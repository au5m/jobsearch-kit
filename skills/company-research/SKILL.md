---
name: company-research
description: Researches a company you are considering applying to, interviewing with, or joining, and tells you whether it is a strong career move for someone in your role and when and how to engage. Use it whenever you name a company in a job-search context, including "look into this company", "is this company legit", "should I take this call", "is it too early to reach out", "research them before my interview", or when you paste a job posting and ask about the company behind it. Also for questions about a prospective employer's funding, competitors, market, leadership, layoffs, runway, or open roles, even if you do not say "research". Not for resume changes (use jobsearch:resume) or interview rehearsal (use jobsearch:interview-prep).
---

# Company research

Read `${CLAUDE_PLUGIN_ROOT}/references/loading.md` first and load the user's context in that order. Load the pack's Role lens section for the user's role family (or `${CLAUDE_PLUGIN_ROOT}/references/defaults.md`). Read `pipeline.md` and the company README if one exists.

The user evaluates companies as a candidate, not an investor. The question is whether this is a good place to do the work they want to do and build a career, and when to make a move. Weight everything toward the user's role as described in the Role lens.

## How to work

- Confirm the entity first. Disambiguate similar names before going deep.
- Search before answering. Funding, leadership, customers, headcount and roles change constantly. Run separate searches per dimension rather than one broad query.
- Classify the stage early. The stage decides which sections matter.
- Rank sources. Trust in this order: company announcements and filings, established trade and business press, investor posts, then aggregators and directories. Label any fact that rests only on an aggregator. Mark vendor claims from a press release as marketing.
- Make the bear case as hard as the bull case. The user would rather hear the risks now than in month three.
- Never use research about a person with the user's name as a fact about the user.

## Stage check

- Pre-product or pre-launch: no paying customers or no shipped product. Focus on timeline, design partners, whether the function the user would join exists yet, who leads it, and when hiring for the user's role starts.
- Early (seed to Series B): named customers, first wins, size of the user's would-be team, founder-led versus professional functions.
- Growth (Series C and later): the full template. Weight leadership stability in the user's function and hiring trend.
- Late-stage or public: weight health signals, reorgs, segment performance, comp structure and refresh grants, and where the role sits in the org.

For a non-venture company (private, family-owned, public sector, nonprofit), replace the funding section with ownership, budget source and stability, and skip the round history.

## What to cover

1. Product or service and who it is for. The core thesis and what differentiates it.
2. Market. Sourced size range if one exists, demand drivers, and whether it is a real category or a feature an incumbent can absorb. Call founder or investor market-size claims what they are.
3. Traction. Named customers, partners, retention, analyst recognition, all with caveats on unaudited numbers.
4. Competitive landscape. Incumbents and newer players, their funding, moats, and the single sharpest threat.
5. Funding and leadership. Total raised, round history, instrument (priced round, convertible note, SAFE), valuation if priced, lead investors, board, founder and exec background.
6. Health signals. Layoffs or reorgs in the last 18 months, turnover in the user's function's leadership, hiring trend, notable news. Employee reviews only as a weak signal, labeled as such.
7. Open roles. Check the careers page and job listings. List roles matching `profile.target_titles` and adjacent ones, with location relative to `profile.location`, remote eligibility as stated, and any credential requirement. If there are no matching roles, say what the hiring pattern implies about timing.

## Your network and conflicts

- Network path. Read the company README and `pipeline.md` for contacts, referrers or relationships at the company. Then ask the user one question: "Do you know anyone there from past employers or past work?" That cannot be searched. Name the person the user would most want to reach, by title.
- Past-employer conflict. Compare the company's product to the user's past employers' from the roster. If there is real overlap, flag it and point to any covenant in `## Constraints`. If none is recorded, ask. Do not give legal conclusions.
- Pipeline comparison. One or two lines on how this company compares to the others in `pipeline.md` on stage, fit and timing.

## Role lens

Apply the pack's Role lens for the user's role family: what to weigh, and the questions to validate before joining, adjusted to stage. Add the equity questions below when the company is venture-backed:

- Priced round: share count, last preferred price, current 409A strike.
- Convertible note or SAFE: valuation cap, discount, how option pricing works until the next priced round.
- Public: RSU grant value, vesting schedule, refresh policy.

## Output

Answer in chat, bottom line first:

1. Bottom line (two to three lines): is this a strong move, and the engagement call. Pick one: apply now, network in now, or wait for a trigger. Name the triggers to watch (a leadership hire in the user's function, the first posting for the user's role, a launch date, the next round, first named customers).
2. Snapshot, one line: what they are, stage, funding or ownership.
3. The sections above, a few bullets each. Collapse any section with nothing material to one line.
4. Network and conflicts, role lens, and questions to ask.

Readable in about three minutes. No em dashes. Vocabulary from the user's role block.

If the user is pursuing the company, offer in one line to save the write-up as `<companies_dir>/<Company>/YYYY-MM-DD_Research_<Company>.md` through `track`, so later sessions (resume, interview prep, thank-you notes) can read it.

If the user asks a narrow question ("did they just have layoffs?", "who are their competitors?", "are they hiring for my role?"), answer that question directly without the full report.
