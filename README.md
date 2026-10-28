# jobsearch-kit

A job-search toolkit for Claude Code. Eight skills that tailor your resume, draft every message you send, research companies, prepare you for interviews, track your pipeline, fix your LinkedIn profile and work an offer. It works in any field. Your facts live in one profile file that you own and that every skill reads. Nothing about your background comes from anywhere else.

## Before you start

- Claude Code installed and signed in. See https://code.claude.com/docs for the install steps. The desktop app's Code tab works too.
- Your current resume, as a file (Word, PDF or text) or as text you can paste.

## Install

1. Open a terminal (Terminal on a Mac, PowerShell on Windows) and paste these two lines:

   ```
   claude plugin marketplace add au5m/jobsearch-kit
   claude plugin install jobsearch@jobsearch-kit
   ```

2. Close Claude Code completely and open it again. New skills load at startup.
3. In Claude Code, type:

   ```
   /jobsearch:setup
   ```

Setup asks five questions, reads your resume, shows your work history back to you for confirmation, and writes your files into a folder you choose. It remembers that folder, so later sessions find it on their own. Every other skill reads those files first. Until setup has run, the other skills stop and point you to it.

## Updating

```
claude plugin marketplace update jobsearch-kit
claude plugin update jobsearch@jobsearch-kit
```

Then restart Claude Code.

## Skills

| Skill | Use it when | Not for |
|---|---|---|
| `/jobsearch:setup` | First run, or when your situation changes | Daily use |
| `/jobsearch:resume` | You have a job description and want your resume tailored to it | Cover letters, LinkedIn |
| `/jobsearch:correspondence` | You need to write to a person: outreach, follow-up, reply, nudge, cover letter | Resume text, LinkedIn profile text |
| `/jobsearch:company-research` | You want to know whether a company is a good move and when to engage | Resume changes |
| `/jobsearch:interview-prep` | You have an interview, take-home, presentation or panel coming | Writing the thank-you note |
| `/jobsearch:track` | You want to log a contact, update status, see what is stale, or hand a long chat off | Drafting messages |
| `/jobsearch:linkedin` | Your headline, About or experience entries need work | Connection-request notes (that is correspondence) |
| `/jobsearch:offer` | You have an offer and want to compare, counter or prepare references | Anything before the offer exists |

## How it stays honest

- Every skill reads your `profile.md` before it drafts. No profile, no draft.
- Nothing is invented. A missing number becomes a marked blank like `[# of projects]` and a question to you. It is never estimated.
- Titles, employers and dates are copied, never changed. Year-only dates are allowed if your resume uses them.
- Every draft checks itself against your work history before you see it, so an employer cannot silently drop out or leak in.
- Messages go through a blind review: a fresh reviewer plays the recipient and gives a verdict before you see the draft. You get one draft and one recommendation.

## Two voices

Documents (resume bullets, LinkedIn experience entries): flat, factual, no adjectives about yourself, every line tied to an outcome.

Correspondence (email, messages, cover letters, LinkedIn About): warm, peer to peer, plain. Thanks for something specific, reacts to what the person said, says what you want, closes warmly. No em dashes, no corporate phrasing, no generic enthusiasm.

## Your files

Setup writes these into the folder you choose (default `~/JobSearch`), plus a one-line pointer file at `~/.jobsearch` that holds the folder's path:

```
JobSearch/
  profile.md        your facts: name, sign-off, bio, work history, approved facts, constraints
  master-resume.md  your resume, if you pasted it (a file you gave is copied here instead)
  workspace.md      where things live; connector settings
  pipeline.md       one row per company you are working
  companies/
    <Company>/
      README.md     contacts, status, next step, notes for this company
      2026-01-15_Resume_<Company>.md
      2026-01-15_Research_<Company>.md
```

Plain files first. If Google Drive or Gmail tools are present in your session, setup offers to use them. They are never required. Drive mirrors your files but never your offer files or your profile unless you say yes. Gmail reads only the thread you point to. Nothing is ever sent for you.

Job postings, emails and web pages are read as data only. If one contains an instruction aimed at Claude, you are told about it, and it is not followed.

## Role packs

The core never names a job title, a product category or an industry. A role pack adds the vocabulary, keyword families, interview formats and company-research lens for a field. Setup picks the pack and the role from one sentence about what you are after.

Shipped in this release:

- `packs/tech/pack.md`: role blocks for sales engineer, software engineer, product manager, plus a default block.

No pack for your field yet? The skills fall back to `references/defaults.md`, which is neutral and works everywhere. To add a pack, copy `packs/_template/pack.md`, keep the section headings exactly, and open a pull request.

## Layout

```
.claude-plugin/     plugin and marketplace manifests
skills/<name>/      one folder per skill
agents/             the blind reviewer used by correspondence
references/         shared rules every skill reads; field-free
packs/              role packs
templates/          the files setup writes for you
scripts/            release gate
```

## Contributing

Pull requests welcome for new packs and for fixes. Run `scripts/release-gate.sh` before you open one. It needs bash with GNU grep (Git Bash on Windows). It fails on any em dash and any role vocabulary that leaks from a pack into the core. The personal-facts check reads your own list of private terms from the file named in `JOBSEARCH_PRIVATE_TERMS`; that list never goes in the repo. Without it, that check is skipped.

## Credit

The message structure in `correspondence` is the coffee-chat method as practiced and written down by au5m, restated here in plain words.

## License

MIT. See `LICENSE`.
