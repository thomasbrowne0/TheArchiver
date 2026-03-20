# The Archiver — 3–5 Minute Demo Script

> **For judges doing a walkthrough.** Keep it punchy. Hit the consent angle hard — that's the story.

---

## Pre-Demo Checklist *(do this 5 minutes before)*

- [ ] Open DevTools → Application → Storage → Clear site data (so the login modal appears fresh)
- [ ] Make sure Docker is running: `docker compose up` in the project root
- [ ] Warm the AI cache: run one query in the AI bar — *"show me all active people"* — then wait for it to finish. The second query will be instant.
- [ ] Stay on the PERSONS tab so clicking COMPANIES triggers the terms modal live

---

## The Pitch *(30 seconds)*

> *"Every time you post online, that data is public — but it's fragmented across dozens of platforms. The Archiver is a unified digital footprint archive: one place where a person or company's entire online presence is catalogued. And unlike every data broker out there, it's built consent-first."*

---

## Demo Flow

### 1. The Login Wall — Opt-In Consent *(~60 sec)*

The site loads with a blurred background and a login modal. You can't see or interact with anything behind it.

> *"Before you can see anyone's data, you have to consent to sharing your own. That's the deal."*

Click **Hackbook** (or HackX / HackTube).

> *"This creates a real archive record for you — your name, a generated profile, and a post. From this moment, you're visible to every user on the platform."*

Watch the spinner. The AI (running locally on Ollama) generates a fictional Danish person in real time.

> *"In production, clicking 'Connect with Facebook' would trigger a GDPR Article 20 data portability request. The platform is legally required to send us your public data. That process takes 3–30 days depending on the platform — so today we mock it with AI."*

---

### 2. The Person Archive *(~45 sec)*

Scroll the person grid. Point out the status badges: **ACTIVE**, **ABSENT**, **DECEASED**.

> *"Status reflects their last known digital presence. Absent means they've gone dark. Deceased is pulled from public records."*

Click a person card. Show the platform tabs — switch between LinkedIn, Twitter, YouTube.

> *"Each tab shows their profile on that platform: followers, bio, recent posts. In a real deployment this is scraped data. Here it's seeded."*

---

### 3. AI Query Layer *(~60 sec — the showstopper)*

Type in the AI query bar:

> **"Show me active women from Europe with more than 2 platforms"**

Wait for the result.

> *"Natural language — no dropdowns, no filters. The AI interprets the query and returns a filtered view."*

Immediately run a second query:

> **"Find people with YouTube but no LinkedIn"**

It's near-instant.

> *"The person list is cached for 5 minutes. First query: the AI thinks. Every query after: under 50 milliseconds. At scale you'd use Redis and pre-computed embeddings — same idea, millions of records."*

---

### 4. Companies Tab + Opt-Out for Companies *(~45 sec)*

Click **COMPANIES** in the nav.

A data notice modal appears — **don't dismiss it yet**.

> *"Companies are listed differently. Their data is scraped from public sources — we don't ask permission first. But we do notify them. And they can request removal."*

Click **REQUEST OPT-OUT**. Show the confirmation message.

> *"In production, this emails our team. An executive officer confirms from their official domain. We verify and remove within 2 business days."*

Click **UNDERSTOOD — VIEW COMPANIES**. Show the company grid.

> *"Same archive concept — digital status, platform presence, industry, headquarters. But the consent model is reversed: companies are opt-out, individuals are opt-in."*

---

### 5. Opt-Out for Persons *(~30 sec — if time permits)*

Click the **⚙** settings icon next to your name in the header.

> *"Any user can delete their entire record at any time. Not soft-delete — hard delete. Platform profiles, posts, everything."*

Show the confirmation step. (Optional: actually delete and show the login modal reappear.)

---

## Closing Line

> *"We built a consent-first digital archive with AI-powered search, in one hackathon session. The mock data is a placeholder — the architecture is real."*
