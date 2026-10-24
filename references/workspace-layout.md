# Workspace layout

Plain files in a folder the user owns. Setup writes the first two; the skills write the rest as they work. Local first. Connectors mirror when present and never block.

```
<root>/                          default ~/JobSearch
  profile.md                     facts about the user; see templates/profile.md
  workspace.md                   paths and connector settings; see templates/workspace.md
  pipeline.md                    one row per company; see templates/pipeline.md
  <master resume>                whatever the user has; path in workspace.md
  companies/
    <Company>/
      README.md                  see templates/company-README.md
      YYYY-MM-DD_<Type>_<Company>.md
      YYYY-MM-DD_<Type>_<Company>.docx    only when the user asks for a file
```

## File names

`YYYY-MM-DD_Type_Subject.md`. Date first so files sort. Type is one word: Resume, Research, Prep, Letter, Offer, Handoff. Subject is the company name in PascalCase (one word, each part capitalized, no spaces). Add a fourth part for a detail when two files would otherwise collide: `2026-03-02_Letter_Acme_HiringManager.md`.

Get the date from the system before naming a file.

## Company README fields

Each `companies/<Company>/README.md` has these headings, in this order. Skills read them by name.

- `## Status`: one line. Where this company is right now.
- `## Role`: title, link to the posting, posting date, location and remote terms as stated.
- `## Contacts`: a table: Name | Title | Role in process | Channel | Last contact | Notes.
- `## Timeline`: dated lines, newest first. One line per event: message sent, call held, round completed, offer received.
- `## Next step`: what happens next and who owes it, with a date.
- `## Notes`: anything the user wants the next session to know. What they said. What the user said. Concerns raised and how they were settled.

## pipeline.md columns

One markdown table. Columns, in order:

Company | Role | Stage | Last contact | Next step | Owner | Notes

Stage is one of: Researching, Applied, Screening, Interviewing, Final, Offer, Closed. Owner is "me" or "them." Last contact is a date.

The `track` skill owns this file. Other skills read it and ask `track` to write.

## Handoff file

When a chat gets long, `track` writes `companies/<Company>/YYYY-MM-DD_Handoff_<Company>.md`: where things stand, what was decided, what is pending, and a one-paragraph prompt the user pastes to start the next chat. The next session reads it through the company README.

## What never goes in these files

Passwords, tokens, API keys, account numbers, anyone's home address, or anything the user would not want a colleague to see. Comp figures go in the offer file only, and only when the user chooses to write them down.
