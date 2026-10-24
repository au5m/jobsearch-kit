# Loading order

Every skill in this plugin reads this file first, then loads the user's context in this order. Stop at the first missing required item and say what to do.

## 1. workspace.md

Look for it in this order:

1. The path the user gives in the conversation.
2. `~/JobSearch/workspace.md`.
3. `./workspace.md` in the current working directory.

If it is missing: say "Run /jobsearch:setup first. It takes five questions." Then stop. Do not draft anything. Do not guess a folder.

`workspace.md` gives you `root`, `master_resume`, `companies_dir`, `pipeline`, `drive_folder` and `gmail`. All paths are relative to `root` unless absolute.

## 2. profile.md

At `<root>/profile.md`. Required by every skill except `setup`.

If it is missing, or its `## Roster` section is empty: same message as above, then stop. A skill that drafts without a roster will invent a career. That is the failure this gate prevents.

`profile.md` is the only source of facts about the user's background. Not the chat history from other sessions, not web search results about a person with the same name, not a resume someone else pasted. If the user states a new fact in the conversation, use it, and offer to add it to `## Approved facts` so the next session has it.

## 3. The role pack

`profile.pack` names a folder under `${CLAUDE_PLUGIN_ROOT}/packs/` in this plugin. `profile.role_family` names a block inside it.

Open `${CLAUDE_PLUGIN_ROOT}/packs/<pack>/pack.md`. For each section the skill needs (Vocabulary, Keyword families, Ask patterns, Reviewer notes, Role lens, Interview formats, Examples):

1. Read the `### role: default` block.
2. If a `### role: <role_family>` block exists, read it too.
3. Vocabulary: the role block replaces the default block.
4. Every other section: the role block adds to the default block.

If `profile.pack` is empty or the folder does not exist, read `${CLAUDE_PLUGIN_ROOT}/references/defaults.md` instead. It has the same section headings and neutral content. Say once, in one line, that no pack is loaded.

Never read a role block other than the one that matches `profile.role_family`. A rule written for one role must not reach a user in another role.

## 4. The company README, when the task names a company

At `<companies_dir>/<Company>/README.md`. It holds contacts, status, the last message sent, and notes from earlier sessions. Read it before drafting anything addressed to someone at that company, and before any research or interview prep for that company. If it does not exist, offer to create it from `${CLAUDE_PLUGIN_ROOT}/templates/company-README.md` through the `track` skill after the task.

## 5. pipeline.md

At `<root>/<pipeline>`. One row per company. Read it when the task compares companies, checks for conflicts, or asks what is stale.

## Connectors

`workspace.drive_folder` is `null` unless the user set it. `workspace.gmail` is `false` unless the user set it. When a value is set and the matching tools are present in the session, mirror writes there after writing the local file, and read from there when the local copy is missing. When the tools are absent, work from local files and say nothing about connectors. Never block on a connector.

## Dates

Before writing any dated filename or any "sent on" line, get today's date from the system, not from memory. File names use `YYYY-MM-DD_Type_Subject.md`.
