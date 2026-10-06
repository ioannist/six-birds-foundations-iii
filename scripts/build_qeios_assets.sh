#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PAPER_DIR="$ROOT_DIR/paper"
BUILD_DIR="$PAPER_DIR/build"
QEIOS_BUILD_DIR="$BUILD_DIR/qeios_single"
FLAT_TEX="$BUILD_DIR/main_flat.tex"
BBL_FILE="$BUILD_DIR/main.bbl"
QEIOS_TEX="$QEIOS_BUILD_DIR/qeios_single.tex"
QEIOS_PDF="$QEIOS_BUILD_DIR/qeios_single.pdf"
QEIOS_ZIP="$QEIOS_BUILD_DIR/qeios_source_bundle.zip"
QEIOS_NOTES_SRC="$ROOT_DIR/scripts/templates/qeios_submission_notes.md"
QEIOS_README_SRC="$ROOT_DIR/scripts/templates/qeios_readme_build.txt"
QEIOS_NOTES="$QEIOS_BUILD_DIR/Qeios_Submission_Notes.md"
QEIOS_README="$QEIOS_BUILD_DIR/README_BUILD.txt"

cd "$ROOT_DIR"
make paper-build

mkdir -p "$QEIOS_BUILD_DIR"

python3 - <<'PY'
from pathlib import Path

flat_path = Path("paper/build/main_flat.tex")
bbl_path = Path("paper/build/main.bbl")
out_path = Path("paper/build/qeios_single/qeios_single.tex")

flat_tex = flat_path.read_text()
bbl = bbl_path.read_text()

orcid_fallback = r"""% orcidlink: use package if available, else provide a fallback
\IfFileExists{orcidlink.sty}{\usepackage{orcidlink}}{%
  \newcommand{\orcidlink}[1]{\textsuperscript{\href{https://orcid.org/#1}{ORCID}}}%
}"""

flat_tex = flat_tex.replace(r"\usepackage{orcidlink}", orcid_fallback)
flat_tex = flat_tex.replace(
    r" \quad DOI: \href{https://doi.org/10.5281/zenodo.20124595}{10.5281/zenodo.20124595}",
    "",
)
flat_tex = flat_tex.replace(
    "\\bibliographystyle{plainnat}\n\\bibliography{references}",
    "% Bibliography embedded from BibTeX .bbl output (no external .bib needed)\n" + bbl.rstrip(),
)

if "\\bibliography{" in flat_tex:
    raise SystemExit("bibliography command still present in Qeios single-file TeX")

out_path.write_text(flat_tex)
PY

cp "$QEIOS_NOTES_SRC" "$QEIOS_NOTES"
cp "$QEIOS_README_SRC" "$QEIOS_README"

(
  cd "$QEIOS_BUILD_DIR"
  lualatex -interaction=nonstopmode -halt-on-error qeios_single.tex >/dev/null
  lualatex -interaction=nonstopmode -halt-on-error qeios_single.tex >/dev/null
)

rm -f "$QEIOS_ZIP"
(
  cd "$PAPER_DIR"
  mapfile -t section_tex < <(sed -n -E 's/.*\\input\{sections\/([^}]+)\}.*/sections\/\1.tex/p' main.tex)
  mapfile -t section_md < <(find sections -maxdepth 1 -name '*.md' | sort)

  zip -jq "$QEIOS_ZIP" \
    build/qeios_single/qeios_single.tex \
    build/qeios_single/qeios_single.pdf \
    build/qeios_single/Qeios_Submission_Notes.md \
    build/qeios_single/README_BUILD.txt

  zip -q "$QEIOS_ZIP" main.tex references.bib build/main.bbl
  zip -qr "$QEIOS_ZIP" includes
  zip -q "$QEIOS_ZIP" "${section_tex[@]}" "${section_md[@]}"
)

echo "Qeios assets ready:"
echo "  $QEIOS_TEX"
echo "  $QEIOS_PDF"
echo "  $QEIOS_ZIP"
