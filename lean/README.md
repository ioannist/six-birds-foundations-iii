# Lean Validation Track

This directory contains the Lean 4 validation track for Six Birds Foundations
III. The full tier is a completed manifest-scoped artifact: every required
definition and numbered claim in `manifest.toml` is represented by a Lean
declaration, and strict validation passes under the pinned toolchain.

## Layout

```text
lean/
├── full/                  Integrated `SixBirdsIII` Lake project
├── manifest.toml          Required paper-to-Lean declaration manifest
├── paper_inventory.toml   Paper inventory used to curate the manifest
└── trust_base.txt         Allowed non-project axioms for theorem audits
```

The full project root is `lean/full/SixBirdsIII.lean`.

## Toolchain

```text
leanprover/lean4:v4.28.0
```

## Build And Validation

From the repository root:

```bash
cd lean/full && lake build
cd ../..
./scripts/validate_lean.sh --tier full --require-full
```

The validator can also write a JSON report:

```bash
./scripts/validate_lean.sh --tier full --require-full --json lean-full-validation.json
```

## Module Map

```text
Basic.lean                    primitive labels, levels, hosts, finite tags
Status.lean                   seven status families
Domain.lean                   finite audited domain data
Records.lean                  profiles, instruments, cells, bridges, claims
Mech0.lean                    small core package and foundational theorems
CoreInteraction.lean          Section 6 core finite-interaction theorems
FiniteMaps.lean               finite maps, images, quotients, fibers
Completion.lean               completion and idempotent-operator support
Strictness.lean               strict extension and factorization support
Defects.lean                  defect equivalence records
CompletionExamples.lean       noncommuting completion and pasting examples
Definability.lean             fixed-interface definability bound
FiniteProbability.lean        finite stochastic closure-deficit support
GraphCohomology.lean          Section 8 graph/cohomology drive theorems
TopDownChannel.lean           structural downward path vs top-down channel records
Promotion.lean                promotion gate and strictness theorems
InstrumentClaims.lean         no-overreading and instrument claim support
RotatingAudit.lean            self-audit and finite rotating-audit theorems
AbstractInterpretation.lean   Section 12 AI theorems and model family
HighStructure.lean            Section 14 decorated-square recovery theorems
ModelRealizations.lean        PICA and Cantor model-realization records
MechanizationFeasibility.lean Proposition 35
SemanticTests.lean            semantic probes used by the validator
```

## What Strict Validation Certifies

Strict validation certifies the manifest-scoped Lean artifact:

- all required definitions are `full`;
- all required numbered claims are theorem-backed Lean declarations;
- declaration probes and declaration-kind checks pass;
- theorem axiom dependencies stay within `trust_base.txt`;
- placeholder scans and semantic-audit probes pass.

It does not certify claims outside `manifest.toml`, empirical implementation
correctness, a universal exact-six theorem, or a universal six-symbol algebra.
