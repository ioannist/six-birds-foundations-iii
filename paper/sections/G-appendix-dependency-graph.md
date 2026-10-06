# Appendix G. Dependency Graph

This appendix records the long-form dependency graph of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. Subsection G.1 records the definition nodes. Subsection G.2 records the theorem build order in topological form. Subsection G.3 records the critical proof paths.

The dependency graph is a finite typed record of the producer/consumer relations among definitions, lemmas, theorems, countermodels, model-realization records, and high-structure recovery theorems in the paper. It is a bookkeeping appendix, not an additional theorem.

## G.1 Definition Nodes

The definition nodes of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ are the finite typed schemas that the calculus introduces and uses throughout the paper. Each node is a finite typed record schema; the dependency graph records which schemas consume the records of which other schemas as part of their admissibility predicate.

The eleven definition-node families are:

1. **Host** — finite host schema (Subsection 2.1).
2. **Content** — finite content universe with visibility and suppression records (Subsections 3.2 and 3.5).
3. **Theory packages** — $\mathcal T=(Z,f,\Sigma_{f},E,\mathcal A)$ (Subsection 3.3).
4. **Instruments** — instrument records $I$ (Subsection 3.4 and Subsubsection 11.1.1).
5. **Profiles** — typed profile $\lambda$ (Subsection 3.6 and Appendix A.4).
6. **Witness/update maps** — $\mathsf{Wit}:\mathbb P\to\mathrm{Type}$ and $\mathsf{Upd}:\mathbb P\to\mathrm{Type}$ (Subsection 3.7 and Tables A.2, A.3).
7. **Statuses** — seven typed status families (Subsection 5.1 and Table A.5).
8. **Defects** — typed defect families per primitive and per promotion (Subsections 5.2–5.5 and Table A.6).
9. **Gates** — promotion gates and bridge-admissibility gates (Subsection 10.2).
10. **Audits** — host audit, claim audit, bridge audit, rotating-audit (Subsubsection 4.9.2 and Section 11).
11. **Model-realization maps** — realization maps $\mathrm{real}_{\mathcal M\to\mathcal S}$ (Subsubsection 13.1.1).

The producer/consumer relations among these eleven node families are recorded as a directed dependency graph: hosts support content and packages; packages, instruments, profiles, witness/update maps, visibility records, thresholds, audits, and defects feed the judgment schemas; classifiers consume judgment and defect data to assign statuses; gates feed promotion-status verdicts; audits feed visibility, source, and instrument-bound claim verdicts; model-realization maps consume the host, package, judgment, status, and audit nodes to produce model-grade $\texttt{model\_realization}$ verdicts on declared fragments.

The dependency graph is a finite typed record on the eleven node families; it is admissible as a bookkeeping object when every node is finite and every dependency edge is recorded, including cross-stage edges.

## G.2 Theorem Build Order

The nine stages list the paper's order of exposition. This is not a topological ordering of the full proof graph: Theorem 5 cites the later countermodel $\mathsf{CM}_4$ (Theorem 1 builds its two records in Subsubsection 6.1.1, and $\mathsf{CM}_7$ restates them), and Theorem 5 uses Theorems 22, 24 and 25. These cross-stage edges are listed at the end of this subsection.

The nine-stage build order is:

1. **Formal host and records.** Sections 2–5: finite host mathematics, primitive labels, claim strengths, status discipline, theory packages, instruments, source-of-truth records, audit records, visibility/suppression records, directed-cell records, pair-observable records, promotion bridges, profiles, status families, and defect schemas.
2. **Finite map/completion lemmas.** Sections 6 and 7: finite-cell admissibility predicates, effective-image representative arguments, idempotent-iteration arguments, and finite fiber-mismatch arguments.
3. **Core finite theorem spine.** Section 6 (Theorems 1–5) and Section 7 (Theorems 6–14): no-total-algebra, typed non-collapse, well-formedness decidability, covered-cell status uniqueness, status-family separation, descent through quotient, descent defect equivalence, Markov closure deficit, noncommuting completions, completion-pasting defect, idempotent saturation, strict-extension nonfactorization, factorization defect equivalence, fixed-interface definability bound.
4. **No-go and countermodels.** Section 8 (Theorems 15–18) and Section 9 plus Appendix C ($\mathsf{CM}_{1}$–$\mathsf{CM}_{12}$): forest no-drive, exact-form null-drive, nonzero-affinity equivalence, gating-affinity suppression, plus the twelve finite countermodels.
5. **Promotion.** Section 10 (Theorems 19–22): promotion gate soundness, strict promotion implies nonfactorization, non-strict promotion implies factorization, Toy22 strict-bridge example.
6. **Instruments and self-reference.** Section 11 (Theorems 23–25): no-overreading suppression, same-level self-audit failure, finite rotating-audit theorem.
7. **Model families.** Section 12 (Theorems 26–28 and Model Theorem 29) and Section 13 (Model Theorems 33, 34, plus the graph/cohomology realization): closure as packaging, descent as sound transformer, representability as fixedness, AI model-family theorem, PICA realization, Cantor strict-bridge realization, graph/cohomology realization. The realization statements in this stage are model-grade, not theorem-grade.
8. **High-structure semantics.** Section 14 (Theorems 30–32): descent-square recovery, completion-pasting recovery, strict extension as no-filler.
9. **Mechanization disclosure appendix.** Appendix F: paper-to-Lean disclosure table, validation command, toolchain, trust base, Proposition 35, and manifest-scoped mechanization nonclaims.

The nine stages give the order of exposition, not a topological ordering of every dependency. The edges of the theorem spine that point from an earlier stage to a later one are:

| consumer (stage) | producer (stage) | what is used |
| --- | --- | --- |
| Theorem 1 (3) | $\mathsf{CM}_7$ (4) | none: $\mathsf{CM}_7$ restates the two records built in Subsubsection 6.1.1, so this entry is a cross-reference, not a dependency |
| Theorem 5 (3) | $\mathsf{CM}_4$ (4) | the action cell and blocked pair observable of case (b) |
| Theorem 5 (3) | Theorem 22 (5) | the strict-bridge instance of cases (c), (d) and (e) |
| Theorem 5 (3) | Theorem 24 (6) | non-acceptance of $\mathrm{Sound}(I_{\mathrm{prom}})$ and $\mathrm{Sound}(I^{+}_{\mathrm{prom}})$ |
| Theorem 5 (3) | Theorem 25 (6) | lifted-soundness acceptance and rejection in case (e) |
| promotion classifier, Subsubsection 5.6.4 (1) | gates, Subsection 10.2 (5) | the gate record $\mathsf{GateResults}(B)$ |

## G.3 Critical Proof Paths

This subsection records the five critical proof paths in the dependency graph. Each path is the chain of definitions and theorems that supports a specific theorem-grade or model-grade conclusion.

### G.3.1 Strict Promotion Path

The strict promotion path is the chain of records and theorems supporting the strict-promotion verdict $\mathrm{Promote}(B):\texttt{strict}$:

Theory packages and promotion bridges supply the gate records of Subsection 10.2, which the promotion classifier of Subsubsection 5.6.4 uses to assign a strict verdict. Theorem 19 derives core-gate soundness from accepted-family verdicts. Separately, Theorem 12 supplies the finite factorization criterion, Theorem 13 identifies nonfactorization with a nonempty $\Delta_{\mathrm{fact}}$, and Theorem 20 combines Theorem 13 with the strict classifier rule. Theorem 20 does not use Theorem 19.

The path is consumed by the Cantor strict-bridge realization (Model Theorem 34) and, through Theorems 12 and 13, by the strict-extension recovery in the high-structure fragment (Theorem 32).

### G.3.2 Package versus Closure Path

The package-versus-closure path is the chain supporting the $P_{5}$-packaging vs macro-closure separation:

theory packages $\to$ quotient/package map $q$ and update $F$ $\to$ effective-image descent setup $\to$ Theorem 6 (descent through quotient) $\to$ Theorem 7 (descent defect equivalence) $\to$ $\mathsf{CM}_{1}$ (active package without macro closure).

The path is consumed by package and closure nonclaims throughout the paper, including the AI host realization (Theorem 26 closure as packaging, paired with Theorem 27 descent as sound transformer) and the Cantor strict-bridge realization (Model Theorem 34), where macro-dynamics closure is *not* asserted without the required descent data.

### G.3.3 Completion versus Route Coherence Path

The completion-versus-route path is the chain supporting the completion-noncommutation vs $P_{3}$-pasting recovery:

The finite completions $E_1,E_2$ give the noncommuting instance of Theorem 9, also recorded as $\mathsf{CM}_8$. Theorem 10 independently identifies noncommutation with a nonempty completion-pasting defect; Theorem 31 uses that defect in the decorated-square recovery. $\mathsf{CM}_8$ is an instance, not a premise of Theorem 10.

The path is consumed by Theorem 31 of Section 14 in Subsection 14.3.

### G.3.4 Self-Reference Honesty Path

The self-reference honesty path is the chain supporting the no-overreading and same-level self-audit failure theorems:

Instrument records, visibility and suppression rules, and classifier priority support Theorem 23. The claim classifier's self-reference rule separately supports Theorem 24. The rotating-audit chain and Theorem 24 then support Theorem 25, including its non-finality clause.

The path is consumed by every model-realization sheet of Section 13 (whose claim-grade verdicts are scoped under instruments) and by the manifest-scope mechanization boundary of Appendix F.

### G.3.5 Drive Separation Path

The drive separation path is the chain supporting the cohomological-drive vs holonomy separation:

finite graph $G$ and cycle space $\mathsf{Cycles}(G)$ $\to$ first cohomology $H^{1}(G;k)$ $\to$ Theorem 15 (forest no-drive), Theorem 16 (exact-form null-drive), and Theorem 17 (nonzero-affinity equivalence) $\to$ $\mathsf{CM}_{2}$ (active route/holonomy without drive); and, on the same graph data, Theorem 18 (gating-affinity suppression) $\to$ $\mathsf{CM}_{12}$ (gating destroys cycle-supported drive).

The path is consumed by the graph/cohomology realization (Subsection 13.4) and by the cohomology nonclaim register $\mathcal N_{\mathrm{coh}}$ of Subsubsection 13.4.4.

The five critical paths are the principal supporting chains for the paper's theorem-grade and model-grade conclusions. They do not exhaust the dependency graph; they record the load-bearing paths that the paper relies on most heavily.
