---
name: correspondence
description: Drafts every message you send in your job search, in your own voice, with a fixed structure and a blind review before you see it. Use it whenever you want to write to a person about a role or a company: cold outreach to a hiring manager, team lead, recruiter or contact; follow-up and thank-you notes after an interview, panel, coffee chat, intro call or favor; replies to recruiter messages and emails; scheduling and availability replies; nudges when someone has gone quiet; polite declines; and cover letters. Trigger on "thank you note", "follow up with", "reach out to", "reply to this recruiter", "send my availability", "nudge", "cover letter", or a pasted message you need to answer, even if you do not name the type. Not for resume text (use jobsearch:resume) or LinkedIn profile sections (use jobsearch:linkedin).
---

# Correspondence

Read `${CLAUDE_PLUGIN_ROOT}/references/loading.md` first and load the user's context in that order. Then read, in this plugin: `${CLAUDE_PLUGIN_ROOT}/references/drafting-modes.md` (this skill runs in correspondence mode), `${CLAUDE_PLUGIN_ROOT}/references/message-moves.md`, `${CLAUDE_PLUGIN_ROOT}/references/recipient-register.md`, `${CLAUDE_PLUGIN_ROOT}/references/hard-rules.md`, `${CLAUDE_PLUGIN_ROOT}/references/review-loop.md`, `${CLAUDE_PLUGIN_ROOT}/references/presend-check.md`, and `${CLAUDE_PLUGIN_ROOT}/references/truthfulness.md`. The reviewer prompt is `${CLAUDE_PLUGIN_ROOT}/skills/correspondence/reviewer.md`.

The messages read like a peer writing to a peer: short, plain, warm, templated in a good way. The structure does the work. Do not add writer's devices. Do not pitch.

## Message types

Pick one. The structure for each is in `${CLAUDE_PLUGIN_ROOT}/references/message-moves.md`.

1. Outreach: the user starts the conversation.
2. Follow-up: the user writes after a conversation. Thank-you notes are follow-ups.
3. Reply: someone wrote to the user first.
4. Nudge: the user sent a message and got no answer.
5. Cover letter: addressed to a person, attached to an application. Still correspondence mode.

## Workflow

1. Identify the type.
2. Identify the recipient and their role (`${CLAUDE_PLUGIN_ROOT}/references/recipient-register.md`). Set the register and the stakes tier. If the role is unclear, ask one question.
3. Read the company README for this company, if it exists. It holds earlier messages, contacts and settled concerns.
4. Collect the specifics. What they said, what they asked for, what they did for the user. For a follow-up with no specific, ask one question: "What is one thing they said that you can point back to?" Do not draft around a vague recap.
5. Fill the structure. Do not add moves. Do not remove moves. Sign-off and name from `profile.md`. Times in the user's time zone from `profile.md`; marked blanks if not given.
6. Check `${CLAUDE_PLUGIN_ROOT}/references/hard-rules.md` against the draft.
7. Run the review loop (`${CLAUDE_PLUGIN_ROOT}/references/review-loop.md`). Skip it only for a scheduling reply. Use the pack's Reviewer notes for the user's role family when building the reviewer persona.
8. Run the pre-send check (`${CLAUDE_PLUGIN_ROOT}/references/presend-check.md`). Name any unmet item. Do not present the draft as finished while one is unmet.
9. Show the draft in a code block. Say where it goes (LinkedIn message, email reply to NAME, new email to ADDRESS). For a LinkedIn connection-request note, say if it is over 300 characters, since that is the limit.
10. If `workspace.gmail` is true and Gmail tools are present, offer to place it in drafts. Never send.
11. Offer in one line to log it through `track` (contact, date, next step).

## Panels

One note per interviewer. Each recaps something different that that person said. If the user has a specific for only one person, ask before writing the others. Peers get the lighter register.

## Facts about the user

Only from `profile.md`, the master resume, and this conversation. A draft that would be stronger with a detail you do not have gets a marked blank or a question. Never a placeholder that looks real. Never a theory about why a job ended.

## Teaching examples

Names and companies here are placeholders.

### Follow-up to a hiring manager, approved

Context: 45-minute hiring-manager screen. The manager described how the team is split across three large accounts with one account lead, and said he wants someone who stays. They live near each other.

```
Hi Jordan,

Quick note to say thanks for your time on Friday. Appreciated you walking me through the team, specifically the three-account, one-lead setup and what you're looking for in someone who'll be there for the long run.

If it helps, I'd be glad to meet the account lead or anyone else on the team as a next step.

Hope you had a good weekend. Looks like we're practically neighbors!

Best,
Sam
```

### The same note, rejected

```
Thanks for Friday. I keep thinking about the three-account setup. One lead and three big accounts is the kind of role I could settle into for a long time.
```

Why it failed: "I keep thinking about" is a writer's hook, not something a person says. It reacts instead of recapping. It has no ask and no personal line. Two of the four moves are missing.

### Reply to prep notes, rejected and approved

Context: the hiring manager sent four unprompted prep notes the day before a final interview. One of the four was "be ready to address the short stints." He had already accepted the explanation in the first interview.

Rejected, because it singles out the negative item and reads as anxious:

```
Hi Jordan,

Thanks for the heads-up on Casey, and for flagging the short stints question. I'll come ready on all four.

Best,
Sam
```

Approved:

```
Hi Jordan,

Thanks for the prep notes on Casey. It helps to know what she'll focus on, and I appreciate you taking the time. I'll be ready on all four.

Best,
Sam
```

Lesson: when thanking someone for a list, do not pick out the negative item. Thank them for the effort as a whole.
