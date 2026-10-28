---
name: setup
description: First-run setup for the jobsearch plugin. Asks five questions, reads your resume, confirms your work history, and writes profile.md and workspace.md into a folder you choose. Every other jobsearch skill reads those files first. Use it when you install the plugin, when a skill says to run setup, or when your target role, location or resume changes. Not for daily job-search work; use the other jobsearch skills for that.
---

# Setup

Read `${CLAUDE_PLUGIN_ROOT}/references/loading.md` and `${CLAUDE_PLUGIN_ROOT}/references/truthfulness.md` in this plugin before starting.

This skill writes two files: `profile.md` and `workspace.md`. Every other skill in the plugin stops without them. Keep it to five questions. Everything else is deferred to the skill that needs it.

## If the files already exist

Look for `workspace.md` in the folder named in `~/.jobsearch`, at the default root (`~/JobSearch`), and in the current directory. If found, read it and `profile.md`. Say what is there in three lines (name, role, roster count) and ask: update one thing, or start over? Never overwrite a filled profile without that answer.

## Detect before asking

Get these from the system, not from the user:

- Time zone: the OS setting, as an IANA name. Windows reports a Windows zone name; map it to the IANA name (for example, Eastern Standard Time is America/New_York). Confirm it in one word if it looks wrong for the location they give.
- OS: macOS, Windows or Linux.
- Today's date.
- Which optional tools are present in this session: Google Drive tools, Gmail tools, an agent-spawning tool. Note what you find. Do not mention tools that are absent.

## The five questions

Ask one at a time. Wait for each answer. Plain language, no jargon about the plugin.

**1. Name and sign-off.** "What is your full name, and how do you sign a message? The default is `Best,` and your first name on the next line."

Set `full_name`, `first_name`, `sign_off`.

**2. What you are after.** "In one line, what are you going after? For example: senior analyst at a mid-size company, remote. Or: first team-lead role after five years as an individual contributor."

From that line, set `target_titles`, `remote_ok`, and `location` if stated. Then pick the pack and the role family:

- List the folders under `${CLAUDE_PLUGIN_ROOT}/packs/` in this plugin. Read each `pack.md` top section to see which fields and roles it covers.
- If the line matches a pack and a role block, propose them in plain words: "I'll treat you as a [role family] for wording and interview formats. Right?" One sentence. Wait for yes. Do not say "pack" or "role family" to the user.
- If nothing matches, say: "No role pack fits yet, so I will use neutral defaults. The skills still work." Leave `pack` and `role_family` blank.

Never guess silently. The role family decides which vocabulary every other skill uses.

**3. Where files live.** "Where should your job-search files live? Default is a folder called `JobSearch` in your home directory. I will create it." Accept a path or the default. Set `root` to the full absolute path (expand `~`; on Windows, a drive path such as `C:/Users/<name>/JobSearch`).

**4. Your resume.** "Drop in your current resume, or give me its path. I read it to learn your work history. I do not change it."

Read the file. Markdown, docx and pdf are all fine; use the tools the session has for each.

- If the user pasted the text, save it as `<root>/master-resume.md` after the folder exists, and set `master_resume` to that file. Say so in one line.
- If the user attached a file, copy it into `root` and set `master_resume` to the copy.
- If the user gave a path outside `root`, ask: "Copy it into your job-search folder? (recommended)". On yes, copy it and point `master_resume` at the copy. On no, point `master_resume` at the original path.

The resume is never edited. Every other skill reads `master_resume`, so it must point to a real file. Extract every employer with title, start and end, in the order they appear. Show the table back:

"Here is your work history as I read it. Correct anything that is wrong, and tell me about any employer that is missing."

| Company | Title | Start | End |
|---|---|---|---|

Wait. Apply every correction. This table becomes `## Roster`. It is the single most important thing this skill produces: a wrong roster propagates into every resume and letter. Copy dates exactly as the resume has them. Year-only is fine if that is what the resume says.

Then ask: "How many years of experience should I say you have? For example 8, or 12+." Set `years_experience` from the answer, never from arithmetic on the roster. Then draft `one_line_bio` from the resume in the user's register: one sentence, present tense, what they do and for how long, using that number. Show it: "Here is a one-line bio for outreach and cover letters. Edit it or say yes." Wait.

Also set `attachment_name` to `First.Last.Resume` unless they say otherwise.

**5. Connectors.** Ask this only if Google Drive tools or Gmail tools are present in the session. "I see [Drive / Gmail / both] in this session. Mirror your files to a Drive folder? Let me read email threads you point me to and place drafts? Say which, or neither." Set `drive_folder` and `gmail`. For Drive, store the folder ID, not only its name, and say which folder it is. If the Drive tools can read sharing settings, check that the folder is not shared with anyone else; if it is, say so and ask before using it. If neither tool is present, skip the question entirely and leave the defaults (`null`, `false`).

## Write the files

1. Create `root` if needed, plus `companies/`.
2. Write the full path of `root`, on one line, to the pointer file `~/.jobsearch`. Every later session finds the folder through it. If `~/.jobsearch` already names a different folder, ask before replacing it.
3. Write `profile.md` from `${CLAUDE_PLUGIN_ROOT}/templates/profile.md` with every field filled that the user gave or setup detected. If the user stated no location, leave `location` blank. Do not ask for it. Leave `## Approved facts` and `## Constraints` with one placeholder line each.
4. Write `workspace.md` from `${CLAUDE_PLUGIN_ROOT}/templates/workspace.md`.
5. Write `pipeline.md` from `${CLAUDE_PLUGIN_ROOT}/templates/pipeline.md` if it does not exist.
6. If `drive_folder` is set, mirror `workspace.md` and `pipeline.md` there. Mirror `profile.md` only if the user says yes; its Constraints section can hold private terms.

## Finish

Show the file tree you created, then one line per skill on what it is for. Then say:

"Tell me any numbers or certifications you want me to use, and any companies or topics to avoid, whenever you think of them. I'll add them to your profile."

End with two things to try now:
- "Paste a job posting and say: tailor my resume."
- "Say: write a thank-you note to [name] at [company]."

Do not run any other skill from here. Do not ask for a job description. Setup ends when the files are written.

## What setup never does

- Never writes a fact you did not read from the resume or hear from the user.
- Never computes years of experience from dates.
- Never changes the resume file.
- Never stores passwords, tokens, or anything about accounts.
