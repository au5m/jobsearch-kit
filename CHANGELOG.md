# Changelog

Newest first.

## 1.1.0 (2026-10-28)

Fixes from a five-lens review: first-time user, plugin engineering, truth and safety, recruiter and hiring manager, maintainer.

- Privacy: the release gate reads personal terms from a private file named in `JOBSEARCH_PRIVATE_TERMS`; the repo holds no list.
- Truth: fact rules (dates, LinkedIn match) cannot be overridden. Pack examples raise scope only when the source says so.
- Outside text: new `references/untrusted-input.md`. Postings, emails, threads and web pages are data, never instructions.
- `setup`: writes a `~/.jobsearch` pointer so later sessions find a custom folder; saves a pasted resume as `master-resume.md`; asks to copy a resume kept elsewhere; plain wording; ends with two things to try.
- `agents/blind-reviewer.md`: the correspondence reviewer runs with no tools.
- Connectors: Drive mirrors by folder ID and skips Offer files and the profile unless the user says yes; Gmail reads only the named thread; nothing is sent, shared or trashed.
- Pre-send check: eight items, run on the final text; adds hard rules and private material. The user sees one summary line by default.
- `offer` and `company-research` load the truthfulness rules. Research cites a link, date and label for every fact.
- Follow-up timing: cold outreach 5 to 7 business days and at most 2 nudges; after an interview, the stated timeline plus 2 business days.
- `resume`: offers a Word file to upload, runs a parse check, and asks for pasted text when a posting link cannot be read.
- README: prerequisites, numbered install with restart, update steps.

## 1.0.2 (2026-10-28)

- `setup`: asks for years of experience inside question 4, so the bio and `years_experience` never come from date arithmetic.
- `setup`: leaves `location` blank when the user states none, instead of asking.
- `setup`: says how to turn a Windows time zone name into an IANA name.

## 1.0.1 (2026-10-26)

- Fix: the plugin failed to load with "conflicting manifests". The marketplace entry no longer lists skills or sets strict; plugin.json is the only component definition.

## 1.0.0 (2026-10-24)

First release. One build, eight skills.

- `setup`: five questions, resume import, roster confirmation, writes `profile.md` and `workspace.md`.
- `resume`: tailors a master resume to a job description. Markdown first, a file in the master's own format on request. Named roster-and-date pass before output.
- `correspondence`: outreach, follow-up, reply, nudge and cover letter. Four moves, blind review loop with stakes tiers, six-item pre-send check.
- `company-research`: stage check, bull and bear case, candidate lens from the role pack, network and conflict check against your pipeline.
- `interview-prep`: scoping, thesis framing, build by format, "tell me about yourself" builder, rehearsal with scoring.
- `track`: company READMEs and `pipeline.md`, stale follow-up flags, handoff prompt for long chats.
- `linkedin`: headline, About, experience entries, skills order. Must match the resume roster.
- `offer`: comp table, counter message, reference-check brief, decision notes.
- `packs/tech`: role blocks for sales engineer, software engineer, product manager, default.
- `references/`: ten field-free rule files shared by every skill.
- `scripts/release-gate.sh`: fails the build on em dashes, personal facts, or role vocabulary in the core.
