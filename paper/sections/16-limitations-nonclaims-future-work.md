# 15. Limitations, Nonclaims, and Future Work

This section collects the final scope discipline of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ and the future-work boundaries of the paper. Subsection 15.1 restates the positive contribution of the paper across six layers — finite typed interaction calculus, statused profile-relative interaction, the theorem-grade finite core, the countermodel/no-go atlas, the instrument and self-reference scope, and the model-realization scope. Subsection 15.2 records the nonclaims, numbered $\mathrm{NC}\text{-}1$ through $\mathrm{NC}\text{-}36$ and organized by the six topical groupings of the calculus. Subsection 15.3 records the six classes of future work that the paper does not undertake.

The discipline of the section is uniform: the paper records exactly what it asserts and exactly what it does not assert, and treats the nonclaims and future-work entries as part of the paper's content rather than as exclusions of content. The section does not introduce any new theorem or model-realization claim; it collects, restates, and frames what the earlier sections have already recorded.

## 15.1 Positive Scope Summary

This subsection restates the positive contribution of the paper across the six structural layers of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.

### 15.1.1 Finite Typed Interaction Calculus

This paper constructs $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$, a finite typed interaction calculus over six primitive labels $\mathbb P=\{P_{1},\ldots,P_{6}\}$, with a finite typed schema of directed-cell records, pair-observable records, promotion-bridge records, claim records, instrument records, source-of-truth records, audit records, and visibility records. The calculus is defined in Sections 3 and 4 as a finite typed schema with finite carriers, finite stores, and finite admissibility predicates on each component. Every record of the calculus is finite and the core calculus uses finite carriers; the macro-kernel class of Theorem 8 and the cochain and cycle spaces of Theorems 15–18, over which the body statements quantify, may be infinite (Subsubsection 2.1.1). The Cantor realization uses finite records over a shell that is not asserted finite (Subsubsection 2.1.2). Every record is interpreted under an explicit host instrument and audit record.

### 15.1.2 Statused Profile-Relative Interaction

The second positive layer is the statused profile-relative interaction discipline of Section 5. Each judgment carries a status family: the role status of Subsubsection 5.1.1, the directed-cell status of Subsubsection 5.1.2, the pair-observable status of Subsubsection 5.1.3, the promotion status of Subsubsection 5.1.4, the claim status of Subsubsection 5.1.5, the gate status of Subsubsection 5.1.6, and the square status of Subsubsection 5.1.7. The status families are typed-separately judgment-indexed: a directed-cell status is not a pair status, a pair status is not a promotion status, and the priority orders within each family are frozen by the classifier of Subsection 5.6.

The same primitive pair can receive different statuses on different profiles: Theorem 1 exhibits this for $(P_6,P_3)$, and the regime variant of Subsubsection 3.6.3 isolates the profile. Profile relativity is enforced by the per-cell profile $\lambda$ of Subsection 4.3 and reflected in Theorem 1's status non-factorization through the primitive pair (Section 6).

### 15.1.3 Numbered Results

The third positive layer is the numbered theorem and proposition spine of the paper. The numbered results are distributed as follows; Model Theorems 29, 33 and 34 are model-grade and Proposition 35 is audit-grade (Appendix I).

- Section 6: the no-total-algebra theorem (Theorem 1) and the four core finite-interaction theorems (Theorems 2–5).
- Section 7: nine finite-domain theorems on descent, closure deficit, completion, saturation, strictness, and definability (Theorems 6–14).
- Section 8: four cohomological theorems on graph-supported drive (Theorems 15–18).
- Section 10: four promotion theorems (Theorems 19–22).
- Section 11: three self-reference and visibility theorems (Theorems 23–25).
- Section 12: the abstract-interpretation theorem trio (Theorems 26–28) and the abstract-interpretation model-family theorem (Model Theorem 29).
- Section 14: the high-structure recovery theorems (Theorems 30–32).
- Section 13: the PICA and Cantor model-realization theorems (Model Theorems 33–34), together with the graph/cohomology model-realization statement of Subsection 13.4.
- Appendix F: the proof-assistant validation audit report (Proposition 35).

Each numbered statement has an instrument-indexed claim form and verdict, listed in Appendix I: $\texttt{accepted}$ for theorem-grade results, $\texttt{model\_realization}$ for scoped model realizations, and $\texttt{audit\_report}$ for the manifest-scoped Lean validation artifact.

### 15.1.4 Countermodel/No-Go Scope

The fourth positive layer is the countermodel atlas of Section 9 and Appendix C. The paper records twelve finite countermodels, each blocking a specific overclaim about the calculus: active package without macro closure ($\mathsf{CM}_{1}$), active route/holonomy without drive ($\mathsf{CM}_{2}$), local packages failing globally ($\mathsf{CM}_{3}$), directed cell active while the pair observable is blocked ($\mathsf{CM}_{4}$), refinement worsening closure ($\mathsf{CM}_{5}$), same-level self-audit circularity ($\mathsf{CM}_{6}$), same primitive pair with different statuses ($\mathsf{CM}_{7}$), idempotent completions that do not commute ($\mathsf{CM}_{8}$), strict extension without macro closure ($\mathsf{CM}_{9}$), strict extension without drive ($\mathsf{CM}_{10}$), fallback source unable to support a real pair observable ($\mathsf{CM}_{11}$), and gating that destroys cycle-supported drive ($\mathsf{CM}_{12}$).

Each countermodel is a finite typed structure under an instrument whose visible content blocks the corresponding overclaim under $I$. The atlas is finite, audited, and host-bound, in keeping with the no-go scope discipline of Subsection 9.1.

### 15.1.5 Instrument/Self-Reference Scope

The fifth positive layer is the instrument and self-reference scope of Section 11. The paper records the instrument-indexed claim semantics of Subsection 11.1, the claim classifier priority of Subsection 11.2, the visibility and suppression discipline of Subsection 11.3, the no-overreading suppression theorem (Theorem 23), the same-level self-audit failure theorem (Theorem 24), the $P_{6}\leftarrow P_{6}$ status separation of Subsection 11.6, the rotating-audit chain and bridge of Subsection 11.7, the finite rotating-audit theorem (Theorem 25), and the instrument-transfer rule of Subsection 11.9.

The discipline records that no claim accepted under an instrument $I$ uses suppressed content that no admissible bridge connects to visible content, that the claim classifier accepts no instrument's claim of its own complete self-soundness without a level-shifted audit, that finite rotating-audit chains are admissible but non-final, and that instrument transfer is bridge-mediated: acceptance under one instrument does not imply acceptance under another.

### 15.1.6 Model-Realization Scope

The sixth positive layer is the model-realization scope of Section 13 and Section 12. The paper records four scoped model realizations: the PICA realization $\mathsf{PICAReal}_{\mathrm{fin}}$ of Subsection 13.2 with Model Theorem 33, the Cantor strict-bridge realization $\mathsf{CantorShell}_{\mathrm{aud}}$ of Subsection 13.3 with Model Theorem 34, the abstract-interpretation family $\mathsf{AIFam}_{\mathrm{fin}}$ of Section 12 with Model Theorem 29, and the graph/cohomology realization $\mathsf{CohGraph}_{\mathrm{fin}}$ of Subsection 13.4. Each realization is host-bound, fragment-scoped, and model-grade, with verdict $\texttt{model\_realization}$, in keeping with the model-realization convention of Subsection 13.1.

## 15.2 Required Nonclaims

This subsection records the nonclaims of the paper, organized into six topical groupings: algebra and universality, status, package and strictness, route/refinement/locality, audit, and model. They are the thirty-six numbered nonclaims $\mathrm{NC}\text{-}1$ through $\mathrm{NC}\text{-}36$, the top-down nonclaim $\mathrm{NC}\text{-}\mathrm{TD}$, and two unnumbered nonclaims on exact-six representation and unique decomposition. Each nonclaim is a scoped negative statement; together they fix the boundary of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ as a finite typed audited interaction calculus and prevent the positive results of Subsection 15.1 from being read as universal foundations. Every nonclaim recorded in the body of the paper (per-section nonclaim subsections, per-realization nonclaim registers, per-bridge nonclaim records) is covered by, or refines, one of these entries, and each entry is carried by the finite nonclaim records $\mathcal N$ of instruments, judgments, bridges, and model-realization sheets. Where a theorem, a countermodel, or a nonclaim register supports an entry, the entry names it.

### 15.2.1 Algebra and Universality Nonclaims

- $\mathrm{NC}\text{-}1$. No universal six-symbol algebra: there is no faithful total operation $\ast:\mathbb P^{2}\to\mathbb P$ whose composition with a status-decoding map recovers typed, statused, profile-relative directed-cell status across all profiles. The non-factorization of cell status through the primitive pair (Theorem 1, Section 6) blocks any such operation as a status-decoding map.
- $\mathrm{NC}\text{-}2$. No "all mathematics is six birds" claim: $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is a finite typed audited interaction calculus, not a foundation for all mathematics, and no mathematical object is thereby a $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ object under any reading.
- *No unrestricted exact-six theorem.* The paper does not assert that every description, theory or phenomenon decomposes into exactly the six roles (the Foundations II result is scoped to $\mathsf{FATCD}$), nor that every typed interaction is exactly representable as one of the thirty-six directed cells $P_{i}\leftarrow P_{j}$. The exact-six structure is recorded as a finite typed schema with admissibility conditions, not as an unrestricted decomposition theorem.
- *No unique decomposition.* The paper does not assert that a typed interaction has a unique decomposition into primitive directed cells. Decomposition records are admissible only under a declared profile and audit, and different profiles can yield different admissible decompositions.

### 15.2.2 Status Nonclaims

- $\mathrm{NC}\text{-}3$. No primitive-pair status determination: the directed-cell status does not factor through the primitive pair $(P_{i},P_{j})$ alone. The status non-factorization theorem (Theorem 1, Section 6) records the formal counterexample.
- $\mathrm{NC}\text{-}4$. No status-family collapse: $\mathrm{RoleStatus}$, $\mathrm{CellStatus}$, $\mathrm{PairStatus}$, $\mathrm{PromotionStatus}$, $\mathrm{ClaimStatus}$, $\mathrm{GateStatus}$, and $\mathrm{SqStatus}$ remain separately typed, judgment-indexed families; Theorem 5 of Section 6 records representative separations.
- $\mathrm{NC}\text{-}5$. No directed-cell-to-pair collapse: a directed-cell status does not determine the pair-observable status. $\mathsf{CM}_{4}$ of Section 9 records a directed cell with status $\texttt{action}$ whose corresponding pair observable is $\texttt{blocked}$.
- $\mathrm{NC}\text{-}6$. No role-channel-to-cell collapse: the role status of a primitive does not determine the directed-cell status of any cell carrying that primitive. Role status is a separate judgment family from cell status; Theorem 5 of Section 6 includes the channel-not-cell separation.

### 15.2.3 Package and Strictness Nonclaims

- $\mathrm{NC}\text{-}7$. No package-implies-closure: a $P_{5}$-packaging operator does not imply macro-dynamics closure of an associated transformer. $\mathsf{CM}_{1}$ of Section 9 records an active package whose macro dynamics are not closed under $I$.
- $\mathrm{NC}\text{-}8$. No idempotence-implies-commutation: two idempotent finite completions $E_{1},E_{2}:C\to C$ may fail to commute. $\mathsf{CM}_{8}$ of Appendix C, named in Subsection 9.8, records two idempotent completions with $E_{1}E_{2}\neq E_{2}E_{1}$.
- $\mathrm{NC}\text{-}9$. No repeated fixed completion as theory growth: iterating a fixed idempotent completion yields no new objects ($E^n=E$, Theorem 11); strict growth needs a new object map, bridge, refinement or nonfactorization witness. The Cantor target has a new packaged-object map $\pi_1$; $E_{\tau,\ell}=U_\ell\circ Q_\ell\circ K^\tau$ is attached completion data acting on distributions, rather than repetition of one fixed completion.
- $\mathrm{NC}\text{-}10$. No strictness-implies-closure: a strict-bridge passage $\mathrm{Promote}(B):\texttt{strict}$ does not imply macro-dynamics closure on the target side of the bridge. $\mathsf{CM}_{9}$ of Appendix C, named in Subsection 9.8, records a strict bridge without closure.
- $\mathrm{NC}\text{-}11$. No strictness-implies-drive: a strict-bridge passage does not imply a $\mathrm{P6}_{\mathrm{drive}}$ certificate on the support graph $G_B$ recorded in the bridge's level/lens/interface record. $\mathsf{CM}_{10}$ of Appendix C, named in Subsection 9.8, records a strict bridge without drive.

### 15.2.4 Route, Refinement, and Locality Nonclaims

- $\mathrm{NC}\text{-}12$. No route-mismatch-implies-drive: a $P_{3}$ route-mismatch witness does not imply a $\mathrm{P6}_{\mathrm{drive}}$ certificate. $\mathsf{CM}_{2}$ of Section 9 records a route mismatch without drive, and the cohomology nonclaims of Subsubsection 13.4.4 record the corresponding model-level form.
- $\mathrm{NC}\text{-}13$. No refinement-implies-improvement: a lens refinement $q_0\rightsquigarrow q_1$ does not improve every defect record. $\mathsf{CM}_{5}$ of Section 9 records a refinement that worsens closure under a chosen defect measure.
- $\mathrm{NC}\text{-}14$. No local-implies-global: local admissibility of a finite family of packages does not imply global admissibility. $\mathsf{CM}_{3}$ of Section 9 records local packages that fail globally.
- $\mathrm{NC}\text{-}\mathrm{TD}$. No structural-downward-implies-channel claim: a completion map, feasibility gate, macro profile, phase record, promoted object, or context-indexed update supplies at most a structural downward path or constraint. It certifies top-down causal difference-making only when a finite $\mathsf{TopDownChannelRecord}$ supplies admissible macro interventions, matched controls, source-of-truth response records, visibility, audit, no-smuggling, and a passed host-specific effect threshold. The third proposition of Subsection 4.7 proves it.

### 15.2.5 Audit Nonclaims

- $\mathrm{NC}\text{-}15$. No audit-is-truth: a passing audit record or claim status $\texttt{accepted}$ under an instrument is not instrument-free truth. The instrument-indexed claim form of Subsubsection 11.1.3 fixes acceptance as relative to $I$ and the surrounding context $\Gamma;\mathcal T$.
- $\mathrm{NC}\text{-}16$. No same-level complete self-certification: the claim classifier does not accept, under an instrument $I_0$, the claim $\mathrm{Sound}(I_0)$ that $I_0$ is completely sound. Theorem 24 of Section 11 records the classifier routing: the claim classifier assigns same-level complete self-soundness under $I_{0}$ the status $\texttt{outside\_scope}$, $\texttt{undefined\_circular}$, or a status of higher priority, and never $\texttt{accepted}$.
- $\mathrm{NC}\text{-}17$. No rotating-audit finality: a finite rotating-audit chain is non-final. Theorem 25 of Section 11 and the non-finality clause of Subsubsection 11.8.1 record that a finite rotating-audit chain audits the lower stack but does not certify its top.
- $\mathrm{NC}\text{-}18$. No overreading: an $I$-accepted claim has no $I$-suppressed use-set element without an admissible bridge (Theorem 23 of Section 11); acceptance under $I$ asserts nothing about suppressed content that no admissible bridge connects to visible content.
- $\mathrm{NC}\text{-}19$. No model-realization-as-theorem overclaim: a $\texttt{model\_realization}$ verdict does not promote to theorem-grade $\texttt{accepted}$ without an admissible bridge, and it does not prove the declared structure universally. The fragment discipline of Subsubsection 13.1.2 records the corresponding rule.

### 15.2.6 Model Nonclaims

- $\mathrm{NC}\text{-}20$. No PICA universality: $\mathsf{PICAReal}_{\mathrm{fin}}$ realizes a finite stochastic fragment of the calculus, not its entirety. The PICA realization is host-bound and fragment-scoped to the finite stochastic cell/pair/provenance fragment.
- $\mathrm{NC}\text{-}21$. No PICA $6\times 6$ universal algebra: the PICA $6\times 6$ multiplicity count, recovered under the record conditions of Subsubsection 13.2.5, is a profile fact, not a universal law. It is a PICA-profile model fact under the cell profile $\lambda_{\mathrm{PICA}}$.
- $\mathrm{NC}\text{-}22$. No raw implementation status as formal status: raw PICA status is not formal directed-cell status without recovery and classifier check.
- $\mathrm{NC}\text{-}23$. No fallback-as-real-source: a fallback record supports at most $\texttt{real\_provisional}$ unless an admissible upgrade bridge is recorded. The fallback-default cap of Subsubsection 13.2.8 records that fallback supports at most $\texttt{real\_provisional}$ unless an explicit upgrade bridge is recorded, and $\mathsf{CM}_{11}$ of Appendix C gives the corresponding finite source-policy countermodel.
- $\mathrm{NC}\text{-}24$. No dirty-state realness: a dirty record in a pair's source slot, or among the $\mathsf{SourceRefs}$ of its audit or branch-compatibility audit, cannot support a real pair observable: the first $\texttt{blocked}$ row applies.
- $\mathrm{NC}\text{-}25$. No Cantor generalization beyond audited shell: the Cantor strict-bridge realization is shell-bound. Subsubsection 13.3.9 records the corresponding nonclaim register.
- $\mathrm{NC}\text{-}26$. No Cantor pressure gap as KL closure deficit: the pressure-gap consequence defect is not a Kullback–Leibler closure-deficit without a separately admissible bridge. Cantor nonclaim 6 of Subsubsection 13.3.9.
- $\mathrm{NC}\text{-}27$. No Cantor pressure gap as strictness witness: the pressure-gap defect is a separately recorded consequence record, not the strictness witness. Cantor nonclaim 7 of Subsubsection 13.3.9.
- $\mathrm{NC}\text{-}28$. No direct autonomous stratum theorem: the persistent strata family $\mathcal F$ does not support a direct stratumwise root-separation theorem in the present paper. Cantor nonclaim 8 of Subsubsection 13.3.9.
- $\mathrm{NC}\text{-}29$. No AI totality: a nonempty admissible AI host family sharing one concrete domain $C$ and one concrete transformer $F$ realizes $P_{1}/P_{2}/P_{5}/P_{6}$, and $P_{1}/P_{2}/P_{4}/P_{5}/P_{6}$ when its refinement records contain a strict refinement (Model Theorem 29); the realization map of Model Theorem 29 assigns role fragments only, adds $P_{3}$ when two closures fail to commute, and assigns no cell, pair or promotion component, so it does not realize the whole calculus.
- $\mathrm{NC}\text{-}30$. No AI soundness-as-completeness: sound abstraction does not imply complete representation. Subsubsection 12.6.2.
- $\mathrm{NC}\text{-}31$. No AI closure-implies-soundness: the closure operator $\rho=\gamma\alpha$ does not imply transformer soundness. Subsubsection 12.6.3.
- $\mathrm{NC}\text{-}32$. No graph cohomology as all drive: the cohomological drive certificate $[a]\neq 0$ is one drive certificate family, not all drive. The cohomology nonclaims of Subsubsection 13.4.4 record $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ as one finite certificate family, not all drive.
- $\mathrm{NC}\text{-}33$. No gating-preserves-drive: $P_{2}$-gating may suppress cycle-supported drive on $G$. Theorem 18 and $\mathsf{CM}_{12}$ of Appendix C record it.
- $\mathrm{NC}\text{-}34$. No double-category completeness: the finite decorated-square fragment of Section 14 does not replace the core calculus. Subsubsection 14.5.1 records the corresponding nonclaim.
- $\mathrm{NC}\text{-}35$. No high-structure status erasure: the decorated-square fragment does not replace statuses, defects, audits, or instruments, and does not collapse the seven status families into a single square-status family. Subsubsection 14.5.2.
- $\mathrm{NC}\text{-}36$. No mechanization beyond manifest scope: the proof-assistant artifact validates the finite audited declarations listed in Appendix F, and does not certify unlisted statements, empirical implementation correctness, a universal exact-six theorem, or a universal six-symbol algebra. The audit-grade verdict of Proposition 35 records the completed validation artifact for the finite manifest scope, not a certificate for unlisted statements, empirical implementations, or unrestricted host extensions.

## 15.3 Future Work

This subsection records the six classes of future work that the present paper does not undertake. Each class is a scoped pointer to admissible extension targets for $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$; none of the entries below is a claim about results in this paper.

### 15.3.1 Classifier and Dependency Completeness

Future work on the claim classifier of Subsection 11.2 includes:

- a complete status-classifier theorem, characterizing the priority order over $\mathrm{ClaimStatus}$ under stated soundness and admissibility conditions for the claim classifier of Subsubsection 5.6.5;
- a defect-to-status soundness theorem, characterizing the routing from the defect families of Subsections 5.2--5.5 through the classifier rules of Subsection 5.6;
- a dependency-lattice theorem, organizing the per-component admissibility predicates of Section 4 and Section 5 into a lattice of dependent admissibility checks with a finite reduction theorem.

The present paper records the priority order of Subsubsection 11.2.1 and the per-status routing rules of Subsection 5.6, but does not establish completeness or soundness in these stronger forms.

### 15.3.2 Promotion and Stacking Theory

Future work on promotion and stacking includes:

- soundness and completeness conditions for the promotion classifier of Subsubsection 5.6.4 over $\mathrm{PromotionStatus}$, relative to an external account of correct promotion;
- a stacking composition theorem for composed bridges whose middle interface refines the source, extending the object-map result of Subsubsection 10.7.1 to the joint gate and nonclaim semantics of the composed bridge;
- a local-to-global promotion theorem, identifying the conditions under which a finite family of locally admissible promotion bridges supports a global promotion verdict.

The present paper records Theorems 19–22 of Section 10, the eight-gate machinery, and the per-bridge classifier; the three extension targets above are recorded as future work.

### 15.3.3 Verified Model Realizations

Future work on the model-realization sheets includes:

- a deeper PICA realization audit, extending Model Theorem 33 of Subsection 13.2 toward implementation-correctness records for the actor-update map, informant-witness map, status recovery, and pair-observable realness predicate;
- a deeper Cantor strict-bridge realization audit, extending Model Theorem 34 of Subsection 13.3 toward implementation-correctness records for the shell-bound strictness witness and the gate-result table;
- a deeper abstract-interpretation realization audit, extending Model Theorem 29 of Section 12 beyond the manifest-scoped Lean support toward richer concrete domains and transformers;
- an implementation-correctness layer for any concrete PICA implementation, audited under a separate proof-assistant-bound instrument.

The present paper records the four realization sheets at model-grade verdict $\texttt{model\_realization}$ and records manifest-scoped proof-assistant declarations for the required model claims. Implementation correctness and richer external model audits remain future work.

### 15.3.4 Cantor Shell Expansion

Future work on the Cantor strict-bridge realization includes:

- a full Cantor strictness proof, extending the audited-shell strict-bridge realization beyond $\mathcal S_{\mathrm{aud}}$ to a wider scope under an admissible expansion bridge;
- a pressure-gap-to-KL bridge, recording an admissible bridge from the pressure-gap consequence defect of Subsubsection 13.3.6 to the Kullback–Leibler closure-deficit framework;
- a stratumwise root-separation theorem, characterizing the persistent strata family $\mathcal F$ via a separation property that supports stronger consequences than the conditional pressure disintegration of Subsubsection 13.3.6.

The present paper records the audited-shell realization with verdict $\texttt{model\_realization}$ on $\mathbf{StrictBridge}_{0\to 1}^{\mathrm{audited\ shell}}$; the three extensions above are recorded as future work.

### 15.3.5 Drive and High-Structure Semantics

Future work on the drive and high-structure layers includes:

- a general drive classification, extending the cohomological drive certificate $[a]\neq 0$ of Subsubsection 13.4.3 to a finite family of drive certificates over multiple drive notions;
- a holonomy-to-drive bridge $B_{3\to 6}^{\mathrm{drive}}$, recording an admissible bridge from a $P_{3}$ route/holonomy witness to a $\mathrm{P6}_{\mathrm{drive}}$ certificate, in the sense of Subsubsection 13.4.4 nonclaim 2;
- gating beyond forests, characterizing $P_{2}$-gating effects on drive on graphs with non-trivial cycle structure under additional gating policies;
- weak double-category coherence, extending the strict pasting law of Subsubsection 14.1.3 to weak coherence relations on finite decorated squares;
- a general obstruction propagation theorem, characterizing the propagation of square defects under finite strict pasting in the sense of Subsubsection 14.5.3.

The present paper records the cohomological theorems of Section 8 and the high-structure recovery theorems of Section 14; the extensions above are recorded as future work.

### 15.3.6 Self-Reference and Instrument Transfer

Future work on self-reference and instrument transfer includes:

- a full instrument-transfer classifier, fixing the per-claim-type mapping from source-side acceptance and bridge defect to target-side $\chi\in\mathrm{ClaimStatus}$ under $J$, in the sense of Subsubsection 11.9.2;
- an infinite rotating-audit semantics, extending the finite rotating-audit chain of Subsection 11.7 to an inverse limit or coalgebraic semantics admissible under a stronger meta-instrument;
- a complete self-reference classification, extending Theorem 24 of Subsection 11.5 to a comprehensive classification of same-level, level-shifted, and rotating self-reference patterns.

The present paper records the instrument-transfer rule of Subsubsection 11.9.1, the rotating-audit chain of Subsection 11.7, and Theorems 24 and 25; the extensions above are recorded as future work.
