# ScopeGuard AI — Intelligent Sprint Scope Creep Detection

> Built by **Vaishali Bhardwaj** | AI Product Manager | SAFe PO/PM Certified  
> Capstone Project — Advanced AI Program, Product Space

---

## What is ScopeGuard?

ScopeGuard is an AI-powered web application that monitors Agile sprint data in real time, detects scope creep patterns using Claude AI, and alerts the Product Manager before the sprint is derailed.

It also features a conversational RAG agent that answers questions like *"Is my sprint at risk?"* using live Jira data and historical retrospective patterns.

**Live Demo:** https://luminous-horse-1f8b1a.netlify.app

---

## The Problem

In SAFe and Scrum environments, scope creep is the leading cause of sprint failure. Unplanned stories added mid-sprint — often driven by executive escalation or enterprise client pressure — derail committed work without the Product Owner realising until it is too late.

**ScopeGuard detects this automatically, every 30 minutes, before it becomes a crisis.**

---

## Architecture

```
Jira (live sprint stories)
        ↓
n8n — fetches every 30 minutes
        ↓
Claude AI — analyses for scope creep patterns
        ↓
Supabase — stores AI alerts and retrospectives
        ↓
Dashboard — live risk scores, flagged stories, AI recommendations
        ↓
RAG Agent — answers PM questions using pgvector similarity search
```

---

## Tech Stack

| Layer | Tool | Purpose |
|-------|------|---------|
| Frontend | HTML/Tailwind CSS | Dashboard UI |
| Hosting | Netlify | Deployment |
| Automation | n8n | Workflow orchestration |
| AI Brain | Claude API (Anthropic) | Scope creep analysis |
| Database | Supabase (PostgreSQL) | Alert storage |
| Vector Search | pgvector | RAG similarity search |
| Embeddings | OpenAI text-embedding-ada-002 | Retrospective embeddings |
| Project Management | Jira | Live sprint data source |

---

## Key Features

### 1. Real-Time Scope Creep Detection
- Fetches live sprint stories from Jira every 30 minutes
- Claude AI analyses story patterns, unplanned additions, and capacity overloads
- Generates risk scores (0-100) with severity levels (low/medium/high/critical)
- Stores structured AI findings in Supabase

### 2. RAG Conversational Agent
- PM asks natural language questions: *"Is my sprint at risk?"*
- Question converted to 1536-dimensional embedding via OpenAI
- pgvector cosine similarity search finds most relevant historical retrospective
- Claude answers with live Jira data + historical context combined

### 3. Live Dashboard
- Fetches real alert data from Supabase on page load
- Auto-refreshes every 30 seconds
- Shows risk scores, flagged stories, AI analysis, recommended actions
- Acknowledge Alert button writes back to Supabase in real time

### 4. Intelligent Deduplication
- Upsert pattern with on_conflict resolution
- Prevents duplicate alerts for same sprint and severity
- Only updates when new analysis differs

---

## Demo Company

All data uses **NovaTech Solutions** — a fictional 120-person SaaS company running SAFe sprints. Sprint 14 Platform Team has 13 stories in Jira with 4 scope creep stories injected via executive escalation, replicating real-world patterns.

---

## RAG Knowledge Base

Three retrospective documents based on real Sprint 14 patterns:
- **Sprint 11** — Executive SSO escalation causing 45% capacity overload
- **Sprint 9** — CORS hotfix mid-sprint, handled with descoping
- **Sprint 6** — Multiple stakeholder requests, 21 unplanned points, CTO escalation

---

## What I Learned Building This

- **Claude API** — Structured JSON output, system prompts, context window management
- **RAG Architecture** — Vector embeddings, pgvector cosine similarity, context injection
- **n8n Automation** — Webhook triggers, HTTP nodes, Code nodes, scheduled workflows
- **Supabase** — PostgreSQL, REST API, upsert patterns, pgvector extension
- **AI Product Management** — Translating technical AI capabilities into product value

---

## About the Builder

**Vaishali Bhardwaj** is an AI Product Manager transitioning from 10 years in BI and data consulting, most recently as a Product Owner at BT Openreach leading the Fibre Build vertical using QlikSense, GCP BigQuery, and SQL.

- SAFe PO/PM Certified
- Enrolled in Advanced AI Program at Product Space
- LinkedIn: [Vaishali Bhardwaj](https://linkedin.com/in/vaishali-bhardwaj)

---

*Built entirely with low-code/no-code AI tools as a demonstration of AI Product Management skills.*
