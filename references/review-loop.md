# Review loop

Goal: the user gets one draft, reviewed as a whole, with one recommendation. They approve or redirect. They never settle a dispute between reviewers.

Run the blind review on every message draft before the user sees it. The user does not need to ask. A draft without a verdict is not finished. Do not show it.

## Exceptions

- A scheduling reply (a yes, times, a confirmation) skips the review.
- A reply under four lines to someone who is not a decision-maker gets one review. The user sees "reviewed once, send," not a log.

## Stakes tier

Set the tier before the first review.

- Decision-maker: owns or strongly shapes the hire. Hiring manager, director, final approver, panel lead. Up to three reviews.
- Everyone else: recruiter, coordinator, peer interviewer, contact. Up to two reviews.

## The loop

1. Spawn a fresh reviewer with the `jobsearch:blind-reviewer` agent type, which has no tools, and give it the prompt in `${CLAUDE_PLUGIN_ROOT}/skills/correspondence/reviewer.md`, the draft, the role facts, and the recipient's actual message, verbatim, inside the outside-text markers. If that agent type is not available, use a general agent and tell it not to use any tool. The reviewer has not seen the drafting, the rules, or earlier versions. It returns a verdict and up to two line changes. For an option set, spawn one reviewer per option, in parallel. Each sees only its own option.
2. Apply a change only if it fixes a missing move or a tone problem. Do not apply a style preference. Reject any change that adds a claim about the user's background, and flag it to the user as unverified.
3. If you changed the draft, spawn a new fresh reviewer on the whole rewritten draft. Do not pass earlier verdicts or versions.
4. Stop when a reviewer says send and flags no move or tone problem, or when the tier limit is reached.
5. Consensus rule: if two or more reviewers flag the same line, fix that line, even if each called it minor.
6. No dispute handoff. If reviewers disagree, decide. Use the moves, the pre-send check, and the concerns the recipient already settled. Build that version. If the tier limit is not reached, review it as a whole. The version the user sees must be the version the last reviewer read.
7. If the tier limit is reached and the last reviewer still flags a problem, or the final version differs from the last reviewed version, say so in one line and ask the user one question. This is the only case where the user decides.
8. User override: if the user asks for another review, run it, even past the tier limit. Then apply the consensus rule to the result.

## What the user sees

- The final draft in a code block, and where it goes.
- One summary line, for example "Reviewed 2x, all 8 checks met."
- Only when something needs the user: the pre-send item that is not met, a rejected suggestion that added a claim about the user, or the one question from step 7.
- The full log (one line per review, each rejected suggestion and why, all eight check lines) only when the user asks for it.

## Timing

Run reviews in parallel when you can. The send window is within 24 hours, 10am to 5pm in the recipient's time zone. If the loop will push past it, say so before you start.

## When no subagent tool exists

Some sessions cannot spawn agents. Then run the review yourself in a separate pass: write the recipient's persona and the eight questions from `reviewer.md`, answer them cold as that person, and apply the same rules. Say "self-reviewed" instead of "reviewed." It is weaker than a blind review. It is still better than none.
