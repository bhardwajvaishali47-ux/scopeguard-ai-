-- ScopeGuard AI — Supabase Schema
-- NovaTech Solutions Demo Data

-- TEAMS TABLE
create table public.teams (
  id uuid not null default gen_random_uuid(),
  name text not null,
  team_size integer null,
  agile_release_train text null,
  created_at timestamp with time zone null default now(),
  constraint teams_pkey primary key (id)
);

-- SPRINTS TABLE
create table public.sprints (
  id uuid not null default gen_random_uuid(),
  team_id uuid null,
  sprint_number integer null,
  sprint_name text null,
  start_date date null,
  end_date date null,
  committed_points integer null,
  goal text null,
  status text null,
  created_at timestamp with time zone null default now(),
  constraint sprints_pkey primary key (id),
  constraint sprints_team_id_fkey foreign key (team_id) references teams(id)
);

-- STORIES TABLE
create table public.stories (
  id uuid not null default gen_random_uuid(),
  sprint_id uuid null,
  team_id uuid null,
  title text not null,
  story_points integer null,
  status text null,
  added_at timestamp with time zone null default now(),
  was_in_original_plan boolean null default true,
  removed_at timestamp with time zone null,
  assignee text null,
  label text null,
  constraint stories_pkey primary key (id),
  constraint stories_sprint_id_fkey foreign key (sprint_id) references sprints(id),
  constraint stories_team_id_fkey foreign key (team_id) references teams(id)
);

-- ALERTS TABLE
create table public.alerts (
  id uuid not null default gen_random_uuid(),
  sprint_id uuid null,
  team_id uuid null,
  alert_type text not null,
  severity text not null,
  claude_analysis text null,
  risk_score integer null,
  recommended_action text null,
  is_acknowledged boolean null default false,
  created_at timestamp with time zone null default now(),
  constraint alerts_pkey primary key (id),
  constraint alerts_sprint_id_fkey foreign key (sprint_id) references sprints(id),
  constraint alerts_team_id_fkey foreign key (team_id) references teams(id),
  constraint alerts_alert_type_check check (
    alert_type = any (array[
      'scope_creep_detected'::text,
      'sprint_at_risk'::text,
      'capacity_exceeded'::text,
      'pattern_warning'::text
    ])
  ),
  constraint alerts_severity_check check (
    severity = any (array[
      'low'::text,
      'medium'::text,
      'high'::text,
      'critical'::text
    ])
  ),
  constraint alerts_risk_score_check check (
    risk_score >= 0 and risk_score <= 100
  )
);

-- SCOPE EVENTS TABLE
create table public.scope_events (
  id uuid not null default gen_random_uuid(),
  sprint_id uuid null,
  story_id uuid null,
  event_type text null,
  description text null,
  created_at timestamp with time zone null default now(),
  constraint scope_events_pkey primary key (id)
);

-- INDEXES
create index idx_stories_sprint_id on stories(sprint_id);
create index idx_alerts_sprint_id on alerts(sprint_id);
create index idx_alerts_severity on alerts(severity);
create index idx_sprints_status on sprints(status);
