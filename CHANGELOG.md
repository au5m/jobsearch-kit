# Changelog

Newest first.

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
