# Role packs

The core of this plugin (`skills/` and `references/`) never names a job title, a product category, an industry, or a verb that belongs to one profession. A pack adds that for a field. Setup picks the pack and the role family from one sentence about what the user is after and writes them into `profile.md`.

## How the core reads a pack

`packs/<pack>/pack.md` has seven fixed section headings the skills read by name:

| Section | Read by | Merge rule |
|---|---|---|
| Vocabulary | resume, linkedin, correspondence, interview-prep | Role block replaces default |
| Keyword families | resume, linkedin | Role block adds to default |
| Ask patterns | correspondence | Role block adds to default |
| Reviewer notes | correspondence (reviewer persona) | Role block adds to default |
| Role lens | company-research, offer, interview-prep | Role block adds to default |
| Interview formats | interview-prep | Role block adds to default |
| Examples | resume | Role block adds to default |

Each section holds a `### role: default` block and zero or more `### role: <family>` blocks. The core reads the default block, then the block matching `profile.role_family`, and never any other block. A rule written for one role must not reach a user in another role.

No pack, or a pack that does not exist: the core reads `references/defaults.md`, which has the same headings with neutral content.

## Shipped

- `tech/`: sales engineer, software engineer, product manager, default.

## Writing a pack

1. Copy `packs/_template/pack.md` to `packs/<yourfield>/pack.md`.
2. Keep the seven headings exactly as spelled. The skills grep for them.
3. Fill `### role: default` in every section first. It is what every user of the pack gets.
4. Add `### role: <family>` blocks for the roles that differ. Lowercase, the way a person says the title.
5. No personal facts, no real names, no company names in examples. Placeholders only.
6. No em dashes.
7. Run `scripts/release-gate.sh` and open a pull request.

A pack is vocabulary and lenses, not rules. The rules live in `references/` and apply to everyone.
