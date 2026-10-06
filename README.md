# Six Birds Foundations III

Companion repository for the paper:

> **Six Birds Foundations III: A Finite Audited Interaction Calculus for SBT**
> Ioannis Tsiokos. Preprint, Version 2, October 2, 2026.
> DOI (v2): [10.5281/zenodo.23096391](https://doi.org/10.5281/zenodo.23096391);
> v1 (May 11, 2026): [10.5281/zenodo.20124595](https://doi.org/10.5281/zenodo.20124595)

This repository contains the paper sources and Lean 4 validation track. The
flattened single-file release source is
`Tsiokos_2026_Six_Birds_Foundations_III_A_Finite_Audited_Interaction_Calculus_for_SBT.tex`.

## Paper Build

```bash
make paper-build
```

The build assembles the Markdown paper, converts section files to LaTeX, and
builds the PDF under `paper/build`.

To produce the Qeios single-file bundle (single `.tex`, single PDF, source
zip, and copy/paste submission notes) under `paper/build/qeios_single/`:

```bash
make paper-qeios
```

To remove the generated Qeios bundle:

```bash
make paper-qeios-clean
```

## Lean Build

```bash
cd lean/full && lake build
```

The Lean toolchain is pinned in `lean/full/lean-toolchain`:

```text
leanprover/lean4:v4.28.0
```

## Strict Lean Validation

From the repository root:

```bash
./scripts/validate_lean.sh --tier full --require-full
```

The validator is driven by `lean/manifest.toml`, which maps required paper
definitions and numbered claims to Lean declarations in the `SixBirdsIII`
namespace. `lean/paper_inventory.toml` records the broader paper inventory, and
`lean/trust_base.txt` records the allowed non-project axioms for theorem audits.

Strict validation certifies the finite manifest scope: all required definitions
are full, all required numbered claims are theorem-backed, declaration probes
and declaration-kind checks pass, theorem axiom dependencies stay within the
trust base, and placeholder and semantic-audit checks pass.

Strict validation does not certify claims outside `lean/manifest.toml`,
empirical implementation correctness, a universal exact-six theorem, or a
universal six-symbol algebra.

## CI

`.github/workflows/lean-validation.yml` runs the strict Lean validator and
uploads `lean-full-validation.json` as an artifact. It also builds the paper,
uploads the PDF and flattened TeX artifacts, and checks that the committed
flattened release TeX matches `paper/build/main_flat.tex`.

## Citation

```bibtex
@misc{tsiokos2026sixbirds3,
  author = {Tsiokos, Ioannis},
  title  = {Six Birds Foundations III: A Finite Audited Interaction Calculus for SBT},
  year   = {2026},
  doi    = {10.5281/zenodo.23096391},
  note   = {Preprint, Version 2}
}
```
