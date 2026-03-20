# The Archiver — Full Presentation Script (10–15 Minutes)

> **For a winner's presentation or a deep-dive demo.** This covers the full story: problem, architecture, consent model, AI layer, scalability, and business case. Adapt timing to your audience.

---

## Pre-Demo Checklist *(do this 10 minutes before)*

- [ ] Clear localStorage so the login modal appears fresh
- [ ] Warm the AI cache: run *"show me all active people"* and wait for it to complete
- [ ] Prepare your query list (see Section 4) — have them written down so you don't pause to think
- [ ] Have the COMPANIES tab unvisited so the terms modal fires live
- [ ] Check Ollama is running: `docker compose ps` — `ollama` service should be healthy

---

## 1. The Problem *(~2 minutes)*

> *"Your digital footprint is scattered. LinkedIn knows your career. Twitter knows your opinions. YouTube knows what you create. Instagram knows what you look like. Each platform holds a fragment of who you are — and none of them talk to each other."*

> *"For a journalist investigating a public figure, that fragmentation is a liability. For an HR team running due diligence, it's hours of manual work. For a compliance officer flagging regulatory risk, it's guesswork. And for individuals who want to know what the internet knows about them — there's no single answer."*

> *"The Archiver is that single answer. A unified archive of digital footprints — persons and companies — with a consent model built in from day one."*

**Show the blurred login screen while saying this.** The blur is intentional — you can't see anyone's data until you've consented to sharing your own.

---

## 2. The Consent Model *(~2.5 minutes)*

### Opt-In: Persons

> *"When you land on The Archiver, you see a login wall. Not a sign-up form — a consent gate. You connect via a social platform. That act of connecting is your consent."*

Click **Hackbook**.

Watch the spinner.

> *"The AI is generating a profile for you right now. A name, a bio, a post — seeded into the database. From this moment, your record is live and visible to every other user on the platform."*

> *"In production, this would work differently. Clicking 'Connect with Facebook' triggers a GDPR Article 20 data portability request. Under EU law, Facebook is legally required to deliver your public data to us within 30 days. LinkedIn, Twitter, Google — same obligation. We'd receive your actual public profile data: posts, followers, bio, activity. Today we mock that with a locally running AI model."*

### Opt-Out: Persons

> *"Opting out is one click. Settings → Delete My Record. Hard delete — not a soft deactivation, not an archive flag. The row is gone. Platform profiles, posts, everything. The login wall reappears."*

### Opt-Out: Companies

> *"Companies work differently. They don't log in — they're discovered. We scrape their public presence: LinkedIn pages, Twitter accounts, YouTube channels. When a company is detected, we send a notification to their public contact address. They're told they've been archived and given a path to respond."*

> *"If they want out, an executive officer contacts us from their official email domain. We verify and remove within 2 business days. That opt-out flow is built into the UI — we'll show it in a moment."*

---

## 3. Architecture *(~2 minutes)*

> *"Let's talk about what's running under the hood."*

```
Frontend:   React + Vite — component-based, no state management library
Backend:    Node.js + Express REST API
Database:   PostgreSQL — persons, companies, platform profiles, posts
AI:         Ollama running qwen2.5:14b locally — zero external API costs
Infra:      Docker Compose — one command to spin up the full stack
```

> *"Two AI use cases:"*

> *"One: character generation at login. When you connect via HackX, the backend calls Ollama with a prompt to generate a realistic fictional Danish person — name, bio, a social post. Temperature 0.85, small context window (4096 tokens) so it's fast."*

> *"Two: the natural language query layer. When you type a question into the query bar, the backend sends the full persons dataset and your query to Ollama. It returns a structured JSON filter object — statuses, genders, locations, platform constraints, sort rules. The frontend applies that filter client-side in milliseconds."*

---

## 4. The AI Query Layer — Live Demo *(~2.5 minutes)*

> *"This is the feature we're most proud of. Watch."*

**Query 1** — type slowly, let them read it:
> `Show me active women from Scandinavia`

Wait for it. (~1 second, Ollama is warmed)

> *"Natural language. No dropdowns. No filter panels. The AI understood 'active', 'women', and 'Scandinavia' as separate constraints and applied them correctly."*

**Query 2** — immediately after:
> `Find people with YouTube but no LinkedIn`

Near-instant response.

> *"See the speed difference? The person list is cached for 30 minutes after first load. The AI still processes the query — but the data retrieval is already done. First query: the AI thinks. Every query after: under 50 milliseconds."*

**Query 3:**
> `Show me the 5 most recently archived people`

> *"Sort, limit, natural language. It correctly interprets 'most recently archived' as sorting by archived_at descending with a limit of 5."*

**Query 4 (if time allows):**
> `Find anyone from Germany or Austria who has been absent`

> *"Multi-location, status-based. It handles compound conditions."*

---

## 5. The Companies Tab *(~1.5 minutes)*

Click **COMPANIES**. Terms modal appears.

> *"Every time you switch to the companies view, you see this notice. It explains how companies are listed and how they can opt out. The opt-out button doesn't send a real email today — but the flow is complete."*

Click **REQUEST OPT-OUT**. Show the success message.

> *"Opt-out request sent. Removed within 2 business days. The company side of consent."*

Click **UNDERSTOOD — VIEW COMPANIES**. Show the grid.

> *"13 companies seeded — a mix of corporations, startups, NGOs, agencies, small businesses across Europe and the US. Digital status: active, absent, or bankrupt — different vocabulary from persons because companies don't die the same way people do."*

Click a company card. Show the platform tabs and profile data.

> *"Same component architecture as persons. Platform tabs, profile stats, bio. No posts — companies post differently and that's a future feature."*

---

## 6. Scalability — How This Works at Millions of Records *(~2 minutes)*

> *"You might ask: why mock data? We had one hackathon session. But the architecture isn't mocked — only the data is."*

**The scraping layer:**
> *"In production, we'd run a job queue — BullMQ or similar — with per-platform scrapers. LinkedIn, Twitter, YouTube, Instagram all have rate limits and anti-scraping measures. The queue manages retries, priority, and platform-specific delays. New profiles are discovered through social graph traversal: follow a public figure's followers, scrape their connections, recurse."*

**The database:**
> *"PostgreSQL scales further than most people think — read replicas handle query load, partitioning by person_id range distributes write load. At 10M records you'd add connection pooling (PgBouncer) and start thinking about sharding."*

**The AI query layer:**
> *"The current approach — load all persons into memory, send them to Ollama — doesn't scale past maybe 100,000 records. The production approach: embed every person profile into a vector database (pgvector or Pinecone). Natural language query → embedding → approximate nearest neighbor search. Sub-10ms at millions of records. The query results are semantically similar profiles, not just keyword matches."*

**The cache:**
> *"Right now we cache the persons list in-process for 30 minutes. In production: Redis, with event-driven invalidation. A delete triggers a cache clear for that person's ID. A new login adds to the cache. No stale reads, no cold starts."*

**The consent pipeline:**
> *"GDPR data portability requests have a legal timeline. We'd track each request as a state machine: requested → platform acknowledged → data received → processed → archived. Users see their request status. Platforms that miss the 30-day window get flagged for follow-up."*

---

## 7. The Business Case *(~1 minute)*

> *"Who pays for this?"*

**Primary markets:**
- Journalists and researchers needing to verify a subject's public presence
- HR and talent teams running background checks on digital footprint
- Legal and compliance teams tracking executives or counterparties
- PR and reputation management agencies monitoring brand presence
- Individuals who want to audit and control their own data exposure

**Monetization:**
- Subscription tiers: free (limited queries) → professional (unlimited AI queries + alerts) → enterprise (API access + compliance reports)
- Compliance API: GDPR request automation as a service for other platforms
- Data enrichment marketplace: individuals opt in to share enriched profiles with verified research institutions

---

## 8. Wrap-Up *(~30 seconds)*

> *"We built a full-stack opt-in/opt-out digital archive — persons and companies — with a local AI query engine, in one hackathon session."*

> *"The mock data is a stand-in. The consent model is real. The architecture is production-shaped. Swap the seed data for a scraping pipeline and you have a deployable product."*

> *"The Archiver. Because your digital footprint deserves a single address."*

---

## Anticipated Questions

**Q: What about privacy law — isn't scraping public data illegal?**
> Scraping publicly visible data is generally legal in most jurisdictions (see HiQ v. LinkedIn, 9th Circuit). We don't scrape private data. The consent model (notify + opt-out for companies, opt-in for individuals) aligns with GDPR principles around legitimate interest and data minimization.

**Q: Why Ollama and not OpenAI/Claude?**
> Zero latency to an external API, zero cost, runs fully offline. For a hackathon and for privacy-sensitive use cases, local inference is the right call. In production you'd evaluate latency vs. capability tradeoffs.

**Q: What happens to a person's data after they opt out?**
> Hard delete — no soft delete, no backups retained. The cascade removes their platform profiles and posts. The UI confirms this to the user before they confirm the action.

**Q: How do you verify that a company email is from an executive officer?**
> Email domain validation (must match company's registered domain), combined with role verification from the company's public website or LinkedIn. For disputed cases, a human review step.
