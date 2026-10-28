---
name: resume
description: Tailors your master resume to a specific job description during a job search. Use it whenever you paste, upload or link a job posting and want your resume adjusted, targeted, checked against it, or keyword-matched for an applicant tracking system, including "tailor my resume for this", "does my resume fit this role", "what should I change for this posting", or a gap analysis between your background and a role even if you do not say "resume". Not for cover letters or messages (use jobsearch:correspondence) or your LinkedIn profile (use jobsearch:linkedin).
---

# Resume

Read `${CLAUDE_PLUGIN_ROOT}/references/loading.md` first and load the user's context in that order. Then read `${CLAUDE_PLUGIN_ROOT}/references/truthfulness.md` and `${CLAUDE_PLUGIN_ROOT}/references/drafting-modes.md`. This skill runs in documents mode.

The goal is a version of the user's real resume that makes the evidence for this role easy to find in a six-second skim and a keyword pass. Tailoring means selecting, ordering and phrasing true things. It never means adding things that are not true.

## Inputs

1. The job description. Pasted, uploaded, or linked (fetch it). If the link cannot be read (many job boards need a login), ask the user to copy the posting text and paste it.
2. The master resume, at `workspace.master_resume`. If it is missing, say so and stop. Do not draft a resume from scratch and do not work from memory of the user.
3. `profile.md`: roster, approved facts, constraints.
4. The pack sections Vocabulary, Keyword families and Examples for the user's role family.

## Step 1: Read the posting for what matters

Pull out, briefly:

- Center of gravity. What the role really is. Titles mislead; the responsibilities section and the first three requirements usually do not.
- Must-haves versus nice-to-haves.
- Keywords, grouped by the pack's Keyword families.
- Their vocabulary for things the user already does. Same work, their word.

## Step 2: Map requirements to evidence

For each must-have and meaningful nice-to-have, find the resume lines that prove it. Mark each:

- Strong: shown with an outcome.
- Partial: the experience is there but buried, vague, or missing a number.
- Gap: nothing in the source supports it.

Gaps become questions for the user, not new bullets. Partials are where tailoring does the most good.

## Step 3: Tailor

In this order of impact:

1. Headline and summary. Lead with the role's center of gravity, using only true claims. Two to three lines. No adjectives about the person.
2. Bullet order within each role. Move the most relevant bullets to the top of each position. Readers see the first two bullets of the most recent roles and little else.
3. Bullet wording. Rephrase partials to surface the relevant part and use the posting's term where it names the same thing. Keep the original metric exactly. Verbs from the pack's Vocabulary "use" list; none from its "avoid" list.
4. Trim. Cut or shorten bullets that do not serve this role rather than growing the resume. Same length as the master unless the user says otherwise.
5. Skills section. Reorder so matching skills come first. Add a keyword only if the resume or `## Approved facts` supports it.

Bullet shape: what you did, to what, with what result. One to two lines. A missing number is a marked blank like `[# of projects]`, listed in the questions.

## Step 4: Roster and date pass

Run the pass in `${CLAUDE_PLUGIN_ROOT}/references/truthfulness.md`, as a named step. List every employer, title, start and end in the draft and compare to `## Roster`. Fix anything that differs. Say "roster pass: clean" or say what you fixed.

## Step 5: Output

Plain text first, for review. Then offer the file the user can upload.

1. The tailored resume in markdown, in chat, for review.
2. A short summary, not a report:
   - The role's center of gravity, one line.
   - What changed, three to five lines.
   - Coverage: which must-haves are strong, partial, gap.
   - Questions: the facts that would strengthen it, each tied to a line or a requirement.
   - Roster pass result.
   - Parse check result (below), one line if it passes.
3. End with one plain question: "Want this as a Word file you can upload?" Most applications take Word or PDF, not markdown. On yes, build it as described next. If the user wants the markdown kept too, save it as `<companies_dir>/<Company>/YYYY-MM-DD_Resume_<Company>.md`.

### Parse check

Applicant tracking systems read the file before a person does. Check the tailored version, and warn the user in one line for each item that fails, naming what to change:

- One column. No tables, text boxes or columns for the main content.
- Contact details in the body, not only in a header or footer.
- Standard section headings: Experience, Education, Skills (or the plain equivalents).
- Each key acronym from the posting written out once in full, for example "applicant tracking system (ATS)".
- Word format unless the posting asks for PDF.

If the master's own layout fails an item, say so once. Do not change the layout without the user's yes.

### Building the file

If the user wants a file in the master's format: if the master is a `.docx`, copy it and edit the copy so fonts, layout and spacing are preserved; if the master is a PDF or text, build a plain, single-column `.docx` and say that it does not match any template. Use the document tools the session has. Open the result and check every page before delivering. Name it `YYYY-MM-DD_Resume_<Company>.docx` in the company folder. The design belongs to the user's master; do not impose one.

Do not pad the summary with advice on applying or interviewing unless asked. Offer in one line to log the application through `track`.

## Checklist before delivering

- Every fact traces to the master resume, `profile.md`, or something the user said in this conversation.
- Titles, employers and dates unchanged; roster pass run.
- No scope inflation, no invented or rounded numbers; blanks marked and listed.
- Top two bullets of each recent role speak to the posting's center of gravity.
- Headline and summary match the role; no self-describing adjectives.
- Vocabulary from the user's role block only; no em dashes; no filler.
- Same length as the master unless told otherwise.
