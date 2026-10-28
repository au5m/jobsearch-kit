---
name: offer
description: Works a job offer with you: lays out the components in a table, compares two or more offers or an offer against your current role, drafts a counter, prepares your references, and lists the questions to settle before you accept. Use it when you say you have an offer, a verbal offer, a comp range, or an offer letter, when you ask "should I counter", "how do I compare these", "what should I ask about the equity", or "who should I use as references". Not for anything before an offer exists (use jobsearch:company-research for the company and jobsearch:interview-prep for the final round).
---

# Offer

Read `${CLAUDE_PLUGIN_ROOT}/references/loading.md` first and load the user's context in that order. Read the company README and any `Research` file for the company. Read `${CLAUDE_PLUGIN_ROOT}/references/drafting-modes.md`: the counter message is correspondence; the comp table and brief are documents. Read `${CLAUDE_PLUGIN_ROOT}/references/truthfulness.md` and `${CLAUDE_PLUGIN_ROOT}/references/hard-rules.md`: every claim about the user comes from the profile, the master resume, or what they say here.

The user decides. This skill lays out the numbers, the levers and the questions, and drafts the message they choose to send. It does not tell them what to accept. It is not legal, tax or financial advice, and it says so once when the table is first shown.

## Step 1: Capture the offer

Ask for the offer letter or the verbal terms. Fill a table with what is stated; leave the rest as marked blanks and list them as questions:

| Component | Offer | Notes |
|---|---|---|
| Base | | |
| Target variable (bonus, commission) and how it is measured | | |
| Sign-on | | |
| Equity: type, amount, vesting, cliff | | |
| For options: strike, last preferred price, 409A, exercise window after leaving | | |
| For RSUs or public stock: grant value, vest schedule, refresh policy | | |
| Benefits that carry a number (401k match, HSA, stipends) | | |
| Time off | | |
| Start date | | |
| Title and level | | |
| Location and remote terms, as written | | |
| Relocation | | |
| Severance or change-of-control terms, if any | | |
| Offer expiry | | |

Never put a number in the table that the user did not give. Never estimate equity value; show the inputs and let the user run the arithmetic, or run it only on inputs they supply, showing the formula.

## Step 2: Compare

If there is a second offer or a current role, add a column per option and a final row "What matters most to you," filled from what the user says. Hold the pack's Role lens in mind for which components matter in the user's field, but do not rank the options. State trade-offs in one line each.

## Step 3: Decide whether to counter

Lay out the levers: base, sign-on, equity, start date, title, remote terms, time off, severance. For each, one line on how negotiable it usually is at this company's stage and what the user would need to say to ask for it (a competing number, a market data point they have, a specific reason). Do not invent market data. If the user wants a market figure, say that it must come from a source they trust and name the kinds of sources (levels data, recruiter ranges, peers), not a number.

Ask one question: "Which one or two levers matter most to you?" Counter on at most two.

## Step 4: Draft the counter

Correspondence mode, to the recruiter or hiring manager who made the offer. Structure:

```
Hi Jordan,

Thanks for the offer and for [the specific thing they did in the process]. I am glad to be at this point with the team.

[One sentence on what is strong about the offer.] [One or two sentences naming the one or two things you would like to adjust, with the number or term, and the plain reason.]

[One sentence that keeps the door open: if the team can get there, you are ready to move forward.]

[profile.sign_off]
[profile.first_name]
```

Run the review loop (`${CLAUDE_PLUGIN_ROOT}/references/review-loop.md`, decision-maker tier) and the pre-send check (`${CLAUDE_PLUGIN_ROOT}/references/presend-check.md`). No ultimatums unless the user wants one and says so. No comparison to a competing offer unless the user chooses to disclose it. Never state a reason for leaving the current job.

## Step 5: References

Ask who the user has in mind. For each: name, relationship, what they can speak to, last time in touch. Then draft:

- A short note to each reference (correspondence mode): thanks for being willing, the company and role in one line, the two things the user would like them to speak to, when to expect the call, and a plain offer to send the posting. The two things come from the roster or approved facts. Run the pre-send check on each note.
- A one-page brief for the user's own use (documents mode): per reference, what the user says this person can speak to, any gap the user names, and what to ask them to emphasize. Do not guess what a reference will say. No scripts for the reference; references speak for themselves.

## Step 6: Before accepting

A short list of questions to settle, from the pack's Role lens "questions to validate before joining" plus: start date flexibility, written confirmation of any verbal change, what happens to unvested equity on a change of control, the exercise window if options, who the manager is and whether that could change before start, and the expiry date of the offer.

## Output

Plain text first; build a file on yes. Save as `<companies_dir>/<Company>/YYYY-MM-DD_Offer_<Company>.md` through `track` only when the user asks. Comp figures go in that file and nowhere else in the workspace.

Offer in one line to log the offer event and the expiry date through `track`.
