#!/usr/bin/env bash
# Assemble paper/sections/*.md into paper/foundations_iii.md in the order
# given by paper/sections.manifest. Missing files are skipped with a warning
# so the build works while the paper is still being drafted.
set -euo pipefail
cd "$(dirname "$0")"

out="foundations_iii.md"
manifest="sections.manifest"
sep=$'\n\n'

: > "$out"
included=0
skipped=0

while IFS= read -r line || [[ -n "$line" ]]; do
  # strip leading/trailing whitespace
  trimmed="${line#"${line%%[![:space:]]*}"}"
  trimmed="${trimmed%"${trimmed##*[![:space:]]}"}"
  [[ -z "$trimmed" || "$trimmed" == \#* ]] && continue
  src="sections/$trimmed"
  if [[ -f "$src" ]]; then
    cat "$src" >> "$out"
    printf '%s' "$sep" >> "$out"
    included=$((included + 1))
  else
    echo "warn: missing $src (skipped)" >&2
    skipped=$((skipped + 1))
  fi
done < "$manifest"

echo "Built $out ($(wc -l < "$out") lines, $included sections included, $skipped skipped)"
