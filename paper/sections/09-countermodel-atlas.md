# 9. Countermodel Atlas

This section presents six of the twelve countermodels. Each countermodel is a finite explicit construction together with the no-go statement it supports, the overclaim it blocks, and any positive bridge that would have to be supplied for a positive claim. The full atlas of twelve countermodels is recorded in Appendix C; Sections 6 through 11 also refer to appendix countermodels, for example $\mathsf{CM}_7$ for Theorem 1, and $\mathsf{CM}_8$ records the instance of Theorem 9.

## 9.1 Atlas Convention

This subsection fixes the sheet form for countermodels and selects which countermodels appear in the main text. It is a schema-grade declaration, with the actual constructions in Subsections 9.2 through 9.7.

### 9.1.1 Countermodel Sheet Form

Unless a sheet lists them, its packages and instruments are completed as in Subsubsection 10.6.1: host $\mathsf H_{\mathrm{fin}}$ ($\mathsf H_{\mathrm{graph}}$ for graph data), level $\mathsf{Ver}$, every field visible, a $\texttt{committed\_state}$ source holding the tables, one audit entry recomputing them, an empty defect family and a nonclaim record; the conditions of Subsubsection 3.3.3 then hold by inspection. For every displayed dependency judgment, its judging instrument admits the claim type $\texttt{dependency}$ and the displayed host; its scope contains $\Gamma,\mathcal C,A,V,\Theta$ and their referenced records, with their level tags admitted. The sheet supplies the finite audit, source and check-rule records it uses. When a sheet borrows an instrument from another construction, it uses a fresh local copy with these additions, extending its mode and required-strength policies to $\texttt{dependency}$ and preserving its existing policies and verdicts; in particular, the local $I_{\mathrm{prom}}$ of $\mathsf{CM}_9$ admits both promotion and dependency judgments.

Each countermodel sheet contains the following five fields, in this order:

- **Construction.** A finite explicit construction on a named host, with the data of the calculus (carriers, maps, packages, profiles, witnesses, updates, defects, audit and source records) made explicit. The construction is finite at every step.
- **Supported no-go.** The dependency judgment $S\mathrel{\mathsf{dep}_r}X$ that the construction supports, in the form fixed by Subsubsection 4.6.1, with relation type $r$ drawn from the eight admissible types $\texttt{suffices}$, $\texttt{insufficient}$, $\texttt{destroys}$, $\texttt{blocks}$, $\texttt{enables}$, $\texttt{equivalent}$, $\texttt{requires\_bridge}$, and $\texttt{outside\_scope}$. *Reading the predicates.* In a sheet, except for $\texttt{destroys}$, $S$ and $X$ are read as predicates on instances containing the displayed records; for $\texttt{destroys}$, $S$ names the operation and $X$ is the predicate tested before and after it. For example, $P_5(q)$ holds when the instance contains an admissible package with lens $q$, $P_1(qF=F^\sharp q)$ when some map $F^\sharp:\mathrm{im}(q)\to\mathrm{im}(q)$ satisfies $F^\sharp q_{\mathrm{im}}=q_{\mathrm{im}}F$, with $q_{\mathrm{im}}$ the corestriction of $q$ to its image, recorded or not; $P_5(q_{\mathrm{global}})$ in $\mathsf{CM}_3$ when some $q:Z\to O$ with $q|_U=q_U$ and $q|_V=q_V$ exists; and $\mathrm{P6}^{H^1}_{\mathrm{drive}}$ holds when the instance records a graph $G$ and a cochain $a\in C^1(G)$ with $[a]\neq0$ in $H^1(G)$; a cochain recorded by a drive bridge $B^{\mathrm{drive}}_{3\to6}$ counts on the graph that bridge declares (Subsubsection 9.3.5), where its class is nonzero by Theorem 17. In $\mathsf{CM}_2$ and $\mathsf{CM}_{10}$ a cochain counts when it is recorded on the triangle $G$, respectively on the support graph $G_B$, or by a drive bridge on the graph that bridge declares; in $\mathsf{CM}_{12}$ only cochains recorded on the graph the gate acts on count, the triangle $G$ before the gate and its output $G'$ after it. An instance that records no cochain fails the predicate. Likewise $P_3^{\mathrm{holonomy}}$ holds when the instance records a $P_3$ transport record and a cycle $\gamma$ with $\delta_3^{\mathrm{hol}}(\gamma)\neq\varnothing$; $P_4(q_0\rightsquigarrow q_1)$ when it contains a package refinement (Subsubsection 3.3.2) from the package with lens $q_0$ to the package with lens $q_1$; "$I_0$ audits $\mathcal T_0$" when it contains an audit record whose $\mathsf{ClaimRef}$ is $\mathcal T_0$ and whose check rules are drawn from $\mathsf{CheckRules}_{I_0}$; and $\mathrm{src}:\texttt{fallback}$ when the source slot of $Q$ holds a record of type $\texttt{fallback}$.
- **What it blocks.** The overclaim that the no-go rules out, named together with the corresponding nonclaim NC-$n$ from Subsection 15.2.
- **What it does not block.** The positive content that the construction is consistent with, so that the no-go is not over-read into a stronger negative statement.
- **Required positive bridge.** When a positive claim of the form $S\Rightarrow X$ would need an additional bridge, the bridge type is named (for example, a drive bridge $B_{3\to 6}^{\mathrm{drive}}$ or a gluing bridge $B_{\mathrm{glue}}$).

Formally, a countermodel sheet is a finite tuple

$$
(\mathrm{id},H,\mathsf{Data},\mathsf{ActiveClaim},\mathsf{FailedClaim},W,A,V,\mathcal N),
$$

with the five prose fields above unpacking that tuple for the reader.

### 9.1.2 Main-Text Selection

The six countermodels of this section are:

- $\mathsf{CM}_1$ — Active package but no macro closure (Subsection 9.2);
- $\mathsf{CM}_2$ — Active route/holonomy but no drive (Subsection 9.3);
- $\mathsf{CM}_3$ — Local packages fail globally (Subsection 9.4);
- $\mathsf{CM}_4$ — Directed cell active but pair observable blocked (Subsection 9.5);
- $\mathsf{CM}_5$ — Refinement worsens closure (Subsection 9.6);
- $\mathsf{CM}_6$ — Same-level self-audit circularity (Subsection 9.7).

The full twelve-countermodel atlas, including same-primitive-pair-different-statuses ($\mathsf{CM}_7$), idempotent-completions-do-not-commute ($\mathsf{CM}_8$), strict-extension-without-closure ($\mathsf{CM}_9$), strict-extension-without-drive ($\mathsf{CM}_{10}$), fallback-source ($\mathsf{CM}_{11}$), and gating-destroys-cycle-supported-drive ($\mathsf{CM}_{12}$), is recorded with full constructions in Appendix C. Subsection 9.8 names these appendix-only countermodels and points to Appendix C for the constructions.

## 9.2 Countermodel 1: Active Package but No Macro Closure

### 9.2.1 Construction

Take $X=\{a,b,c\}$ and $Y=\{A,B\}$, both finite sets on $\mathsf H_{\mathrm{fin}}$. Define a finite package map

$$
q:X\to Y,\qquad q(a)=A,\quad q(b)=A,\quad q(c)=B.
$$

The map $q$ is admissible as a $P_5$-package on $X$ in the schema of Subsection 3.3: it is a finite map on a finite carrier with a finite codomain.

Define a finite update

$$
F:X\to X,\qquad F(a)=a,\quad F(b)=c,\quad F(c)=c.
$$

Then $q(a)=q(b)=A$, while $qF(a)=q(a)=A$ and $qF(b)=q(c)=B$, so

$$
qF(a)\;\neq\;qF(b).
$$

By Theorem 7, $(a,b)\in\delta_1^{\mathrm{split}}(q,F)$, so

$$
\delta_1^{\mathrm{split}}(q,F)\;\neq\;\varnothing,
$$

and no finite descended update $F^\sharp:Y\to Y$ with $qF=F^\sharp q$ exists.

### 9.2.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;P_5(q)\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;P_1(qF=F^\sharp q),
$$

that is, $P_5\not\Rightarrow P_1\text{ macro closure}$ on the host $\mathsf H_{\mathrm{fin}}$ under the declared admissible instrument.

### 9.2.3 What It Blocks

The overclaim "a package automatically closes the dynamics" is rejected. NC-7 of Subsection 15.2 records the corresponding nonclaim. The construction is the working content of NC-7: package admissibility on a finite carrier does not by itself produce a descended update.

### 9.2.4 What It Does Not Block

The construction does not say packages are useless or that descent is generically impossible. It says only that package existence alone does not guarantee descent of a given update, and a positive descent claim requires an explicit witness: in this construction, replacing $F$ with a different finite update consistent with the fibers of $q$ would produce an admissible descended map.

### 9.2.5 Required Positive Bridge

A positive descent claim $P_5\Rightarrow P_1$ on a specific package $q$ and update $F$ requires an explicit descent record: the empty defect $\delta_1^{\mathrm{split}}(q,F)=\varnothing$ together with the audit and visibility data required by the surrounding judgment. Theorem 7 makes the vanishing of $\delta_1^{\mathrm{split}}(q,F)$ necessary and sufficient for the descended update, while the audit and visibility records remain separate admissibility requirements.

## 9.3 Countermodel 2: Active Route / Holonomy but No Drive

### 9.3.1 Construction

Take a finite cycle graph $G$ on $\mathsf H_{\mathrm{graph}}$, for example the triangle $0\to 1\to 2\to 0$ with $\beta_1(G)=1$, so that $Z_1(G)$ is spanned by the triangle cycle $\gamma$. Equip the surrounding judgment with the $P_3$ transport record of Subsubsection 5.3.3 with fiber $\Phi=\{u,v\}$, $g_{0\to1}=g_{1\to2}=\mathrm{id}$ and $g_{2\to0}=\sigma$, the swap of $u$ and $v$. Then

$$
\operatorname{Hol}(\gamma)\;=\;\sigma\;\neq\;\mathrm{id},\qquad \delta_3^{\mathrm{hol}}(\gamma)=\{u,v\},
$$

so that a role-channel record for $P_3$ with evidence $\delta_3^{\mathrm{hol}}(\gamma)\neq\varnothing$ can receive $\texttt{active\_projection}$.

For the drive face, take the symmetric random walk on $G$, $M(x,y)=1/2$ for each edge $\{x,y\}$, and its log-ratio cochain $a(x\to y)=\log\bigl(M(x,y)/M(y,x)\bigr)$; then $a=0\in C^1(G)$. By Theorem 16 (or directly from $a=0$), every cycle integral vanishes:

$$
\oint_\gamma a\;=\;0\quad\text{for every cycle }\gamma\in Z_1(G).
$$

Hence $[a]=0\in H^1(G)$, and no positive cycle-supported cohomological drive certificate $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ is admissible on $G$ for this $a$. The route/holonomy data is active, but the drive certificate is empty: the affinity cochain of a reversible chain on the same graph has no drive, while the holonomy is $\sigma$.

### 9.3.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;P_3^{\mathrm{holonomy}}\;\mathrel{\mathsf{dep}_{\texttt{requires\_bridge}}}\;\mathrm{P6}_{\mathrm{drive}}^{H^1},
$$

recording that route mismatch or holonomy alone does not establish a cohomological drive certificate. The construction establishes the first conjunct, $P_3^{\mathrm{holonomy}}\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\mathrm{P6}^{H^1}_{\mathrm{drive}}$; the second conjunct of the truth condition of $\texttt{requires\_bridge}$ (Subsubsection 4.6.1) holds trivially: by Subsubsection 9.3.5, $B^{\mathrm{drive}}_{3\to6}$ itself records a cochain $a$ and a cycle $\gamma$ with $\oint_\gamma a\neq0$, a complete positive certificate (Subsubsection 8.1.2) whatever the route data. The content of the judgment is its insufficiency half.

### 9.3.3 What It Blocks

The overclaim "route mismatch or holonomy automatically certifies drive" is rejected. NC-12 of Subsection 15.2 records the corresponding nonclaim. The construction is consistent with active $P_3$ data and absent $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ data on the same graph.

### 9.3.4 What It Does Not Block

The construction does not say drive certificates are unattainable on $G$ or that route mismatch is incompatible with drive. A different choice of $1$-cochain $a$ on $G$ — one with $\oint_\gamma a\neq 0$ — would supply a positive drive certificate; the construction shows only that the choice of $a$ is independent data from the route/holonomy record.

### 9.3.5 Required Positive Bridge

A positive inference of the form $P_3\Rightarrow\mathrm{P6}_{\mathrm{drive}}^{H^1}$ requires an explicit drive bridge

$$
B_{3\to 6}^{\mathrm{drive}},
$$

a finite typed record in $\mathsf{BridgePolicy}_I$ that connects the route/holonomy data to a specific cochain $a$ and cycle $\gamma$ with $\oint_\gamma a\neq 0$, together with the audit and source records required by $\mathsf{AuditPolicy}_I$ and $\mathsf{SourcePolicy}_I$ (Subsubsection 8.1.2). The bridge supplies the missing data: the route witness alone does not produce $a$, and the choice of $a$ is the substantive content of the bridge. Such a drive bridge is *admissible* under $I$ when $\mathsf{BridgePolicy}_I$ admits the type $\texttt{drive}$, the bridge records a declared finite graph $G$, a cochain $a\in C^1(G)$ and a cycle $\gamma\in Z_1(G)$ with $\oint_\gamma a\neq0$, and its audit draws its $\mathsf{CheckRules}$ from $\mathsf{CheckRules}_I$ with audit defect $\texttt{audit\_passes}$; this is the sense used in Subsubsections 4.6.1 and 5.4.2.

## 9.4 Countermodel 3: Local Packages Fail Globally

### 9.4.1 Construction

Take a finite carrier $Z=\{a,b,c\}$ on $\mathsf H_{\mathrm{fin}}$ with a finite cover $\{U,V\}$ given by

$$
U\;=\;\{a,b\},\qquad V\;=\;\{b,c\},
$$

so that the overlap is $U\cap V=\{b\}$. Let local packages be finite maps

$$
q_U:U\to O_U,\qquad q_V:V\to O_V,
$$

each admissible on its own patch. The restriction system is part of the data. All package targets are the two-element set,

$$
O_U\;=\;O_V\;=\;O_{U\cap V}\;=\;O\;=\;\{0,1\},
$$

every restriction map on targets is the identity of $\{0,1\}$, and a global package is a map $q:Z\to O$ whose restrictions to the patches are the local packages, $q|_U=q_U$ and $q|_V=q_V$. Take $q_U(a)=q_U(b)=0$ and $q_V(b)=q_V(c)=1$, so that on the overlap

$$
\mathrm{res}_{U,U\cap V}(q_U(b))\;=\;0,\qquad \mathrm{res}_{V,U\cap V}(q_V(b))\;=\;1,
$$

and $0\neq1$ in the overlap target. Each local package is admissible on its own patch, but no global package $q:Z\to O$ extends both: $q(b)$ would have to equal $q_U(b)=0$ and $q_V(b)=1$.

The gluing defect $\delta_4^{\mathrm{glue}}$ on the cover $\{U,V\}$ is therefore nonempty, with $b$ as a witness.

### 9.4.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\bigl\{P_5(q_U),\,P_5(q_V)\bigr\}\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;P_5(q_{\mathrm{global}}),
$$

recording that local-$P_5$-validity does not by itself imply global package existence on the cover.

### 9.4.3 What It Blocks

The overclaim "local validity implies global validity" is rejected. NC-14 of Subsection 15.2 records the corresponding nonclaim. The construction is consistent with two admissible local packages and an absent global package on the same finite carrier.

### 9.4.4 What It Does Not Block

The construction does not say global packaging is generically impossible or that covers are useless. Different overlap data — with admissibly identifiable values on $U\cap V$ — would produce a global package; the construction shows only that the overlap data is part of the global packaging input. The no-go is relative to the restriction system fixed above. A different global target with different restriction maps, for example one that records the pair of local values at $b$, poses a different gluing problem, which this construction does not address.

### 9.4.5 Required Positive Repair

A positive global-packaging claim from local data requires a $P_4$-gluing bridge

$$
B_{\mathrm{glue}}\quad\text{with}\quad \delta_4^{\mathrm{glue}}\;=\;\varnothing,
$$

together with a $P_6$-audit compatibility record on the overlaps. Absent these, the gluing defect blocks the global claim, and Subsubsection 5.3.4 records the gluing-defect schema used by $B_{\mathrm{glue}}$.

## 9.5 Countermodel 4: Directed Cell Active but Pair Observable Blocked

### 9.5.1 Construction

The active cell of this construction is the running example of Subsection 3.8.

Take the primitive pair $P_6\leftarrow P_3$ in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$, with the directed-cell schema of Subsection 4.3. Equip the cell with witness and update data

$$
W_3\;=\;\mathsf{RouteMismatchWit},\qquad U_6\;=\;\mathsf{AddAuditRecord},
$$

drawn from $\mathsf{Wit}(P_3)$ and $\mathsf{Upd}(P_6)$ respectively. Suppose the witness is visible under the surrounding instrument $I$ and audited under $\mathsf{AuditPolicy}_I$, and that the cell's profile $\lambda_{\mathrm{audit}}$ records the audit-only instrument mode for an audit update. The classifier of Subsubsection 5.6.2 then assigns

$$
\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}\;:\;\texttt{action}.
$$

Now consider the unordered pair-observable judgment

$$
\mathsf{PairObs}_{\{3,6\}}^{\mu_{\mathrm{drive}}}
$$

with profile $\mu_{\mathrm{drive}}=(\mathsf{Ver},\mathsf{Ver},\texttt{fine},\texttt{drive-certification},\texttt{drive},\texttt{audit-only},\texttt{local})$, whose compatibility tuple $(\texttt{fine},\texttt{drive-certification},\texttt{local},\mathsf H_{\mathrm{fin}})$ lies in $\mathsf{Compat}_I$, and a pair record whose joint witness is $W_3$, whose source slot carries an audited absence, and whose visibility and audit checks pass and whose defect record correctly contains $\delta_6^{\mathrm{source}}=\texttt{missing}$ and $\delta_{\mathrm{reqbridge}}=\{\texttt{drive}\}$; its regime $\texttt{drive-certification}$ gives $\mathsf{ReqBridge}(Q)=\{\texttt{drive}\}$ (Subsubsection 5.5.2), so the pair can be real only with an admissible drive bridge. Give the pair a branch-compatibility record with $\mathsf{compatible}=\mathrm{true}$ and its own passing audit. Suppose no drive bridge is present: $B_{3\to 6}^{\mathrm{drive}}$ is absent from $\mathcal L$, and no admissible drive source-of-truth certifying $[a]\neq0$ is recorded under $\mu_{\mathrm{drive}}$. The cell is well-formed and active, but the pair record's source defect is $\delta_6^{\mathrm{source}}=\texttt{missing}$, which fails the source threshold; so the first condition of the $\texttt{blocked}$ row of the pair-observable table in Subsubsection 5.6.6 holds, and the pair classifier of Subsubsection 5.6.3 assigns

$$
\mathsf{PairObs}_{\{3,6\}}^{\mu_{\mathrm{drive}}}\;:\;\texttt{blocked}.
$$

The same primitive pair $\{3,6\}$ thus carries an active directed cell and a blocked pair observable simultaneously.

### 9.5.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}:\texttt{action}\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;\mathsf{PairObs}_{\{3,6\}}^{\mu_{\mathrm{drive}}}:\texttt{real},
$$

recording that directed-cell action does not by itself imply pair-observable realness on the same primitive pair.

### 9.5.3 What It Blocks

The overclaim "directed-cell action implies pair-observable realness" is rejected. NC-5 of Subsection 15.2 records the corresponding nonclaim, and Theorem 5 of Section 6 makes the cell-to-pair non-implication formal as part of the status-family separation theorem.

### 9.5.4 What It Does Not Block

The construction does not say pair observables are unattainable on $\{3,6\}$ or that audit cells are incompatible with pair realness. A different pair record on the same primitives, with an admissible source and the required drive bridge, may classify $\texttt{real}$ or $\texttt{real\_provisional}$ in the schema of Subsubsection 4.4.3.

### 9.5.5 Required Positive Bridge

A positive pair-observable claim requires its own typed records: a real or fallback source under $\mathsf{SourcePolicy}_I$, an admissible branch-compatibility record, the visibility, threshold, and audit data of the pair record, and (when the pair claims drive content) the drive bridge $B_{3\to 6}^{\mathrm{drive}}$ under $\mathsf{BridgePolicy}_I$. The directed-cell record contributes none of these; the pair record carries them as separate data.

## 9.6 Countermodel 5: Refinement Worsens Closure

### 9.6.1 Construction

Take a finite carrier $X=\{a,b,c,d\}$ on $\mathsf H_{\mathrm{fin}}$. Define a coarse abstraction

$$
q_0\colon X\to\{*\},\qquad q_0(x)\;=\;*\;\text{ for every }x\in X,
$$

so that $q_0$ has a single fiber and every finite update on $X$ descends through $q_0$ trivially.

Now define a refinement

$$
q_1\colon X\to\{A,B,C\},\qquad q_1(a)=A,\quad q_1(b)=A,\quad q_1(c)=B,\quad q_1(d)=C.
$$

The coarse abstraction $q_0$ factors through $q_1$ via the unique forgetting map $r:\{A,B,C\}\to\{*\}$, so $q_0=rq_1$. Thus the package data of $q_1$ is more refined than that of $q_0$ in the sense of Subsection 3.3. Record the package refinement $\Phi=(\mathrm{id}_X,r)$ from the package with lens $q_0$ to the package with lens $q_1$. The latter has a source record holding the tables of $q_0$ and $q_1$, and an audit family containing the audit entry of the package with lens $q_0$, so that $A_{\mathcal T_0}\subseteq A_{\mathcal T_1}$ and $\Phi$ is admissible (Subsubsection 3.3.2).

Now choose a finite update $F:X\to X$ that creates a $q_1$-split. For instance, take

$$
F(a)\;=\;c,\quad F(b)\;=\;d,\quad F(c)\;=\;c,\quad F(d)\;=\;d.
$$

Then $q_1(a)=q_1(b)=A$, but $q_1F(a)=q_1(c)=B$ and $q_1F(b)=q_1(d)=C$, so

$$
q_1F(a)\;\neq\;q_1F(b),
$$

and $(a,b)\in\delta_1^{\mathrm{split}}(q_1,F)\neq\varnothing$. By Theorem 7, no descended update through $q_1$ exists.

By contrast, every update on $X$ — including this one — descends through $q_0$, since $q_0$ has a single fiber and the descended map on $\{*\}$ is the identity. Thus the descent defect $\delta_1^{\mathrm{split}}(q_0,F)$ is empty, while $\delta_1^{\mathrm{split}}(q_1,F)$ is non-empty: the refinement from $q_0$ to $q_1$ has worsened the closure status of the same update.

### 9.6.2 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;P_4(q_0\leadsto q_1)\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;\bigl(\delta_1^{\mathrm{split}}(q_1,F)\;\subseteq\;\delta_1^{\mathrm{split}}(q_0,F)\bigr),
$$

recording that $P_4$-refinement does not by itself improve closure: a refinement can introduce a non-empty $\delta_1^{\mathrm{split}}$ where there was none before.

### 9.6.3 What It Blocks

The overclaim "finer is always better" is rejected. NC-13 of Subsection 15.2 records the corresponding nonclaim. The construction is the working content of NC-13: refinement can introduce closure defects rather than improve them.

### 9.6.4 What It Does Not Block

The construction does not say refinement is always harmful or that closure improvement under refinement is impossible. A different finite update $F'$ — one whose action is consistent with the fibers of $q_1$ — would descend through $q_1$ as well as $q_0$. The construction shows only that compatibility of $F$ with $q_1$ is independent of compatibility with $q_0$.

### 9.6.5 Required Positive Bridge

A positive refinement-improvement theorem requires monotonicity hypotheses on the refinement, the update, and the closure functional, recorded as a $P_4$-monotonicity bridge. Such hypotheses are not asserted in this paper.

## 9.7 Countermodel 6: Same-Level Self-Audit Circularity

### 9.7.1 Construction

Let $I_0$ be a finite admissible instrument under an admissible package $\mathcal T_0$ on the host $\mathsf H_{\mathrm{instr}}$, with the instrument record schema of Subsubsection 3.4.1. The instance also contains an audit record $A_0$ with $\mathsf{ClaimRef}=\mathcal T_0$, $\mathsf{CheckRules}$ drawn from $\mathsf{CheckRules}_{I_0}$ and $\delta_6^{\mathrm{audit}}(A_0)=\texttt{audit\_passes}$, replaying the package audit entry of $\mathcal T_0$; so "$I_0$ audits $\mathcal T_0$" holds in the sense of Subsubsection 9.1.1. Consider the candidate same-level self-soundness claim

$$
\Gamma\,;\;\mathcal T_0\,;\;I_0\;\vdash\;\mathrm{Sound}(I_0)\;:\;?,
$$

asserting that $I_0$ certifies its own soundness without a level shift. Two cases arise from the classifier of Subsubsection 5.6.5.

### 9.7.2 Cases

**Outside-scope case.** Suppose the claim's host tag is not in $\mathsf{Hosts}_{I_0}$, a level tag of its profile is not in $\mathsf{Levels}_{I_0}$, $\texttt{soundness}\notin\mathsf{ClaimTypes}(I_0)$, or $\mathsf{Use}(\mathrm{Sound}(I_0))\not\subseteq\mathsf{Scope}_{I_0}$. The first classifier row assigns

$$
\Gamma\,;\;\mathcal T_0\,;\;I_0\;\vdash\;\mathrm{Sound}(I_0)\;:\;\texttt{outside\_scope}.
$$

This is the case for instruments configured to evaluate object-level claims only.

**Circular case.** Suppose the claim's host tag is in $\mathsf{Hosts}_{I_0}$, its level tags are in $\mathsf{Levels}_{I_0}$, $\texttt{soundness}\in\mathsf{ClaimTypes}(I_0)$ and the use-set of $\mathrm{Sound}(I_0)$ is contained in $\mathsf{Scope}_{I_0}$; the use-set then contains the verdict reference $\ulcorner\mathrm{Sound}(I_0),I_0\urcorner$ (Subsubsection 11.5.1). When no higher-priority $\texttt{blocked}$, $\texttt{absent\_with\_record}$ or $\texttt{failed\_audit}$ condition is present, the classifier assigns

$$
\Gamma\,;\;\mathcal T_0\,;\;I_0\;\vdash\;\mathrm{Sound}(I_0)\;:\;\texttt{undefined\_circular}.
$$

This is the case when an instrument is asked to certify a property of itself whose verification cannot be carried out without already knowing the verdict.

In neither case does $I_0$ certify its own soundness at $\texttt{accepted}$ without a level shift.

### 9.7.3 Supported No-Go

The construction supports the dependency judgment

$$
\Gamma\,;\;\mathsf H_{\mathrm{instr}}\,;\;I_{\mathrm{instr}}\;\vdash\;I_0\text{ audits }\mathcal T_0\;\mathrel{\mathsf{dep}_{\texttt{blocks}}}\;\bigl(I_0\vdash\mathrm{Sound}(I_0):\texttt{accepted}\bigr),
$$

recording, by Theorem 24, that in every admissible instance an instrument's audit capacity for object-level content is accompanied by a non-$\texttt{accepted}$ verdict on its own same-level soundness.

### 9.7.4 What It Blocks

The overclaim "an instrument can certify its own complete soundness without a level shift" is rejected within this calculus: the claim classifier routes that claim to $\texttt{outside\_scope}$, $\texttt{undefined\_circular}$, or a status of higher priority, and never to $\texttt{accepted}$. NC-16 of Subsection 15.2 records the corresponding nonclaim, and Theorem 24 of Section 11 states this classifier routing formally. The construction concerns this classifier; it is not a general impossibility result about self-certification.

### 9.7.5 What It Does Not Block

The construction does not say self-audit data is unattainable or that instruments cannot record any self-referential information. Object-level audit updates within $P_6\leftarrow P_6$ (auditing a specific object-level record) and fixed audit refreshes (re-running an existing audit policy on existing records) remain admissible: Subsection 11.6 records the three-case separation between object-level audit, fixed audit refresh, and complete same-level self-audit. Only in the third case does the complete self-soundness claim itself force a status that precedes $\texttt{accepted}$ in the classifier's priority order; the first two cases receive whatever status the cell classifier assigns to their records.

### 9.7.6 Required Positive Repair

A positive same-level soundness claim requires a level shift: a soundness claim whose use-set contains a verdict reference of an instrument at the judging instrument's level or above receives $\texttt{undefined\_circular}$ or a status of higher priority, never $\texttt{accepted}$ (Subsubsection 5.6.5; Theorem 24), so the claim must be judged by a higher instrument $I_1$; an admissible audit bridge $B^{\mathrm{audit}}_{0\to 1}$ in the rotating-audit chain of Subsection 11.7 records such an audit. The chain is finite and admissible; Theorem 25 of Section 11 records that an extension instrument can audit the lower stack, and by its clause 4 accept an upper-level soundness claim for a lower instrument exactly when that instrument's recorded verdicts are correct, but does not certify its own soundness, so the rotating audit is non-final (NC-17 of Subsection 15.2).

## 9.8 Additional Countermodels for Appendix

The remaining six countermodels of the full atlas are recorded with their full constructions and dependency judgments in Appendix C; they are named here for cross-reference. Each uses the sheet form of Subsubsection 9.1.1.

### 9.8.1 Same Primitive Pair, Different Statuses

$\mathsf{CM}_7$ exhibits two directed-cell records on the same primitive pair $P_6\leftarrow P_3$: one with audit-only profile $\lambda_{\mathrm{audit}}$ classified $\texttt{action}$, the other with drive-certification profile and a registered drive bridge too weak for it, classified $\texttt{blocked}$. Supports NC-3 (no primitive-pair status determination); the construction is the working content of Theorem 1 of Section 6. Full sheet in Appendix C.

### 9.8.2 Idempotent Completions Do Not Commute

$\mathsf{CM}_8$ exhibits two finite idempotent completion operators $E_1,E_2$ on the power set $\mathcal P(\{a,b,c\})$ that fail to commute. Supports NC-8 (no idempotence-implies-commutation); the construction is the working content of Theorem 9 of Section 7. Full sheet in Appendix C.

### 9.8.3 Strict Extension Without Macro Closure

$\mathsf{CM}_9$ exhibits a finite strict object map, with nonfactorization $\pi_{j+1}\not\factor\pi_j$, and a finite update with no descended dynamics on the target package. Supports NC-10 (no strictness-implies-closure). Full sheet in Appendix C.

### 9.8.4 Strict Extension Without Drive

$\mathsf{CM}_{10}$ exhibits a finite strict object map whose support graph is a forest, so $H^1=0$ and no admissible cohomological drive certificate exists. Supports NC-11 (no strictness-implies-drive). Full sheet in Appendix C.

### 9.8.5 Fallback Source Cannot Support Real Pair

$\mathsf{CM}_{11}$ exhibits a pair-observable record whose only available source has type $\texttt{fallback}$ and which carries no audited source-upgrade bridge admitted by $\mathsf{SourcePolicy}_I$ and $\mathsf{BridgePolicy}_I$. The classifier of Subsubsection 5.6.3 assigns at most $\texttt{real\_provisional}$, never $\texttt{real}$. Supports the source-of-truth discipline of Subsubsection 4.4.3. Full sheet in Appendix C.

### 9.8.6 Gating Destroys Cycle-Supported Drive

$\mathsf{CM}_{12}$ exhibits a triangle graph with a nonzero drive cochain and a $P_2$-style gate that deletes one edge, leaving a path with $\beta_1=0$ and hence $H^1=0$. Supports the gating-suppression discipline of Section 8 and is the working content of Theorem 18. Full sheet in Appendix C.
