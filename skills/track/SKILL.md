---
name: track
description: Keeps the record of your job search: one README per company, a pipeline table, and handoff notes between chats. Use it when you want to log a contact or a message you sent, update where a company stands, add a company, see what is stale or waiting on you, review your whole pipeline, or hand a long chat off to a fresh one. Trigger on "log this", "update status", "where do I stand with", "what's stale", "show my pipeline", "add this company", "hand this off", or when another jobsearch skill offers to record something and you say yes. Not for drafting messages (use jobsearch:correspondence) or deciding whether to pursue a company (use jobsearch:company-research).
---

# Track

Read `${CLAUDE_PLUGIN_ROOT}/references/loading.md` first, then `${CLAUDE_PLUGIN_ROOT}/references/workspace-layout.md`. This skill owns `pipeline.md` and every `companies/<Company>/README.md`. Other skills read them and ask this skill to write.

Get today's date from the system before any write.

## Actions

**Add a company.** Create `<companies_dir>/<Company>/` and `README.md` from `${CLAUDE_PLUGIN_ROOT}/templates/company-README.md`. Fill `## Role` from whatever the user gave (posting link, title). Add a row to `pipeline.md` with Stage `Researching` unless told otherwise. Show the row.

**Log an event.** A message sent, a call held, a round completed, an offer received. Add a dated line to `## Timeline` (newest first), update the contact's `Last contact`, update `## Status` and `## Next step`, and update the pipeline row's Stage, Last contact, Next step and Owner. One write per file. Show the changed lines, not the whole file.

**Add a contact.** Add a row to `## Contacts`: Name | Title | Role in process | Channel | Last contact | Notes. Role in process is one of: recruiter, hiring manager, peer, executive, referrer, contact. The correspondence skill reads this to pick the register.

**Record a note.** Something they said, a concern raised and how it was settled, a debrief. Append to `## Notes` with the date. These notes are what keep a later thank-you from reopening a settled concern.

**Save a file.** When another skill produced a resume, research, prep or offer write-up and the user said yes, save it in the company folder as `YYYY-MM-DD_Type_<Company>.md` and add a Timeline line pointing to it.

**Show the pipeline.** Print `pipeline.md` sorted by Stage (Offer first, Closed last), then two short lists: waiting on me, waiting on them.

**What is stale.** Flag:
- A follow-up not sent within 24 hours of a conversation (a Timeline "call held" or "round completed" with no "message sent" after it in a day).
- A message sent with no reply, past the nudge timing in `${CLAUDE_PLUGIN_ROOT}/references/hard-rules.md` rule 8 (cold outreach: 5 to 7 business days; after an interview: the timeline they gave plus 2 business days, or 1 week).
- A pipeline row with Owner "them" and Last contact more than 10 days ago.
- A pipeline row with Owner "me" and no Next step.

Say what to do for each in one line. Offer to draft through `jobsearch:correspondence` where a message is the fix.

**Hand off.** When the user says the chat is long, or when the conversation has covered more than one round and several drafts, write `<companies_dir>/<Company>/YYYY-MM-DD_Handoff_<Company>.md`:
- Where things stand, three lines.
- Decisions made in this chat, one line each.
- Pending items, one line each, with who owes them.
- A starter prompt for the next chat, one paragraph, in a code block, that names the company, the stage, the file to read first (this handoff), and what the user wants next.

Update the README `## Notes` with one line pointing to the handoff. Tell the user to paste the starter prompt into a new chat.

**Close a company.** Set Stage to `Closed`, record the outcome and the date in Timeline and Status, add a one-line lesson to Notes if the user has one. Do not delete anything.

## Rules

- One company per README. A fact about company A never goes in company B's file.
- Never remove a Timeline line. Correct it with a new dated line.
- Never write comp figures here. Those go in the offer file only, and only when the user chooses.
- Never write anything from `${CLAUDE_PLUGIN_ROOT}/references/workspace-layout.md`'s "what never goes in these files" list.
- When `workspace.drive_folder` is set and Drive tools are present, mirror each written file after the local write, by the stored folder ID. Say so in three words. Never mirror an Offer file unless the user says yes for that file. When the tools are absent, say nothing about Drive.
- Plain text before a file is created for the first time; after that, log without asking, since the user asked you to. The exception: a note that records what another person said or a concern about the user. Show that line and ask before writing it.
