#!/usr/bin/env bash
# Build the Foundations III LaTeX paper.
#
# Pipeline:
#   1) Assemble the markdown sources into paper/foundations_iii.md (sanity
#      assemble using the existing paper/build.sh).
#   2) Convert each section markdown to LaTeX via pandoc, dropping the
#      "N. ", "N.M ", "N.M.K ", and "Appendix X. " numeric prefixes from
#      headings so LaTeX numbers the sections itself.
#   3) Run latexmk on paper/main.tex; latexmkrc directs output to build/.
#   4) After successful build, latexmkrc also runs latexpand to produce a
#      flattened single-file source at build/main_flat.tex.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
paper_root="${repo_root}/paper"

mkdir -p "${paper_root}/build"

# Step 1: assemble single markdown for sanity (existing pipeline).
cd "${paper_root}"
bash build.sh

# Step 1b: render mechanization disclosure includes from the Lean manifest.
cd "${repo_root}"
python3 scripts/render_mech_disclosure.py

# Step 2: pandoc markdown -> LaTeX, per section file.
# The Front Matter file (00-front-matter.md) is not converted here; its
# title/abstract/keywords content is mirrored directly inside main.tex.
cd "${paper_root}"
for src in sections/*.md; do
  base=$(basename "${src}" .md)
  case "${base}" in
    00-front-matter)
      # Skip: handled inline in main.tex.
      continue
      ;;
  esac
  out="sections/${base}.tex"
  # -auto_identifiers and -implicit_header_references prevent pandoc from
  # emitting \hypertarget/\label slugs derived from heading text; many
  # subsubsections (e.g. "Statement", "Evidence", "Nonclaim") repeat across
  # sections and would otherwise produce hundreds of duplicate-label warnings.
  tmp_md="$(mktemp --suffix=.md)"
  python3 "${repo_root}/scripts/md_isolate_envs.py" "${src}" "${tmp_md}"
  pandoc -f markdown-auto_identifiers-implicit_header_references \
    -t latex --wrap=preserve "${tmp_md}" -o "${out}"
  rm -f "${tmp_md}"

  # Strip numeric/appendix prefixes from section/subsection/subsubsection
  # headings so LaTeX's own numbering takes over.
  # \section{1. Introduction} -> \section{Introduction}
  # \section{Appendix A. Full Definitions} -> \section{Full Definitions}
  # \subsection{1.1 ...} -> \subsection{...}
  # \subsubsection{1.1.1 ...} -> \subsubsection{...}
  sed -i -E 's/\\section\{Appendix [A-Z]\. /\\section{/' "${out}"
  sed -i -E 's/\\section\{[0-9]+\. /\\section{/' "${out}"
  sed -i -E 's/\\subsection\{[0-9]+\.[0-9]+ /\\subsection{/' "${out}"
  sed -i -E 's/\\subsection\{[A-Z]\.[0-9]+ /\\subsection{/' "${out}"
  sed -i -E 's/\\subsubsection\{[0-9]+\.[0-9]+\.[0-9]+ /\\subsubsection{/' "${out}"
  sed -i -E 's/\\subsubsection\{[A-Z]\.[0-9]+(\.[0-9]+)? /\\subsubsection{/' "${out}"
  # Same prefixes can appear inside \texorpdfstring{...}{...} arguments when
  # pandoc protects math content; strip from each arg of texorpdfstring.
  sed -i -E 's/(\\texorpdfstring\{)([0-9]+|[A-Z])\.[0-9]+(\.[0-9]+)? /\1/g' "${out}"
  sed -i -E 's/(\\texorpdfstring\{[^{}]*\}\{)([0-9]+|[A-Z])\.[0-9]+(\.[0-9]+)? /\1/g' "${out}"
  # Section titles with math: strip a bare "N. " prefix from both
  # \texorpdfstring arguments on \section lines.
  sed -i -E '/^\\section\{\\texorpdfstring/ s/\{[0-9]+\. /{/g' "${out}"

  # pandoc emits \tightlist after compact list items; harmless but noisy.
  # Define it as a no-op via the macros file (see includes/...).
done

# Step 2b: label headings and claims, and make printed cross-references
# ("Subsubsection 5.6.6", "Theorem 25") clickable without changing the text.
python3 "${repo_root}/scripts/tex_crossrefs.py" "${paper_root}/main.tex"

# Step 3 + 4: build the PDF and flat .tex. Use lualatex for native Unicode
# support (pseudo-Lean code blocks contain forall/exists/arrow glyphs).
latexmk -lualatex -interaction=nonstopmode -halt-on-error main.tex

echo
echo "Built:"
ls -la "${paper_root}/build/main.pdf" "${paper_root}/build/main_flat.tex" 2>/dev/null || true
