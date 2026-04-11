# ScopeGuard AI 🛡️
### AI-Powered Sprint Scope Creep Detection for Agile Product Managers

Built by **Vaishali Bhardwaj** — SAFe PO/PM Certified | AI Product Manager

---

##  Live Demo
**Dashboard:** https://luminous-horse-1f8b1a.netlify.app

---

##  What Problem Does ScopeGuard Solve?

In large SAFe organisations, scope creep is the number one cause of sprint failure. By the time a PM notices unplanned work in a standup, 3-4 days are already lost. ScopeGuard detects scope creep automatically — before the sprint is derailed.

**The detection lag problem:** The gap between when scope creep starts and when a PM becomes aware of it. In a 10-day sprint, catching it on day 2 versus day 6 is the difference between saving the sprint and missing delivery.

---

##  Architecture

Supabase (PostgreSQL)
↓
n8n Schedule Trigger (every 30 mins)
↓
Supabase HTTP Request (fetch active sprints + stories)
↓
Prepare Claude Request (Code Node — builds API payload)
↓
Claude AI API (scope creep analysis → structured JSON)
↓
Parse Claude Response (Code Node — extracts fields)
↓
Supabase Write Alert (saves AI analysis to alerts table)
↓
Filter Node (critical alerts only)
↓
Critical Alert Logger (notification trigger)


---

##  Tech Stack

| Layer | Tool | Purpose |
|---|---|---|
| Database | Supabase (PostgreSQL) | Sprint and alert data storage |
| AI Brain | Claude API (Anthropic) | Scope creep detection and reasoning |
| Automation | n8n | Workflow orchestration pipeline |
| Notifications | Make.com | Alert delivery (Phase 2) |
| Frontend | HTML + Tailwind CSS | Dashboard UI |
| Hosting | Netlify | Live deployment |

---

##  How Claude AI Works in ScopeGuard

ScopeGuard uses Claude's instruction-following and structured output capabilities. Sprint data is fetched from Supabase and injected directly into the Claude prompt at runtime — a lightweight RAG (Retrieval Augmented Generation) pattern. Claude returns structured JSON with:

- `risk_level` — LOW / MEDIUM / HIGH / CRITICAL
- `scope_creep_detected` — boolean
- `changed_items` — array of flagged stories with reasons
- `recommended_action` — specific PM action
- `summary` — plain English explanation

---

##  Demo Data

All data uses fictional **NovaTech Solutions** — a 120-person SaaS company running SAFe sprints. Sprint 14 — Platform Team demonstrates a CRITICAL scope creep scenario:

- 42 committed story points
- 4 unplanned stories added mid-sprint
- 29 unplanned points (69% capacity overload)
- CTO-escalated Telstra SSO story (13 points)

---

##  Database Schema

5 tables: `sprints`, `stories`, `teams`, `alerts`, `scope_events`

See `/schema/supabase_schema.sql` for full schema.

---

##  Roadmap

**Phase 1 (Complete) **
- Supabase database with synthetic NovaTech data
- n8n AI pipeline with Claude scope creep detection
- Automated alerts written to database
- Live dashboard deployed on Netlify

**Phase 2 (Planned)**
- Jira integration — sync stories directly from Jira sprints
- Slack notifications — real-time alerts to PM channel
- Email alerts via Make.com
- Conversational agent — "Is my sprint at risk?"

---

##  About the Builder

**Vaishali Bhardwaj** — 10 years corporate experience, most recently BI Consultant and Product Owner at BT Openreach (Fibre Build vertical). SAFe PO/PM Certified. Currently transitioning into AI Product Management.

- LinkedIn: [Add your LinkedIn URL]
- Built as part of Advanced AI PM Program at Product Space
