#!/usr/bin/env bash
# Release gate for jobsearch-kit.
# Fails the build on: any em dash; any personal fact left over from the
# private plugin this was derived from; any role vocabulary that leaks from
# a pack into the field-free core; a pack missing a required heading.
# Run from anywhere: scripts/release-gate.sh [repo root]

set -u
ROOT="${1:-$(cd "$(dirname "$0")/.." && pwd)}"
cd "$ROOT" || exit 2
SELF="scripts/release-gate.sh"
fail=0

say() { printf '%s\n' "$*"; }
hit() { fail=1; say "FAIL: $*"; }

# Files under check: everything tracked or present, minus .git, this script
# and the private terms file.
files() {
  find . -type f ! -path './.git/*' ! -path "./$SELF" ! -path './scripts/private-terms.txt' -print | sort
}

# 1. Em dash (U+2014) anywhere.
say "== em dash"
if files | xargs grep -n -P '\x{2014}' 2>/dev/null; then
  hit "em dash found"
else
  say "ok"
fi

# 2. Personal facts. The terms live in a private file, never in this repo.
#    The file named in JOBSEARCH_PRIVATE_TERMS, else scripts/private-terms.txt
#    (gitignored). One extended regex per line, case-insensitive; # lines and
#    blank lines are ignored. A line starting "author:" is a term allowed in
#    LICENSE and the two manifests, and nowhere else.
say "== personal facts"
terms_file="${JOBSEARCH_PRIVATE_TERMS:-scripts/private-terms.txt}"
if [ ! -f "$terms_file" ]; then
  say "skipped: no private terms file (set JOBSEARCH_PRIVATE_TERMS)"
else
  while IFS= read -r line || [ -n "$line" ]; do
    line="${line%$'\r'}"
    case "$line" in ''|'#'*) continue ;; esac
    case "$line" in
      author:*)
        term="${line#author:}"
        if files | grep -v -E '^\./(LICENSE|\.claude-plugin/(marketplace|plugin)\.json)$' | xargs grep -n -i -E -- "$term" 2>/dev/null; then
          hit "author name outside LICENSE and manifests"
        fi ;;
      *)
        if files | xargs grep -n -i -E -- "$line" 2>/dev/null; then
          hit "personal term found (see the line above)"
        fi ;;
    esac
  done < "$terms_file"
  say "personal facts checked"
fi

# 3. Role vocabulary leaking into the core (skills/ and references/ only).
say "== core field boundary"
core_terms=(
  'sales engineer' 'software engineer' 'product manager' 'account executive'
  'technical win' 'proof of value' 'proof of concept' '\bPOV\b' '\bPOC\b'
  '\bDSPM\b' '\bEDR\b' '\bXDR\b' '\bSIEM\b' '\bCISO\b' 'cybersecurity' 'security vendor'
  'quota' 'territory' '\bdemo\b' '\bdemos\b' '\bp99\b' '\bPRD\b' 'roadmap' '\bRFP\b'
  'pre-sales' 'presales' '\bSaaS\b' '\bAE\b' '\bSE\b'
)
for term in "${core_terms[@]}"; do
  if find skills references -type f -print0 | xargs -0 grep -n -i -P -- "$term" 2>/dev/null; then
    hit "role vocabulary in core: $term"
  fi
done
say "core checked"

# 4. Every pack has the seven headings, each with a default block.
say "== pack structure"
for pack in packs/*/pack.md; do
  [ -f "$pack" ] || continue
  for h in 'Vocabulary' 'Keyword families' 'Ask patterns' 'Reviewer notes' 'Role lens' 'Interview formats' 'Examples'; do
    if ! grep -q -x "## $h" "$pack"; then
      hit "$pack missing heading: ## $h"
    fi
  done
  n_head=$(grep -c -E '^## (Vocabulary|Keyword families|Ask patterns|Reviewer notes|Role lens|Interview formats|Examples)$' "$pack")
  n_def=$(grep -c -x '### role: default' "$pack")
  if [ "$n_def" -lt "$n_head" ]; then
    hit "$pack has $n_head sections but $n_def default blocks"
  fi
done
say "packs checked"

# 5. Every skill listed in plugin.json exists and has frontmatter with name and description.
say "== skills"
for d in skills/*/; do
  f="${d}SKILL.md"
  [ -f "$f" ] || { hit "missing $f"; continue; }
  head -1 "$f" | grep -q -x -- '---' || hit "$f has no frontmatter"
  grep -q -E '^name: ' "$f" || hit "$f has no name"
  grep -q -E '^description: ' "$f" || hit "$f has no description"
  grep -q -i 'Not for' "$f" || hit "$f description has no Not for clause"
done
say "skills checked"

if [ "$fail" -ne 0 ]; then
  say "RELEASE GATE: FAIL"
  exit 1
fi
say "RELEASE GATE: PASS"
