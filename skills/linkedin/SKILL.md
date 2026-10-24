---
name: linkedin
description: Rewrites your LinkedIn profile for a job search: headline, About section, experience entries, skills order, and the open-to-work settings to check. Use it when you ask to improve, rewrite, align or review your LinkedIn profile or any section of it, when you want it to match your resume, or when a recruiter said your profile does not show something your resume does. Not for connection-request notes or messages (use jobsearch:correspondence) or for your resume (use jobsearch:resume).
---

# LinkedIn

Read `${CLAUDE_PLUGIN_ROOT}/references/loading.md` first and load the user's context in that order. Then `${CLAUDE_PLUGIN_ROOT}/references/truthfulness.md`, `${CLAUDE_PLUGIN_ROOT}/references/drafting-modes.md`, and the pack's Vocabulary and Keyword families for the user's role family (or `${CLAUDE_PLUGIN_ROOT}/references/defaults.md`).

Two modes inside one profile:

- Headline, experience entries, skills: documents mode. Flat, factual, outcome per line.
- About section: correspondence mode. First person, plain, warm, the way the user would describe their work to a peer over coffee. Still no adjectives about themselves and no generic enthusiasm.

## Inputs

1. The current profile text. Ask the user to paste it section by section, or export it. Do not browse to it unless the user asks and the session has a browser tool.
2. The master resume and `profile.md`.
3. Optional: one or two target postings, so the headline and skills can carry their keywords.

## Order of work

1. Roster check first. Compare the profile's employers, titles and dates to `## Roster`. List every mismatch. Fix the profile to the roster. This is `${CLAUDE_PLUGIN_ROOT}/references/hard-rules.md` rule 7 and it comes before any wording.
2. Headline. Under 220 characters. Target title or role family, the one or two things the user is known for, in the posting's words. No "seeking" and no "open to" in the headline; the open-to-work setting carries that.
3. About. Three short paragraphs, under 2,000 characters:
   - What you do and for whom, from `one_line_bio`, expanded by a sentence.
   - Two or three proofs from the resume, in sentences, each with its outcome.
   - What you are looking at next, stated plainly, and how to reach you (email only if the user wants it public).
4. Experience entries. For each roster row: title and employer exactly as the roster. Two to four bullets, the top two matching the target roles' center of gravity, taken from the master resume's bullets for that role and tightened. Same numbers, same scope. Marked blanks where a number is missing.
5. Skills. Reorder so the keyword families from the target postings come first, up to the platform's pin limit. Add a skill only if the resume or approved facts support it.
6. Settings to check, as a short list for the user: open-to-work visibility (recruiters only versus everyone), job titles and locations in open-to-work, custom URL, headline visible in search, featured section.

## Output

Plain text, section by section, each in a code block the user can paste. State the character count for the headline and About. Run the roster pass again on the finished set and say "roster pass: clean" or what you fixed.

Offer in one line to save the set as `<root>/YYYY-MM-DD_LinkedIn_Profile.md` through `track` so later sessions can keep resume and profile in step.

## Rules

- Employers, titles and dates match the roster. Every time.
- No new facts. Same sources as every other skill.
- No em dashes, no corporate phrasing, no self-describing adjectives.
- Connection-request notes and messages are correspondence. Hand them off.
