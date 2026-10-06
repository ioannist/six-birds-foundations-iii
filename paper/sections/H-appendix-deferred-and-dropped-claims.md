# Appendix H. Deferred and Excluded Claims

This appendix records the deferred and excluded claims of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. Subsection H.1 records the deferred claims, organized by future-paper group. Subsection H.2 records the excluded claims, which lie outside the calculus's positive scope.

The appendix is a finite typed register that consolidates the future-work items of Subsection 15.3 and the negative-scope items of Subsection 15.2 (and the per-section nonclaim subsections) in one place. It does not introduce new theorems; it records what is *not* in this paper and *not* a target of this paper.

## H.1 Deferred Claims

This subsection records the deferred claims by future-paper group, mirroring the six classes of future work in Subsection 15.3.

### H.1.1 Classifier and Dependency Completeness

Deferred items:

- a complete status-classifier theorem characterizing the priority order over $\mathrm{ClaimStatus}$;
- a defect-to-status soundness theorem characterizing the routing from the defect families of Subsections 5.2--5.5 through the classifier rules of Subsection 5.6;
- a dependency-lattice theorem organizing the per-component admissibility predicates of Sections 4 and 5 into a lattice with a finite reduction theorem.

### H.1.2 Promotion and Stacking Theory

Deferred items:

- soundness and completeness conditions for the promotion classifier of Subsubsection 5.6.4 over $\mathrm{PromotionStatus}$, relative to an external account of correct promotion;
- a stacking composition theorem for composed bridges whose middle interface refines the source, extending the object-map result of Subsubsection 10.7.1 to the joint gate and nonclaim semantics of the composed bridge;
- a local-to-global promotion theorem identifying conditions under which a finite family of locally admissible promotion bridges supports a global promotion verdict.

### H.1.3 Verified Model Realizations

Deferred items:

- a deeper PICA realization audit, extending Model Theorem 33 of Subsection 13.2 toward implementation-correctness records for the actor-update map, informant-witness map, status recovery, and pair-observable realness predicate;
- a deeper Cantor strict-bridge realization audit, extending Model Theorem 34 of Subsection 13.3 toward implementation-correctness records for the shell-bound strictness witness and the gate-result table;
- a deeper abstract-interpretation realization audit, extending Model Theorem 29 of Section 12 beyond the manifest-scoped Lean support toward richer concrete domains and transformers;
- an implementation-correctness layer for any concrete PICA implementation, audited under a separate proof-assistant-bound instrument.

### H.1.4 Cantor Shell Expansion

Deferred items:

- a full Cantor strictness proof extending the audited-shell strict-bridge realization beyond $\mathcal S_{\mathrm{aud}}$ via an admissible expansion bridge;
- a pressure-gap-to-KL bridge recording an admissible bridge from the pressure-gap consequence defect of Subsubsection 13.3.6 to the Kullback–Leibler closure-deficit framework;
- a stratumwise root-separation theorem characterizing the persistent strata family $\mathcal F$ via a separation property stronger than the conditional pressure disintegration of Subsubsection 13.3.6.

### H.1.5 Drive and High-Structure Semantics

Deferred items:

- a general drive classification extending the cohomological drive certificate $[a]\neq 0$ of Subsubsection 13.4.3 to a finite family of drive certificates over multiple drive notions;
- a holonomy-to-drive bridge $B_{3\to 6}^{\mathrm{drive}}$ from a $P_{3}$ route/holonomy witness to a $\mathrm{P6}_{\mathrm{drive}}$ certificate;
- gating beyond forests, characterizing $P_{2}$-gating effects on drive on graphs with non-trivial cycle structure under additional gating policies;
- weak double-category coherence extending the strict pasting law of Subsubsection 14.1.3 to weak coherence relations on finite decorated squares;
- a general obstruction propagation theorem characterizing the propagation of square defects under finite strict pasting, in the sense of Subsubsection 14.5.3.

### H.1.6 Self-Reference and Instrument Transfer

Deferred items:

- a full instrument-transfer classifier fixing the per-claim-type mapping from source-side acceptance and bridge defect to target-side $\chi\in\mathrm{ClaimStatus}$ under $J$, in the sense of Subsubsection 11.9.2;
- an infinite rotating-audit semantics extending the finite rotating-audit chain of Subsection 11.7 to an inverse limit or coalgebraic semantics admissible under a stronger meta-instrument;
- a complete self-reference classification extending Theorem 24 of Subsection 11.5 to a comprehensive classification of same-level, level-shifted, and rotating self-reference patterns.

The six groups above record the principal future-work items of the paper. Each item is a scoped pointer to an admissible extension target, in keeping with the future-work boundary of Subsection 15.3.

## H.2 Excluded Claims

This subsection records claims that lie outside the calculus's positive scope. Each item below is *not* deferred to future work but excluded as a positive claim of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.

The seven excluded claims are:

1. **Universal six-symbol algebra.** No total operation $\ast:\mathbb P^{2}\to\mathbb P$ recovers cell status across profiles. Theorem 1 of Section 6 records the formal counterexample, and $\mathrm{NC}\text{-}1$ of Subsection 15.2 records the corresponding nonclaim.
2. **All mathematics is six birds.** The claim that every mathematical structure decomposes into the six primitives is excluded; $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is a finite typed audited interaction calculus, not a foundation for all mathematics. $\mathrm{NC}\text{-}2$ of Subsection 15.2 records the corresponding nonclaim.
3. **Unrestricted exact-six.** The unrestricted decomposition claim, that every typed interaction is exactly representable as one of the thirty-six directed cells, is excluded. The exact-six structure is a finite typed schema with admissibility conditions, not an unrestricted decomposition theorem. The excluded claim is recorded in Subsubsection 2.4.3 and the corresponding nonclaim is the unnumbered entry *No unrestricted exact-six theorem* of Subsubsection 15.2.1.
4. **PICA as canonical algebra.** The claim that PICA defines the canonical $6\times 6$ algebra of the calculus is excluded. PICA is a finite stochastic model realization, scoped to the cell/pair/provenance fragment, and the recovered $6\times 6$ multiplicity count is a profile fact, not a universal law. PICA nonclaims 1 and 2 of Subsubsection 13.2.10 and $\mathrm{NC}\text{-}20$, $\mathrm{NC}\text{-}21$ of Subsection 15.2 record the corresponding nonclaims.
5. **Cantor pressure gap as unbridged strictness witness.** The claim that the pressure-gap defect $\Delta_{T_{0}\to T_{1}}$ is itself the strictness witness is excluded. The strictness witness is the factorization defect $\Delta_{\mathrm{fact}}^{\mathrm{Cantor}}$, and the pressure-gap defect is a separately recorded consequence record whose values are cited from the Cantor paper, not derived here from the witness. Cantor nonclaim 7 of Subsubsection 13.3.9 and $\mathrm{NC}\text{-}27$ of Subsection 15.2 record the corresponding nonclaim.
6. **Provenance as proof.** The claim that provenance records constitute proof of any underlying mathematical fact is excluded. Provenance records are finite typed records of producer, source, audit, and visibility data; they support pair-realness and source-of-truth predicates but are not theorem-grade proofs of mathematical claims. The audit nonclaim $\mathrm{NC}\text{-}15$ of Subsection 15.2 (no audit-is-truth) records the corresponding boundary.
7. **High-structure semantics as replacement calculus.** The claim that the finite decorated double-category fragment of Section 14 replaces or supersedes the core calculus is excluded. The decorated-square fragment is a secondary organizational layer; it records three specific recoveries (Theorems 30–32) and not a general claim that every theorem-grade fact reduces to a decorated-square fact. $\mathrm{NC}\text{-}34$, $\mathrm{NC}\text{-}35$ of Subsection 15.2 record the corresponding nonclaims.

The seven excluded claims above are outside the positive scope of the paper. Each is recorded as a negative scope item in Section 15, and each is supported by a theorem, a countermodel, or a per-realization nonclaim register elsewhere in the paper. The appendix records them in one place to make the paper's negative scope register explicit.

The seven excluded claims and the six groups of deferred claims in Subsection H.1 together record the boundary of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$: the calculus admits the theorem-grade, model-grade, and audit-grade results recorded in this paper; defers the items of Subsection H.1 to future work; and excludes the items of Subsection H.2 from any positive claim.
