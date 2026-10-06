# Appendix A. Full Definitions

This appendix records the long-form definitions and tables of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$, supplementing the body of the paper. Subsection A.1 records the full domain tuple. Subsection A.2 records the full primitive witness table. Subsection A.3 records the full primitive update table. Subsection A.4 records the full profile grammar and admissibility table. Subsection A.5 records the full status-family tables. Subsection A.6 records the full primitive and promotion defect tables. Each subsection collects, in one place, definitions made in the body: A.1 the tuple of Subsubsection 3.1.1, A.2 and A.3 the tables of Subsubsections 3.7.4 and 3.7.5, A.4 the profiles of Subsection 3.6, A.5 the status sets of Sections 4 and 5, and A.6 the defect schemas of Subsections 5.2 through 5.4. The body's definition is the reference.

## A.1 Full Domain Tuple

The full domain tuple of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is the nineteen-component finite typed record displayed in Subsubsection 3.1.1, with components:

- $\mathsf{Host}$, the finite and scoped host inventory, recording finite carriers, finite maps, finite records, finite relations, finite diagrams, finite graphs, and finite audit records (Subsection 2.1);
- $\mathsf{Cont}$, the finite content set whose records may be visible, suppressed, outside-scope, or unknown under an instrument (Subsections 3.2 and 3.5);
- $\mathbb P=\{P_{1},P_{2},P_{3},P_{4},P_{5},P_{6}\}$, the finite primitive labels with stable role glosses (Subsection 2.2);
- $\mathsf{Lev}$, the finite level set $\{\mathsf{Beh},\mathsf{Ver},\mathsf{Str}\}$ used by the calculus (Subsubsection 2.2.3);
- $\mathsf{Instr}$, the finite class of instrument records, with components introduced in Subsection 3.4 and used in the claim semantics of Subsection 11.1;
- $\mathsf{Pkg}$, the finite class of theory packages with components $(Z,f,\Sigma_{f},E,\mathcal A)$ (Subsection 3.3);
- $\mathsf{Prof}$, the finite typed profile family $\lambda$ with admissibility predicates (Subsection 3.6);
- $\mathsf{Wit}$, the finite typed witness family for primitive informants (Subsection 3.7 and Table A.2);
- $\mathsf{Upd}$, the finite typed update family for primitive actors (Subsection 3.7 and Table A.3);
- $\mathsf{Def}$, the finite typed defect family with per-component schemas (Subsections 5.2 through 5.5 and Table A.6);
- $\mathsf{Judg}$, the finite typed judgment family — role-channel, directed-cell, pair-observable, promotion, dependency, instrument-indexed claim and model-realization judgments; gate and square records are classified by $\mathrm{GateStatus}$ and $\mathrm{SqStatus}$ but are not judgment forms — with per-judgment admissibility predicates (Subsections 4.2 through 4.7, 10.2, 11.1 and 14.1, and Subsubsection 13.1.1);
- $\mathsf{Status}$, the seven finite status families, with their family-specific classifier and priority rules where defined (Subsection 5.1 and Table A.5);
- $\mathsf{Gate}$, the finite typed gate family — the eight promotion gates, including the strictness gate, and bridge-admissibility gates (Subsection 10.2);
- $\mathsf{Dep}$, the finite typed dependency relation between content classes under an instrument (Subsection 4.6);
- $\mathsf{Audit}$, the finite typed audit family — host audit, claim audit, bridge audit, rotating-audit (Subsubsection 4.9.2 and Section 11);
- $\mathsf{Vis}$, the finite family of visibility maps and visibility bridges (Subsection 3.5);
- $\mathsf{Source}$, the finite family of source records (Subsubsection 4.9.1);
- $\mathsf{Nonclaim}$, the finite nonclaim register $\mathcal N$ (Subsection 15.2 and per-record nonclaim subfields throughout);
- $\mathsf{Real}$, the finite family of model-realization modules (Section 13).

Every strong claim under the calculus is instrument-indexed:

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\varphi\;:\;\chi,
$$

with $\chi\in\mathrm{ClaimStatus}$ as recorded in Subsubsection 5.1.5. The shorthand $I\vdash\varphi(\mathcal T)$ abbreviates $\Gamma;\mathcal T;I\vdash\varphi:\texttt{accepted}$ under the acceptance rule of Subsubsection 11.1.3 and never abbreviates instrument-free truth.

The domain is *finite*: every component is finite, every admissibility predicate is a finite check on finite records, decidable when numerical fields have decidable equality and order and threshold data are computable (Theorem 3), relative to the conditions the instance declares (Subsubsection 5.6.6), and every claim under the domain is recorded with a finite typed instrument-indexed claim form. The design principle of the domain is that interaction is typed, statused, profile-relative, instrument-indexed, and audited — and that the primitive-pair collapse $P_{i}\ast P_{j}=P_{k}$ is rejected as a universal representation of interaction in keeping with Theorem 1 of Section 6.

## A.2 Full Primitive Witness Table

The witness families are typed by the informant primitive: $\mathsf{Wit}:\mathbb P\to\mathrm{Type}$, with $W_{j}\in\mathsf{Wit}(P_{j})$ for the informant $P_{j}$ of any directed cell $P_{i}\leftarrow P_{j}$. The full witness families per primitive are:

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\begin{center}
\begin{tabularx}{0.96\linewidth}{@{}>{\raggedright\arraybackslash}p{0.11\linewidth}>{\raggedright\arraybackslash}X@{}}
\toprule
primitive & witness family \\
\midrule
$P_{1}$ & descent success/failure, rewrite obstruction, closure deficit \\
$P_{2}$ & representability, nonrepresentability, gate, support, capacity \\
$P_{3}$ & route mismatch, holonomy, commutator, critical pair, pasting mismatch \\
$P_{4}$ & stage, refinement, filtration, cover, local/global obstruction \\
$P_{5}$ & package map, quotient, completion, idempotence, fixed point \\
$P_{6}$ & audit, provenance, source-of-truth, threshold check, nonclaim, drive certificate \\
\bottomrule
\end{tabularx}
\end{center}
\endgroup

The typed actor/informant rule of Subsection 4.3 fixes the admissibility of any directed-cell judgment: a cell record $P_{i}\leftarrow P_{j}$ is admissible only when its witness slot holds $W_{j}\in\mathsf{Wit}(P_{j})$, of a type drawn from the row of $P_{j}$ above, or a typed, audited absence marker (Subsubsection 3.7.3), and its update slot holds an actor update of a type drawn from the row of $P_{i}$ or such a marker in Subsection A.3 below. The witness families are finite for each primitive, and admissibility of the typed witness assignment is a decidable check on the finite records of the cell.

## A.3 Full Primitive Update Table

The update families are typed by the actor primitive: $\mathsf{Upd}:\mathbb P\to\mathrm{Type}$, with $U_{i}\in\mathsf{Upd}(P_{i})$ for the actor $P_{i}$ of any directed cell $P_{i}\leftarrow P_{j}$. The full update/effect families per primitive are:

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\begin{center}
\begin{tabularx}{0.96\linewidth}{@{}>{\raggedright\arraybackslash}p{0.11\linewidth}>{\raggedright\arraybackslash}X@{}}
\toprule
primitive & update/effect family \\
\midrule
$P_{1}$ & mark descent failure, install descended update, rewrite, repair \\
$P_{2}$ & mark representable/nonrepresentable, gate support, update admissibility \\
$P_{3}$ & record route mismatch, holonomy, commutator, critical pair \\
$P_{4}$ & refine lens, advance stage, record local/global obstruction \\
$P_{5}$ & install package, apply completion, record fixed points, saturate \\
$P_{6}$ & add audit, check provenance, commit source, record nonclaim, certify drive/no-drive \\
\bottomrule
\end{tabularx}
\end{center}
\endgroup

The actor update is the second half of the typed actor/informant rule of Subsection 4.3: a cell record $P_{i}\leftarrow P_{j}$ is admissible only when both $W_{j}\in\mathsf{Wit}(P_{j})$ and $U_{i}\in\mathsf{Upd}(P_{i})$ hold for the witness and update assigned to the cell. The update families are finite for each primitive, and admissibility of the typed update assignment is a decidable check on the finite records of the cell.

## A.4 Full Profile Grammar

The profile grammar of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is the finite typed record schema

$$
\lambda\;=\;(\,\ell_{i},\;\ell_{j},\;\mathsf{Scale},\;\mathsf{Regime},\;\mathsf{BridgeType},\;\mathsf{InstrumentMode},\;\mathsf{Locality}\,),
$$

with components:

| component | admissible values / role |
| --- | --- |
| $\ell_i$ | actor-side level tag in $\mathsf{Lev}=\{\mathsf{Beh},\mathsf{Ver},\mathsf{Str}\}$ |
| $\ell_j$ | informant-side level tag in $\mathsf{Lev}=\{\mathsf{Beh},\mathsf{Ver},\mathsf{Str}\}$ |
| $\mathsf{Scale}$ | finite scale label for the carrier, partition, kernel, graph, or other hosted data used by the judgment |
| $\mathsf{Regime}$ | finite regime label, such as dynamical, structural, or audit, as fixed by the surrounding judgment family |
| $\mathsf{BridgeType}$ | bridge type admitted by $\mathsf{BridgePolicy}_I$, such as visibility, level, instrument-transfer, drive, or model-realization |
| $\mathsf{InstrumentMode}$ | finite instrument-mode label, such as default, audit-only, transfer, or rotating-audit |
| $\mathsf{Locality}$ | finite locality label, such as local, semi-global, or global use of the judgment data |

When individual fields of a profile must be named, the paper writes them as $\mathsf{Scale}_{\lambda}$, $\mathsf{Regime}_{\lambda}$, $\mathsf{BridgeType}_{\lambda}$, $\mathsf{InstrumentMode}_{\lambda}$, and $\mathsf{Locality}_{\lambda}$.

Specific named profiles and their defining locations are listed in Subsubsection 3.6.1; each has the seven components displayed above.

Profile admissibility is the predicate

$$
\mathsf{AdmProfile}(\lambda,I,\mathcal T)
$$

on a profile $\lambda$, an instrument $I$, and a target package $\mathcal T$. The admissibility predicate is finite and decidable on the finite components of $\lambda$, $I$, and $\mathcal T$.

| check | admissibility condition |
| --- | --- |
| level | $\ell_i,\ell_j\in\mathsf{Lev}$ (a cross-level bridge is checked on the judgment's $L$, not here) |
| scale, regime, locality | $(\mathsf{Scale},\mathsf{Regime},\mathsf{Locality},h_{\mathcal T})\in\mathsf{Compat}_I$ |
| bridge type | $\mathsf{BridgeType}$ is admitted by $\mathsf{BridgePolicy}_I$ |
| instrument mode | $\mathsf{InstrumentMode}=\mathsf{ModePolicy}_I(\text{surrounding judgment family})$ |

Profile mutation is not allowed without an explicit profile update record: a judgment under profile $\lambda$ does not become a judgment under a different profile $\lambda'$ unless a finite typed update record for that profile change is present in $\mathsf{Cont}$ and passes the relevant visibility, source, and audit checks. This rule records the profile-relative discipline used later by the no-total-algebra theorem; it does not prove that theorem here.

## A.5 Full Status Tables

The tables below give a brief gloss of each value of the seven status families; for the directed-cell, pair and claim families the glosses restate the classifier conditions of Subsubsection 5.6.6. The value sets are displayed in Subsubsections 4.2.2, 4.3.4, 4.5.3 and 4.8.2, Subsection 4.4, and Subsubsections 5.1.6 and 5.1.7; the family-specific classifier and priority rules are fixed in Section 5 and Section 11. The rows below are not in priority order; for role, directed-cell, pair, promotion and claim records use Subsubsections 5.6.1–5.6.5, respectively, and for square records use Subsubsection 5.6.6.

### A.5.1 Role Status

| value                                  | meaning                                                                |
| -------------------------------------- | ---------------------------------------------------------------------- |
| $\texttt{active\_projection}$          | role evidence $R_i$ is present, in scope, visible and audited, $\mathsf{collapse}_i$ is false and $\Theta_i^{\mathrm{act}}$ is met; no profile is read |
| $\texttt{below\_threshold}$            | role evidence exists but does not meet activation threshold              |
| $\texttt{collapsed\_boundary\_case}$   | the role-channel record's declared Boolean field $\mathsf{collapse}_i$ is true |
| $\texttt{absent\_with\_record}$        | absence of the role/witness is audited                                   |
| $\texttt{inapplicable\_outside\_scope}$| instrument or host does not adjudicate this role                         |

The role/cell separation rule of Section 5 records that an active role channel does not imply $\texttt{action}$ on every cell carrying that role.

### A.5.2 Cell Status

| value                          | meaning                                                                                              |
| ------------------------------ | ---------------------------------------------------------------------------------------------------- |
| $\texttt{action}$              | no earlier row applies; $W$ and $U$ are present; the cell is well-formed, every defect entry meets its threshold, the visibility defect is empty, and $\delta_6^{\mathrm{audit}}=\texttt{audit\_passes}$ |
| $\texttt{implicit}$            | $\mathsf{implicitW}$: $W$ is attached to $\mathcal T$ and no threshold of $\Theta$ evaluates $W$ (a computed condition) |
| $\texttt{trivial}$             | $\mathsf{noopU}$ holds, or $\delta$ contains $\texttt{identity\_package}$ |
| $\texttt{blocked}$             | a required bridge is missing or weak, an overread, weak-bridge or unknown visibility defect is nonempty (an outside-scope use is caught by the first row), or the audit defect contains $\texttt{source\_failure}$, $\texttt{visibility\_failure}$, $\texttt{missing\_audit}$, $\texttt{failed\_audit}$ or $\texttt{nonclaim\_failure}$ |
| $\texttt{undefined\_circular}$ | $\texttt{circular\_audit}\in\delta_6^{\mathrm{audit}}$ |
| $\texttt{below\_threshold}$    | $W$ and $U$ are present and $\texttt{threshold\_failure}\in\delta_6^{\mathrm{audit}}$ |
| $\texttt{collapsed}$           | $\delta$ contains $\texttt{total\_collapse}$ or $\texttt{singleton\_collapse}$ |
| $\texttt{absent}$              | $W$ or $U$ is an audited absence marker, and $\delta_6^{\mathrm{audit}}$ contains neither $\texttt{missing\_audit}$ nor $\texttt{failed\_audit}$ |
| $\texttt{outside\_scope}$      | the host tag is not in $\mathsf{Hosts}_I$, a level tag is not in $\mathsf{Levels}_I$, or $\delta_{\mathrm{outside}}(I,C)=\mathsf{Use}(C)\cap\mathsf{Outside}_I\neq\varnothing$ |

### A.5.3 Pair Status

| value                       | meaning                                                                                                     |
| --------------------------- | ----------------------------------------------------------------------------------------------------------- |
| $\texttt{real}$             | pair observable has source-of-truth, compatibility, visibility, threshold, and audit                         |
| $\texttt{real\_provisional}$| the source is a fallback or proxy source that $\mathsf{SourcePolicy}_I$ admits for provisional use under $\mu$, the visibility defect is empty, $\mathsf{partialEvidence}$ is false, and every bridge this row needs is admissible (Subsubsection 5.6.3) |
| $\texttt{real\_duplicated}$ | the conditions of $\texttt{real}$ hold and the record carries an explicit duplicate-pair record |
| $\texttt{blocked}$          | an earlier blocking condition holds, including incompatible branches or a branch audit other than $\texttt{audit\_passes}$, or no preceding pair row applies |

The pair-realness rule of Section 5 requires $\delta_6^{\mathrm{source}}=\texttt{committed}$, or $\texttt{fallback\_admitted}$ together with an audited source-upgrade bridge; on the PICA host failure of $\mathsf{SourceOfTruthOK}$ fails the source threshold and blocks the pair.

### A.5.4 Promotion Status

The values $\texttt{strict}$ and $\texttt{non\_strict}$ are accepted-status refinements: a $\texttt{strict}$ verdict implies the accepted core and $\pi_{j+1}\not\factor\pi_{j}$, and a $\texttt{non\_strict}$ verdict implies the accepted core and $\pi_{j+1}\factor\pi_{j}$, in keeping with Theorems 19, 20, 21 of Section 10.

### A.5.5 Claim Status

| value                          | meaning                                                                       |
| ------------------------------ | ----------------------------------------------------------------------------- |
| $\texttt{accepted}$            | all required checks pass                                                       |
| $\texttt{rejected}$            | the claim is well-formed and the check rules of the instrument assign a rejection verdict |
| $\texttt{provisional}$         | $\mathsf{partialEvidence}$ is true and the claim type lies in $\mathsf{ProvisionalTypes}_I$ |
| $\texttt{blocked}$             | in scope, with an unbridged suppressed or unknown use, an evidence entry that is not an admitted source passing $\Theta_{\mathrm{source}}$, or a failed audit source or visibility check; also the final default |
| $\texttt{outside\_scope}$      | instrument or host does not adjudicate claim                                   |
| $\texttt{absent\_with\_record}$| a record referred to by the content of $\varphi$, other than an evidence source, is absent and the absence is audited (an absent evidence source gives $\texttt{blocked}$ unless the earlier $\texttt{outside\_scope}$ row applies) |
| $\texttt{below\_threshold}$    | evidence exists but threshold fails                                            |
| $\texttt{failed\_audit}$       | required audit fails                                                           |
| $\texttt{undefined\_circular}$ | the use-set of the claim reaches its own verdict reference by resolved references, or $\texttt{circular\_audit}\in\delta_6^{\mathrm{audit}}$, or the claim type is $\texttt{soundness}$ and some $\ulcorner\psi,I'\urcorner\in\mathsf{Use}(\varphi)$ has $\mathsf{Level}(I')\ge\mathsf{Level}(I)$ |

The full priority order of $\mathrm{ClaimStatus}$ is fixed in Subsubsection 5.6.5.

### A.5.6 Gate Status

The gate status set $\mathrm{GateStatus}$ and its refinement $\mathrm{StrictGateStatus}$ for the strictness gate are displayed in Subsubsection 5.1.6. The core promotion gates are $\mathsf{CoreGates}=\{G_{\mathrm{suff}},G_{\mathrm{desc}},G_{\mathrm{stab}},G_{\mathrm{ctrl}},G_{\mathrm{nosmuggle}},G_{\mathrm{vis}},G_{\mathrm{audit}}\}$, with the additional gate $G_{\mathrm{strict}}$ and the optional gate $G_{\mathrm{locglob}}$ (Subsection 10.2).

### A.5.7 Square Status

| value                          | meaning                                                                  |
| ------------------------------ | ------------------------------------------------------------------------ |
| $\texttt{exact}$               | square defect is empty and exact comparison holds                         |
| $\texttt{lax}$                 | the decoration declares an order comparison, $\mathsf{partialEvidence}_\Xi$ is false, $\delta_\Xi=\varnothing$, and equality of the two boundary composites fails |
| $\texttt{obstructed}$          | square is in scope and audited but defect is nonempty                     |
| $\texttt{blocked}$             | nonempty visibility defect, or audit defect containing $\texttt{source\_failure}$ or $\texttt{visibility\_failure}$, or no earlier row completes a per-type check |
| $\texttt{outside\_scope}$      | host/instrument does not adjudicate square                                 |
| $\texttt{failed\_audit}$       | square audit fails                                                         |
| $\texttt{undefined\_circular}$ | square support/audit is circular                                           |
| $\texttt{provisional}$         | $\mathsf{partialEvidence}_\Xi$ is true and $\mathrm{type}_\Xi\in\mathsf{ProvisionalTypes}_I$ |

The seven status families are typed-separately judgment-indexed and remain non-collapsing, in keeping with Theorem 5 of Section 6 and the status-discipline of Section 5.

## A.6 Full Defect Tables

The general defect record schema and the per-primitive and promotion defect tables are recorded below.

### A.6.1 General Defect Record Schema

A typed defect record under instrument $I$ on a target package $\mathcal T$ has the schema

$$
\mathsf{Def}_{i}^{\lambda}(\mathcal T,I)\;=\;(\,\delta_{i},\;\Omega_{i},\;\Theta_{i},\;\mathrm{polarity}_{i},\;W_{i},\;A_{i},\;V_{i},\;\sigma_{i}\,),
$$

with components:

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\begin{center}
\begin{tabularx}{0.96\linewidth}{@{}>{\raggedright\arraybackslash}p{0.12\linewidth}>{\raggedright\arraybackslash}X@{}}
\toprule
field & meaning \\
\midrule
$\delta_{i}$ & defect value (set, function, scalar, or other finite typed value) \\
$\Omega_{i}$ & value object / defect type \\
$\Theta_{i}$ & threshold or pass condition \\
$\mathrm{polarity}_{i}$ & obstruction, certificate, gap, residual, capacity loss, or other polarity tag \\
$W_{i}$ & witness, certificate, or counterexample for $\delta_{i}$ \\
$A_{i}$ & audit record for $\delta_{i}$ \\
$V_{i}$ & visibility record for $\delta_{i}$ \\
$\sigma_{i}$ & induced status or status annotation \\
\bottomrule
\end{tabularx}
\end{center}
\endgroup

The general threshold rule on a defect record is

$$
\mathsf{Eval}_{\Theta_{i}}(\delta_{i})\;\in\;\{\,\texttt{pass},\;\texttt{fail},\;\texttt{not\_checked},\;\texttt{outside\_scope}\,\}.
$$

### A.6.2 Threshold Types

The admissible thresholds form the finite typed family

$$
\Theta\;\in\;\{\,\Theta_{=0},\;\Theta_{\neq0},\;\Theta_{\le\varepsilon},\;\Theta_{\ge\varepsilon},\;\Theta_{\in S},\;\Theta_{\notin S},\;\Theta_{\mathrm{pass}},\;\Theta_{\mathrm{source}},\;\Theta_{\mathrm{bridge}},\;\Theta_{\mathrm{audit}},\;\Theta_{\mathrm{vis}}\,\},
$$

with intended readings recorded in Subsection 5.2.

### A.6.3 Primitive Defect Families

The per-primitive defect records are as follows. Each row is a finite typed instance of the general defect schema of Subsubsection A.6.1.

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\setlength{\LTleft}{0pt}
\setlength{\LTright}{0pt}
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.11\linewidth}>{\raggedright\arraybackslash}p{0.49\linewidth}>{\raggedright\arraybackslash}p{0.34\linewidth}@{}}
\toprule
primitive & defect record & threshold / status use \\
\midrule
\endhead
$P_1$ & \(\begin{aligned}[t]\delta_1^{\mathrm{split}}(q,F)&=\{\,(x,x'):\ q(x)=q(x'),\\ &\quad qF(x)\neq qF(x')\,\}\end{aligned}\) & $\Theta_1^{\mathrm{desc}}:\delta_1^{\mathrm{split}}=\varnothing$; nonempty records an active $P_1$ obstruction \\
$P_1$ & \(\begin{aligned}[t]\delta_1^{\mathrm{cand}}(q,F,F^\sharp)&=\{\,x:\ F^\sharp(q_{\mathrm{im}}(x))\\ &\quad \neq q_{\mathrm{im}}F(x)\,\}\end{aligned}\) & candidate descended-map defect \\
$P_1$ & \(\begin{aligned}[t]\mathrm{CD}_{\tau}^{\mu}(\Pi)&=I(X_t;\Pi(X_{t+\tau})\mid\Pi(X_t))\end{aligned}\) & $\Theta_1^{\mathrm{closure}}:\mathrm{CD}_{\tau}^{\mu}(\Pi)=0$ for exact closure, or $\mathrm{CD}_{\tau}^{\mu}(\Pi)\le\varepsilon$ for approximate closure \\
$P_2$ & \(\delta_2^{\mathrm{rep}}(s;f)=\begin{cases}0,&s\in\Sigma_f,\\ 1,&s\notin\Sigma_f,\end{cases}\) & in full finite-lens mode, $s\in\Sigma_f$ iff $s=f^{-1}(B)$ for some $B\subseteq\mathrm{im}(f)$; nonrepresentability is witnessed by $z,z'$ with $f(z)=f(z')$ and $\mathbf 1_s(z)\neq\mathbf 1_s(z')$ \\
$P_2$ & $\delta_2^{\mathrm{cycle}}(G,G')=\beta_1(G)-\beta_1(G')$ & drive-suppression threshold $\Theta_2^{\mathrm{forest}}:\beta_1(G')=0$ \\
$P_3$ & \(\Delta_3^{\mathrm{comp}}(E_1,E_2)=\{\,c:\ E_1E_2(c)\neq E_2E_1(c)\,\}\) & route mismatch is active when $\Delta_3^{\mathrm{comp}}\neq\varnothing$; route coherence holds when $\Delta_3^{\mathrm{comp}}=\varnothing$ \\
$P_3$ & $\delta_3^{\mathrm{hol}}(\gamma)=\{\,\phi\in\Phi:\operatorname{Hol}(\gamma)(\phi)\neq\phi\,\}$ & active when $\operatorname{Hol}(\gamma)\neq\mathrm{id}$; no $P6_{\mathrm{drive}}$ consequence follows without a drive bridge \\
$P_4$ & \(\delta_4^{\mathrm{ref}}(f_0,f_1,\rho)=\{\,z:\ f_0(z)\neq\rho f_1(z)\,\}\) & refinement passes iff $\delta_4^{\mathrm{ref}}=\varnothing$ \\
$P_4$ & \(\begin{aligned}[t]\delta_4^{\mathrm{glue}}=\{\,x\in U\cap V:\ &\mathrm{res}_{U,U\cap V}(q_U(x))\\ &\neq\mathrm{res}_{V,U\cap V}(q_V(x))\,\}\end{aligned}\) & gluing passes iff $\delta_4^{\mathrm{glue}}=\varnothing$; failed gluing may induce $\texttt{globally\_obstructed}$ \\
$P_5$ & \(\delta_5^{\mathrm{idem}}(E)=\{\,x:\ E^2(x)\neq E(x)\,\}\) & $\Theta_5^{\mathrm{idem}}:\delta_5^{\mathrm{idem}}=\varnothing$; if $U$ applies idempotent $E$ to a recorded $s\in\operatorname{im}E$, then $e_U(s)=s$, so the cell is $\texttt{trivial}$ unless an earlier row applies \\
$P_5$ & $\delta_5^{\mathrm{fix}}(E)=\{\,o:\ E(o)\neq o\,\}$; on a host with a declared norm, $\|E(o)-o\|$ is a pointwise residual & fixed-point residual; an approximate threshold uses a declared scalar residual \\
$P_5$ & package collapse values such as $\texttt{identity\_package}$, $\texttt{total\_collapse}$, and $\texttt{singleton\_collapse}$ & $\texttt{total\_collapse}$ and $\texttt{singleton\_collapse}$ induce $\texttt{collapsed}$; $\texttt{identity\_package}$ induces $\texttt{trivial}$ \\
$P_6$ & $\delta_6^{\mathrm{audit}}\subseteq\{\,\texttt{missing\_audit},\allowbreak\,\texttt{failed\_audit},\allowbreak\,\texttt{source\_failure},\allowbreak\,\texttt{visibility\_failure},\allowbreak\,\texttt{threshold\_failure},\allowbreak\,\texttt{nonclaim\_failure},\allowbreak\,\texttt{circular\_audit}\,\}$ & $\Theta_6^{\mathrm{audit}}$: the $\mathsf{CheckRules}$ field of $A$ is drawn from $\mathsf{CheckRules}_I$ and $\delta_6^{\mathrm{audit}}(A)=\varnothing$ (written $\texttt{audit\_passes}$); classifier priority decides the status when several codes occur, and circular audit induces $\texttt{undefined\_circular}$ \\
$P_6$ & $\delta_6^{\mathrm{source}}\in\{\,\texttt{committed},\allowbreak\,\texttt{fallback\_admitted},\allowbreak\,\texttt{proxy\_admitted},\allowbreak\,\texttt{dirty},\allowbreak\,\texttt{fallback\_forbidden},\allowbreak\,\texttt{unknown},\allowbreak\,\texttt{contradictory},\allowbreak\,\texttt{missing}\,\}$ & $\Theta_{\mathrm{source}}$ passes at $\texttt{committed}$, $\texttt{fallback\_admitted}$ and $\texttt{proxy\_admitted}$; real pair claims require $\texttt{committed}$, or $\texttt{fallback\_admitted}$ with an audited source-upgrade bridge \\
$P_6$ & drive certificate $\kappa_6^{\mathrm{drive}}$, kept separate from $\delta_6^{\mathrm{audit}}$ & cohomological drive uses $[a]\neq0\in H^1(G)$, equivalently $\exists\gamma:\oint_{\gamma}a\neq0$; each of $[a]=0$, $a=d\phi$, $H^1(G)=0$ and $\beta_1(G)=0$ yields the no-drive certificate of Subsubsection 8.1.2 \\
\bottomrule
\end{longtable}
\endgroup

### A.6.4 Promotion-Specific Defects

The promotion bridge $B_{j\to j+1}$ carries the promotion-specific defects recorded in Subsection 5.4, in addition to any per-primitive defect contributions of its fields.

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\begin{center}
\begin{tabularx}{0.96\linewidth}{@{}>{\raggedright\arraybackslash}p{0.44\linewidth}>{\raggedright\arraybackslash}X@{}}
\toprule
defect & threshold / status use \\
\midrule
\(\begin{aligned}[t]\Delta_{\mathrm{fact}}(\pi_j,\pi_{j+1})&=\{\,(s,s'):\pi_j(s)=\pi_j(s'),\\ &\quad \pi_{j+1}(s)\neq\pi_{j+1}(s')\,\}\end{aligned}\) & $\Theta_{\mathrm{strict}}:\Delta_{\mathrm{fact}}\neq\varnothing$ gives $G_{\mathrm{strict}}=\texttt{strict\_pass}$; $\Theta_{\mathrm{nonstrict}}:\Delta_{\mathrm{fact}}=\varnothing$ gives $G_{\mathrm{strict}}=\texttt{non\_strict\_pass}$ \\
$\delta_{\mathrm{nosmuggle}}(B)$ & contains violations: target-layer data used to prove target novelty; suppressed content used without bridge; simulation used as theorem; local evidence used as global without gluing; $P_3$-witness used as $P6_{\mathrm{drive}}$ without drive bridge; lossy summary used as exact data. Threshold $\Theta_{\mathrm{nosmuggle}}:\delta_{\mathrm{nosmuggle}}=\varnothing$; failure induces $\mathrm{Promote}(B):\texttt{failed\_no\_smuggling}$ \\
$\delta_{\mathrm{stab}}=\{o\in\mathrm{im}(\pi_{j+1}):E(\pi_{j+1}^{-1}(o))\neq\pi_{j+1}^{-1}(o)\}$, or $\{o:E(\iota o)\neq\iota o\}$ via the recorded embedding $\iota$, or its approximate residual analogue & if required and failed, induces $\mathrm{Promote}(B):\texttt{failed\_stability}$ \\
descent defect inside promotion & if macro closure is claimed, the promotion requires $G_{\mathrm{desc}}=\texttt{pass}$; failure induces $\mathrm{Promote}(B):\texttt{failed\_descent}$; if no dynamics or closure claim is made, $G_{\mathrm{desc}}=\texttt{not\_required}$ \\
\bottomrule
\end{tabularx}
\end{center}
\endgroup

Each defect record above conforms to the general schema of Subsubsection A.6.1, with the polarity tag, threshold, and induced promotion status drawn from the schemas of Subsection 5.4 and the promotion classifier of Subsubsection 5.6.4.
