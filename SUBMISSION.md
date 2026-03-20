# The Archiver

## Inspiration

Every time you post online, that data is public — but it's scattered. LinkedIn knows your career. Twitter knows your opinions. YouTube knows what you create. For journalists, researchers, HR teams, and compliance officers, piecing together a person's digital presence means manually hunting across a dozen platforms. For individuals, there's no single place to understand what the internet actually knows about them.

We were also thinking about the other side of the equation: data brokers exist, but they operate in the shadows with no consent model. We wanted to build something that flips that — a digital footprint archive where **consent is the foundation, not an afterthought**.

The name came naturally. The Archiver doesn't just collect data — it preserves a moment in time. A person's online presence as it existed. Archived.

---

## What it does

The Archiver is a unified digital footprint archive for persons and companies, with an AI-powered natural language query layer on top.

**For persons:**
- Every person in the archive has a profile consolidating their presence across platforms — LinkedIn, Twitter, YouTube, and more — with follower counts, bios, posts, and activity status
- Digital status reflects their last known online state: **Active**, **Absent**, or **Deceased**
- Users must **opt in** to be listed. Logging in via a social platform creates your archive record and constitutes your consent. You're visible to all users from that moment
- Users can **opt out** at any time via settings — a hard delete, not a soft deactivation. Profile, platform data, posts: all gone

**For companies:**
- Companies are listed by automated scraping of public platforms, with notifications sent to their official contact address
- Company digital status uses a different vocabulary: **Active**, **Absent**, or **Bankrupt**
- A built-in opt-out flow lets any listed company request removal — verified via executive officer email from the company's official domain, removed within 2 business days

**The AI query layer:**
- A natural language search bar lets you query the archive in plain English: *"Show me active women from Scandinavia with more than 2 platforms"* or *"Find people with YouTube but no LinkedIn"*
- The AI interprets the query and returns a filtered, sorted view — no dropdowns, no filter panels
- Results are cached for 30 minutes so repeated queries are near-instant

---

## How we built it

**Frontend:** React + Vite, component-based architecture with no external state management library. Custom CSS using design tokens for a consistent dark-theme UI.

**Backend:** Node.js + Express REST API with PostgreSQL for persistence. Separate data models for persons and companies, with platform profiles linked to each.

**AI:** Ollama running `qwen2.5:14b` locally — no external API costs, no latency to a third-party service.

Two distinct AI use cases:
1. **Natural language query filtering** — the full persons dataset is serialised and sent to the model with the user's query. The model returns a structured JSON filter object (statuses, genders, locations, platform constraints, sort rules) which the frontend applies client-side
2. **Login persona generation** — when a user connects via a mock social provider, the backend calls Ollama to generate a realistic fictional Danish person in real time: name, bio, platform profile, and a seeded post

**Infrastructure:** Docker Compose for local development — one command spins up the full stack including the database and Ollama service.

---

## Challenges we ran into

**The consent model for companies vs. persons is fundamentally different.** Persons opt in actively — their login is the consent event. Companies are discovered passively — we notify them after the fact. Building two parallel data models, two separate consent flows, and a UI that communicates the distinction clearly without confusing users took significant iteration.

**Making the AI query feel fast.** The first query after startup hits Ollama cold — there's inherent latency. We solved this with two-layer caching: a 30-minute persons list cache (so the data is always in memory, not re-fetched from the DB on every query) and a 30-minute response cache keyed on the question text (so identical queries skip the model entirely). The result: first query ~1 second, every subsequent query under 50 milliseconds.

**Keeping the login wall honest.** The consent narrative only works if the login wall is visually and technically real — not just decorative. We used `backdrop-filter: blur` to make the content genuinely inaccessible until consent is given, and `pointer-events: none` to ensure no interaction could bypass the gate.

**Structured output from a local model.** Getting `qwen2.5:14b` to return consistent, parseable JSON for both the filter queries and the persona generation required careful prompt engineering — explicit output format instructions, type annotations in the prompt, and fallback parsing logic for edge cases.

---

## Accomplishments that we're proud of

- A **working consent model** that makes the data ethics narrative tangible, not just theoretical — logging in literally creates your archive record
- **Natural language search** over a structured dataset, running entirely locally with no external API dependency
- The **company terms modal** — a small UI detail that communicates a real-world data governance concept clearly and concisely, with a functional opt-out request flow
- A clean, consistent dark-theme UI with a monospace design language that feels like a real archival tool, not a hackathon prototype
- The full stack — DB schema, backend API, frontend, AI integration, seed data, and consent flows — built end-to-end in a single hackathon session

---

## What we learned

- **Consent UX is hard to get right.** Making users feel informed without overwhelming them with legal text requires deliberate design. The login modal, the company terms notice, and the opt-out flows each went through multiple iterations to find the right balance of clarity and brevity.
- **Local AI is genuinely viable for demo-scale workloads.** Running `qwen2.5:14b` on Ollama gave us structured query interpretation and creative text generation with zero API cost and no network dependency. The latency is manageable with caching.
- **The GDPR data portability angle is underexplored.** GDPR Article 20 gives individuals the right to request their data from any platform in a portable format. A product built on top of that legal mechanism — rather than scraping — would be both more ethical and more legally defensible. We didn't have time to implement it, but the architecture points toward it.
- **Separating opt-in and opt-out models cleanly** requires careful data modelling. Persons and companies live in separate tables with separate consent vocabularies — a decision we made early that saved us significant complexity later.

---

## What's next for The Archiver

**Real data ingestion.** Replace seed data with a scraping pipeline: an async job queue (BullMQ) with per-platform scrapers for LinkedIn, Twitter, YouTube, and Instagram. New profiles discovered through social graph traversal.

**GDPR Article 20 login.** Instead of mocking the login, actually trigger a data portability request to the connected platform. The platform delivers the user's public data within 30 days. We track the request state and populate the archive when it arrives.

**Vector search at scale.** Embed all person profiles into a vector database (pgvector or Pinecone). Natural language query → embedding → approximate nearest neighbour search. Sub-10ms at millions of records — no need to load the full dataset into memory.

**Verified company opt-out.** Automate the executive officer verification step: domain validation + LinkedIn role check. Remove verified opt-outs within the promised 2-business-day window with a status page companies can track.

**Alerts and monitoring.** Let users subscribe to alerts when a person or company's digital status changes, a new platform profile is detected, or their own data appears on a new platform they haven't consented to.

**Enterprise API.** A compliance and due diligence API for HR teams, law firms, and financial institutions — structured digital footprint reports on demand, with audit trails.
