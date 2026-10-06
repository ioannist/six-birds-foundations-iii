# Appendix C. Full Countermodel Atlas

This appendix records the full twelve-countermodel atlas. Sheets $\mathsf{CM}_1$ through $\mathsf{CM}_6$ summarize the constructions of Section 9 with their dependency judgments and point back to the corresponding subsections of Section 9. Sheets $\mathsf{CM}_7$ through $\mathsf{CM}_{12}$ supply the full constructions for the appendix-only countermodels referenced in Subsection 9.8.

## C.1 Atlas Convention

Each sheet uses the form fixed in Subsubsection 9.1.1: construction, supported no-go (with dependency judgment), what it blocks, what it does not block, and required positive bridge or repair where applicable. The predicates $S$ and $X$ of every displayed judgment are read by the convention *Reading the predicates* in the *Supported no-go* item of Subsubsection 9.1.1, and the relation types by the truth conditions of Subsubsection 4.6.1. The tuple form $(\mathrm{id},H,\mathsf{Data},\mathsf{ActiveClaim},\mathsf{FailedClaim},W,A,V,\mathcal N)$ of Subsubsection 9.1.1 is the underlying representation of each sheet; the prose fields below unpack that representation for the reader.

Where a sheet repeats a Section 9 entry, the sheet is brief and points back to the corresponding main-text subsection. Where the sheet is appendix-only, the construction is given in full with the data of the calculus made explicit.

## C.2 $\mathsf{CM}_1$: Active Package but No Macro Closure

Construction, blocked overclaim, and required bridge are recorded in Subsection 9.2: a finite package $q:\{a,b,c\}\to\{A,B\}$ with $q(a)=q(b)=A$, $q(c)=B$, together with $F:X\to X$ given by $F(a)=a$, $F(b)=c$, $F(c)=c$. The split-pair $(a,b)$ witnesses $\delta_1^{\mathrm{split}}(q,F)\neq\varnothing$, so no descended update through $q$ exists.

The dependency judgment is

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;P_5(q)\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;P_1(qF=F^\sharp q),
$$

supporting the no-go $P_5\not\Rightarrow P_1\text{ macro closure}$ (NC-7). The required positive bridge is the descent record $\delta_1^{\mathrm{split}}(q,F)=\varnothing$ together with the audit and visibility data of the surrounding judgment, with Theorem 7 supplying the equivalence between the empty descent defect and the existence of $F^\sharp$.

## C.3 $\mathsf{CM}_2$: Active Route / Holonomy but No Drive

Construction and blocked overclaim are recorded in Subsection 9.3: a finite cycle graph $G$ on $\mathsf H_{\mathrm{graph}}$ (for instance the triangle $0\to 1\to 2\to 0$) with active $P_3$-route data, the transport record with fiber $\{u,v\}$ whose only nonidentity edge permutation is the swap on $2\to0$, so that $\operatorname{Hol}(\gamma)$ is the swap, and the log-ratio cochain $a(x\to y)=\log\bigl(M(x,y)/M(y,x)\bigr)$ of the symmetric random walk $M(x,y)=1/2$ on $G$, which is $a=0$. Every cycle integral vanishes, so $[a]=0\in H^1(G)$ and no positive cycle-supported cohomological drive certificate is admissible on $G$ for this $a$.

The dependency judgment is

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;P_3^{\mathrm{holonomy}}\;\mathrel{\mathsf{dep}_{\texttt{requires\_bridge}}}\;\mathrm{P6}_{\mathrm{drive}}^{H^1},
$$

supporting NC-12 (no route-mismatch-implies-drive). The required positive bridge is the drive bridge $B_{3\to 6}^{\mathrm{drive}}$ in $\mathsf{BridgePolicy}_I$ that connects the route/holonomy data to a specific cochain $a$ with $[a]\neq 0$.

## C.4 $\mathsf{CM}_3$: Local Packages Fail Globally

Construction and blocked overclaim are recorded in Subsection 9.4: a finite carrier $Z=\{a,b,c\}$ with cover $U=\{a,b\}$, $V=\{b,c\}$ and overlap $U\cap V=\{b\}$, with all package targets equal to $\{0,1\}$, identity restriction maps, and local packages $q_U,q_V$ that assign incompatible values $0,1$ on the overlap $\{b\}$. The gluing defect $\delta_4^{\mathrm{glue}}$ is non-empty, with $b$ as a witness, and no global package extends both local data.

The dependency judgment is

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\bigl\{P_5(q_U),\,P_5(q_V)\bigr\}\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;P_5(q_{\mathrm{global}}),
$$

supporting NC-14 (no local-implies-global). The required positive bridge is a $P_4$-gluing bridge $B_{\mathrm{glue}}$ with $\delta_4^{\mathrm{glue}}=\varnothing$ together with a $P_6$-audit compatibility record on the overlaps.

## C.5 $\mathsf{CM}_4$: Directed Cell Active but Pair Observable Blocked

Construction and blocked overclaim are recorded in Subsection 9.5: a directed cell $\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}$ with $W_3=\mathsf{RouteMismatchWit}$, $U_6=\mathsf{AddAuditRecord}$ and audit-only profile $\lambda_{\mathrm{audit}}$, classified $\texttt{action}$ by the cell classifier of Subsubsection 5.6.2; together with a pair-observable record $\mathsf{PairObs}_{\{3,6\}}^{\mu_{\mathrm{drive}}}$ on the same primitives with profile $\mu_{\mathrm{drive}}$ asserting drive content, but with no admissible drive bridge and no admissible drive source-of-truth, classified $\texttt{blocked}$ by the pair classifier of Subsubsection 5.6.3.

The dependency judgment is

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}:\texttt{action}\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;\mathsf{PairObs}_{\{3,6\}}^{\mu_{\mathrm{drive}}}:\texttt{real},
$$

supporting NC-5 (no cell-to-pair collapse). The required positive bridge is a real or fallback source under $\mathsf{SourcePolicy}_I$ together with the drive bridge $B_{3\to 6}^{\mathrm{drive}}$ when the pair claims drive content; Theorem 5 of Section 6 records the status-family separation in theorem-grade form.

## C.6 $\mathsf{CM}_5$: Refinement Worsens Closure

Construction and blocked overclaim are recorded in Subsection 9.6: a finite carrier $X=\{a,b,c,d\}$ with coarse abstraction $q_0:X\to\{*\}$ and refinement $q_1:X\to\{A,B,C\}$ given by $q_1(a)=q_1(b)=A$, $q_1(c)=B$, $q_1(d)=C$, with $q_0$ factoring through $q_1$ via the forgetting map $r:\{A,B,C\}\to\{*\}$. The finite update $F(a)=c$, $F(b)=d$, $F(c)=c$, $F(d)=d$ descends through $q_0$ trivially but creates a $q_1$-split at $(a,b)$, so $\delta_1^{\mathrm{split}}(q_1,F)\neq\varnothing$.

The dependency judgment is

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;P_4(q_0\leadsto q_1)\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;\bigl(\delta_1^{\mathrm{split}}(q_1,F)\;\subseteq\;\delta_1^{\mathrm{split}}(q_0,F)\bigr),
$$

supporting NC-13 (no refinement-implies-improvement). A positive refinement-improvement theorem requires a $P_4$-monotonicity bridge with explicit hypotheses on the refinement, the update, and the closure functional, not asserted in this paper (Subsubsection 9.6.5).

## C.7 $\mathsf{CM}_6$: Same-Level Self-Audit Circularity

Construction and blocked overclaim are recorded in Subsection 9.7: a finite admissible instrument $I_0$ under package $\mathcal T_0$ asked to certify $\mathrm{Sound}(I_0)$ at the same level; the instance contains the audit record $A_0$ of Subsubsection 9.7.1. Two cases arise — outside-scope when the claim's host tag is not in $\mathsf{Hosts}_{I_0}$, a level tag of its profile is not in $\mathsf{Levels}_{I_0}$, $\texttt{soundness}\notin\mathsf{ClaimTypes}(I_0)$ or $\mathsf{Use}(\mathrm{Sound}(I_0))\not\subseteq\mathsf{Scope}_{I_0}$, and undefined-circular (or a status of higher priority) when none of these four conditions holds and the use-set of $\mathrm{Sound}(I_0)$ contains the verdict reference $\ulcorner\mathrm{Sound}(I_0),I_0\urcorner$ — and in neither case does the claim classifier accept $\mathrm{Sound}(I_0)$ under $I_0$ at the same level.

The dependency judgment is

$$
\Gamma\,;\;\mathsf H_{\mathrm{instr}}\,;\;I_{\mathrm{instr}}\;\vdash\;I_0\text{ audits }\mathcal T_0\;\mathrel{\mathsf{dep}_{\texttt{blocks}}}\;\bigl(I_0\vdash\mathrm{Sound}(I_0):\texttt{accepted}\bigr),
$$

supporting NC-16 (no same-level complete self-certification). The required positive repair is a level shift via a higher instrument $I_1$ that audits $I_0$ through an admissible audit bridge $B^{\mathrm{audit}}_{0\to 1}$; Theorem 24 of Section 11 states the classifier routing of the same-level self-soundness claim, and Theorem 25 records the rotating-audit theorem with NC-17 (no rotating-audit finality).

## C.8 $\mathsf{CM}_7$: Same Primitive Pair, Different Statuses

### C.8.1 Construction

Take the primitive pair $P_6\leftarrow P_3$ in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.

**Cell 1 — audit-only profile $\lambda_{\mathrm{audit}}$.** Take witness $W_3=\mathsf{RouteMismatchWit}\in\mathsf{Wit}(P_3)$ and update $U_6=\mathsf{AddAuditRecord}\in\mathsf{Upd}(P_6)$, with the witness visible and audited under the surrounding instrument $I$ and a profile $\lambda_{\mathrm{audit}}$ that records the audit-only instrument mode for an audit update. The cell

$$
\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}\;=\;(P_6\leftarrow P_3,\,W_3,\,U_6,\,L,\,V,\,\Theta_{\ge1},\,A,\,\delta=\varnothing)
$$

is well-formed, and the classifier of Subsubsection 5.6.2 assigns

$$
\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}\;:\;\texttt{action}.
$$

**Cell 2 — drive-certification profile.** Use the same primitive pair $P_6\leftarrow P_3$, but with update $U_6'=\mathsf{CertifyDrive}\in\mathsf{Upd}(P_6)$ and a profile $\lambda_{\mathrm{drive}}$ that requires a drive bridge. Suppose the only member of $\mathcal L$ bridging the drive datum is a registered drive bridge $L_{\mathrm{drive}}$ whose strength is below that required by $\lambda_{\mathrm{drive}}$, so that $\delta_{\mathrm{weakbridge}}$ is nonempty (the record is written out in Subsubsection 6.1.1). The cell record

$$
\mathsf{Cell}_{63}^{\lambda_{\mathrm{drive}}}
$$

fails the bridge check; its classifier verdict is

$$
\mathsf{Cell}_{63}^{\lambda_{\mathrm{drive}}}\;:\;\texttt{blocked}.
$$

The same primitive pair $(P_6,P_3)$ thus carries two cell records with different profile, update, and bridge requirements, and these records receive distinct cell statuses.

### C.8.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}:\texttt{action}\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;\mathsf{Cell}_{63}^{\lambda_{\mathrm{drive}}}:\texttt{action},
$$

witnessed by the instance of Theorem 1; hence cell status does not factor through the primitive pair: there is no map $g:\mathbb P\times\mathbb P\to\mathrm{CellStatus}$ recovering both verdicts from the same pair. In particular, since $d\circ *$ would be such a $g$, no total operation $*:\mathbb P\times\mathbb P\to\mathbb P$ together with a decoder $d:\mathbb P\to\mathrm{CellStatus}$ can faithfully encode typed, statused, profile-relative interaction. The construction is the working content of NC-1 and NC-3 of Subsection 15.2, and Theorem 1 of Section 6 makes the non-factorization formal.

### C.8.3 What It Blocks

The overclaim "the $6\times 6$ primitive-pair table is a universal interaction algebra" is rejected. NC-1 and NC-3 are the corresponding nonclaims.

### C.8.4 What It Does Not Block

The construction does not say cell records on $(P_6,P_3)$ are unattainable. Both are finite covered records for the directed-cell classifier; what fails is the inference from the primitive pair alone to a cell status.

### C.8.5 Required Positive Bridge

A positive cell-status claim on $(P_6,P_3)$ requires the surrounding profile, witness, update, threshold, audit, visibility, and bridge data of the cell record; the primitive pair alone is not sufficient input.

## C.9 $\mathsf{CM}_8$: Idempotent Completions Do Not Commute

### C.9.1 Construction

Take a finite three-element set $U=\{a,b,c\}$ and let $C=\mathcal P(U)$ be its finite power set on $\mathsf H_{\mathrm{fin}}$. Define two finite endomaps $E_1,E_2:C\to C$ by

$$
E_1(S)\;=\;\begin{cases}\,S\cup\{b\}, & a\in S,\\[2pt] S, & a\notin S,\end{cases}\qquad E_2(S)\;=\;\begin{cases}\,S\cup\{c\}, & b\in S,\\[2pt] S, & b\notin S.\end{cases}
$$

**Idempotence.** For $E_1$: if $a\in S$, then $E_1(S)=S\cup\{b\}$ still contains $a$, so $E_1(E_1(S))=(S\cup\{b\})\cup\{b\}=S\cup\{b\}=E_1(S)$. If $a\notin S$, then $E_1(S)=S$, hence $E_1(E_1(S))=E_1(S)$. So $E_1^2=E_1$. The argument for $E_2$ is symmetric: $E_2^2=E_2$.

**Noncommutation.** Take $S_0=\{a\}$. Then

$$
E_1\,E_2(\{a\})\;=\;E_1(\{a\})\;=\;\{a,b\},
$$

since $E_2$ leaves $\{a\}$ unchanged ($b\notin\{a\}$). On the other hand,

$$
E_2\,E_1(\{a\})\;=\;E_2(\{a,b\})\;=\;\{a,b,c\},
$$

since $E_1$ adds $b$ (because $a\in\{a\}$) and then $E_2$ adds $c$ (because $b\in\{a,b\}$). Hence $E_1E_2(\{a\})\neq E_2E_1(\{a\})$, and $\Delta_3^{\mathrm{comp}}(E_1,E_2)\neq\varnothing$ by Theorem 10.

### C.9.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\bigl(E_1^2=E_1\,\wedge\,E_2^2=E_2\bigr)\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;\bigl(E_1E_2=E_2E_1\bigr),
$$

recording that individual idempotence does not imply commutation, equivalently that $P_5$-individual exactness does not imply $P_3$-route coherence.

### C.9.3 What It Blocks

The overclaim "valid completions always commute" is rejected. NC-8 of Subsection 15.2 records the corresponding nonclaim, and Theorem 9 of Section 7 makes the noncommuting-completions result theorem-grade.

### C.9.4 What It Does Not Block

The construction does not say completions are always non-commuting, or that route coherence is unattainable. Specific pairs of idempotent completions on a finite carrier may commute — for instance, when the two maps are identical or when one of them is the identity — but commutation is not implied by individual idempotence.

### C.9.5 Required Positive Bridge

A positive commutation claim $E_1E_2=E_2E_1$ requires an explicit route-coherence record: the empty defect $\Delta_3^{\mathrm{comp}}(E_1,E_2)=\varnothing$ together with the audit and visibility data of the surrounding judgment. Theorem 10 makes the equivalence between the empty defect and commutation precise.

## C.10 $\mathsf{CM}_9$: Strict Extension Without Macro Closure

### C.10.1 Construction

Take a finite carrier $S=\{a,b,c\}$ on $\mathsf H_{\mathrm{fin}}$. Define an old object map $\pi_0:S\to O_0=\{*\}$ collapsing every element to a single value:

$$
\pi_0(a)\;=\;\pi_0(b)\;=\;\pi_0(c)\;=\;*.
$$

Define a new object map $\pi_1:S\to O_1=\{U,V\}$ with

$$
\pi_1(a)\;=\;U,\qquad \pi_1(b)\;=\;U,\qquad \pi_1(c)\;=\;V.
$$

Since $\pi_0$ collapses everything but $\pi_1$ separates $c$, there exist $s,s'\in S$ — for example $s=a$ and $s'=c$ — with $\pi_0(s)=\pi_0(s')=*$ but $\pi_1(s)=U\neq V=\pi_1(s')$. By Theorem 12, $\pi_1\not\factor\pi_0$, so the bridge is strict at the object-map level: the strictness gate $G_{\mathrm{strict}}$ records $\texttt{strict\_pass}$ from $\Delta_{\mathrm{fact}}(\pi_0,\pi_1)\neq\varnothing$.

Now define a finite update $F:S\to S$ by

$$
F(a)\;=\;a,\qquad F(b)\;=\;c,\qquad F(c)\;=\;c.
$$

Then $\pi_1(a)=\pi_1(b)=U$, but $\pi_1F(a)=\pi_1(a)=U$ and $\pi_1F(b)=\pi_1(c)=V$, so $\pi_1F(a)\neq\pi_1F(b)$. The descent defect $\delta_1^{\mathrm{split}}(\pi_1,F)$ is non-empty, with $(a,b)$ as a witness, and by Theorem 7 no descended dynamics exists for $F$ through $\pi_1$. The object map is strict, but macro closure on the target package fails.

### C.10.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{prom}}\;\vdash\;\Delta_{\mathrm{fact}}(\pi_0,\pi_1)\neq\varnothing\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;P_1(\pi_1F=F^\sharp\pi_1),
$$

recording that a strict object map does not by itself imply macro closure on the target. The bridge carrying these object maps is completed as in the instance of Theorem 22 (Subsubsection 10.6.1), with $S=\{a,b,c\}$, $O_0=\{*\}$ and $O_1=\{U,V\}$: packages $\mathcal T_k=(S,\pi_k,\Sigma_{\pi_k},\mathrm{id},\mathcal A_k)$, the instrument $I_{\mathrm{prom}}$, every field visible, and $G_{\mathrm{desc}}=\texttt{not\_required}$ because the bridge makes no closure claim. The gates pass as in Subsubsection 10.6.2, so the promotion classifier assigns $\texttt{strict}$, while $(a,b)\in\delta_1^{\mathrm{split}}(\pi_1,F)$ for the update $F$ recorded in the target instance.

### C.10.3 What It Blocks

The overclaim "strict extension automatically gives closed dynamics" is rejected. NC-10 of Subsection 15.2 records the corresponding nonclaim.

### C.10.4 What It Does Not Block

The construction does not say a strict object map is incompatible with macro closure. A different finite update $F'$ — one whose action is consistent with the fibers of $\pi_1$ — would descend through $\pi_1$ and produce an admissible descended dynamics on the target package; the construction shows only that descent is independent data from strictness.

### C.10.5 Required Positive Bridge

A positive macro-closure claim on a promotion bridge with a strict object map requires an explicit descent record: the empty defect $\delta_1^{\mathrm{split}}(\pi_1,F)=\varnothing$ recorded by the descent gate $G_{\mathrm{desc}}$ of Subsubsection 5.4.4, together with the other audit, visibility, and required gate data of the bridge.

## C.11 $\mathsf{CM}_{10}$: Strict Extension Without Drive

### C.11.1 Construction

Use the same strict object maps from $\mathsf{CM}_9$: $S=\{a,b,c\}$, $\pi_0:S\to\{*\}$ collapsing all elements, and $\pi_1:S\to\{U,V\}$ separating $c$. By Theorem 12, $\pi_1\not\factor\pi_0$, so the object map is strict.

Record in the bridge's level/lens/interface record $L$ a finite support graph $G_B$ that is a forest, for example the path

$$
a\;\text{---}\;b\;\text{---}\;c
$$

with vertex set $V(G)=S=\{a,b,c\}$, the support of the bridge's carrier, and edge set $E(G)=\{(a,b),(b,c)\}$. Then $|E(G)|=2$, $|V(G)|=3$ and $G$ is connected, so $\beta_1(G)=2-3+1=0$. By Theorem 15,

$$
H^1(G)\;=\;0,
$$

and every $1$-cochain $\omega$ on $G$ has $[\omega]=0\in H^1(G)$, so no admissible cycle-supported cohomological drive certificate $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ is available on $G$. The object map is strict, but the drive face is absent on the support graph.

### C.11.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;\Delta_{\mathrm{fact}}(\pi_0,\pi_1)\neq\varnothing\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;\mathrm{P6}_{\mathrm{drive}}^{H^1},
$$

recording that a strict object map does not by itself imply a cycle-supported cohomological drive certificate. In this instance, form a new bridge $B^{\mathrm{graph}}_{0\to1}$ from the same object-map tables as $\mathsf{CM}_9$, with both packages, the path support $a$--$b$--$c$, and the bridge tagged by $\mathsf H_{\mathrm{graph}}$. Tag both packages and the bridge with host $\mathsf H_{\mathrm{graph}}$, give the bridge the profile $\lambda_{\mathrm{prom}}$ of Subsubsection 10.6.1, and give $I_{\mathrm{graph}}$, besides $\texttt{promotion}\in\mathsf{ClaimTypes}_{I_{\mathrm{graph}}}$ and the finite source, visibility, audit and gate checks for these records, $\mathsf{Hosts}\ni\mathsf H_{\mathrm{graph}}$, $\mathsf{Levels}\ni\mathsf{Ver}$, $\mathsf{ModePolicy}(\texttt{promotion})=\texttt{default}$, $(\texttt{fine},\texttt{structural},\texttt{local},\mathsf H_{\mathrm{graph}})\in\mathsf{Compat}_{I_{\mathrm{graph}}}$, a bridge policy admitting the visibility type, and source and evidence policies admitting $\texttt{committed\_state}$ in the sense of Subsubsection 5.3.6, so that $\mathsf{AdmProfile}(\lambda_{\mathrm{prom}},I_{\mathrm{graph}},\mathcal T_j)$ holds for $j=0,1$. Recompute the gate results under $I_{\mathrm{graph}}$; the required core gates pass, $G_{\mathrm{desc}}=\texttt{not\_required}$, and the nonempty factorization defect gives $G_{\mathrm{strict}}=\texttt{strict\_pass}$. The promotion classifier therefore assigns this bridge $\texttt{strict}$.

### C.11.3 What It Blocks

The overclaim "strictness implies drive" is rejected. NC-11 of Subsection 15.2 records the corresponding nonclaim.

### C.11.4 What It Does Not Block

The construction does not say a strict object map is incompatible with drive. A different support graph with $\beta_1\ge 1$ — for example, a triangle — could carry a positive drive certificate; the construction shows only that the choice of support graph is independent data from the strictness of the object map.

### C.11.5 Required Positive Bridge

A positive drive claim on a promotion bridge with a strict object map requires an explicit drive bridge in $\mathsf{BridgePolicy}_I$ together with a support graph $G'$ on which $H^1(G')\neq 0$ and an admissible cochain $\omega$ with $[\omega]\neq 0\in H^1(G')$ (written $\omega$ here, since $a$ names a vertex of this construction). Theorem 17 makes the equivalence between $[\omega]\neq 0$ and existence of a cycle with $\oint_\gamma \omega\neq 0$ precise.

## C.12 $\mathsf{CM}_{11}$: Fallback Source Cannot Support Real Pair

### C.12.1 Construction

Take a pair-observable record $Q=\mathsf{PairObs}_{\{i,j\}}^{\mu}$ on a primitive pair $\{i,j\}$ on the host $\mathsf H_{\mathrm{PICA}}$, under a local instrument $I_{\mathrm{PICA}}$ (written $I$ below) with $(t,\texttt{full},\mu)\in\mathsf{SourcePolicy}_I$, among the five candidate tags of Subsubsection 4.9.1, exactly for $t\in\{\texttt{committed\_state},\texttt{independent\_pair\_witness}\}$, with or without entries $(\texttt{fallback},m,\mu)$.

Suppose the only available source record has type $\texttt{fallback}$:

$$
\mathrm{src}\;=\;(\mathrm{id}_{\mathrm{src}},\;\texttt{fallback},\;\mathrm{trace}_{\mathrm{src}},\;\mathrm{valid}_{\mathrm{src}}),
$$

and that the record carries no audited source-upgrade bridge admitted by $\mathsf{SourcePolicy}_I$ and $\mathsf{BridgePolicy}_I$. Assume also that the source is within its validity condition, its trace records no failed audit or threshold check, and it is not obtained through a typed source bridge. Then $\delta_6^{\mathrm{source}}$ is $\texttt{fallback\_admitted}$ if $(\texttt{fallback},m,\mu)\in\mathsf{SourcePolicy}_I$ for some mode $m$, and $\texttt{fallback\_forbidden}$ otherwise (rules 5–6 of Subsubsection 5.3.6). In the first case condition (a) of the $\texttt{real}$ row fails, so, when no condition of the first $\texttt{blocked}$ row holds, $(\texttt{fallback},\texttt{provisional},\mu)\in\mathsf{SourcePolicy}_I$ and that row's other conditions hold, the classifier assigns

$$
Q\;:\;\texttt{real\_provisional},
$$

and otherwise $\texttt{blocked}$; in the second the source threshold fails and the first $\texttt{blocked}$ row applies. In neither case is $Q$ $\texttt{real}$.

### C.12.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{PICA}}\,;\;I_{\mathrm{PICA}}\;\vdash\;\mathrm{src}:\texttt{fallback}\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;Q:\texttt{real},
$$

recording that fallback evidence does not by itself support a real pair-observable verdict.

### C.12.3 What It Blocks

The overclaim "placeholder or fallback source counts as a real pair source-of-truth" is rejected. The pair-observable source-of-truth discipline of Subsubsection 4.4.3 records the schema-level statement; this countermodel records the failure case at the dependency level.

### C.12.4 What It Does Not Block

The construction does not say fallback sources are useless. A fallback source can support $\texttt{real\_provisional}$, which is a legitimate pair-observable verdict, and, with an audited source-upgrade bridge admitted by the source and bridge policies, $\texttt{real}$. The construction shows only that a fallback source does not by itself license the strongest verdict $\texttt{real}$.

### C.12.5 Required Positive Bridge

A positive $Q:\texttt{real}$ verdict requires a real source under $\mathsf{SourcePolicy}_I$ — one of the five real-source classes from Subsubsection 4.9.1: $\texttt{committed\_state}$, $\texttt{audited\_cell\_records}$, $\texttt{independent\_pair\_witness}$, $\texttt{simulation\_trace}$, or $\texttt{ablation\_record}$, admitted by $\mu$. A fallback source can support $\texttt{real}$ only when the record carries an audited source-upgrade bridge admitted by $\mathsf{SourcePolicy}_I$ and $\mathsf{BridgePolicy}_I$; absent that bridge, the fallback source supports at most $\texttt{real\_provisional}$, or $\texttt{blocked}$ if fallback is forbidden.

## C.13 $\mathsf{CM}_{12}$: Gating Destroys Cycle-Supported Drive

### C.13.1 Construction

Take the triangle graph $G$ on $\mathsf H_{\mathrm{graph}}$ with vertex set $V(G)=\{0,1,2\}$ and oriented edge set $E(G)=\{(0,1),(1,2),(2,0)\}$. Then $|E(G)|=3$, $|V(G)|=3$, $c(G)=1$, so

$$
\beta_1(G)\;=\;3\;-\;3\;+\;1\;=\;1,
$$

and the cycle space $Z_1(G)$ is one-dimensional, spanned by the triangle cycle $\gamma=(0,1)(1,2)(2,0)$.

Choose a finite $1$-cochain $a\in C^1(G)$ with nonzero cycle integral, for example $a((0,1))=1$, $a((1,2))=0$, $a((2,0))=0$ over a free coefficient host. Then

$$
\oint_\gamma a\;=\;a((0,1))\;+\;a((1,2))\;+\;a((2,0))\;=\;1\;\neq\;0,
$$

so $[a]\neq 0\in H^1(G)$ and $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ is active on $G$ for this $a$.

Now apply a $P_2$-style gate that deletes the edge $(2,0)$: the resulting graph $G'$ has vertex set $V(G')=\{0,1,2\}$ and edge set $E(G')=\{(0,1),(1,2)\}$, that is, the path $0\to 1\to 2$. Then $|E(G')|=2$, $|V(G')|=3$, $c(G')=1$, so

$$
\beta_1(G')\;=\;2\;-\;3\;+\;1\;=\;0.
$$

By Theorem 15, $H^1(G')=0$, and by Theorem 18 no cohomological drive certificate $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ exists on $G'$. The gate has destroyed the cycle-supported drive that was active on $G$.

### C.13.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;P_2(\text{edge deletion to forest})\;\mathrel{\mathsf{dep}_{\texttt{destroys}}}\;\mathrm{P6}_{\mathrm{drive}}^{H^1},
$$

recording that $P_2$-style gating that produces a forest destroys the cycle-supported cohomological drive certificate. The universal clause of `destroys` holds by Theorem 18: every gate output $G'$ with $\beta_1(G')=0$ has $H^1(G')=0$, so no recorded cochain has a nonzero class on $G'$ (only cochains recorded on the gated graph count, Subsubsection 9.1.1).

### C.13.3 What It Blocks

The overclaim "gating only removes irrelevant support" is rejected. The gating-suppression discipline of Section 8 records the corresponding theorem (Theorem 18), and this sheet gives the finite countermodel instance: gating to a forest can destroy a previously active drive certificate.

### C.13.4 What It Does Not Block

The construction does not say all gates destroy drive. A $P_2$-style gate whose output retains nontrivial cycles ($\beta_1(G')\ge 1$) may leave drive certificates intact; the construction shows only that gates producing forests are sufficient to suppress cycle-supported cohomological drive.

### C.13.5 Required Positive Repair

A positive drive-preservation claim under gating requires that the output graph $G'$ have $\beta_1(G')\ge 1$ and that the class $[a|_{G'}]$ of the restricted cochain be nonzero in $H^1(G')$ — equivalently, by Theorem 17, that some cycle $\gamma'\in Z_1(G')$ have $\oint_{\gamma'}a\neq 0$. Without these conditions, the drive certificate is absent on $G'$.
