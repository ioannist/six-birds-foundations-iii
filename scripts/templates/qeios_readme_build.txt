README_BUILD.txt
================
Six Birds Foundations III: A Finite Audited Interaction Calculus for SBT
Ioannis Tsiokos <ioannis@automorph.io>

Build instructions for the Qeios source bundle
----------------------------------------------

OPTION A: Single-file build (recommended, no BibTeX needed)

    lualatex qeios_single.tex
    lualatex qeios_single.tex

  Two passes are needed for cross-references. No .bib file is required;
  the bibliography is embedded in the .tex file.

OPTION B: Full modular build

    make paper-build

  This writes the canonical manuscript outputs to:

    paper/build/main.pdf
    paper/build/main_flat.tex

  The modular build requires:
  - `paper/references.bib`
  - `paper/includes/*.tex`
  - all files under `paper/sections/`
  - `pandoc`, `latexmk`, `lualatex`, `latexpand`, and `bibtex`

OPTION C: Generate all Qeios-ready assets

    make paper-qeios

  This produces:

    paper/build/qeios_single/qeios_single.tex
    paper/build/qeios_single/qeios_single.pdf
    paper/build/qeios_single/qeios_source_bundle.zip
    paper/build/qeios_single/Qeios_Submission_Notes.md
    paper/build/qeios_single/README_BUILD.txt

Files in this bundle
--------------------
  qeios_single.tex                         Self-contained single-file TeX
  qeios_single.pdf                         Pre-built PDF from qeios_single.tex
  qeios_source_bundle.zip                  Source bundle for upload / archive
  Qeios_Submission_Notes.md                Copy/paste submission metadata
  main.tex                                 Modular main TeX
  includes/*.tex                           Shared macros and mechanization disclosure includes
  build/main.bbl                           Pre-built BibTeX output
  references.bib                           BibTeX database
  sections/*.tex                           Generated section TeX used by the modular build
  sections/*.md                            Canonical editable Markdown sources

Requirements
------------
  - LuaLaTeX (TeX Live 2022 or later recommended)
  - latexmk for the modular build
  - pandoc for Markdown-to-LaTeX section conversion
  - latexpand or texflatten for the flattened export
  - zip for the source-bundle archive
  - Standard packages used by `paper/main.tex`
  - Optional: orcidlink (fallback provided in `qeios_single.tex`)
