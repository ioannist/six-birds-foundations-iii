# 13. Model Realizations

This section presents the four model realizations of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$: PICA, Cantor strict-bridge, the abstract-interpretation host of Section 12, and the graph/cohomology drive support of Section 8. Subsection 13.1 fixes the model-realization convention and the fragment discipline that governs every model in the family. Subsections 13.2, 13.3, and 13.4 give the PICA, Cantor, and graph/cohomology realizations and their model theorems (Theorems 33 and 34 plus the model-grade reading of Section 8). Subsection 13.5 organizes the four realizations into a combined model-realization matrix. Subsection 13.6 records the cross-model role-coverage observation and the corresponding nonclaim.

The four model families are located as follows.

\begingroup\small
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.24\linewidth}>{\raggedright\arraybackslash}p{0.22\linewidth}>{\raggedright\arraybackslash}p{0.32\linewidth}>{\raggedright\arraybackslash}p{0.14\linewidth}@{}}
\toprule
Model family & Host & Results & Sheet \\
\midrule
PICA & Subsection 13.2 & Model Theorem 33 & Appendix D.1 \\
Cantor strict bridge & Subsection 13.3 & Model Theorem 34 & Appendix D.2 \\
Abstract interpretation & Subsection 12.1 & Theorems 26--28, Model Theorem 29 & Appendix D.3 \\
Graph/cohomology & Subsection 8.1 & Theorems 15--18; realization in Subsection 13.4 & Appendix D.4 \\
\bottomrule
\end{longtable}
\endgroup

The discipline of the section is uniform: each realization is scoped, each declares its host, instrument, source-of-truth policy, audit policy, visibility policy, and nonclaim register, and each realizes a declared fragment of the calculus. None of the four realizations is claimed to be the whole calculus, and the section does not state a global model-coverage theorem.

## 13.1 Model-Realization Convention

This subsection fixes the form of a model-realization statement and the fragment discipline imposed on every model realization in the section.

### 13.1.1 Realization Map

A model-realization statement has the form

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\mathcal M\;\models\;\mathcal S\;:\;\texttt{model\_realization},
$$

where:

- $\mathcal M$ is the realization object: a finite typed record carrying the host data, the instrument, the source-of-truth policy, the audit policy, the visibility policy, and the nonclaim register required by the host;
- $\mathcal S$ is the declared structure: a finite, named fragment of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$, written either as a role fragment (for example, $P_1/P_2/P_4/P_5/P_6$) or as a named substructure (for example, $\mathrm{cell/pair/prov}$ for the finite stochastic cell/pair/provenance fragment, or $0\to1$ for an audited strict-bridge passage); the PICA fragment is written $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin\text{-}stoch}}{}^{\mathrm{cell/pair/prov}}$, the subscript recording the stochastic host, and the Cantor fragment $\mathrm{StrictBridge}^{\mathrm{audited\ shell}}_{0\to1}$, the $0\to1$ fragment on the audited shell;
- $I$ is the instrument under which the realization claim is recorded, and $\mathcal T$ is the surrounding target package, in the sense of Subsection 11.1.

The verdict $\texttt{model\_realization}$ records that the realization map of $\mathcal M$ supplies finite host data satisfying clauses 1--7 below, with each assigned audit replayed and its computed outcome recorded; every assigned audit passes, except for failure codes that determine the classifier status carried under clause 7 (for example $\texttt{circular\_audit}$ on a cell of status $\texttt{undefined\_circular}$). The verdict $\texttt{model\_realization}$ is the verdict of a model-grade result (Subsubsection 2.3.4) and is distinct from the per-claim status $\texttt{accepted}$ in $\mathrm{ClaimStatus}$. The model-realization judgment is a judgment form of its own, separate from the instrument-indexed claim judgment of Subsection 4.8: $\Gamma;\mathcal T;I\vdash\mathcal M\models\mathcal S:\texttt{model\_realization}$ holds exactly when the realization map of $\mathcal M$ to $\mathcal S$ defined below satisfies clauses 1--7.

The realization map of $\mathcal M$ to $\mathcal S$ is a finite typed family of assignments

$$
\mathrm{real}_{\mathcal M\to\mathcal S}\;=\;\bigl\{\,\mathrm{real}_X\;:\;X\in\mathrm{Components}(\mathcal S)\,\bigr\},
$$

with each $\mathrm{real}_X$ mapping a host datum from $\mathcal M$ to the corresponding component $X$ of $\mathcal S$. The components of the fragments used in this section are as follows. For $\mathrm{cell/pair/prov}$: the thirty-six directed-cell records $\mathsf{Cell}_{ij}$, $1\le i,j\le 6$, each with its fields $W_j,U_i,L,V,\Theta,A,\delta$ and profile; the fifteen pair-observable records $\mathsf{PairObs}_{\{i,j\}}$, $i\ne j$, each with its source-of-truth record; the provenance and audit records they reference; and the finite dependency and ablation records. For a role fragment such as $P_1/P_2/P_4/P_5/P_6$: for each listed role $P_i$, a role-channel record $(\mathrm{Chan}_i,R_i,\Theta_i^{\mathrm{act}},A_{R_i},V_{R_i},\mathsf{collapse}_i)$ of Subsubsection 5.6.1 to which the role-channel classifier assigns $\texttt{active\_projection}$ under $I$, and the witness and update records it uses. For $0\to 1$: the expanded bridge tuple of Subsubsection 10.1.1, including its two packages and gate record. For $P_2/P_6^{H^1}\text{-drive}/P_3\text{-separation}$: a $P_2$ gate record $G\leadsto G'$ with its cycle-support defect, the $P_6$ audit record $A$, a drive record $\kappa_6^{\mathrm{drive}}(a)$ or a no-drive certificate of Subsubsection 8.1.2, and NC-12 in the nonclaim register. The realization map is admissible when:

1. every component of $\mathcal S$ is assigned a finite host datum from $\mathcal M$;
2. each assignment carries an audit record judged under the host instrument $I$ whose checks are replayed and whose audit defect is $\texttt{audit\_passes}$, up to the exception stated above;
3. every source record referenced by a realized record is admitted by $\mathsf{SourcePolicy}_I$ of the host instrument $I$;
4. the visibility policy of $\mathcal M$ exposes the records required by $\mathcal S$, with visibility bridges of Subsubsection 3.5.3 supplied where required;
5. the nonclaim register of $\mathcal M$ contains the model-realization nonclaims of Subsection 13.6 and any host-specific nonclaims of the realization;
6. every realized witness or update has a signature in $\mathsf{Wit}(P_j)$ or $\mathsf{Upd}(P_i)$ for the role it realizes (Subsection 3.7 and the convention of Subsubsection 3.1.1);
7. every realized record that carries a status (a directed cell, a pair observable or a promotion bridge) carries the status that the classifier of Subsection 5.6 assigns to the realized record; a status reported by the host that differs from it is recorded as a discrepancy and is not the status of the record.

Admissibility of the realization map is a finite predicate on $(\mathcal M,\mathcal S,I)$. Clauses 6 and 7 are what make the realization respect the calculus: the host data are typed as the calculus types them, and the verdicts on realized records are the calculus's own verdicts.

### 13.1.2 Fragment Discipline

Every model realization in the section is scoped to a declared fragment $\mathcal S$ of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. The fragment discipline imposes the following rules on every realization claim:

- *Fragment-only realization.* A model-realization statement $\mathcal M\models\mathcal S:\texttt{model\_realization}$ asserts realization of $\mathcal S$ and not of the whole calculus. The verdict $\texttt{model\_realization}$ for $\mathcal S$ does not imply a $\texttt{model\_realization}$ verdict for any larger fragment $\mathcal S'\supsetneq\mathcal S$.
- *No theorem grade by realization.* A model-realization verdict is not a theorem-grade verdict. In the absence of a separately admissible theorem-grade bridge, $\mathcal M\models\mathcal S:\texttt{model\_realization}$ does not yield a $\texttt{accepted}$ verdict on a theorem-grade claim about $\mathcal S$. This is the model-realization nonclaim of Subsection 2.4.
- *Host-bound realization.* A model-realization verdict for $\mathcal S$ under $\mathcal M$ is bound to the host of $\mathcal M$: it does not transfer to other hosts without an admissible instrument-transfer bridge in the sense of Subsection 11.9.
- *No model-coverage theorem.* The four realizations recorded in Subsections 13.2–13.4 and Section 12 do not, taken together, support a global model-coverage theorem for $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. This is the model-coverage nonclaim of Subsection 13.6.

The fragment discipline is the central structural constraint of the section: it fixes the meaning of $\models$, prevents over-reading of the model-realization verdict, and defines the boundary between model-grade and theorem-grade claims throughout Sections 13 and 12. The four realizations of the section are each scoped to a declared fragment, and the four fragments are recorded in the combined matrix of Subsection 13.5.

## 13.2 PICA Realization

This subsection records the PICA model-realization sheet and Model Theorem 33: any store family meeting $\mathsf{AdmPICAReal}$ induces a model of the finite stochastic cell/pair/provenance fragment of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$; the stores constructed to satisfy the predicate read the chain only through positive-probability traces; the predicate is met over every nonempty finite Markov chain for every raw status table, and is not checked here on the stores of the PICA simulator. The PICA realization is host-bound and fragment-scoped: it does not realize the whole calculus, the recovered $6\times 6$ table is a PICA-profile fact rather than a universal law, and raw PICA statuses recover into formal statuses only via the host classifier.

*Orientation.* PICA, the Primitive Interaction Closure Algebra, is the interaction algebra of the minimal stochastic substrate of \citet{Tsiokos2026PICA}: a finite Markov chain whose dynamics are built from six primitive mechanisms, simulated with audit records for every run. That work records a raw status (Action, Implicit, Trivial or Undefined) for each of the thirty-six ordered pairs of primitives, one for each directed interaction; Subsubsection 13.2.6 maps these raw statuses to the formal cell statuses of the calculus. This subsection reads the simulator's finite stores as host data of the calculus and states the conditions ($\mathsf{AdmPICAReal}$ and those of Subsubsection 13.2.5) under which they realize its cell, pair and provenance fragment. In the symbols below, $\Omega$ is the finite state space of the chain, $K$ its Markov kernel, and the other components of $\mathsf H_{\mathrm{PICA}}$ are the finite stores of the implementation.

### 13.2.1 Name and Host

The PICA realization name is $\mathsf{PICAReal}_{\mathrm{fin}}$. Its host is the finite stochastic implementation context $\mathsf H_{\mathrm{PICA}}$, with components

$$
\mathsf H_{\mathrm{PICA}}\;=\;(\,\Omega,\;K,\;\mathbb P,\;\mathsf{Bus},\;\mathsf{CellRules},\;\mathsf{WitnessStore},\;\mathsf{UpdateStore},\;\mathsf{PairStore},\;\mathsf{DepGraph},\;A,\;V\,),
$$

where $\Omega$ is a nonempty finite stochastic state space, $K$ a row-stochastic Markov kernel on $\Omega$, recorded in the stores by its finite support table $\operatorname{supp}K=\{(\omega,\omega'):K(\omega,\omega')>0\}$, together with its entries when these lie in a declared numerical type with decidable order (the trace-support rule reads only $\operatorname{supp}K$), $\mathbb P=\{P_1,\ldots,P_6\}$ the six primitive labels, and the remaining fields finite stores for the bus, cell rules, witness records, actor-update records, pair observables, the producer/consumer dependency graph, the host audit record $A$, and the host visibility record $V$. The host instrument is $I_{\mathrm{PICA}}$, an admissible instrument in the sense of Subsubsection 11.1.1 whose visible class contains the host stores and whose audit policy is clause (ii) of Subsubsection 13.2.2 and whose source policy is a relation of Subsubsection 5.3.6 containing $(t,\texttt{full},\lambda)$ for every profile $\lambda$ and the default entry, for $t=\texttt{committed\_state}$ and, where the host fallback policy allows it, $t=\texttt{fallback}$, together with $(\texttt{fallback},\texttt{provisional},\mu_{\mathrm{PICA}})$; $\mathsf{SourceOfTruthOK}$ enters through source traces (Subsubsection 13.2.7).

### 13.2.2 Realization Object

A PICA realization object is the finite typed tuple

$$
\begin{aligned}
\mathcal P\;=\;(\,&\Omega,\;K,\;\mathbb P,\;\mathsf{Bus},\;\mathsf{CellRules},\;\mathsf{WitnessStore},\;\mathsf{UpdateStore},\\
&\mathsf{StatusStore},\;\mathsf{PairStore},\;\mathsf{DepGraph},\;\mathsf{Abl},\;A,\;V,\;\mathcal N\,),
\end{aligned}
$$

extending the host data with $\mathsf{StatusStore}$ (raw and recovered statuses), $\mathsf{Abl}$ (finite ablation/model evidence), and $\mathcal N$ (the PICA nonclaim register of Subsubsection 13.2.10). The object is admissible, written $\mathsf{AdmPICAReal}(\mathcal P)$, when (i) each store is finite; (ii) every entry carries an audit record judged under $I_{\mathrm{PICA}}$ whose checks are replayed, and every such audit defect is empty except that the audit of a cell with raw status $\texttt{Undefined}$, and the audit of a pair record with raw status $\texttt{blocked}$, may contain the failure codes that determine its formal status under clause 7 of Subsubsection 13.1.1 (for example $\texttt{circular\_audit}$ for $\texttt{undefined\_circular}$, $\texttt{threshold\_failure}$ for $\texttt{below\_threshold}$, and $\texttt{source\_failure}$ or $\texttt{visibility\_failure}$ for a blocked pair); (iii) $\mathsf{CellRules}$ contains exactly one cell record for each of the thirty-six ordered pairs of primitives and $\mathsf{PairStore}$ exactly one pair record for each of the fifteen unordered pairs; a second record named by a duplicate-pair record is kept in $A$, not in $\mathsf{PairStore}$; (iv) every source record referenced by any realized component, including witness and update records and their audits, is admitted by $\mathsf{SourcePolicy}_{I_{\mathrm{PICA}}}$; (v) the directed-cell, pair-observable, source/audit, and status-recovery records satisfy the schemas used in Subsections 4.3, 4.4, 4.8, and 5.6; (vi) $\mathcal N$ contains the three coverage nonclaims of Subsubsection 13.6.2; (vii) every witness and update record carries a trace $(\omega_0,\dots,\omega_m)$ in $\Omega$, $m\ge1$, with $K(\omega_{r-1},\omega_r)>0$ for each $r$, replayed by its audit; and (viii) every source record $R$ whose $\mathrm{valid}_{\mathrm{src}}$ records a nonempty dirty-since step, or that fails a conjunct of $\mathsf{SourceOfTruthOK}(R,Q)$ for a pair record $Q$ whose source slot or audits name $R$, carries in $\mathrm{trace}_{\mathrm{src}}$ a failed check of $R$ itself; and for every source record $R$ whose $\mathrm{valid}_{\mathrm{src}}$ records a nonempty dirty-since step, whose validity condition fails, or whose $\mathrm{trace}_{\mathrm{src}}$ records a failed audit or threshold check of $R$ itself, $\mathsf{SourceOfTruthOK}(R,Q)$ is false for every pair record $Q$ of the instance. In addition, the visibility policy exposes every record required by the realized fragment, including referenced audit evidence, with admissible visibility bridges supplied where required, as stipulated by clause 4 of Subsubsection 13.1.1. The audit-failure exceptions do not waive this requirement. Every cell record of $\mathsf{CellRules}$ is well formed in the sense of Subsubsection 4.3.3 and every pair record of $\mathsf{PairStore}$ in the sense of Subsubsection 4.4.1. Admissibility is a finite predicate on the stores.

The associated realization map is

$$
\mathcal R_{\mathrm{PICA}}\;:\;\mathsf{PICAReal}_{\mathrm{fin}}\longrightarrow
\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin\text{-}stoch}}{}^{\,\mathrm{cell}/\mathrm{pair}/\mathrm{prov}},
$$

sending $\mathcal P$ to the realized finite stochastic model $\mathcal M_{\mathcal P}$. The induced package is

$$
\mathcal T_{\mathrm{PICA}}\;=\;(\,\Omega,\;f_{\mathrm{PICA}},\;\Sigma_{f_{\mathrm{PICA}}},\;E_{\mathrm{PICA}},\;\mathcal A_{\mathrm{PICA}}\,),
$$

where $f_{\mathrm{PICA}}$ is the bus/lens projection, $\Sigma_{f_{\mathrm{PICA}}}=\{f_{\mathrm{PICA}}^{-1}(B):B\subseteq f_{\mathrm{PICA}}(\Omega)\}$ and $E_{\mathrm{PICA}}=E_{f_{\mathrm{PICA}}}$ are the lens-induced content and completion, with the finite visible-claim set and the commit/update closure recorded as attached records, and $\mathcal A_{\mathrm{PICA}}$ is the inherited package-level audit functional assembled from the finite PICA audit record $A$.

### 13.2.3 Actor-Update Map

The PICA actor-update map sends each primitive $P_i$ to a finite update sort drawn from $\mathsf{UpdateStore}$:

$$
P_i\;\longmapsto\;\mathsf{Upd}_{\mathrm{PICA}}(P_i),
$$

with the assignments

| primitive | PICA actor update sort                          |
| --------- | ----------------------------------------------- |
| $P_1$     | descent repair / closure update                 |
| $P_2$     | support gate / admissibility update             |
| $P_3$     | route-memory / mismatch update                  |
| $P_4$     | refinement / staging update                     |
| $P_5$     | package / completion / closure-summary update   |
| $P_6$     | audit / provenance / source update              |

Each row records a finite update sort consumed by the directed-cell record of Subsubsection 13.2.5; the assignment is a typed map from $\mathbb P$ to the PICA update sorts, audited by $I_{\mathrm{PICA}}$.

### 13.2.4 Informant-Witness Map

The PICA informant-witness map sends each primitive $P_j$ to a finite witness sort drawn from $\mathsf{WitnessStore}$:

$$
P_j\;\longmapsto\;\mathsf{Wit}_{\mathrm{PICA}}(P_j),
$$

with the assignments

| primitive | PICA informant witness sort                    |
| --------- | ---------------------------------------------- |
| $P_1$     | descent/closure defect                          |
| $P_2$     | gate/support/admissibility witness              |
| $P_3$     | route mismatch / route-memory witness           |
| $P_4$     | refinement/stage witness                        |
| $P_5$     | package/closure/completion witness              |
| $P_6$     | audit/provenance/source witness                 |

The actor-update and informant-witness maps together specify the per-cell witness/update content for the directed-cell realization of Subsubsection 13.2.5.

### 13.2.5 Directed-Cell Realization

Each PICA directed cell becomes a typed claim in the calculus:

$$
\Gamma\,;\;\mathcal T_{\mathrm{PICA}}\,;\;I_{\mathrm{PICA}}\;\vdash\;\mathsf{Cell}_{ij}^{\lambda_{\mathrm{PICA}}}\;:\;\sigma_{ij},
$$

with the cell record

$$
(P_i\leftarrow P_j,\;W_j,\;U_i,\;L,\;V,\;\Theta,\;A,\;\delta),
$$

where $L$ is the level/lens/interface record of Subsubsection 4.3.3, $V$ is the visibility record, $\Theta$ the threshold record, $A$ the audit record, and $\delta$ the cell defect record. For each cell, $W_j$ is a selected record from $\mathsf{WitnessStore}$ whose signature belongs to $\mathsf{Wit}(P_j)$, and $U_i$ is a selected record from $\mathsf{UpdateStore}$ whose signature belongs to $\mathsf{Upd}(P_i)$. The sorts in Subsubsections 13.2.3–13.2.4 specify the permitted record kinds; they are not themselves the cell's witness and update fields. The cell profile is $\lambda_{\mathrm{PICA}}=(\mathsf{Ver},\mathsf{Ver},\texttt{fine},\texttt{dynamical},\texttt{visibility},\texttt{default},\texttt{local})$, and each pair record carries $\mu_{\mathrm{PICA}}$ with the same entries. $I_{\mathrm{PICA}}$ has $\texttt{directed-cell},\texttt{pair-observable}\in\mathsf{ClaimTypes}_{I_{\mathrm{PICA}}}$, $\mathsf{Ver}\in\mathsf{Levels}_{I_{\mathrm{PICA}}}$, $\mathsf{ModePolicy}_{I_{\mathrm{PICA}}}(\text{directed-cell})=\mathsf{ModePolicy}_{I_{\mathrm{PICA}}}(\text{pair-observable})=\texttt{default}$, $(\texttt{fine},\texttt{dynamical},\texttt{local},\mathsf H_{\mathrm{PICA}})\in\mathsf{Compat}_{I_{\mathrm{PICA}}}$, and a bridge policy admitting the visibility type. Per-cell thresholds are carried by $\Theta$.

The raw statuses of the thirty-six pairs are imported from \citet{Tsiokos2026PICA}. The realized records attach the witnesses of the eight raw $\texttt{Implicit}$ cells, and no other witness, to $\mathcal T_{\mathrm{PICA}}$ (so $W_{\mathcal T_{\mathrm{PICA}}}$ consists of these eight records, as in the proof of Model Theorem 33), with no threshold evaluating them, so that step 8 computes $\mathsf{implicitW}$ on those cells, and the audit record of the raw $\texttt{Undefined}$ cell lists among its evidence references the verdict reference of that cell under $I_{\mathrm{PICA}}$, recording the circularity the PICA audit reports for it, so step 8 computes a failing $\mathsf{CircularityCheck}$ there. The two raw $\texttt{Trivial}$ cells have recorded updates whose effect maps fix their targets, so step 8 computes $\mathsf{noopU}=\mathrm{true}$; the other thirty-four have $\mathsf{noopU}=\mathrm{false}$. If all thirty-six cells are in scope, have their witness and update present, satisfy their thresholds, have empty visibility and required-bridge defects, have no package-collapse entry or other failing defect, and pass every audit check except that one circularity check, and no raw $\texttt{Action}$ cell has as its witness one of the eight attached records (for example, the thirty-six witness records are pairwise distinct), on these records the classifier of Subsubsection 5.6.2 returns the PICA-profile multiplicity record

$$
25\;\texttt{action},\quad 8\;\texttt{implicit},\quad 2\;\texttt{trivial},\quad 1\;\texttt{undefined\_circular}.
$$

Since the attachments and the circularity code are chosen from the raw statuses, this count re-expresses the raw table under the recovery map; it is not an independent computation.

This agrees with the recovery map of Subsubsection 13.2.6, in which the one raw $\texttt{Undefined}$ pair, with its circular audit, is recovered as $\texttt{undefined\_circular}$. It records the multiplicities of the four directed-cell statuses within the PICA host under the recovery map of Subsubsection 13.2.6, and is not a universal table theorem about $6\times 6$ tables in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.

### 13.2.6 Status Recovery

Raw PICA statuses recover as formal statuses through the recovery map

$$
\texttt{Action}\;\longmapsto\;\texttt{action},\qquad\texttt{Implicit}\;\longmapsto\;\texttt{implicit},\qquad\texttt{Trivial}\;\longmapsto\;\texttt{trivial},
$$

$$
\texttt{Undefined}\;\longmapsto\;\text{reason-dependent formal status},
$$

where the reason-dependent recovery of $\texttt{Undefined}$ is one of $\texttt{blocked}$, $\texttt{undefined\_circular}$, $\texttt{outside\_scope}$, $\texttt{absent}$, $\texttt{below\_threshold}$, or $\texttt{collapsed}$, decided by the formal classifier of Subsection 5.6 acting on the cell record, the threshold record, the audit record, and the source-of-truth record.

Raw PICA status never overrides the formal classifier verdict: if the recovered formal status assigned by the classifier differs from the raw status, the formal status is the authoritative cell status, and the raw/recovered discrepancy is recorded in the source/provenance correction record of $\mathsf{StatusStore}$. The same holds for pair observables below: the formal pair status is the verdict of the pair classifier of Subsubsection 5.6.3 on the realized record.

### 13.2.7 Pair-Observable Realization

PICA pair statuses recover as formal pair statuses through

$$
\texttt{real}\;\longmapsto\;\texttt{real},\qquad\texttt{provisional}\;\longmapsto\;\texttt{real\_provisional},\qquad\texttt{duplicated}\;\longmapsto\;\texttt{real\_duplicated},
$$

$$
\texttt{blocked}\;\longmapsto\;\texttt{blocked},
$$

with a PICA pair observable record

$$
\begin{aligned}\mathsf{PairObs}_{\{i,j\}}^{\mu}\;=\;(\,&\{P_i,P_j\},\;\mu,\;\mathsf{ObservableType},\;\mathsf{BranchData},\;\mathsf{SourceOfTruth},\;L,\;V,\;\Theta,\\&A,\;\delta,\;\mathcal N,\;\mathsf{forbidsSource},\;\mathsf{partialEvidence},\;\mathsf{Dup}\,).\end{aligned}
$$

Here $\mathsf{ObservableType}$ is the joint-witness field and $\mathsf{BranchData}$ the branch-compatibility record of Subsubsection 4.4.1, and $\mathsf{Dup}$ is present only for a duplicated pair.

Realness of the pair observable requires the conjunction

$$
\mathsf{SourceOfTruthOK}\;\land\;\mathsf{VisibilityPasses}\;\land\;\mathsf{AuditPasses}\;\land\;\mathsf{ThresholdPasses},
$$

Here $\mathsf{SourceOfTruthOK}$ is the source-of-truth predicate of Subsubsection 13.2.8, and the other three predicates are the host-level visibility, audit, and threshold checks of Subsection 11.3, Subsubsection 4.9.2 and Subsection 5.2. Since $\mathsf{SourcePolicy}_{I_{\mathrm{PICA}}}$ relates only tags, modes and profiles (Subsubsection 5.3.6), the PICA store discipline records the failure of any conjunct of $\mathsf{SourceOfTruthOK}$ as a failed check of $R$ itself in $\mathrm{trace}_{\mathrm{src}}$. The source defect of $R$ is then $\texttt{dirty}$, unless an earlier clause assigns $\texttt{unknown}$ or $\texttt{contradictory}$; in every case it fails the source threshold, so the first $\texttt{blocked}$ row applies, even when an upgrade bridge is present. The $\texttt{real\_duplicated}$ row reads the duplicate-pair record together with the conditions of the $\texttt{real}$ row, so it also requires all four checks; if a visibility, audit or threshold defect fails, the first $\texttt{blocked}$ row applies. An admitted fallback source, or a proxy source obtained through an admitted, audited source bridge, may receive $\texttt{real\_provisional}$; other cases that meet no earlier row receive $\texttt{blocked}$.

### 13.2.8 Provenance Discipline

The PICA source-of-truth predicate is

$$
\mathsf{SourceOfTruthOK}(R,Q)\;\;\Longleftrightarrow\;\;\mathsf{Committed}(R)\;\land\;\mathsf{CorrectProducer}(R,Q)\;\land\;\mathsf{CorrectProvenance}(R,Q)
$$

$$
\land\;\mathsf{NotFallbackUnlessAllowed}(R,Q)\;\land\;\mathsf{Visible}(R)\;\land\;\mathsf{Audited}(R),
$$

for a record $R$ and a query/observable $Q$. Each conjunct is a finite check on the host stores: $\mathsf{Committed}$ on $\mathsf{Bus}$ and $\mathsf{StatusStore}$; $\mathsf{CorrectProducer}$ on $\mathsf{DepGraph}$; $\mathsf{CorrectProvenance}$ on $A$; $\mathsf{NotFallbackUnlessAllowed}$ on the host's fallback policy; $\mathsf{Visible}$ on $V$; $\mathsf{Audited}$ on $A$.

The provenance discipline imposes two non-negotiable rules:

- *Dirty exclusion.* Clause (viii) of $\mathsf{AdmPICAReal}$ requires every record whose $\mathrm{valid}_{\mathrm{src}}$ records a nonempty dirty-since step to carry in $\mathrm{trace}_{\mathrm{src}}$ a failed check of $R$ itself. Consequently its source threshold fails: its source defect is $\texttt{dirty}$ unless an earlier clause assigns $\texttt{unknown}$ or $\texttt{contradictory}$; and $\neg\,\mathsf{SourceOfTruthOK}(R,Q)$. A dirty record cannot be a source of truth for any query, and a dirty record in a pair's source slot, or among the $\mathsf{SourceRefs}$ of its audit or branch-compatibility audit, cannot support a $\texttt{real}$ pair observable: the first $\texttt{blocked}$ row applies.
- *Fallback-default cap.* $R\;\text{is fallback}\;\Longrightarrow\;Q\;\text{recovers as}\;\texttt{real\_provisional}\;\text{at most}$, unless $\mathrm{trace}_{\mathrm{src}}(R)$ names a source-upgrade bridge admitted by $\mathsf{SourcePolicy}_{I_{\mathrm{PICA}}}$ and $\mathsf{BridgePolicy}_{I_{\mathrm{PICA}}}$ (Subsubsection 5.3.6). Without that admitted upgrade, a fallback record supports at most a provisional pair observation.

The discipline ensures that pair-realness is grounded in committed, correct, audited, visible, non-dirty, and not-merely-fallback records; under any failure of these conditions, the pair recovers as one of the non-real statuses of Subsubsection 13.2.7.

### 13.2.9 Model Theorem 33: PICA Model-Realization

Call a PICA realization object $\mathcal P$ *$K$-independent* if $K$ is named, in the reference graph of Subsubsection 5.6.5, only by the $K$ fields of $\mathcal P$ and its host and by trace-support audit entries, and no rule of $\mathsf{CheckRules}_{I_{\mathrm{PICA}}}$ other than the trace-support rule, which checks $K(\omega_{r-1},\omega_r)>0$, takes $K$ as an argument; and every other admissibility or classifier computation, including threshold and defect computations and transitive calls to named programs, depends on trace-support checks only through their Boolean outcomes and does not otherwise read $K$, directly or indirectly. For such $\mathcal P$ the realized statuses are determined by the stores, and $K$ enters only through the support of the recorded traces.

\begin{claimtheorem}{Model Theorem 33 (PICA Model-Realization)}
Let $\mathcal P\in\mathsf{PICAReal}_{\mathrm{fin}}$ be admissible: $\mathsf{AdmPICAReal}(\mathcal P)$ holds. Then the realization map $\mathcal R_{\mathrm{PICA}}$ supplies a finite, audited assignment of host data to every component of the finite stochastic cell/pair/provenance fragment, so

$$
\mathcal R_{\mathrm{PICA}}(\mathcal P)\;\models\;\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin\text{-}stoch}}{}^{\,\mathrm{cell}/\mathrm{pair}/\mathrm{prov}}.
$$

Moreover: (i) for every nonempty finite $\Omega$ and row-stochastic Markov kernel $K$ on $\Omega$, and every assignment of raw statuses in $\{\texttt{Action},\texttt{Implicit},\texttt{Trivial},\texttt{Undefined}\}$ to the thirty-six ordered pairs, $\mathsf{AdmPICAReal}$ is satisfiable over $(\Omega,K)$ by stores on which the cell classifier reproduces that assignment under the recovery map of Subsubsection 13.2.6, with $\texttt{Undefined}\mapsto\texttt{undefined\_circular}$, with no cell discrepancy; (ii) for pairs, for every assignment of raw pair statuses in $\{\texttt{real},\texttt{provisional},\texttt{duplicated},\texttt{blocked}\}$ to the fifteen pairs, the stores can be chosen so that the pair classifier reproduces it under the recovery map of Subsubsection 13.2.7, with no pair discrepancy. Clause (i), applied to the raw cell table of \citet{Tsiokos2026PICA}, gives $25$ $\texttt{action}$, $8$ $\texttt{implicit}$, $2$ $\texttt{trivial}$ and $1$ $\texttt{undefined\_circular}$ cells, multiplicities that are an input of the realization, not a consequence of $\mathsf{AdmPICAReal}$. (iii) in particular, every assignment of $\texttt{action}$, $\texttt{implicit}$, $\texttt{trivial}$ and $\texttt{undefined\_circular}$ to the thirty-six cells is realized over every nonempty finite $(\Omega,K)$ by suitable stores. (iv) the stores constructed in the proof are $K$-independent: once their traces are fixed, only the positive-probability checks read $K$. (v) consequently, if $\mathsf{AdmPICAReal}(\mathcal P)$ holds over $(\Omega,K)$, $\mathcal P$ is $K$-independent, and $K'$ is a row-stochastic kernel on $\Omega$ positive on every recorded trace step, then $\mathcal P$ with $K$ replaced by $K'$ (each trace replay rerun under $K'$) satisfies $\mathsf{AdmPICAReal}$, and every realized cell and pair keeps its classifier status.
\end{claimtheorem}

The paper does not verify $\mathsf{AdmPICAReal}$ for the stores of \citet{Tsiokos2026PICA}.

\begin{proof}
By $\mathsf{AdmPICAReal}(\mathcal P)$, $\mathsf{CellRules}$ and $\mathsf{PairStore}$ contain one record for each of the thirty-six cells and fifteen pair observables listed as components in Subsubsection 13.1.1, so each component of the realized fragment is assigned a finite host datum and audit record from $\mathcal P$:

- *Typed directed cells.* Subsubsections 13.2.3 and 13.2.4 supply the actor-update and informant-witness maps; Subsubsection 13.2.5 assembles them into the directed-cell record under the cell profile $\lambda_{\mathrm{PICA}}$.
- *Cell-status recovery.* Subsubsection 13.2.6 supplies the recovery map from raw to formal statuses, with the formal classifier of Subsection 5.6 as the authoritative verdict.
- *Pair-observable contracts.* Subsubsection 13.2.7 supplies the pair-observable record and the four-conjunct realness predicate.
- *Source-of-truth and provenance discipline.* Subsubsection 13.2.8 supplies the $\mathsf{SourceOfTruthOK}$ predicate and the dirty-exclusion and fallback-default rules.
- *Finite dependency and ablation records.* The host stores $\mathsf{DepGraph}$ and $\mathsf{Abl}$ supply finite dependency and ablation records, recorded in $A$ under $I_{\mathrm{PICA}}$.

Each assignment is a finite host datum, audited by $I_{\mathrm{PICA}}$ and visible under it; clause 3 holds because $\mathsf{AdmPICAReal}(\mathcal P)$ requires every referenced source record to be admitted by $\mathsf{SourcePolicy}_{I_{\mathrm{PICA}}}$. Clause 5 of Subsubsection 13.1.1 holds by $\mathsf{AdmPICAReal}(\mathcal P)$. For clause 6, the witness and update records selected for each cell in Subsubsection 13.2.5 have signatures in $\mathsf{Wit}(P_j)$ and $\mathsf{Upd}(P_i)$. For clause 7, Subsubsection 13.2.6 makes the classifier's verdict the status of every realized cell and Subsubsection 13.2.7 does the same for every realized pair observable, with raw PICA statuses entering only through the recovery maps and the recorded discrepancies. The realization map is admissible in the sense of Subsubsection 13.1.1, so the scoped model-realization statement receives verdict $\texttt{model\_realization}$.

*Traces and instrument.* For the satisfiability clause, take any nonempty finite $\Omega$ and row-stochastic Markov kernel $K$ on it; attach to every witness and update record a trace $(\omega_0,\omega_1)$ with $K(\omega_0,\omega_1)>0$, choosing any $\omega_0\in\Omega$ and any $\omega_1$ with $K(\omega_0,\omega_1)>0$, which exists because $K(\omega_0,\cdot)$ sums to $1$, and replay it in the record's audit. Take $I_{\mathrm{PICA}}$ at level $\mathsf{Ver}$, with strengths $\{\texttt{weak}\}$, every admitted pair and claim type sent to $\texttt{weak}$, an evidence policy admitting $\texttt{committed\_state}$, $\mathsf{ProvisionalTypes}_{I_{\mathrm{PICA}}}=\varnothing$, threshold policy consisting of the exact thresholds that the cell and pair records below carry, nonclaim record $\mathcal N_{I_{\mathrm{PICA}}}=\mathcal N_{\mathrm{PICA}}$, and with scope and visible set containing, besides the host stores, the verdict references $\ulcorner\mathsf{Cell}_{ij},I_{\mathrm{PICA}}\urcorner$ of the thirty-six cells, as for the running-example instrument of Subsection 3.8, with $\mathsf H_{\mathrm{PICA}}\in\mathsf{Hosts}_{I_{\mathrm{PICA}}}$ and the level tags of the cell profiles in $\mathsf{Levels}_{I_{\mathrm{PICA}}}$.

*Cells.* Take pairwise distinct finite, typed witness and update records, on $\mathsf H_{\mathrm{PICA}}$ and tagged $\mathsf{Ver}$, for the thirty-six cells. Give each raw $\texttt{Action}$ cell an update with signature in $\mathsf{Upd}(P_i)$ (Subsubsection 3.7.5) whose recorded effect map changes its target (for $P_6$, by adding a fresh log entry), so that $\mathsf{noopU}$ is false; give each raw $\texttt{Implicit}$ cell the same, with its witness attached to $\mathcal T_{\mathrm{PICA}}$ and evaluated by no threshold, so that $\mathsf{implicitW}$ is computed true; give each raw $\texttt{Undefined}$ cell an update whose recorded effect changes its target and each raw $\texttt{Trivial}$ cell a recorded identity effect; and give the audit record of each raw $\texttt{Undefined}$ cell an evidence reference to that cell's own verdict under $I_{\mathrm{PICA}}$, so that its computed $\mathsf{CircularityCheck}$ fails. Give every cell a level/lens/interface record with the identity lens on $\Omega$. Give every cell $\lambda_{\mathrm{PICA}}$ and every pair $\mu_{\mathrm{PICA}}$; step 4 and the profile clause of Subsubsection 4.4.1 then hold, and no bridge is required. Choose each update's signature from $\mathsf{Upd}(P_i)$ (Subsubsection 3.7.5). For $P_5$, register a fresh fixed-point record in the first three groups and re-register an existing one in the trivial group. Thus no cell has a package-collapse entry. All cells are in scope with witness and update present, and every other check passes with its computed defect. The classifier then returns $\texttt{action}$, $\texttt{implicit}$, $\texttt{trivial}$ and $\texttt{undefined\_circular}$ on these four groups, reproducing the thirty-six raw statuses with no discrepancy. The construction treats each cell by its raw status alone, so it applies to every assignment of raw statuses. Record each raw PICA status, its formal verdict and the empty discrepancy in $\mathsf{StatusStore}$.

*Sources and pairs.* Give every witness, update, cell, dependency and ablation audit a $\texttt{committed\_state}$ source record admitted by $\mathsf{SourcePolicy}_{I_{\mathrm{PICA}}}$. Every record built in this proof is on $\mathsf H_{\mathrm{PICA}}$ and tagged $\mathsf{Ver}$. Give each of the fifteen pairs a bus entry, a producer edge, a passing provenance audit, $\mathsf{partialEvidence}=\mathrm{false}$, an empty visibility defect, no required bridge, and a visible branch-compatibility record with $\mathsf{compatible}=\mathrm{true}$ and its own passing audit; the $\mathsf{SourceRefs}$ of this audit and of the pair's audit are $\{R\}$, for the pair's source record $R$ chosen below, so clause (viii) of $\mathsf{AdmPICAReal}$ is met by the choice of $R$ alone. Choose these entries so that each pair's source record $R$ satisfies $\mathsf{SourceOfTruthOK}(R,Q)$: $R$ is committed on $\mathsf{Bus}$, produced along the recorded edge, correctly provenanced, visible, audited and, if fallback, allowed by the host fallback policy; hence $\mathrm{trace}_{\mathrm{src}}(R)$ records no failed check and $\delta_6^{\mathrm{source}}(R)\neq\texttt{dirty}$. Choose the remaining pair data by raw pair status. A raw $\texttt{real}$ pair gets an admitted $\texttt{committed\_state}$ source and $\mathsf{forbidsSource}=\mathrm{false}$, so the $\texttt{real}$ row of Subsubsection 5.6.3 holds; a raw $\texttt{duplicated}$ pair gets the same together with a duplicate-pair record $\mathsf{Dup}=(Q',A_{\mathsf{Dup}})$, where $Q'$ is a copy of that pair record with a fresh identifier, no $\mathsf{Dup}$ field and its own passing audit, stored with the audit evidence of $A$ and not in $\mathsf{PairStore}$; $Q'$ is well formed, classified $\texttt{real}$, and is not one of the fifteen realized pair records, and the $\texttt{real\_duplicated}$ row holds for the stored record. A raw $\texttt{provisional}$ pair gets $\mathsf{forbidsSource}=\mathrm{false}$ and a fallback source record that $\mathsf{SourcePolicy}_{I_{\mathrm{PICA}}}$ admits for provisional use under $\mu$, with $\delta_6^{\mathrm{source}}=\texttt{fallback\_admitted}$ and no source-upgrade bridge; condition (a) of the $\texttt{real}$ row then fails, the first $\texttt{blocked}$ row does not apply, and the $\texttt{real\_provisional}$ row holds. Also give fallback full-mode admission under every profile and the default entry, and allow it under the host fallback policy; without an upgrade, it still yields $\texttt{real\_provisional}$. A raw $\texttt{blocked}$ pair gets an admitted $\texttt{committed\_state}$ source and $\mathsf{forbidsSource}=\mathrm{true}$, so the first $\texttt{blocked}$ row holds. Every pair audit passes, and each pair's raw status, formal verdict and empty discrepancy are recorded in $\mathsf{StatusStore}$. Include an audited finite ablation record and the nonclaims of Subsubsections 13.2.10 and 13.6.2. These stores satisfy $\mathsf{AdmPICAReal}$. Each cell so built passes steps 1–8 of Subsubsection 6.3.1, and only the witnesses of raw $\texttt{Implicit}$ cells lie in $W_{\mathcal T_{\mathrm{PICA}}}$.

*Thresholds and $K$-independence.* Take every threshold of a raw $\texttt{Action}$, $\texttt{Trivial}$ or $\texttt{Undefined}$ cell to be an exact check on the values of its recorded witness or update, every threshold of a raw $\texttt{Implicit}$ cell an exact check on the values of its recorded update, and every threshold of a pair an exact check on its source record, each chosen so that the recorded values pass it (for instance $\Theta_{\in S}$ with $S$ the singleton of the recorded value); these are the thresholds meant above when every other check is said to pass, and give $I_{\mathrm{PICA}}$ no rule other than the trace-support rule that takes $K$ as an argument. Then $K$ is named only by the $K$ fields of $\mathcal P$ and its host and by trace-support audit entries, and these stores are $K$-independent. For $K$-independent $\mathcal P$, rerunning the trace-support checks under $K'$ preserves their passing values, while all other checks and classifier inputs remain unchanged; hence admissibility and statuses are preserved.
\end{proof}

### 13.2.10 PICA Nonclaims

The PICA nonclaim register $\mathcal N_{\mathrm{PICA}}$ contains, in particular:

1. PICA is not the universal six-bird algebra: $\mathsf{PICAReal}_{\mathrm{fin}}$ realizes a declared finite stochastic fragment, not the whole calculus.
2. The recovered $6\times 6$ multiplicity count is a PICA-profile model fact under the cell profile $\lambda_{\mathrm{PICA}}$, not a universal $6\times 6$ law.
3. Raw PICA status is not formal status without recovery and classifier check; the formal classifier verdict is the authoritative cell status.
4. Directed-cell status $\texttt{action}$ does not imply pair-realness; pair-realness requires the source/visibility/audit/threshold conjunction of Subsubsection 13.2.7.
5. A fallback record does not by itself support a real pair source-of-truth; it supports at most $\texttt{real\_provisional}$.
6. Ablation evidence in $\mathsf{Abl}$ is model-realization evidence, not theorem-grade evidence, in the absence of an admissible bridge to a theorem-grade claim.
7. A $P_3$ route mismatch is not a $\mathrm{P6}_{\mathrm{drive}}$ assertion in the sense of Section 8: the two are connected only through an admissible drive bridge.
8. A dirty record cannot support a real claim under any host configuration of $\mathsf H_{\mathrm{PICA}}$.
9. PICA realizes a finite stochastic fragment, and not the entirety of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$; this restates the fragment discipline of Subsubsection 13.1.2.
10. Implementation correctness of any concrete PICA implementation is future work and is not certified by this realization theorem; the theorem concerns only the finite realization record specified above.

The register $\mathcal N_{\mathrm{PICA}}$ is finite, recorded in $\mathcal P$, and is part of the admissibility predicate $\mathsf{AdmPICAReal}(\mathcal P)$ in the sense of Subsubsection 13.2.2.

## 13.3 Cantor Strict-Bridge Realization

This subsection records the Cantor strict-bridge realization sheet and Model Theorem 34: under the audited Cantor shell, the strict-bridge passage from a base cocycle-pressure package $T_0$ to a completion-packaged target package $T_1$ is admissibly classified $\texttt{strict}$. The realization is host-bound to the audited shell and fragment-scoped to the strict-bridge passage; it does not generalize beyond the shell, and its pressure-gap content is recorded as a consequence defect rather than the strictness witness itself. The realization packages the base and target theories, interfaces, bridge, pressure-gap defect, audits and nonclaims in a finite typed tuple over the audited Cantor shell; its strictness input comes from the cited Cantor theorem.

*Orientation.* The Cantor model is the theorem package of \citet{Tsiokos2026Cantor}. Its substrate is a continuous Cantor system whose update is generated by six interacting mechanisms that play the roles of the six primitives, and its results hold on a distinguished class $\mathcal S_{\mathrm{aud}}$ of lawful states, the audited shell. Two theories live on the shell. The base theory $T_0$ is built from a cocycle and its pressure. The extension $T_1$ is built from a packaging map that evolves a distribution, forgets detail, and reinstates a prototype. The Cantor paper proves that $T_1$ is a strict extension of $T_0$: the packaged-object map does not factor through the cocycle-level object map. This subsection records that result as a strict promotion bridge of the calculus. In the symbols below, $a_n(s;x)$ is the cocycle observable at depth $n$, parameter $s$ and shell state $x$; $K$ is the normalized kernel of the substrate and $\tau>0$ a timescale, so that $\mu K^{\tau}$ is the state $\mu$ evolved over the timescale $\tau$; $Q_\ell$ is the forgetting map of the lens $\ell$ and $U_\ell$ the matching reinstatement map; and $\mathcal F$ is the family of persistent packaged strata. The pressure $P_{T_0}(s)$ is defined by a limit in $n$. It enters this paper only as a value recorded in the finite record of $T_0$, established in the Cantor paper; no argument here takes the limit. In this subsection $P_{T_0}$ and any other $P$ with a package subscript are pressures, not role labels; $W$ is the finite carrier, not a witness; and $T_0,T_1$ name the Cantor theories, whose packages are $\mathcal T^{\mathrm{Cantor}}_0,\mathcal T^{\mathrm{Cantor}}_1$.

### 13.3.1 Name and Host

The Cantor realization name is $\mathsf{CantorShell}_{\mathrm{aud}}$. Its host is the audited Cantor shell context $\mathsf H_{\mathrm{CantorShell}}$: a scoped audited application host built over a fixed audited shell-stable comparison domain $\mathcal S_{\mathrm{aud}}$, recording the base and target packages, the bridge data, the pressure-gap defect record, and the audit/nonclaim register. The host is not the base finite theorem host of Sections 3 and 4, but a scoped audited host whose records are judged by an instrument in the sense of Subsection 11.1; the host instrument is $I_{\mathrm{Cantor}}$, an admissible instrument under which the realization claim of Subsubsection 13.3.8 is recorded.

The realization object is the tuple of finite records

$$
\mathsf{CantorShell}_{\mathrm{aud}}
\;=\;
(\,\mathsf{cite}_{\mathcal S},\;W,\;T_0,\;T_1,\;\pi_0,\;\pi_1,\;\mathcal F,\;\Delta,\;A,\;\mathcal N\,),
$$

where $\mathsf{cite}_{\mathcal S}$ is a finite citation record for the shell $\mathcal S_{\mathrm{aud}}$ (an identifier and a pointer to its definition in the Cantor paper), $T_0$ is the base cocycle-pressure theory with package $\mathcal T_0^{\mathrm{Cantor}}$, $T_1$ is the completion-packaged target theory with package $\mathcal T_1^{\mathrm{Cantor}}$, $\mathcal F$ is the persistent packaged-strata family, $\Delta$ is the pressure-gap consequence record, which records the values of $\Delta_{T_0\to T_1}$ and of $P_{T_0}$ only at a declared finite set of parameters and at points of $W$, each with a source record; each value is recorded as a closed interval with rational endpoints certified by the cited source, and no gate, threshold or check rule compares these values; $A$ is the finite audit and support record, and $\mathcal N$ is the Cantor nonclaim register of Subsubsection 13.3.9.

### 13.3.2 Base Package $T_0$

The base package is

$$
\mathcal T_0^{\mathrm{Cantor}}\;=\;(\,W,\;\pi_0,\;\Sigma_{\pi_0}^{\mathrm{cocycle}},\;E_0^{\mathrm{cocycle}},\;\mathcal A_{T_0}\,),
$$

a candidate package in the schema of Subsection 3.3, with:

- $W\subseteq\mathcal S_{\mathrm{aud}}$, a finite audited subset of the audited shell-stable comparison domain that contains a witness pair of the nonfactorization of Subsubsection 13.3.5. The carrier $W$ and the restricted object maps are finite, and the completion endomaps of the two packages are finite endomaps of $\mathcal P(W)$, as below;
- $\pi_0:W\to\mathcal O_0$, the old cocycle-level object map onto a finite collection $\mathcal O_0$ of cocycle-level objects;
- $\Sigma_{\pi_0}^{\mathrm{cocycle}}=\{\pi_0^{-1}(B):B\subseteq\pi_0(W)\}$, the lens-induced content of the base package; the cocycle-level claims that $T_0$ exposes are recorded in its visibility profile $V_{T_0}$;
- $E_0^{\mathrm{cocycle}}=E_{\pi_0}$, the lens completion $\Sigma\mapsto\pi_0^{-1}(\pi_0(\Sigma))$ on $\mathcal P(W)$, the canonical lens completion $E_f$ of Subsubsection 3.3.1; the closure $\operatorname{Cl}_{P_{T_0}}$ of the base pressure object is cited from the Cantor paper, not recorded;
- $\mathcal A_{T_0}$, the audit functional of Subsubsection 3.3.1, certifying each entry of the finite audit record family $A_{T_0}$ of $\mathcal T_0^{\mathrm{Cantor}}$ under $I_{\mathrm{Cantor}}$.

The base pressure object is

$$
P_{T_0}(s)\;=\;\lim_{n\to\infty}\frac{1}{n}\,\log\!\left(\sup_{x\in\mathcal S_{\mathrm{aud}}}a_n(s;x)\right),
$$

a real-valued function of the parameter $s$ whose values at the declared finite parameter set of Subsubsection 13.3.1 are recorded in $T_0$, each with a source record; the function itself is cited, not recorded.

### 13.3.3 Target Package $T_1$

The target package is

$$
\mathcal T_1^{\mathrm{Cantor}}\;=\;(\,W,\;\pi_1,\;\Sigma_{\pi_1}^{\mathrm{pkg}},\;E_1^{\mathrm{pkg}},\;\mathcal A_{T_1}\,),
$$

with $\pi_1:W\to\mathcal O_1$ the new packaged-object map onto a finite collection $\mathcal O_1$ of completion-packaged objects, $\Sigma_{\pi_1}^{\mathrm{pkg}}=\{\pi_1^{-1}(B):B\subseteq\pi_1(W)\}$ the lens-induced content, with the packaged-object claims recorded in $V_{T_1}$, $\mathcal A_{T_1}$ the audit functional certifying the entries of the audit record family $A_{T_1}$ of $\mathcal T_1^{\mathrm{Cantor}}$, and completion endomap $E_1^{\mathrm{pkg}}=E_{\pi_1}$, the lens completion $\Sigma\mapsto\pi_1^{-1}(\pi_1(\Sigma))$ on $\mathcal P(W)$. The packaging data of the Cantor system,

$$
(\,E_{\tau,\ell},\;\mathrm{Fix}(E_{\tau,\ell}),\;\mathcal F,\;\mathrm{Sat},\;\mathrm{Force}_{4\leftarrow 5}\,),
$$

are recorded in $T_1$ only as finite citation records, each an identifier with a pointer to its definition in the Cantor paper, as for $\mathsf{cite}_{\mathcal S}$; the operators themselves act on distributions of the Cantor system, not on $\mathcal P(W)$, and are not records of the calculus. The level/lens/interface record of the bridge references these citation records. Here $E_{\tau,\ell}(\mu)=U_{\ell}\bigl(Q_{\ell}(\mu K^{\tau})\bigr)$, $\mathcal F$ the persistent packaged-strata family, $\mathrm{Sat}$ the saturation operator, and $\mathrm{Force}_{4\leftarrow 5}$ the forcing operator that records the $P_4\leftarrow P_5$ completion-packaging relation.

### 13.3.4 Cantor Strict Bridge

The Cantor strict bridge is

$$
B_{0\to 1}^{\mathrm{Cantor}}\;=\;(\,\mathcal T_0^{\mathrm{Cantor}},\;\mathcal T_1^{\mathrm{Cantor}},\;\pi_0,\;\pi_1,\;L_{\mathrm{Cantor}},\;V_{\mathrm{Cantor}},\;\Theta_{\mathrm{Cantor}},\;A_{\mathrm{Cantor}},\;\delta_{\mathrm{Cantor}},\;\mathcal N_{\mathrm{Cantor}}\,),
$$

a promotion bridge with strict object maps in the promotion-bridge schema of Subsection 10.1. Its threshold record is $\Theta_{\mathrm{Cantor}}=\{\Theta_{\mathrm{strict}}\}$, the exact strictness threshold $\Delta_{\mathrm{fact}}(\pi_0,\pi_1)\neq\varnothing$ of Subsubsection 5.4.1, so a strictness verdict is required (Subsubsection 10.2.1); it carries no threshold on $\delta_1^{\mathrm{split}}$ or $\delta_{\mathrm{stab}}$. Its expanded record (Subsubsection 4.5.2) has carrier $S=W$, codomains $\mathcal O_0,\mathcal O_1$, the gate record of Subsubsection 13.3.7, host tag $\mathsf H_{\mathrm{CantorShell}}$ and bridge profile $\lambda_{\mathrm{Cantor}}$; Model Theorem 34 constrains $\lambda_{\mathrm{Cantor}}$ only through $\mathsf{AdmProfile}$ and the requirement that its level tags lie in $\mathsf{Levels}_{I_{\mathrm{Cantor}}}$, and its Moreover clause fixes one admissible value. Its level/lens/interface record $L_{\mathrm{Cantor}}$ records the level pair $(\mathsf{Ver},\mathsf{Ver})$, the identity lens on $W$, and the interface $(\pi_0,\pi_1)$, and it references the attached lift data $(E_{\tau,\ell},Q_\ell,U_\ell,\mathrm{Sat},\mathrm{Force}_{4\leftarrow5})$. The defect bundle $\delta_{\mathrm{Cantor}}$ contains the computed strictness, no-smuggling, stability, descent and audit defects of the promotion-bridge schema and the typed pressure-gap consequence defect of Subsubsection 13.3.6. Citation records for the Cantor saturation, $4\leftarrow 5$ forcing and macro defects are attached to $T_1$ and referenced by $L_{\mathrm{Cantor}}$; they feed no gate.

### 13.3.5 Strictness Witness

The strictness witness is the nonfactorization

$$
\pi_1\not\factor\pi_0\quad\text{on}\quad W,
$$

equivalently,

$$
\exists\,x,x'\in W:\;\pi_0(x)=\pi_0(x')\;\land\;\pi_1(x)\neq\pi_1(x').
$$

Under the hypotheses of its strict-extension theorem on the audited shell, the Cantor paper proves that no map of sets $\phi$ from the cocycle-level objects to the packaged objects, with no regularity condition, satisfies $\pi_1=\phi\circ\pi_0$ on $\mathcal S_{\mathrm{aud}}$, where $\pi_0,\pi_1$ here denote the object maps of the Cantor paper on $\mathcal S_{\mathrm{aud}}$, whose restrictions to $W$ are the maps of Subsubsections 13.3.2–13.3.3; by Theorem 12, which holds for arbitrary sets, such a pair exists in $\mathcal S_{\mathrm{aud}}$, and $W$ is chosen to contain it; conversely, nonfactorization on $W\subseteq\mathcal S_{\mathrm{aud}}$ implies nonfactorization on $\mathcal S_{\mathrm{aud}}$, so nothing is lost by passing to $W$.

The factorization defect record is

$$
\Delta_{\mathrm{fact}}^{\mathrm{Cantor}}(\pi_0,\pi_1)\;=\;\bigl\{\,(x,x')\in W\times W\;:\;\pi_0(x)=\pi_0(x')\;\land\;\pi_1(x)\neq\pi_1(x')\,\bigr\},
$$

a finite witness set on the audited shell. The strictness gate of Subsection 10.2 returns

$$
G_{\mathrm{strict}}\;=\;\texttt{strict\_pass}\quad\Longleftrightarrow\quad\Delta_{\mathrm{fact}}^{\mathrm{Cantor}}(\pi_0,\pi_1)\;\neq\;\varnothing,
$$

so the strictness witness is the nonempty factorization defect on the audited shell. The witness is host-bound: it is a property of $\pi_0$, $\pi_1$, and $\mathcal S_{\mathrm{aud}}$, recorded under $I_{\mathrm{Cantor}}$, and not a property of $\pi_0$ and $\pi_1$ outside the shell.

### 13.3.6 Pressure-Gap Consequence Defect

The Cantor strict bridge carries a pressure-gap consequence defect

$$
\Delta_{T_0\to T_1}(s;x)\;=\;P_{T_0}(s)\;-\;\sum_{\Sigma\in\mathcal F(x)}w_{\Sigma}(x)\,P_{\Sigma}(s),
$$

with $\mathcal F(x)$ the persistent packaged-strata family at $x$, $w_{\Sigma}(x)$ the per-stratum weight, and $P_{\Sigma}(s)$ the per-stratum pressure object. The defect record is

$$
\mathsf{Def}^{\mathrm{press}}_{0\to 1}(s;x)\;=\;(\,\delta_{\mathrm{press}},\;\Omega_{\mathrm{press}},\;\Theta_{\mathrm{press}},\;\mathrm{polarity}_{\mathrm{press}},\;W_{\mathrm{press}},\;A_{\mathrm{press}},\;V_{\mathrm{press}},\;\sigma_{\mathrm{press}}\,),
$$

with $\delta_{\mathrm{press}}$ storing a certified closed rational interval enclosing $\Delta_{T_0\to T_1}(s;x)$, and the remaining fields drawn from the defect-record schema of Subsection 5.2. The activation assertion below is imported from the cited source; it is not a numerical test of the enclosure.

The pressure-gap defect is a *consequence* defect, not the strictness witness itself: it is activated when

$$
\Delta_{T_0\to T_1}(s;x)\;\not\equiv\;0
$$

holds on the audited shell or on a recorded audited witness set, and it records a quantitative pressure deficit associated with the strict bridge, without itself supplying the nonfactorization data. The fragment discipline of Subsection 13.1 forbids reading the pressure-gap defect as the strictness witness, and Subsubsection 13.3.9 records the corresponding nonclaim.

### 13.3.7 Gate Results

The bridge audit records an origin and role tag for every use of every record in $\mathsf{Use}(B)$; its strictness comparison uses the defining object maps on the common carrier and uses no independent target-layer novelty assertion. For the Cantor strict bridge, the promotion gates of Subsection 10.2 return the following verdicts under $I_{\mathrm{Cantor}}$:

| gate                        | result                |
| --------------------------- | --------------------- |
| $G_{\mathrm{suff}}$         | $\texttt{pass}$       |
| $G_{\mathrm{desc}}$         | $\texttt{not\_required}$ |
| $G_{\mathrm{stab}}$         | $\texttt{not\_required}$ |
| $G_{\mathrm{ctrl}}$         | $\texttt{pass}$       |
| $G_{\mathrm{nosmuggle}}$    | $\texttt{pass}$       |
| $G_{\mathrm{vis}}$          | $\texttt{pass}$       |
| $G_{\mathrm{audit}}$        | $\texttt{pass}$       |
| $G_{\mathrm{strict}}$       | $\texttt{strict\_pass}$ |
| $G_{\mathrm{locglob}}$      | $\texttt{not\_required}$ |

The descent gate $G_{\mathrm{desc}}$ is $\texttt{not\_required}$ because the bridge claims object-map strictness on the audited shell, not closed macro dynamics; the local-global gate $G_{\mathrm{locglob}}$ is $\texttt{not\_required}$ because the realization is bound to the shell. The stability gate $G_{\mathrm{stab}}$ is $\texttt{not\_required}$ because the bridge does not claim fixed-point targets; the fixed points of the Cantor packaging $E_{\tau,\ell}$ are cited attached data, not a claim of the bridge. The strictness gate $G_{\mathrm{strict}}$ returns $\texttt{strict\_pass}$ from the nonempty factorization defect of Subsubsection 13.3.5. The remaining gates pass under the hypotheses of Model Theorem 34, as its proof shows.

### 13.3.8 Model Theorem 34: Cantor Strict-Bridge Realization

The predicate $\mathsf{AdmCantorShell}(\mathsf{CantorShell}_{\mathrm{aud}})$ holds when: (1) $\mathcal T_0^{\mathrm{Cantor}}$ and $\mathcal T_1^{\mathrm{Cantor}}$ are admissible packages in the sense of Subsection 3.3, with the finite carrier $W$; (2) $B_{0\to1}^{\mathrm{Cantor}}$ is a record in the promotion-bridge schema of Subsection 10.1 (Subsubsection 13.3.4); (3) the factorization defect of Subsubsection 13.3.5 is recorded on $W$; (4) the gate record of Subsubsection 13.3.7 is recorded; (5) the audit record $A$ is admissible under $I_{\mathrm{Cantor}}$ and passes $\mathsf{AuditPolicy}_{I_{\mathrm{Cantor}}}$; (6) the nonclaim register $\mathcal N_{\mathrm{Cantor}}$ of Subsubsection 13.3.9, containing the coverage nonclaims of Subsubsection 13.6.2, is recorded, and $\mathsf{SourcePolicy}_{I_{\mathrm{Cantor}}}$ admits the source records of $W$, $T_0$ and $T_1$; and (7) the source record of $W$ lists, for each $x\in W$, a finite identifier of the shell state $x$ fixed by the cited Cantor paper and the values $\pi_0(x),\pi_1(x)$ as defined in the Cantor paper, and $A_{\mathrm{Cantor}}$ checks the recorded labels against these cited values.

\begin{claimtheorem}{Model Theorem 34 (Cantor Strict-Bridge Realization)}
Suppose the Cantor realization object is admissible:

$$
\mathsf{AdmCantorShell}\bigl(\mathsf{CantorShell}_{\mathrm{aud}}\bigr)
$$

holds, the strictness witness of Subsubsection 13.3.5 records a nonempty factorization defect on $W$, $\mathsf{Use}(B^{\mathrm{Cantor}}_{0\to1})\subseteq\mathsf{Visible}_{I_{\mathrm{Cantor}}}$, $\mathsf{Suppressed}_{I_{\mathrm{Cantor}}}=\varnothing$, $\mathsf H_{\mathrm{CantorShell}}\in\mathsf{Hosts}_{I_{\mathrm{Cantor}}}$, $\texttt{promotion}\in\mathsf{ClaimTypes}_{I_{\mathrm{Cantor}}}$, $\mathsf{Ver}$ and both level tags of $\lambda_{\mathrm{Cantor}}$ lie in $\mathsf{Levels}_{I_{\mathrm{Cantor}}}$, and $\mathsf{AdmProfile}(\lambda_{\mathrm{Cantor}},I_{\mathrm{Cantor}},\mathcal T^{\mathrm{Cantor}}_j)$ for $j=0,1$, the audit record $A_{\mathrm{Cantor}}$ passes $\mathsf{AuditPolicy}_{I_{\mathrm{Cantor}}}$, and the no-smuggling defect of $B_{0\to1}^{\mathrm{Cantor}}$ (Subsubsection 5.4.2) is empty. Then the gate record of Subsubsection 13.3.7 holds, and

$$
\mathsf{CantorShell}_{\mathrm{aud}}\;\models\;\mathbf{StrictBridge}_{0\to 1}^{\mathrm{audited\ shell}}.
$$

In particular, the bridge promotion under $\mathcal T_0^{\mathrm{Cantor}}$ classifies as $\texttt{strict}$:

$$
\Gamma\,;\;\mathcal T_0^{\mathrm{Cantor}}\,;\;I_{\mathrm{Cantor}}\;\vdash\;\mathrm{Promote}\bigl(B_{0\to 1}^{\mathrm{Cantor}}\bigr)\;:\;\texttt{strict}.
$$

Moreover, the defect hypothesis can be met whenever the hypotheses of the cited strict-extension theorem hold (Subsubsection 13.3.5): that theorem gives nonfactorization on $\mathcal S_{\mathrm{aud}}$, so there are $x,x'\in\mathcal S_{\mathrm{aud}}$ with $\pi_0(x)=\pi_0(x')$ and $\pi_1(x)\neq\pi_1(x')$, and any finite $W\subseteq\mathcal S_{\mathrm{aud}}$ containing $x$ and $x'$, for example $W=\{x,x'\}$, has $(x,x')\in\Delta_{\mathrm{fact}}^{\mathrm{Cantor}}(\pi_0,\pi_1)$. Take $W=\{x,x'\}$ and write $o:=\pi_0(x)=\pi_0(x')$, $u:=\pi_1(x)$ and $v:=\pi_1(x')$, so $u\ne v$; record $\mathcal O_0=\{o\}$, $\mathcal O_1=\{u,v\}$, and $\Sigma_{\pi_k}$, $E_{\pi_k}$ as in Subsubsections 13.3.2–13.3.3. Give every record of this construction (the packages, their source, audit and nonclaim records, the source record of $W$, and the bridge with its threshold, audit, defect and gate records) host tag $\mathsf H_{\mathrm{CantorShell}}$ and level tag $\mathsf{Ver}$, and give the packages $\texttt{committed\_state}$ source records citing the Cantor paper, and give $W$ one $\texttt{committed\_state}$ source record citing the nonfactorization theorem and naming $x,x'$ as its witness pair. Make every field visible, let the audit record's check rules replay the comparisons of these finite labels, and tag every record of $\mathsf{Use}(B)$ $\texttt{other}/\texttt{other}$, except the table of $\pi_1$ ($\texttt{target}/\texttt{novelty}$, which kind 1 exempts); the source record of $W$ is $\texttt{other}/\texttt{other}$, since the theorem only selects $W$ and the strictness comparison recomputes $\Delta_{\mathrm{fact}}$ from the labels $o,u,v$; the six no-smuggling tests are then empty by inspection. Then the object satisfies $\mathsf{AdmCantorShell}$ and the remaining hypotheses. For this, record the bridge in its expanded form $(\mathrm{id},\mathcal T_0,\mathcal T_1,S=W,O_0,O_1,\pi_0,\pi_1,L,V,\Theta,A,\delta,\mathsf{GateResults},\mathcal N,\mathsf H_{\mathrm{CantorShell}},\lambda_{\mathrm{Cantor}})$ with $\lambda_{\mathrm{Cantor}}=(\mathsf{Ver},\mathsf{Ver},\texttt{fine},\texttt{structural},\texttt{visibility},\texttt{default},\texttt{local})$, and give $I_{\mathrm{Cantor}}$ the claim types $\{\texttt{promotion}\}$, the mode $\mathsf{ModePolicy}(\texttt{promotion})=\texttt{default}$, the entry $(\texttt{fine},\texttt{structural},\texttt{local},\mathsf H_{\mathrm{CantorShell}})\in\mathsf{Compat}_{I_{\mathrm{Cantor}}}$, check rules recomputing $\pi_0$ and $\pi_1$ on $W$ and $\Delta_{\mathrm{fact}}$, exact thresholds, $\mathsf{Hosts}_{I_{\mathrm{Cantor}}}=\{\mathsf H_{\mathrm{CantorShell}}\}$ and $\mathsf{Levels}_{I_{\mathrm{Cantor}}}=\{\mathsf{Ver}\}$, a bridge policy admitting the visibility type, and source and evidence policies admitting $\texttt{committed\_state}$, as for $I_{\mathrm{prom}}$ in Subsubsection 10.6.1; its level is $\mathsf{Ver}$, its strengths are $\{\texttt{weak}\}$ with every admitted pair and claim type sent to $\texttt{weak}$, its audit policy requires replay of every recorded check result under its check rules, $\mathsf{ProvisionalTypes}_{I_{\mathrm{Cantor}}}=\varnothing$, and its nonclaim record is $\mathcal N_{\mathrm{Cantor}}$. With these data, the bridge has the two-point object-map pattern of Theorem 22, with its witness pair supplied by the cited Cantor theorem. The strictness input is the cited theorem; the calculus checks only the finite record built on it.
\end{claimtheorem}

\begin{proof}
By Subsubsection 13.3.4, $B_{0\to 1}^{\mathrm{Cantor}}$ is a finite typed strict-bridge record in the promotion-bridge schema of Subsection 10.1. Subsubsection 13.3.5 records that the factorization defect $\Delta_{\mathrm{fact}}^{\mathrm{Cantor}}$ is nonempty on $W$, so $G_{\mathrm{strict}}=\texttt{strict\_pass}$. The remaining gates are computed as follows. $G_{\mathrm{suff}}$ passes by clauses (1) and (2) of $\mathsf{AdmCantorShell}$ and the agreement of the recorded defect-fed gate values with those computed here, and of the required marks with $\Theta_{\mathrm{Cantor}}=\{\Theta_{\mathrm{strict}}\}$. $G_{\mathrm{vis}}$ passes because $\mathsf{Suppressed}_{I_{\mathrm{Cantor}}}=\varnothing$ and every field is visible. $G_{\mathrm{audit}}$ passes because $A_{\mathrm{Cantor}}$ passes $\mathsf{AuditPolicy}_{I_{\mathrm{Cantor}}}$. $G_{\mathrm{nosmuggle}}$ passes because its defect is empty, and so does $G_{\mathrm{ctrl}}$, whose failure is the first violation kind of that defect. $G_{\mathrm{desc}}$, $G_{\mathrm{stab}}$ and $G_{\mathrm{locglob}}$ are $\texttt{not\_required}$, since the bridge claims neither closed macro dynamics, nor fixed-point targets, nor a local-to-global packaging. The row $\texttt{outside\_scope}$ does not apply: $h_B=\mathsf H_{\mathrm{CantorShell}}\in\mathsf{Hosts}_{I_{\mathrm{Cantor}}}$, the level tags of $\lambda_{\mathrm{Cantor}}$ and $L_{\mathrm{Cantor}}$ lie in $\mathsf{Levels}_{I_{\mathrm{Cantor}}}$, and $\mathsf{Use}(B)\subseteq\mathsf{Visible}_{I_{\mathrm{Cantor}}}\subseteq\mathsf{Scope}_{I_{\mathrm{Cantor}}}$. The promotion classifier of Subsubsection 5.6.4, applied with the gate record of Subsubsection 13.3.7, returns $\mathrm{Promote}(B_{0\to 1}^{\mathrm{Cantor}}):\texttt{strict}$. This is the status the realization records for the bridge, so clause 7 of Subsubsection 13.1.1 holds. Clause 1 holds because the components of the $0\to1$ fragment are the fields of $B_{0\to1}^{\mathrm{Cantor}}$; clause 2 by the admissible audit record $A$; clause 3 by clause (6) of $\mathsf{AdmCantorShell}$; clause 4 because every field is visible; and clause 5 because $\mathcal N_{\mathrm{Cantor}}$ contains the coverage nonclaims; the realized fragment contains no directed cell, so clause 6 concerns only the typed bridge record of Subsubsection 13.3.4. By the realization-map convention of Subsubsection 13.1.1, the model-realization claim therefore receives the model-grade verdict $\texttt{model\_realization}$ on the declared structure $\mathbf{StrictBridge}_{0\to 1}^{\mathrm{audited\ shell}}$.
\end{proof}

### 13.3.9 Cantor Nonclaims

The Cantor nonclaim register $\mathcal N_{\mathrm{Cantor}}$ contains:

1. The realization is scoped to the audited Cantor shell $\mathcal S_{\mathrm{aud}}$; it is not a shell-general theorem and does not assert a strict-bridge passage outside the shell.
2. There is no shell-general strict-bridge theorem; extending the realization beyond $\mathcal S_{\mathrm{aud}}$ requires a separately admissible bridge.
3. There is no broader external-class theorem; the realization does not assert structural facts about external classes of theories unless an admissible inter-theory bridge is supplied.
4. Strictness does not imply macro closure: the strictness witness of Subsubsection 13.3.5 is object-map nonfactorization, not closure of macro dynamics.
5. Strictness does not imply drive: the realization does not supply a $\mathrm{P6}_{\mathrm{drive}}$ assertion in the sense of Section 8 without a separately admissible drive bridge.
6. The pressure-gap consequence defect of Subsubsection 13.3.6 is not a Kullback–Leibler closure deficit unless an admissible bridge to the KL closure-deficit framework is recorded.
7. The pressure-gap defect is not the strictness witness; it is recorded alongside the witness; its values are cited from \citet{Tsiokos2026Cantor}, and this paper does not derive it from non-factorization.
8. The pressure-gap functional $\Delta_{T_0\to T_1}$ is a conditional pressure disintegration on the persistent strata family $\mathcal F$, and is not a direct stratumwise root separation.
9. Cantor is a model realization/application, not a universal strict-extension theory.
10. The target completion $T_1$ is not merely repeated application of one fixed idempotent completion; it is the packaged completion of Subsubsection 13.3.3. The register also contains the three coverage nonclaims of Subsubsection 13.6.2.

The register $\mathcal N_{\mathrm{Cantor}}$ is finite, recorded in $\mathsf{CantorShell}_{\mathrm{aud}}$, and is part of the admissibility predicate $\mathsf{AdmCantorShell}$.

## 13.4 Graph/Cohomology Realization

This subsection records the graph/cohomology realization sheet $\mathsf{CohGraph}_{\mathrm{fin}}$ and connects the cohomology theorems of Section 8 to the model-realization convention of Subsection 13.1. The realization is host-bound to the finite graph/cohomology host and fragment-scoped to the drive-support fragment $P_2/P_6^{H^1}\text{-drive}/P_3\text{-separation}$.

### 13.4.1 Host

The graph/cohomology realization name is $\mathsf{CohGraph}_{\mathrm{fin}}$. Its host is the finite graph/cohomology context $\mathsf H_{\mathrm{graph}}$, with realization object

$$
\mathsf{CohGraph}_{\mathrm{fin}}\;=\;(\,G,\;C^{0}(G;k),\;C^{1}(G;k),\;d,\;H^{1}(G;k),\;\mathsf{Cycles}(G),\;a,\;\mathsf{Gate},\;A,\;V,\;\mathcal N\,),
$$

with components:

- $G=(V,E)$, a finite support graph (finite vertex set $V$ and finite edge set $E$);
- $C^{0}(G;k)$ and $C^{1}(G;k)$, the finite-dimensional $0$- and $1$-cochain spaces over the coefficient field or declared free coefficient ring $k$ of Subsubsection 8.1.1;
- $d:C^{0}(G;k)\to C^{1}(G;k)$, the coboundary operator;
- $H^{1}(G;k)$, the first cohomology group of $G$ with coefficients in $k$;
- $\mathsf{Cycles}(G)=Z_1(G;k)$, the cycle space of $G$, a free $k$-module of rank $\beta_1(G)$ with the finite basis of fundamental cycles of a declared spanning forest (each $z\in Z_1$ equals $\sum_{e\notin T}z(e)\gamma_e$, since the difference is a cycle supported on the forest $T$ and vanishes as in the proof of Theorem 15; the $\gamma_e$ are independent, $e$ lying only in $\gamma_e$);
- $a\in C^{1}(G;k)$, the affinity/drive cochain assigning a finite scalar to each oriented edge of $G$;
- $\mathsf{Gate}$, a finite typed record of admissible edge or support deletions/restrictions $G\rightsquigarrow G'$;
- $A$ and $V$, the host audit and visibility records;
- $\mathcal N$, the cohomology nonclaim register.

The host instrument is $I_{\mathrm{graph}}$, an admissible instrument under which all cohomology and gating data are audited. The realization object is admissible, written $\mathsf{AdmCohGraph}(\mathsf{CohGraph}_{\mathrm{fin}})$, when $G$, $a$, $\mathsf{Gate}$, $A$, $V$ and $\mathcal N$ are finite records, $C^0(G;k)$, $C^1(G;k)$, $H^1(G;k)$ and $\mathsf{Cycles}(G)$ are recorded by declared finite bases (vertices, edges, fundamental cycles; $H^1(G;k)$ through the isomorphism $H^1(G;k)\cong k^{\beta_1(G)}$ of Theorem 17), and $A$ records the verifications of the cochain spaces, the coboundary, the cycle space, the cohomology, and the affinity cochain, each of these verifications passes, and every assigned component's audit is replayed under $I_{\mathrm{graph}}$ with audit defect $\texttt{audit\_passes}$.

### 13.4.2 Realized Fragment

The graph/cohomology realization realizes the $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ fragment

$$
\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{\,P_{2}/P_{6}^{H^{1}}\text{-drive}/P_{3}\text{-separation}},
$$

with realization map

| primitive                     | cohomology realization                                                       |
| ----------------------------- | ---------------------------------------------------------------------------- |
| $P_{2}$                       | support gating / edge deletion / cycle-rank capacity                         |
| $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ | cohomological drive certificate $[a]\neq 0$                            |
| $P_{6}$ audit face            | audit of cochains, cycles, source-of-truth, and visibility                   |
| $P_{3}$                       | optional route/holonomy witness, kept separate from drive                    |
| $P_{4}$                       | optional local/global cover or gluing of cochains (out of core scope)         |
| $P_{5}$                       | optional quotient/support package of graph state (out of core scope)          |

The core sheet of the realization focuses on $P_{2}$ and $\mathrm{P6}_{\mathrm{drive}}^{H^1}$; the $P_{4}$ and $P_{5}$ assignments above are optional extensions, recorded for completeness but not part of the core fragment, and the $P_{3}$ separation is enforced as a nonclaim of Subsubsection 13.4.4.

### 13.4.3 Drive and No-Drive Certificates

The cohomological drive certificate is the finite typed record

$$
\kappa_{6}^{\mathrm{drive}}(a)\;:\;[a]\neq 0\;\in\;H^{1}(G;k),
$$

equivalent, by Theorem 17, to the existence of a cycle integral witness:

$$
[a]\;\neq\;0\quad\Longleftrightarrow\quad\exists\,\gamma\in\mathsf{Cycles}(G):\;\oint_{\gamma}a\;\neq\;0.
$$

The drive certificate is a $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ record in the sense of Section 8, distinct from a generic $P_{6}$ audit record: it records that the affinity cochain $a$ has a nonzero cohomology class, equivalently a nonzero cycle integral on at least one cycle.

Each of the following finite records, with the audit and source records of Subsubsection 8.1.2, yields the no-drive certificate of that subsubsection; the first two concern the cochain $a$, the last two the graph $G$ and hence every $a\in C^{1}(G;k)$:

$$
[a]\;=\;0,\qquad a\;=\;d\phi\;\;\text{for some}\;\phi\in C^{0}(G;k),\qquad H^{1}(G;k)\;=\;0,\qquad\beta_{1}(G)\;=\;0.
$$

The four records are connected by finite implications recorded in Section 8: $a=d\phi\Rightarrow\oint_{\gamma}a=0$ for every cycle $\gamma$; $\beta_{1}(G)=0\Rightarrow H^{1}(G;k)=0$; and $H^{1}(G;k)=0\Rightarrow[a]=0$ for every $a\in C^{1}(G;k)$. The gating realization

$$
G\;=\;(V,E)\;\rightsquigarrow\;G'\;=\;(V',E')
$$

records a $P_{2}$ support restriction with cycle-rank loss defect

$$
\delta_{2}^{\mathrm{cycle}}(G,G')\;=\;\beta_{1}(G)\;-\;\beta_{1}(G')
$$

and forest threshold $\Theta_{2}^{\mathrm{forest}}:\beta_{1}(G')=0$. When the gate sends $G$ to a forest $G'$, the consequence $H^{1}(G';k)=0$ records the absence of any cohomological drive certificate on $G'$: by Theorem 18, no certificate $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ exists on $G'$.

The cohomology theorems of Section 8 — forest no-drive ($\beta_{1}(G)=0\Rightarrow H^{1}(G;k)=0$), exact-form null-drive ($a=d\phi\Rightarrow\oint_{\gamma}a=0$), nonzero-affinity equivalence ($[a]\neq 0\iff\exists\gamma:\oint_{\gamma}a\neq 0$), and gating-affinity suppression (gating to a forest kills $\mathrm{P6}_{\mathrm{drive}}^{H^1}$) — are recorded under the realization-map convention as the host-bound model-grade record of the drive-support fragment. Their theorem-grade status is preserved from Section 8; the model-realization convention adds the host-bound record under $\mathsf H_{\mathrm{graph}}$ and $I_{\mathrm{graph}}$, with verdict

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;\mathsf{CohGraph}_{\mathrm{fin}}\;\models\;\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{\,P_{2}/P_{6}^{H^{1}}\text{-drive}/P_{3}\text{-separation}}\;:\;\texttt{model\_realization}.
$$

The realization claim is admissible when $\mathsf{AdmCohGraph}$ holds and the clauses of Subsubsection 13.1.1 are met: clause 1 by the components listed there for this fragment; clauses 2 and 4 by the audit record $A$ and the visibility record $V$; clause 3 because $\mathsf{SourcePolicy}_{I_{\mathrm{graph}}}$ admits the source records of the graph, cochain and audit records; clause 5 by $\mathcal N_{\mathrm{coh}}$, which contains the coverage nonclaims of Subsubsection 13.6.2; clause 6 by the signatures of the gate and audit records in $\mathsf{Wit}(P_2)$ and $\mathsf{Wit}(P_6)$ and of the drive or no-drive certificate record in $\mathsf{Wit}(P_6)$ (Subsubsection 3.7.4); and clause 7 vacuously, since no directed cell, pair observable or promotion bridge is realized. The cohomology theorems of Section 8 are imported as their theorem-grade $\texttt{accepted}$ verdicts.

### 13.4.4 Nonclaims

The graph/cohomology nonclaim register $\mathcal N_{\mathrm{coh}}$ contains:

1. The drive certificate $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ with $[a]\neq 0$ in $H^{1}(G;k)$ is one drive certificate family, not every possible drive notion.
2. A $P_{3}$-route/holonomy witness is not a $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ assertion in the sense of Section 8 in the absence of an admissible bridge $B_{3\to 6}^{\mathrm{drive}}$.
3. Gating to a forest kills cycle-supported drive, not all forms of activity on $G$.
4. Exact $1$-cochains $a=d\phi$ have zero cycle drive: $\oint_{\gamma}a=0$ for every cycle $\gamma$.
5. The condition $H^{1}(G;k)=0$ is a no-drive certificate for cohomological drive on $G$, and not a no-drive certificate for any other notion of activity.
6. Nonzero route holonomy on $G$ can coexist with a zero drive cochain $a$; the two are distinct records.
7. The graph/cohomology host $\mathsf H_{\mathrm{graph}}$ is finite and scoped; it is not a universal cohomological framework.
8. Cohomology does not replace the PICA, Cantor, or abstract-interpretation realizations of Subsections 13.2, 13.3, and Section 12.
9. No edge-support claim about $G$ is accepted under $I_{\mathrm{graph}}$ without the visibility and audit conditions of $V$ and $A$.
10. Positive holonomy-to-drive claims — that a positive route holonomy implies a positive drive — require an admissible drive bridge $B_{3\to 6}^{\mathrm{drive}}$ in the sense of Section 8.
11. The three coverage nonclaims of Subsubsection 13.6.2.

The register $\mathcal N_{\mathrm{coh}}$ is finite, recorded in $\mathsf{CohGraph}_{\mathrm{fin}}$, and is part of $\mathsf{AdmCohGraph}$.

## 13.5 Combined Model-Realization Matrix

This subsection collects the four realizations of Sections 12 and 13 into a single matrix, with one row per realization and one column per scoped attribute. The matrix records what each realization realizes, under what host, with what claim strength, and where the supporting record is located. It does not assert any cross-model fact beyond what the per-row realizations already record; in particular, it does not state a model-coverage theorem, in keeping with Subsection 13.6.

### 13.5.1 Rows

The rows of the combined matrix are the four model realizations of this paper:

- *PICA*: $\mathsf{PICAReal}_{\mathrm{fin}}$ of Subsection 13.2;
- *Cantor*: $\mathsf{CantorShell}_{\mathrm{aud}}$ of Subsection 13.3;
- *Abstract interpretation*: $\mathsf{AIFam}_{\mathrm{fin}}$ of Section 12;
- *Graph/cohomology*: $\mathsf{CohGraph}_{\mathrm{fin}}$ of Subsection 13.4.

### 13.5.2 Columns

The columns of the combined matrix are the per-realization attributes:

- *Host*: the host context $\mathsf H$ and instrument $I$ under which the realization claim is recorded.
- *Realized fragment*: the declared structure $\mathcal S$ realized by the model.
- *Main theorem*: the theorem-grade or model-grade theorem of the realization, with its number in this paper.
- *Blocked overclaims*: the principal nonclaims of the realization that the fragment discipline of Subsubsection 13.1.2 enforces.
- *Appendix support*: the appendix sheet that records the long-form realization data for the model.

The combined matrix is

\begingroup\footnotesize

| model                                | host / instrument                                  | realized fragment                                                                               | main theorem                                          | blocked overclaims                                                                            | appendix support                  |
| ------------------------------------ | -------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------- |
| $\mathsf{PICAReal}_{\mathrm{fin}}$  | $\mathsf H_{\mathrm{PICA}}$ / $I_{\mathrm{PICA}}$  | $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin\text{-}stoch}}{}^{\,\mathrm{cell}/\mathrm{pair}/\mathrm{prov}}$ | Model Theorem 33 (model-grade)                        | no PICA universality; no $6\times 6$ universal law; raw status is not formal status            | Appendix D.1                     |
| $\mathsf{CantorShell}_{\mathrm{aud}}$ | $\mathsf H_{\mathrm{CantorShell}}$ / $I_{\mathrm{Cantor}}$ | $\mathbf{StrictBridge}_{0\to 1}^{\mathrm{audited\ shell}}$                                       | Model Theorem 34 (model-grade)                        | no shell-general theorem; pressure-gap is consequence, not strictness witness; strictness does not imply drive | Appendix D.2                     |
| $\mathsf{AIFam}_{\mathrm{fin}}$     | $\mathsf H_{\mathrm{AI}}$ / $I_{\mathrm{AI}}$     | $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{\,P_{1}/P_{2}/P_{5}/P_{6}}$; with $P_4$ given a strict refinement; with $P_3$ given two noncommuting closures | Model Theorem 29 (model-grade)                        | no AI totality; no soundness-as-completeness; no closure-implies-soundness                     | Appendix D.3                     |
| $\mathsf{CohGraph}_{\mathrm{fin}}$  | $\mathsf H_{\mathrm{graph}}$ / $I_{\mathrm{graph}}$ | $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{\,P_{2}/P_{6}^{H^{1}}\text{-drive}/P_{3}\text{-separation}}$ | Section 8 theorem group plus CohGraph model-realization statement (model-grade) | one drive certificate family, not all drive; $P_{3}$ holonomy separated from drive            | Appendix D.4                     |

\endgroup

The four rows record the four scoped realizations recognized by the calculus in this paper. Each row is read horizontally as a host-bound, fragment-scoped record; the matrix is not read vertically as a coverage assertion, in keeping with the cross-model role-coverage observation of Subsection 13.6.

Each row corresponds to a $\models$ realization statement: Model Theorem 33 (Subsubsection 13.2.9) for PICA, Model Theorem 34 (Subsubsection 13.3.8) for Cantor, Model Theorem 29 (Subsection 12.5) for abstract interpretation, and the realization statement of Subsubsection 13.4.3 for graph/cohomology. The instrument-indexed forms of the three model theorems, with verdict $\texttt{model\_realization}$, are listed in Appendix I. The matrix collects these four claims in one place; it does not introduce a new claim. The blocked-overclaims column is a summary view of the per-realization nonclaim registers $\mathcal N_{\mathrm{PICA}}$, $\mathcal N_{\mathrm{Cantor}}$, $\mathcal N_{\mathrm{AI}}$, and $\mathcal N_{\mathrm{coh}}$, and is not a separate, free-standing nonclaim register.

## 13.6 Cross-Model Role Coverage

This subsection records the cross-model role-coverage observation: which primitives $P_{1},\ldots,P_{6}$ each realization realizes within its declared fragment, and which it does not. The observation is not a coverage theorem; the calculus does not assert that the union of the four realizations covers the six-role calculus, and Subsubsection 13.6.2 records the corresponding coverage nonclaim.

### 13.6.1 Coverage Table

The role-coverage table records, per primitive, what each realization realizes within its declared fragment:

| role                       | $\mathsf{PICAReal}_{\mathrm{fin}}$           | $\mathsf{CantorShell}_{\mathrm{aud}}$              | $\mathsf{AIFam}_{\mathrm{fin}}$                            | $\mathsf{CohGraph}_{\mathrm{fin}}$            |
| -------------------------- | -------------------------------------------- | --------------------------------------------------- | ----------------------------------------------------------- | --------------------------------------------- |
| $P_{1}$                    | descent / closure update                     | macro obstruction; cited, not realized               | sound descent $\alpha F\le_{A}F^{\sharp}\alpha$              | not primary                                   |
| $P_{2}$                    | gating / support / admissibility             | admissibility obstruction (cited, not realized)      | representability $\rho(p)=p$                                  | support gating                                |
| $P_{3}$                    | route mismatch                               | not central                                          | noncommuting closures $\Delta_3^{\mathrm{comp}}(\rho_k,\rho_\ell)$, when two closures fail to commute           | separated from drive                          |
| $P_{4}$                    | refinement / staging                         | $P_{4}\!\leftarrow\!P_{5}$ completion-packaging (cited, not realized) | refinement $A_{k}\rightsquigarrow A_{\ell}$                    | optional local/global cover                   |
| $P_{5}$                    | package / completion                         | completion-packaged objects                          | closure / packaging $\rho=\gamma\alpha$                        | optional graph package                         |
| $P_{6}$                    | audit / provenance                           | audit of shell bridge                                | audit of maps and soundness                                    | drive certificate $[a]\neq 0$ and audit         |

A cell of the table records what the column's realization carries for the row's primitive *within its declared fragment*. The phrase "not primary" records that the primitive is not part of the realization's core declared fragment. For $\mathsf{PICAReal}_{\mathrm{fin}}$ the entries are the actor-update sorts of Subsubsection 13.2.3, and for $\mathsf{CantorShell}_{\mathrm{aud}}$ records or citations of the bridge; neither builds role-channel records classified $\texttt{active\_projection}$, so these columns are not role-fragment realizations in the sense of Subsubsection 13.1.1, unlike the $\mathsf{AIFam}_{\mathrm{fin}}$ column.

The table reads horizontally and vertically only as a record of per-cell facts; it does not assert any cross-column equivalence of realizations of the same primitive, and it does not assert any aggregation across columns.

### 13.6.2 Coverage Nonclaim

The cross-model role-coverage observation does not, by itself, support a model-coverage theorem for $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. The framework records the following coverage nonclaim:

- *No model-coverage theorem.* The calculus does not assert that the four realizations together realize the whole calculus. Each cell of the table records one realization's datum for one role, within that realization's declared fragment; the union of the cells is not lifted to a coverage statement.

- *No cross-model identity.* Two cells in the same row carrying entries for the same primitive $P_{i}$ are not identified: the PICA realization of $P_{6}$ as audit/provenance and the cohomology realization of $P_{6}$ as a drive certificate are distinct realizations of distinct facets of the audit role, and the matrix does not assert their identity. Cross-model identification of any per-primitive realization requires an admissible instrument-transfer bridge of Subsection 11.9.

- *Realization is not theorem grade.* The coverage table is a model-grade summary view. The $\texttt{accepted}$ verdicts on theorem-grade claims of the calculus are recorded in Sections 6, 7, 8, 10, and 11; they are not displaced or summarized by the coverage table.

The coverage nonclaim is an instance of the fragment discipline of Subsubsection 13.1.2 and the model-realization nonclaim of Subsection 2.4: the calculus records the per-row $\texttt{model\_realization}$ verdicts of Subsection 13.5, and does not promote them, jointly or severally, to a coverage statement about $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.
