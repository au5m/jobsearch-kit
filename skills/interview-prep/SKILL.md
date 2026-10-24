---
name: interview-prep
description: Plans, builds and rehearses your job interviews and interview assignments: screening calls, hiring-manager conversations, panels, take-homes, work samples, presentations, case studies, coding or technical rounds, and the "tell me about yourself" answer. Use it whenever you mention an upcoming interview, a take-home, an assessment, a presentation round, panel prep, or paste assignment instructions from a recruiter or hiring manager, even if you only say "I have an interview next week" or "help me prep for this exercise". Not for the thank-you note afterward (use jobsearch:correspondence) or for researching the company from scratch (run jobsearch:company-research first).
---

# Interview prep

Read `${CLAUDE_PLUGIN_ROOT}/references/loading.md` first and load the user's context in that order. Load the pack's Interview formats, Role lens and Vocabulary sections for the user's role family (or `${CLAUDE_PLUGIN_ROOT}/references/defaults.md`). Read the company README and any `Research` file in the company folder. Read `${CLAUDE_PLUGIN_ROOT}/references/truthfulness.md`: every story and claim the user rehearses comes from the roster, approved facts, the master resume, or what they say here.

These rounds test how the user thinks and presents, not how much they can stand up. The pattern that wins: frame everything through the company's core thesis, build the simplest thing that proves the skill being tested, rehearse until it is boring, and be ready to go one level deeper on anything you say.

## Step 1: Scope before building

Run a short scoping interview, one question at a time, and lock the answers before any building or slide work. Get:

- The assignment or invitation text, verbatim. Reread it for what is being evaluated; the instructions usually say.
- Format and time limit. Live, slides only, hands-on, conversation. Hard constraints: no live product, no screenshots, AI tools allowed or not.
- Who is in the room and their backgrounds. A senior practitioner probes differently than a recruiter or an executive.
- What the user has access to and what they do not.
- The date, so any trial, credit or booking does not lapse before the round.

If no `Research` file exists for this company, say so and recommend running `jobsearch:company-research` first. Step 2 depends on it.

## Step 2: Frame through their thesis

Find the company's core argument for why it wins, and make every section of the assignment or every story demonstrate it. The goal is that the panel finishes thinking "this person already thinks like one of us." Connect it to something the user has actually done, using only facts from the sources in `${CLAUDE_PLUGIN_ROOT}/references/truthfulness.md`.

## Step 3: Build by format

The pack's Interview formats section lists the formats common in the user's field and what each tests. Match the round to one, then:

- Technical build or live demonstration: tell it as a story with acts, each raising the stakes. For each element: what it is, why it matters, how it works, what it proves, and where the company's product or approach fits. Anchor to a real, recent example; search rather than rely on memory. Prefer tools already on screen over extra tooling that adds failure points. Do extra credit only when the core is solid.
- Hands-on exercise or work sample: recreate the scenario in a practice setting with a realistic stand-in and a clean control. Keep the deliverable small and readable: one clear input, one clear output. Verify every assumption against current documentation. Show both the finding and the fix when the format allows.
- Presentation or case study: choose the simplest structure that shows how the user thinks, positions, and lands a next step. One fictional input driving a few outputs beats a complex setup. Never show real job-search data, real customer data, or a real inbox or calendar. Fit the time box with room for questions; a 35-minute slot is about 25 minutes of content.
- Panel or conversational rounds: for each story or claim, prepare the next level down: the specific decision, number, config or trade-off. High-level examples read as shallow when the panel is probing for depth; lead with the specific. Prepare two or three stories where the user was hands-on, not only coordinating.

When the user needs commands or steps, give them for the OS in `profile.os`, one at a time, each with a one-line explanation.

## Step 4: "Tell me about yourself"

Build it from the roster and `one_line_bio`, in correspondence register (spoken, plain, warm):

1. One sentence on who you are now, from the bio.
2. Two or three sentences walking the roster forward, one clause per move, each naming the thing that connects to this role.
3. One sentence on why this conversation: the specific thing about the company from the research.

Under 90 seconds spoken. No adjectives about yourself. No reason any job ended. Show it, let the user edit, then rehearse it.

## Step 5: Deliverables

Plain text first; build a file only when the user says yes.

- Outline or deck: around ten slides for a 30 to 45 minute slot, speaker notes included. Title, thesis framing, the acts or sections, a closing slide tying back to their thesis and a next step. Documents mode.
- Runbook: for a live demonstration, the exact steps, inputs, what to click, what the audience should see, and the talking point for each step.
- Fallback: a plan for when the live part breaks (pre-captured output or a talk-through), unless the assignment forbids it.
- Q&A prep: about ten likely questions, weighted toward hard follow-ups and competitor comparisons, each with a short answer and the one-level-deeper detail.
- Rehearsal: at least one full timed run before the day. Score it: on time, every act landed, every claim has its next level, no filler words on the key lines. Repeat the weak act, not the whole run.

Save to `<companies_dir>/<Company>/YYYY-MM-DD_Prep_<Company>.md` on yes.

## Practice hygiene

- Use throwaway accounts and trials. Note the trial end date.
- Grant least access. Keep tokens and keys in environment variables, never in chat, notes or memory.
- Pause or scale down anything that bills after each session; record how to resume. Never add a payment method.
- Check current docs before acting on steps that may have changed. Validate each step before the next.

## After the round

- Hand off to `jobsearch:correspondence` for the follow-up, with a specific detail from each interviewer.
- Debrief in a few lines: what landed, what got probed, what the user would do differently. Offer to record it in the company README through `track` so the next round starts from it.
