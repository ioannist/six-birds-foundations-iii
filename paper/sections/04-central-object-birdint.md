# 4. The Central Object $\mathbf{BirdInt}$

Section 3 declared the ambient domain $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ as a finite tuple of finite typed components. As stated in Subsubsection 3.1.1, $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is a schema and the theorems quantify over its admissible instances. This section defines the judgment families that the rest of the paper consumes: role-channel, directed-cell, pair-observable, promotion, dependency, and instrument-indexed claim judgments, together with the audit, source, and admissibility records that the calculus carries on every judgment line. The judgment families are introduced at schema-grade; their classifier rules and theorem-grade results appear in Sections 5 through 11. Subsection 4.7 separates structural downward influence from a top-down causal channel, which must pass intervention gates. The definitions needed for Theorems 1–4 are listed in the reader's map (Subsection 1.4); the rest of this section is reference material.

## 4.1 Central Object Definition

### 4.1.1 Object Form

\begin{claimdefinition}{Central object $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$}
The central object of this paper is the nineteen-component signature $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ displayed in Subsubsection 3.1.1, whose instances are finite assignments of its components, equipped with the judgment families introduced in Subsections 4.2 through 4.8 and the source, audit, and admissibility records of Subsections 4.9 and 4.10. The same notation $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ refers to this object; no second name is introduced. It is distinct from the inherited Foundations II domain $\mathsf{FATCD}$. The qualifier $\mathrm{fin}$ records that every component is finite, and the qualifier $\mathrm{aud}$ records that every accepted claim is interpreted under an explicit audit record.

The object is not a category, an algebra, or a closure operator. Each instance is a finite typed record over a finite host inventory, carrying finite typed records in each component. The judgment families of this section operate on the components directly, and a theorem about $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is a theorem about a finite check on those records, under explicit instrument, package, profile, level, visibility, threshold, audit, and nonclaim assumptions.
\end{claimdefinition}

### 4.1.2 Internal Versus Model-Realization Components

The components of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ split into two groups.

The **internal components** are $\mathbb P$, $\mathsf{Lev}$, $\mathsf{Host}$, $\mathsf{Cont}$, $\mathsf{Instr}$, $\mathsf{Pkg}$, $\mathsf{Prof}$, $\mathsf{Wit}$, $\mathsf{Upd}$, $\mathsf{Def}$, $\mathsf{Judg}$, $\mathsf{Status}$, $\mathsf{Gate}$, $\mathsf{Dep}$, $\mathsf{Audit}$, $\mathsf{Vis}$, $\mathsf{Source}$, and $\mathsf{Nonclaim}$. These are the components on which the calculus's syntax, classifier rules, defect-to-status rules, gate semantics, and instrument-indexed claim semantics operate. The theorems of Sections 6, 10 and 11 are theorems about the internal components; those of Sections 7 and 8 concern the finite maps, kernels and graphs that these components record.

The **model-realization component** is $\mathsf{Real}$. This is the family of finite model-realization modules through which scoped finite hosts (PICA, the audited Cantor shell, finite abstract interpretation, finite graph/cohomology fragments) realize named fragments of the internal calculus. Statements about the model-realization component are tagged model-only when they assert a realization; they do not transfer to internal universal claims, and the negative scope of Subsubsection 2.4.3 records this explicitly.

The split is enforced by the discipline of the paper: a theorem about an internal component does not silently use a model-realization fact, and a model-realization theorem is always tagged model-only and accompanied by the host, the realized fragment, the realization map, and the explicit nonclaims. Section 13 carries the model-realization material; the present section defines only the internal judgment families.

## 4.2 Role-Channel Judgments

### 4.2.1 Judgment Form

A role-channel judgment fixes the standing of a primitive role channel under an instrument and a theory package. Its form is

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\mathrm{Chan}_i:\rho_i,
$$

where $\Gamma$ is a finite typed context, $\mathcal T$ is an admissible theory package, $I$ is an admissible instrument, $\mathrm{Chan}_i$ is the role channel for primitive $P_i\in\mathbb P$, and $\rho_i$ is the role-channel status assigned to $\mathrm{Chan}_i$ under $\Gamma,\mathcal T,I$. Unlike the directed-cell, pair-observable and promotion judgment forms, this form has no claim-type premise; scope enters only through rule 1 of Subsubsection 5.6.1.

The notation $\mathrm{Chan}_i$ records that the subject of the judgment is the role channel of $P_i$, not the primitive label $P_i$ itself. Channels are typed slots through which role-aligned witness, threshold, level, visibility, and audit data are recorded; the primitive label only names the channel.

### 4.2.2 Channel Statuses

The role-channel status set is inherited from Foundations II:

$$
\begin{aligned}
\mathrm{RoleStatus}\;=\;\{\,&\texttt{active\_projection},\;\texttt{below\_threshold},\;\texttt{collapsed\_boundary\_case},\\
&\texttt{absent\_with\_record},\;\texttt{inapplicable\_outside\_scope}\,\}.
\end{aligned}
$$

The five values have the inherited meanings:

- $\texttt{active\_projection}$: an active derived role projection exists with the required role-aligned witness, threshold, level, audit, and relevant visibility/support data.
- $\texttt{below\_threshold}$: candidate role evidence is present, but the threshold data required for activation is absent or not met.
- $\texttt{collapsed\_boundary\_case}$: the role-channel record's declared Boolean field $\mathsf{collapse}_i$ is true.
- $\texttt{absent\_with\_record}$: no relevant raw features or witness data for the role are present, and the absence is explicitly recorded.
- $\texttt{inapplicable\_outside\_scope}$: the role-$P_i$ content lies outside the scope covered by $\mathcal T$ under $I$.

Foundations III does not introduce additional role-channel statuses. The new status families introduced for directed cells, pair observables, promotions, claims, gates, and squares (Subsubsection 2.3.2 and Subsection 5.1) extend the calculus; they do not replace or relabel the inherited five role-channel statuses.

### 4.2.3 Channel/Activation Discipline

A role channel is a typed slot. An active witness is a recorded value passing the threshold, level, witness, and audit conditions of the surrounding instrument and package. The two are distinct:

- a primitive may have an open role channel without an active witness, with status $\texttt{absent\_with\_record}$ or $\texttt{below\_threshold}$;
- a primitive may have an active witness under one instrument and be inapplicable under another instrument whose scope excludes the role evidence, with status $\texttt{inapplicable\_outside\_scope}$ there (rule 1 of Subsubsection 5.6.1); the role-channel classifier reads no profile;
- a primitive may have status $\texttt{active\_projection}$ on its role channel and yet not produce a directed cell with status $\texttt{action}$, because directed-cell action additionally requires admissible actor/informant data, profile, visibility, threshold, audit, and defect records on the cell.

No theorem in this paper infers an active witness from the existence of a channel, and no theorem infers a directed-cell status from a role-channel status. The status-family separation theorem of Section 6 makes the second of these formal.

## 4.3 Directed-Cell Judgments

Directed-cell judgments are the central typed bridge judgments of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. A directed cell records that, under an admissible context, package, and instrument, an actor primitive consumes typed witness data from an informant primitive through a typed update, with the level/lens/interface, visibility, threshold, audit, and defect data of the surrounding judgment. The cell is the working unit of typed interaction; the no-total-six-symbol-algebra theorem of Section 6 records that cell status does not factor through the primitive pair.

### 4.3.1 Judgment Form

\begin{claimdefinition}{Directed-cell record}
The directed-cell judgment form is

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;(\,P_i\leftarrow P_j,\;W_j,\;U_i,\;L,\;V,\;\Theta,\;A,\;\delta\,)^{\lambda}\;:\;\sigma,
$$

where $\Gamma$ is a finite typed context, $\mathcal T$ is an admissible theory package, $I$ is an admissible instrument with $\texttt{directed-cell}\in\mathsf{ClaimTypes}_I$ (a premise of the judgment form, as for promotion judgments, Subsubsection 4.5.1, not a classifier test; for claims, claim-type exclusion is instead a classifier outcome, Subsubsection 11.1.2), $\lambda\in\mathsf{Prof}$ is an admissible profile, and $\sigma\in\mathrm{CellStatus}$ is the directed-cell status assigned by the classifier of Subsubsection 5.6.2. The cell record itself is the finite typed tuple

$$
\mathsf{Cell}_{ij}^{\lambda}\;=\;(\,P_i\leftarrow P_j,\;W_j,\;U_i,\;L,\;V,\;\Theta,\;A,\;\delta\,),
$$

so the judgment may equivalently be written $\Gamma;\mathcal T;I\vdash\mathsf{Cell}_{ij}^{\lambda}:\sigma$. The notation $P_i\leftarrow P_j$ is a typed bridge designation, not a binary product on $\mathbb P$; it records the actor and informant roles for the surrounding witness, update, and status data.
\end{claimdefinition}

### 4.3.2 Actor and Informant Roles

In the cell $P_i\leftarrow P_j$, the actor primitive is $P_i$ and the informant primitive is $P_j$. When the slots are present, the actor receives a typed update $U_i\in\mathsf{Upd}(P_i)$ and the informant supplies a typed witness $W_j\in\mathsf{Wit}(P_j)$, with $\mathsf{Wit}$ and $\mathsf{Upd}$ as in Subsection 3.7. The arrow direction is part of the data: the cells $P_i\leftarrow P_j$ and $P_j\leftarrow P_i$ are distinct judgments with different witness/update typing requirements and may receive different statuses under the same package, instrument, and profile.

The slot rule of Subsubsection 3.7.3 applies: each slot holds a record of the declared family or a typed, audited absence marker; a wrong-typed record or an unaudited marker is malformed. A typed, audited absence passes its slot check; if the remaining well-formedness checks pass, the cell classifier tests the marker.

### 4.3.3 Cell Components

The cell judgment uses the following finite typed records, each hosted and instrument-indexed as required by $\mathcal T$, $I$, and the profile $\lambda$:

- $W_j$: the informant-side witness data, a record with signature in $\mathsf{Wit}(P_j)$ or a typed, audited absence marker for that slot.
- $U_i$: the actor-side update data, a record with signature in $\mathsf{Upd}(P_i)$ or a typed, audited absence marker for that slot.
- $L$: the level/lens/interface record. $L$ specifies the level tags on which the actor and informant operate, the lens through which the cell content is read, and the interface against which the cell is judged. Its level tags are the actor and informant level tags of $\lambda$; if they differ, $L$ contains a level-bridge record of one of the types of Subsubsection 2.2.3.
- $V$: the visibility record under $I$ for the fields of the cell, drawn from the visibility partition of Subsection 3.5; it assigns each field of the cell, and each record of $\mathsf{Use}(C)$, its class under $\mathsf{vis}_I$, and a record whose marks differ from $\mathsf{vis}_I$ fails condition (4) of well-formedness. $V$ specifies which of $W_j$, $U_i$, $L$, $\Theta$, $A$, $\delta$ are visible, suppressed, outside-scope, or unknown under $I$, and lists any visibility bridges admitted under $\mathsf{BridgePolicy}_I$ that bring suppressed fields into admissible reach.
- $\Theta$: the threshold record. $\Theta$ specifies the exact, approximate, tolerance, rank, visibility, and source thresholds the cell must meet, drawn from the eleven-element threshold family of Subsubsection 5.2.2. Each threshold names its evaluated datum: a direct check on witness or update values, a primitive defect of Subsection 5.3, a visibility or required-bridge defect of Subsection 5.5, the audit defect of a named audit record, or, for $\Theta_{\mathrm{pass}}$, a recorded Boolean field of a record of $\mathsf{Cont}$ named by $\Theta$ (which then lies in $\mathsf{Use}(C)$).
- $A$: the audit slot, holding either a finite audit record in the schema of Subsubsection 4.9.2 or a typed, audited absence marker. The marker has no check-result fields; its audit defect is $\{\texttt{missing\_audit}\}$. $A$ is distinct from the inherited audit functional $\mathcal A$ of $\mathcal T$: $A$ is the finite audit record of the cell, and its relation to $\mathsf{AuditPolicy}_I$ is read by the classifier through the audit defect of Subsubsection 5.3.6.
- $\delta$: the defect record family attached to the cell. Each entry of $\delta$ is a typed defect record in the schema of Subsubsection 5.2.1, and $\delta$ consists of (i) the visibility, required-bridge and audit defects of Subsection 5.5 and Subsubsection 5.3.6, computed from the other fields; (ii) the package-collapse entries of Subsubsection 5.3.5, computed from $L$, $W$ and $U$; (iii) for each primitive defect of Subsection 5.3 explicitly named as the evaluated datum of a threshold in $\Theta$, that defect computed on the witness and update data; and (iv) the Booleans $\mathsf{noopU}$ and $\mathsf{implicitW}$ of Subsubsection 4.3.4, recorded as computed, with passing value false. A payload defect to which $\Theta$ attaches no threshold, such as $\Delta_3^{\mathrm{comp}}$ of a $P_3$ witness, is witness content, not an entry of $\delta$.
- $\lambda\in\mathsf{Prof}$: the profile of the cell, fixing the actor and informant level tags, scale, regime, bridge type, instrument mode, and locality, in the schema of Subsubsection 3.6.1.
- $\sigma\in\mathrm{CellStatus}$: the directed-cell status assigned to the cell by the classifier. This is part of the judgment line, not an extra field of the cell tuple $\mathsf{Cell}_{ij}^{\lambda}$.

The host tag of a cell is the host tag $h_{\mathcal T}$ of its package; step 5 of Subsubsection 6.3.1 checks that every component is a record on that host.

The use-set of the cell, $\mathsf{Use}(C)$, consists of the records held or named by its fields $W_j,U_i,L,\Theta,A$ together with every record named by a reference field of one of those records, except the instrument named in an audit record's $\mathsf{CheckRules}$ field; the expansion is applied once (Subsubsection 5.5.2); the visibility defects of condition 7 are computed on it. The $V$ and $\delta$ slots do not themselves contribute references to $\mathsf{Use}(C)$; references to these records occurring in the included fields are still counted. Bridge candidates listed in $V$ are assessed through $\mathsf{AdmVisBridge}$ where required, and $\delta$ is recomputed in step 8.

A cell is *well-formed* when the following eight conditions hold:

1. its labels are primitives [decided by step 1 of Subsubsection 6.3.1];
2. its witness and update slots are typed or carry audited absence markers [decided by steps 2–3 of Subsubsection 6.3.1];
3. its profile is admissible [decided by step 4 of Subsubsection 6.3.1];
4. its $L,V,\Theta,A,\delta,\lambda$ records are finite and typed with the level tags of $L$ as above, and its present $W_j$, $U_i$ are records on the host of $\mathcal T$ tagged $\ell_j$, $\ell_i$, and $V$ assigns each field of the cell and each record of $\mathsf{Use}(C)$ its class under $\mathsf{vis}_I$ [decided by step 5 of Subsubsection 6.3.1];
5. its references resolve [decided by step 6 of Subsubsection 6.3.1];
6. its host and instrument tags are declared [decided by step 7 of Subsubsection 6.3.1];
7. its defect record $\delta$ records the visibility and required-bridge defects of Subsection 5.5, the audit defect of Subsubsection 5.3.6, the package-collapse entries of Subsubsection 5.3.5 and each primitive defect named by $\Theta$, as computed from its other fields [decided by step 8 of Subsubsection 6.3.1];
8. (a) if the audit slot holds a present record $A$: its $\mathsf{ClaimRef}$ names $C$ and its $\mathsf{CheckRules}$ names the judging instrument $I$, its $\mathsf{VisibilityCheck}$ passes exactly when the visibility defect of condition 7 is empty, its $\mathsf{ThresholdCheck}$ passes exactly when every threshold of $\Theta$ evaluates to $\texttt{pass}$, and its $\mathsf{CircularityCheck}$ is the reachability test of Subsubsection 4.9.2 with $X=C$; (b) if it holds an audited absence marker: $\delta_6^{\mathrm{audit}}=\{\texttt{missing\_audit}\}$; (c) in both cases: $\mathsf{noopU}$ and $\mathsf{implicitW}$ equal their computed values, and each type-(iii) defect entry carries exactly the threshold that $\Theta$ assigns to it [decided by step 8 of Subsubsection 6.3.1].

Steps 1, 2–3, 4, 5, 6 and 7 decide conditions 1–6, and step 8 decides conditions 7 and 8. Consequently, on a well-formed cell, $\delta$ and the check results of $A$ are determined by the other fields: the classifier's status is a function of $P_i,P_j,W,U,L$, the bridges listed in $V$, $\Theta$, the remaining fields of $A$, $\lambda$, $\mathcal T$, $I$ and the instance records they reference.

*Covered cells.* A cell is *covered* when it is well-formed and one of the nine rows $\texttt{outside\_scope}$ through $\texttt{action}$ of the table of Subsubsection 5.6.6 holds at it; the final $\texttt{blocked}$ row is a totality guard. The notion lets Theorem 1 be stated without Theorem 4, which shows that every well-formed cell is covered, so that $\mathsf{CoveredCell}$ is the set of well-formed cells. A missing witness or update, and content outside $\mathsf{Scope}_I$, are classifier outcomes ($\texttt{absent}$, $\texttt{outside\_scope}$), not well-formedness failures. The well-formedness step is a finite decidable check (Theorem 3, Subsection 6.3); the resulting status $\sigma$ is then determined by the rows of the directed-cell table of Subsubsection 5.6.6 (glossed in Subsubsection 5.6.2) from the $L,V,\Theta,A,\delta$ data and the profile. In the running example of Subsection 3.8, the witness is the route-mismatch record $(E_1,E_2,\{a\})$, the update adds an audit record, both level tags are $\mathsf{Ver}$, and $\delta$ is empty.

### 4.3.4 Directed-Cell Statuses

The directed-cell status set is

$$
\begin{aligned}
\mathrm{CellStatus}\;=\;\{\,&\texttt{action},\;\texttt{implicit},\;\texttt{trivial},\;\texttt{blocked},\;\texttt{undefined\_circular},\\
&\texttt{below\_threshold},\;\texttt{collapsed},\;\texttt{absent},\;\texttt{outside\_scope}\,\}.
\end{aligned}
$$

In words (Subsubsection 5.6.2 gives the exact rules and their priority order): $\texttt{action}$, the cell is well formed, its witness and update are present and every defect, visibility, audit and source check passes; $\texttt{implicit}$, the witness is attached to the package and no threshold evaluates it; $\texttt{trivial}$, the update changes nothing ($\mathsf{noopU}$) or re-installs the package map or completion already recorded for its target ($\texttt{identity\_package}$, Subsubsection 5.3.5; an identity lens or completion of $\mathcal T$ itself produces no entry); $\texttt{below\_threshold}$, the witness and update are present and the audit's threshold check fails; $\texttt{collapsed}$, the lens of $L$ collapses the witness content; $\texttt{undefined\_circular}$, the cell's own verdict is reachable from its audit's evidence or sources; $\texttt{blocked}$, a bridge required by the profile is missing or too weak, a used record is suppressed without an admissible bridge or has unknown visibility, or the audit is missing or records a failed source, visibility, nonclaim or replay check; $\texttt{absent}$, the witness or update is an audited absence marker and the audit defect contains neither $\texttt{missing\_audit}$ nor $\texttt{failed\_audit}$ (otherwise the cell is $\texttt{blocked}$); $\texttt{outside\_scope}$, the instrument does not cover the cell's host, level or used records. The classifier assigns exactly one of these to a covered well-formed cell (Theorem 4, Subsection 6.4). The classifier priority order, fixed for the rest of the paper, is displayed with the per-status rules in Subsubsection 5.6.2.

The field $\mathsf{implicitW}$ holds when the witness $W$ lies in the witness family $W_{\mathcal T}$ attached to the package $\mathcal T$ and no threshold of $\Theta$ evaluates it, that is, has as its evaluated datum a field of $W$, a direct check on values of $W$, or a primitive defect computed from fields of $W$ (status $\texttt{implicit}$, Subsubsection 5.6.6); the well-formedness check computes $\mathsf{noopU}$, which is $[e_U(r)=r]$ when the update $U$ has a recorded finite effect map $e_U$ on its target $r$ and false otherwise, and which decides the status $\texttt{trivial}$. Subsubsection 5.6.6 lists the declared inputs of all the classifiers.

Under this priority, a cell whose data simultaneously matches more than one status condition is assigned the highest-priority match; the per-status conditions are the rows of the directed-cell table of Subsubsection 5.6.6, glossed in Subsubsection 5.6.2, and the uniqueness theorem is Theorem 4. The priority ordering reflects the working discipline of the calculus: out-of-scope and absence verdicts are recorded before any further check on the cell's content; blocking, circularity, and collapse are recorded before threshold or activity verdicts; and the $\texttt{action}$ verdict is reached only after every higher-priority condition has been ruled out.

## 4.4 Pair-Observable Judgments

A directed cell records one role acting on another. A pair observable instead records joint content for an unordered pair of roles, with a source-of-truth record. Its classifier uses that source together with the pair's compatibility, visibility, threshold and audit records to assign $\texttt{real}$, $\texttt{real\_provisional}$, $\texttt{real\_duplicated}$ or $\texttt{blocked}$. Pair-observable judgments record the standing of an unordered pair of primitives as a joint observable, distinct from the directed-cell judgments of Subsection 4.3. The pair-observable family has its own status set, its own classifier inputs (notably a source-of-truth record), and its own admissibility conditions. Directed-cell action does not by itself imply pair-observable realness; the schema-level distinction is recorded here, and the formal status-family separation appears in Theorem 5 of Section 6.

### 4.4.1 Judgment Form

\begin{claimdefinition}{Pair-observable record}
The pair-observable judgment form is

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\mathsf{PairObs}_{\{i,j\}}^{\mu}\;:\;\omega,
$$

where $\{i,j\}\subseteq\{1,\ldots,6\}$ is an unordered pair of distinct primitive indices ($i\neq j$; there are fifteen such pairs), $\mu\in\mathsf{Prof}$ is a profile drawn from the family of profiles for pair-observable judgments, the instrument $I$ has $\texttt{pair-observable}\in\mathsf{ClaimTypes}_I$, and $\omega\in\mathrm{PairStatus}$ is the pair-observable status assigned to the record by the classifier of Subsubsection 5.6.3. The unordered pair $\{i,j\}$ equals $\{j,i\}$; the judgment is the same for either ordering.

A pair-observable record is a finite typed tuple recording, in addition to $\{i,j\}$ and $\mu$, the joint witness data, the source-of-truth record, the branch-compatibility record, the visibility record, the threshold record, the audit record, the defect record, and the nonclaim record, together with declared Boolean fields $\mathsf{forbidsSource}$ and $\mathsf{partialEvidence}$ that the surrounding instrument and package require, and optionally a duplicate-pair record $\mathsf{Dup}$, read by the $\texttt{real\_duplicated}$ row of Subsubsection 5.6.3. The source-of-truth field is the record's *source slot*: it holds a source record $R$ of Subsubsection 4.9.1 or a typed, audited absence marker. In the PICA display of Subsubsection 13.2.7 the joint-witness, source and branch fields are named $\mathsf{ObservableType}$, $\mathsf{SourceOfTruth}$ and $\mathsf{BranchData}$. A duplicate-pair record $\mathsf{Dup}=(Q',A_{\mathsf{Dup}})$ names a second pair record $Q'\neq Q$ of the instance, on the same unordered pair, that records the same joint content, with its own passing audit; the classifier reads only its presence. The full schema is registered in $\mathsf{Cont}$. A pair-observable record is *well formed* when its fields are present, finite and typed, $\mathsf{AdmProfile}(\mu,I,\mathcal T)$ holds, every reference resolves or is an audited absence (a missing source is recorded as $\delta_6^{\mathrm{source}}=\texttt{missing}$), its audit slot holds an audit record whose $\mathsf{ClaimRef}$ names the pair record, or a typed, audited absence marker, whose audit defect is $\{\texttt{missing\_audit}\}$ (Subsubsection 5.3.6), and its visibility, required-bridge, source and audit defect entries equal the values computed as in Subsections 5.5 and 5.3; policy failures are classifier outcomes, not well-formedness failures. The branch-compatibility record carries a Boolean field $\mathsf{compatible}$ and its own audit record. Each threshold of a pair record names its evaluated datum as for a directed cell (Subsubsection 4.3.3), the source-of-truth and branch-compatibility records counting as witness data.
\end{claimdefinition}

### 4.4.2 Pair Versus Directed Cell

A pair observable is not a directed cell. The directed cell $P_i\leftarrow P_j$ records typed actor/informant bridge data; the pair observable $\mathsf{PairObs}_{\{i,j\}}^{\mu}$ records joint source-of-truth content for the unordered pair. The two are distinct judgment families with distinct status sets, distinct classifier inputs, and distinct admissibility schemas.

In particular,

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\mathsf{Cell}_{ij}^{\lambda}\;:\;\texttt{action}\;\;\not\Rightarrow\;\;\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\mathsf{PairObs}_{\{i,j\}}^{\mu}\;:\;\texttt{real}.
$$

A directed cell with status $\texttt{action}$ records that the typed actor/informant bridge passes the well-formedness, threshold, visibility, and audit conditions of the cell record. A pair observable with status $\texttt{real}$ additionally records that the unordered pair has a real source of truth, an admissible branch-compatibility record, and an admissible source policy under $I$. The countermodel sheet $\mathsf{CM}_4$ of Section 9 supplies a finite construction in which a directed cell is $\texttt{action}$ and the corresponding pair observable is $\texttt{blocked}$. Section 6 contains the theorem-grade form of this separation as part of Theorem 5; this subsection records only the schema-level distinction.

### 4.4.3 Source-of-Truth Conditions

Pair-observable acceptance depends on a source-of-truth record drawn from a finite typed family. The source classes used by this paper, drawn from the source-policy values of Subsubsection 4.9.1, are:

- **real source.** A finite source record, certified under $\mathsf{SourcePolicy}_I$ with admissible audit and bridge data, that supports the unordered pair under profile $\mu$. Here "real" requires a source admitted by the instrument's source policy and passing the applicable checks; fallback and proxy sources are provisional by default, subject to the audited-upgrade rule for fallback stated in the next item.
- **fallback source.** A finite source record certified as a designated fallback under $\mathsf{SourcePolicy}_I$. A fallback source supports a pair observable at $\texttt{real\_provisional}$ at most by default; it does not support $\texttt{real}$ unless its record carries an audited source-upgrade bridge admitted by $\mathsf{SourcePolicy}_I$ and $\mathsf{BridgePolicy}_I$ (the $\texttt{real}$ row of the pair classifier, Subsubsection 5.6.3).
- **dirty source.** A finite source record whose trace records a failed audit or threshold check of the record itself, or whose validity record places it outside its validity condition (the $\texttt{dirty}$ clause of Subsubsection 5.3.6); failed checks that the record only holds as data do not make it dirty. A dirty source does not support an accepted pair observable; the resulting status is $\texttt{blocked}$.
- **proxy source.** A finite source record obtained via a typed bridge from another source, admissible only when the bridge is recorded in $\mathsf{BridgePolicy}_I$ and audited; a proxy source supports a pair observable at most at $\texttt{real\_provisional}$.
- **missing source.** No source record is supplied. The pair observable does not pass acceptance: the status is $\texttt{blocked}$.

The pair-observable status set used by this paper is

$$
\mathrm{PairStatus}\;=\;\{\,\texttt{real},\;\texttt{real\_provisional},\;\texttt{real\_duplicated},\;\texttt{blocked}\,\}.
$$

The source-condition names above--fallback source, dirty source, proxy source, and missing source--are not additional pair-observable statuses. They are source-policy conditions that the classifier routes into one of the four values in $\mathrm{PairStatus}$.

The classifier of Subsubsection 5.6.3 consumes the pair record together with its source-of-truth record, branch-compatibility record, visibility record, threshold record, audit record, and defect record, and assigns a value in $\mathrm{PairStatus}$ to every well-formed pair-observable record. As with directed cells, no theorem in this paper infers a pair-observable status from a directed-cell status, a role-channel status, or a primitive pair alone; the schema discipline of this subsection together with the status-family separation theorem of Section 6 closes that gap.

## 4.5 Promotion Judgments

Promotion judgments record the standing of a finite promotion bridge from a source theory package to a target theory package under an instrument. They are the typed/statused machinery on which the strict-extension theorems of Section 7 and the promotion-gate-soundness theorem of Section 10 are built. Like directed-cell and pair-observable judgments, promotion judgments have their own status set and their own classifier inputs; in particular, the strict and non-strict refinements of an accepted promotion are properties of the bridge's object-map data and do not by themselves imply closure or drive on the target package.

### 4.5.1 Judgment Form

The promotion judgment form is

$$
\Gamma\,;\;\mathcal T_j\,;\;I\;\vdash\;\mathrm{Promote}(B_{j\to j+1})\;:\;\sigma_{\mathrm{promote}},
$$

where $B_{j\to j+1}$ is the promotion bridge from source theory package $\mathcal T_j$ to target theory package $\mathcal T_{j+1}$, $I$ is an admissible instrument with $\mathsf{ClaimTypes}_I$ that includes promotion claims, and $\sigma_{\mathrm{promote}}\in\mathrm{PromotionStatus}$ is the promotion status assigned by the classifier of Subsubsection 5.6.4.

### 4.5.2 Promotion Bridge Object

\begin{claimdefinition}{Promotion bridge record}
A promotion bridge is the finite typed tuple

$$
B_{j\to j+1}\;=\;(\,\mathcal T_j,\;\mathcal T_{j+1},\;\pi_j,\;\pi_{j+1},\;L,\;V,\;\Theta,\;A,\;\delta,\;\mathcal N\,),
$$

with the following components, all finite:

- $\mathcal T_j$: the source theory package, admissible in the sense of Subsubsection 3.3.3.
- $\mathcal T_{j+1}$: the target theory package, admissible in the same sense.
- $\pi_j$: the old object map or interface, recording how content is read out of $\mathcal T_j$.
- $\pi_{j+1}$: the new object map or interface, recording how content is read out of $\mathcal T_{j+1}$.
- $L$: the level/lens/interface record of the bridge, fixing the levels at which $\pi_j$ and $\pi_{j+1}$ operate and, when drive is judged, a finite support graph $G_B$ on the carrier $S$ of the expanded form below.
- $V$: the visibility record of the bridge under $I$, in the schema of Subsection 3.5.
- $\Theta$: the threshold record of the bridge, drawn from the threshold family of Subsubsection 5.2.2.
- $A$: the audit record of the bridge, distinct from the audit functionals $\mathcal A_j$, $\mathcal A_{j+1}$ of the source and target packages, whose $\mathsf{ClaimRef}$ names $B_{j\to j+1}$.
- $\delta$: the defect record family attached to the bridge, including the strictness, no-smuggling, stability, descent, and audit defects defined in Subsections 5.3 and 5.4.
- $\mathcal N$: the nonclaim record attached to the bridge.

The expanded form of $B_{j\to j+1}$ recorded in $\mathsf{Cont}$ also carries a bridge identifier, the carrier $S$ on which the object maps act, the codomains $O_j$ and $O_{j+1}$, the gate-results record, the host tag, and the bridge profile:

$$
\begin{aligned}
B_{j\to j+1}=\bigl(&\mathrm{id},\mathcal T_j,\mathcal T_{j+1},S,O_j,O_{j+1},\pi_j,\pi_{j+1},\\
&L,V,\Theta,A,\delta,\mathsf{GateResults},\mathcal N,\mathsf{HostTag},\lambda_{\mathrm{prom}}\bigr).
\end{aligned}
$$

The last field is the bridge profile, a variable of the schema; the named profile $\lambda_{\mathrm{prom}}$ of Subsubsection 10.6.1 is one value of it.

A bridge is admissible when its well-formedness gate $G_{\mathrm{suff}}$ passes (Subsubsection 10.2.1); the other gates are inputs to the promotion classifier of Subsubsection 5.6.4, not admissibility conditions.

A promotion bridge has **strict object maps** when

$$
\pi_{j+1}\;\not\factor\;\pi_j,
$$

equivalently when there exist $s,s'\in S$ with $\pi_j(s)=\pi_j(s')$ and $\pi_{j+1}(s)\neq\pi_{j+1}(s')$. A promotion bridge has **non-strict object maps** when $\pi_{j+1}$ factors through $\pi_j$, that is, when there exists a finite map $\phi:\mathrm{im}(\pi_j)\to O_{j+1}$ with $\pi_{j+1}=\phi\,\pi_j$. Strictness is a property of the typed object-map data. Strict object maps need not refine the old ones: $\pi_{j+1}$ may also merge points that $\pi_j$ separates, and strictness of two consecutive bridges then need not give strictness of the composite bridge (Subsubsection 10.7.1); when $\pi_j=r\circ\pi_{j+1}$, strictness is strict refinement of the fibre partition (Subsubsection 10.1.2). Strictness is not by itself a closure or drive claim, and the negative scope of Subsubsection 2.4.3 records the corresponding nonclaims (NC-10 and NC-11 of Subsection 15.2).
\end{claimdefinition}

### 4.5.3 Promotion Statuses

The promotion status set is

$$
\begin{aligned}
\mathrm{PromotionStatus}\;=\;\{\,&\texttt{candidate},\;\texttt{accepted},\;\texttt{strict},\;\texttt{non\_strict},\\
&\texttt{failed\_descent},\;\texttt{failed\_stability},\;\texttt{failed\_audit},\;\texttt{failed\_no\_smuggling},\\
&\texttt{local\_only},\;\texttt{globally\_obstructed},\;\texttt{outside\_scope}\,\}.
\end{aligned}
$$

The values $\texttt{strict}$ and $\texttt{non\_strict}$ are accepted-status refinements: a strict promotion is an accepted promotion in which the strictness condition $\pi_{j+1}\not\factor\pi_j$ holds, and a non-strict promotion is an accepted promotion in which $\pi_{j+1}$ factors through $\pi_j$. The classifier of Subsubsection 5.6.4 produces an accepted, strict, or non-strict verdict only when every required core gate in $\mathsf{GateResults}(B)$ passes; the failure-tagged values record specific gate failures (descent, stability, audit, no-smuggling), and $\texttt{local\_only}$ and $\texttt{globally\_obstructed}$ record the optional local-to-global gate's verdict. The verdict $\texttt{candidate}$ records a bridge whose required core gates have not yet been resolved, typically because at least one core gate has status $\texttt{not\_checked}$.

A promotion bridge with status $\texttt{strict}$ does not by that fact alone imply macro closure, descended dynamics, or drive: NC-10 and NC-11 of Subsection 15.2 record the corresponding strictness nonclaims, and the later no-go results are stated against these would-be implications.

## 4.6 Dependency and No-Go Judgments

Dependency judgments record typed relationships between content classes under an instrument. They are the working format for the no-go and bridge-required claims that appear throughout the paper, including the route-mismatch-requires-bridge dependency that keeps the drive face $\mathrm{P6}_{\mathrm{drive}}$ separate from generic $P_3$ holonomy. Like the other judgment families, dependencies have their own admissibility schema; theorem-grade no-go statements supported by countermodels are recorded in Sections 7 through 10 and Appendix C.

### 4.6.1 Judgment Form

The dependency judgment form is

$$
\Gamma\,;\;\mathcal C\,;\;I\;\vdash\;S\;\mathrel{\mathsf{dep}_r}\;X\;[\,H,\;A,\;V,\;\Theta\,],
$$

where $\Gamma$ is a finite typed context, $\mathcal C$ is a finite content context (typically a theory package, a model-realization module, or a content fragment of $\mathsf{Cont}$), $I$ is an admissible instrument, $S$ and $X$ are content classes (primitive labels, primitive role channels, named structural records, drive certificates, gating data, or any record drawn from $\mathsf{Cont}$), $r$ is the relation type, and $H,A,V,\Theta$ are the host, audit, visibility, and threshold records under which the dependency is asserted.

The relation types admitted by this paper are

$$
\begin{aligned}
\{\,&\texttt{suffices},\;\texttt{insufficient},\;\texttt{destroys},\;\texttt{blocks},\\
&\texttt{enables},\;\texttt{equivalent},\;\texttt{requires\_bridge},\;\texttt{outside\_scope}\,\}.
\end{aligned}
$$

The relation type fixes the polarity and form of the dependency; the host, audit, visibility, and threshold records fix the scope under which the dependency is asserted.

*Truth conditions.* Let $\Sigma$ be the class of admissible instances that contain the records $\Gamma,\mathcal C,I,H,A,V,\Theta$ and in which $I$ admits the dependency, that is, $\texttt{dependency}\in\mathsf{ClaimTypes}_I$, $H\in\mathsf{Hosts}_I$, and the records $\Gamma,\mathcal C,A,V,\Theta$ lie in $\mathsf{Scope}_I$ with level tags in $\mathsf{Levels}_I$, and read $S,X$ as predicates on the instances of $\Sigma$. $S\mathrel{\mathsf{dep}_{\texttt{suffices}}}X$ holds when every instance in $\Sigma$ satisfying $S$ satisfies $X$; $\texttt{insufficient}$ when some instance satisfies $S$ and not $X$ ($S\not\Rightarrow X$, Subsubsection 2.3.1); $\texttt{blocks}$ when every instance satisfying $S$ fails $X$; $\texttt{destroys}$ when $S$ names an operation on instances and, for every instance $\mathfrak D$ in $\Sigma$ satisfying $X$ to which it applies, the result $S(\mathfrak D)$ fails $X$; $\texttt{equivalent}$ when $S\Leftrightarrow X$ on $\Sigma$; $\texttt{enables}$ when some instance satisfies both; $\texttt{requires\_bridge}$ when $S\mathrel{\mathsf{dep}_{\texttt{insufficient}}}X$ and $S$ together with an admissible drive bridge (Subsubsection 9.3.5) $\mathrel{\mathsf{dep}_{\texttt{suffices}}}X$; this paper uses $\texttt{requires\_bridge}$ only with $X$ a drive predicate (Subsubsection 4.6.2, $\mathsf{CM}_2$). When a drive bridge by itself carries a certificate of $X$, as $B^{\mathrm{drive}}_{3\to6}$ does in Subsubsection 9.3.5, the second conjunct holds for every $S$; the judgment then asserts that $S$ is insufficient for $X$ and that a drive bridge is one admissible route to $X$. The judgment does not assert necessity: instances of $\Sigma$ may satisfy $X$ with no bridge of the named type (a cochain with a nonzero cycle integral certifies drive without $P_3$ data). Beyond $\texttt{insufficient}$, its additional requirement is that $S$ together with an admissible bridge of the named type suffices for $X$. Finally, $S\mathrel{\mathsf{dep}_{\texttt{outside\_scope}}}X$ holds when $I$ does not admit the dependency.

### 4.6.2 Dependency Claims

The dependency judgment family supports four categories of statement, each appearing throughout the paper.

**Positive dependency.** A statement of the form $S\mathrel{\mathsf{dep}_{\texttt{suffices}}}X$ or $S\mathrel{\mathsf{dep}_{\texttt{enables}}}X$ records that, under the named scope, $S$ supplies or enables $X$. Positive dependencies in this paper are typically theorem-grade results stated under explicit host, instrument, and audit assumptions: the descent theorem of Section 7, for example, gives a positive dependency from a vanishing descent defect to the existence of a descended map.

**Blocked dependency.** A statement of the form $S\mathrel{\mathsf{dep}_{\texttt{insufficient}}}X$, $S\mathrel{\mathsf{dep}_{\texttt{blocks}}}X$, or $S\mathrel{\mathsf{dep}_{\texttt{destroys}}}X$ records that $S$ does not support $X$ under the named scope, or actively obstructs it. Blocked dependencies are the natural form of the paper's no-go results: the gating-affinity-suppression theorem of Section 8, for instance, records a $\texttt{destroys}$ dependency from $P_2$-style support deletion to cohomological drive on the resulting forest.

**Bridge-required dependency.** A statement of the form $S\mathrel{\mathsf{dep}_{\texttt{requires\_bridge}}}X$ records that $S$ does not by itself yield $X$, but does so via a typed bridge admitted by $\mathsf{BridgePolicy}_I$. The canonical instance in this paper is the route-mismatch dependency

$$
P_3\;\mathrel{\mathsf{dep}_{\texttt{requires\_bridge}}}\;\mathrm{P6}_{\mathrm{drive}},
$$

recording that route mismatch or holonomy alone does not establish a drive certificate; an explicit drive bridge is required to infer a positive drive claim from route-mismatch data; a drive claim can also be certified directly by a cochain with a nonzero cycle integral (Subsubsection 8.1.2); a directed cell under the $\texttt{drive-certification}$ regime needs the required bridge of Subsubsection 5.5.2, a drive-type visibility bridge when the certified datum is suppressed, or a drive bridge of Subsubsection 9.3.5 named by its drive-check field when the certified datum is visible.

**Countermodel-supported no-go.** A statement of the form $S\mathrel{\mathsf{dep}_{\texttt{insufficient}}}X$ or $S\mathrel{\mathsf{dep}_{\texttt{blocks}}}X$ supported by a finite explicit countermodel construction. Sections 7, 8, 9, and 10 use this category for their no-go and separation results; the countermodel atlas of Section 9 and Appendix C records the constructions in full.

A dependency judgment is admissible when every component is finite and consistent with the surrounding instrument and content context, and when its relation label $r$ is one of the eight allowed values above. The label $\texttt{outside\_scope}$ records the case in which the surrounding instrument does not adjudicate the dependency.

## 4.7 Structural Downward Influence Versus Top-Down Causal Channels

The calculus records several forms of downward influence across packages, profiles, levels, and hosts. A macro package may select a representative substrate record by a completion or lift; a macro admissibility condition may exclude substrate states or histories; a phase, profile, or protocol record may index which substrate update rule is active. These are structural downward influences: they are paths, restrictions, or context-indexing records from a macro record to a substrate record.

They are not, by themselves, top-down causal channels. In this subsection "top-down channel" means an intervention-respecting difference-making record; it is distinct from the role channels $\mathrm{Chan}_i$ of Subsection 4.2, which are slots for the six roles. A completion, lift, representative map, feasibility restriction, or context index is a structural path unless the top-down channel gates pass. Such a record must exhibit an admissible finite family of macro interventions and an audited comparison showing that changing the macro intervention changes a substrate-future response under matched controls.

A macro record is a finite level-tagged or lens-related record $M$ in the current package: for example a package object, profile parameter, phase, protocol, admissibility gate, policy, abstract value, or promoted object-map value. A substrate record $X$ is a lower-level or finer-lens future observable, state predicate, update trace, or output record in the same host or a connected host. The macro/substrate relation is therefore relative to a package, lens, level profile, host, and bridge record, rather than an external micro/macro ontology.

\begin{claimdefinition}{Top-down channel record}
A top-down channel record is a finite tuple

$$
\mathsf{TopDownChannelRecord}_{M\to X}^{\lambda}
=
(M,X,\mathsf{StructPath},\mathsf{Interv}_M,\mathsf{Ctrl},\mathsf{Resp},D,\Theta,L,V,A,
\delta_{\mathrm{td}},\mathcal N).
$$

Here $M$ is a macro record relative to $(\mathcal T,I,\lambda)$, $X$ is a substrate-future record, $\mathsf{StructPath}$ is a declared record from $M$ to $X$ of one of the five structural kinds (completion, lift, representative map, feasibility restriction, context index) or an audited absence marker, $\mathsf{Interv}_M$ is a finite family of admissible macro interventions, $\mathsf{Ctrl}$ records matched controls, $\mathsf{Resp}$ records the substrate response under each intervention, $D$ is the host-supplied effect comparator, $\Theta$ is the effect threshold, $L,V,A$ are bridge, visibility, and audit records, $\delta_{\mathrm{td}}$ is the measured difference-making defect or certificate, and $\mathcal N$ records the required nonclaims.
\end{claimdefinition}

The calculus does not fix a universal probability metric for top-down channels. The host supplies the comparator $D_{\mathsf H}$ and threshold $\Theta_{\mathrm{td}}$; $\Theta_{\mathrm{td}}$ is an instance of $\Theta_{\ge\varepsilon}$ or $\Theta_{\in S}$ (Subsubsection 5.2.2) on $\delta_{\mathrm{td}}$. A probabilistic host may instantiate the comparator by total variation, KL divergence, or a channel-capacity quantity; a deterministic host may instantiate it by finite output inequality. The present calculus requires only that the comparator, threshold, source records, and audit be finite and visible or bridged.

*Reading the statements.* $\mathsf{StructDown}(M,X)$ says that a macro record $M$ constrains, indexes or maps to a substrate record $X$ by one of the structural paths listed above: a completion, lift, representative map, feasibility restriction or context index. $\mathsf{TopDownChannel}(R)$ is the claim that $R$ is a top-down channel from $M$ to $X$. Its claim-type tag is $\texttt{top\_down\_channel}$, its $\mathsf{Refs}$ consists of $R$ and all records held or named by its fields, and its audit field is the audit record $A$ of $R$, whose $\mathsf{ClaimRef}$ names this claim; its use-set is that of Subsubsection 3.2.1, and $G_{\mathrm{audit}}$, $G_{\mathrm{source}}$ and $G_{\mathrm{vis}}$ below read this $A$ and this use-set. It is classified by the claim classifier of Subsubsection 5.6.5; for this tag the check rules of every admissible $I$ that admits the tag assign the rejection verdict unless every gate of $\mathsf{TDGate}(R)$, whose nine gates are macro record, intervention, matched controls, feasibility, source, visibility, audit, no-smuggling and effect (in particular $G_{\mathrm{interv}}$ passes iff $|\mathsf{Interv}_M|\ge2$, and $G_{\mathrm{effect}}$ passes iff the set of comparator values of distinct matched interventions is nonempty and its maximum passes $\Theta_{\mathrm{td}}$; full conditions after the third proposition), passes (Subsubsection 3.4.1). The display of $\mathsf{TDGate}(R)$ and the paragraph after it, which follow the third proposition and the satisfiability example, give the pass conditions of all nine gates and define $\mathcal M$ and $\delta_{\mathrm{td}}$, which the three proofs use.

\begin{claimproposition}{Top-down channel gate soundness}
The claim

$$
\Gamma;\mathcal T;I
\vdash
\mathsf{TopDownChannel}(R):\texttt{accepted}
$$

is accepted only if the following gates pass: macro-record well-formedness, admissible intervention, matched controls, feasibility, source-of-truth, visibility, audit, no-smuggling, and effect threshold. In particular, the record must contain at least two admissible macro interventions and a host-supplied comparison satisfying

$$
\Theta_{\mathrm{td}}(\delta_{\mathrm{td}})=\texttt{pass}.
$$
\end{claimproposition}

\begin{proof}
The claim classifier of Subsubsection 5.6.5 returns $\texttt{accepted}$ only when no earlier row applies, in particular not the row $\texttt{rejected}$. For the tag $\texttt{top\_down\_channel}$, admissibility of $I$ (Subsubsection 3.4.1) requires its check rules to assign the rejection verdict whenever some gate of $\mathsf{TDGate}(R)$ does not pass; if the tag is not admitted, the claim is $\texttt{outside\_scope}$. Hence an accepted top-down channel claim has every gate passing: macro-record well-formedness, intervention, matched controls, feasibility, source, visibility, audit, no-smuggling and effect. The intervention gate requires at least two admissible macro interventions, and the effect gate is $\Theta_{\mathrm{td}}(\delta_{\mathrm{td}})=\texttt{pass}$.
\end{proof}

\begin{claimproposition}{Top-down channel implies structural downward influence}
An accepted top-down channel claim carries a positive structural dependency,

$$
\mathsf{TopDownChannel}(R):\texttt{accepted}
\;\mathrel{\mathsf{dep}_{\texttt{suffices}}}\;
\mathsf{StructDown}(M,X).
$$
\end{claimproposition}

\begin{proof}
By the previous proposition, acceptance requires the macro gate $G_{\mathrm{macro}}$ to pass, and that gate requires the field $\mathsf{StructPath}$ of $R$ to be a declared record from $M$ to $X$ of one of the five structural kinds. That record witnesses $\mathsf{StructDown}(M,X)$. Hence the accepted channel claim suffices for the structural-downward dependency.
\end{proof}

\begin{claimproposition}{Structural downward influence is insufficient for top-down channel acceptance}
Structural downward influence does not imply top-down causal-channel acceptance:

$$
\mathsf{StructDown}(M,X)
\;\mathrel{\mathsf{dep}_{\texttt{insufficient}}}\;
\mathsf{TopDownChannel}(R):\texttt{accepted}.
$$
\end{claimproposition}

\begin{proof}
A structural downward path records only that some macro-side record constrains, indexes, or maps to substrate-side data. Top-down channel acceptance requires strictly more data: at least two admissible macro interventions, matched controls, source-of-truth response records, visibility, audit, no-smuggling, and a passed effect threshold. The following finite instance provides the structural path without that data. The host is $\mathsf H_{\mathrm{fin}}$, with deterministic substrate states $\{0,1\}$, and the judging instrument $I$ is admissible, admits $\mathsf H_{\mathrm{fin}}$ and the claim types $\texttt{top\_down\_channel}$ and $\texttt{dependency}$, and has the records of the judgment in its scope with every recorded level tag in $\mathsf{Levels}_I$, so the instance lies in the class $\Sigma$ of Subsubsection 4.6.1; $M$ is a phase record of $\mathcal T$ with the single value $\phi_0$; $X$ is the next-state record; and $\mathsf{StructPath}$ is the context index by which $\phi_0$ selects the update rule $s\mapsto s$. Then $\mathsf{StructDown}(M,X)$ holds. Let $R$ carry this path, the one-element intervention family $\mathsf{Interv}_M=\{\phi_0\}$, and passing records for every gate except $G_{\mathrm{interv}}$ and $G_{\mathrm{effect}}$; record the audited absence of $\delta_{\mathrm{td}}$: with the single intervention $\phi_0$ there is no pair $m\neq m'$, so the comparison set $\mathcal M$ defined after the third proposition is empty and $G_{\mathrm{effect}}$ fails. Its intervention gate fails, since it requires two admissible macro interventions, so the check rules assign the rejection verdict and the claim $\mathsf{TopDownChannel}(R)$ is not $\texttt{accepted}$: it receives $\texttt{rejected}$, or a status of higher priority. So structural downward influence is insufficient for channel acceptance.
\end{proof}

The acceptance hypothesis of the first two propositions is satisfiable. Take the host and instrument of the last proof with a phase record $M$ attached to $\mathcal T$ (a record of $\mathcal T$ that exists before $R$), whose two values $\phi_0,\phi_1$ select the update rules $s\mapsto 0$ and $s\mapsto 1$, and let $\mathsf{StructPath}$ be the context index; give $R$ a profile $\lambda$ with $\mathsf{AdmProfile}(\lambda,I,\mathcal T)$. Let $\mathsf{Interv}_M=\{\phi_0,\phi_1\}$, each with a feasibility record whose audit passes; let $\mathsf{Ctrl}$ give both interventions initial state $0$ and the same background, support, package, profile and source policy; let $\mathsf{Resp}(\phi_k)$ be the recorded next state $k$, each carrying a $\texttt{committed\_state}$ source record listed in the $\mathsf{SourceRefs}$ of $A$; let $D$ be the output-inequality indicator and $\Theta_{\mathrm{td}}$ the threshold $D=1$; and let every used record be visible, every origin tag be $\texttt{target}$ and every role tag be $\texttt{other}$, with all six no-smuggling tests passing, and every audit check pass. All nine gates pass and $\delta_{\mathrm{td}}=1$, so under an admissible instrument whose host, levels, scope, visibility, evidence and source policies admit this claim and the committed response sources, whose claim types include $\texttt{top\_down\_channel}$, and whose check rules reject only when a gate fails, the claim $\mathsf{TopDownChannel}(R)$ is $\texttt{accepted}$.

A completion, lift, feasibility gate, or context index is a structural path. It becomes a top-down causal channel only when the intervention and matched-response gates pass. The required top-down gates are

$$
\mathsf{TDGate}(R)
=
(G_{\mathrm{macro}},G_{\mathrm{interv}},G_{\mathrm{matched}},G_{\mathrm{feas}},
G_{\mathrm{source}},G_{\mathrm{vis}},G_{\mathrm{audit}},G_{\mathrm{nosmuggle}},
G_{\mathrm{effect}}).
$$

The macro gate requires that $M$ be a package/profile record rather than a post hoc label, the intervention gate at least two macro choices, the matched-control gate a common background, and the feasibility gate feasible interventions; the source, visibility, audit and no-smuggling gates apply the source-of-truth, no-overreading, audit and anti-smuggling discipline to the records used by the top-down claim; and the effect gate is the host-specific threshold check $\Theta_{\mathrm{td}}$. Write $\varphi_R=\mathsf{TopDownChannel}(R)$ and $\mathcal L_R$ for the bridges recorded in $L$ and $V$. The pass conditions are as follows. $G_{\mathrm{macro}}$ passes iff $M$ is a record of $\mathcal T$ or of $\lambda$ whose identifier is not introduced by $R$, and $\mathsf{StructPath}$ is a record, not an absence marker, of one of the five structural kinds with source $M$ and target $X$. $G_{\mathrm{feas}}$ passes iff each $m\in\mathsf{Interv}_M$ has a feasibility record in the declared layer whose audit defect is $\texttt{audit\_passes}$. $G_{\mathrm{source}}$ passes iff each $\mathsf{Resp}(m)$ carries a source-of-truth record $R_m$ listed in the $\mathsf{SourceRefs}$ of $A$, and $\delta_6^{\mathrm{source}}(R_m;I)$ is $\texttt{committed}$, $\texttt{fallback\_admitted}$ or $\texttt{proxy\_admitted}$. $G_{\mathrm{vis}}$ passes iff $\delta_{\mathrm{vis}}(I,\varphi_R,\mathcal L_R)=\varnothing$ (Subsection 5.5). $G_{\mathrm{audit}}$ passes iff $\delta_6^{\mathrm{audit}}(A)$ is $\texttt{audit\_passes}$. $G_{\mathrm{nosmuggle}}$ passes iff the six violation tests of Subsubsection 5.4.2 are empty on the audited origin and role tags of $\mathsf{Use}(\varphi_R)$, using the visibility record of $R$ and $\delta_{\mathrm{vis}}(I,\varphi_R,\mathcal L_R)$; in the first test, an independent substrate-effect assertion used in place of the recorded response comparison is the forbidden premise. For the effect gate, let the values of $D$ have a declared decidable total order, and let $\mathcal M=\{D(\mathsf{Resp}(m),\mathsf{Resp}(m')):m\neq m'\in\mathsf{Interv}_M,\ \mathsf{Ctrl}(m)=\mathsf{Ctrl}(m')\}$. When $\mathcal M\neq\varnothing$, set $\delta_{\mathrm{td}}=\max\mathcal M$; otherwise record its audited absence and set $G_{\mathrm{effect}}=\texttt{fail}$. $G_{\mathrm{interv}}$ passes iff $|\mathsf{Interv}_M|\ge2$; $G_{\mathrm{matched}}$ passes iff $\mathsf{Ctrl}$ assigns all interventions the same background, initial class, support, package/lens, profile and source-policy record; and $G_{\mathrm{effect}}$ passes exactly when $\mathcal M\neq\varnothing$ and $\Theta_{\mathrm{td}}(\delta_{\mathrm{td}})=\texttt{pass}$, with $\delta_{\mathrm{td}}$ recomputed from $D$, $\mathsf{Resp}$ and $\mathsf{Ctrl}$.

The record is not assigned to a single primitive. Its macro package or representative path may use $P_5$, its feasible intervention family may use $P_2$, its layer/profile bridge may use $P_4$, its response or transition-law comparison may use $P_1$ when an induced operator is at issue, and its provenance, source, threshold, visibility, and no-smuggling checks are $P_6$-audited. $P_3$ route data may enter the record when protocol or order matters, but it is not by itself a channel certificate.

## 4.8 Instrument-Indexed Claims

Instrument-indexed claims are the most general judgment family in the calculus. Every nontrivial assertion in the paper — directed-cell, pair-observable, promotion, dependency, theorem, model-realization, or countermodel — is interpreted as an instrument-indexed claim under an admissible instrument. This subsection fixes the claim form at the level of generality required throughout the paper, and records the per-claim status set used by the classifier of Subsubsection 5.6.5; the classifier rules and the no-overreading and same-level self-audit theorems are stated in Section 11.

### 4.8.1 Claim Form

The general instrument-indexed claim form is

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\varphi\;:\;\chi,
$$

introduced at schema-grade in Subsubsection 3.4.2 and reused throughout the paper. Here $\Gamma$ is a finite typed context, $\mathcal T$ is an admissible theory package, $I$ is an admissible instrument, $\varphi$ is a claim with a finite use-set $\mathsf{Use}(\varphi)\subseteq\mathsf{Cont}$, and $\chi\in\mathrm{ClaimStatus}$ is the claim status assigned by the classifier of Subsubsection 5.6.5.

\begin{claimdefinition}{Instrument-indexed claim record}
A candidate claim record under $I$ is the finite typed tuple $\varphi(\mathcal T)=(\mathrm{id}_\varphi,\mathcal T,\mathsf{ClaimType},\mathsf{Content},\mathsf{LevelProfile},\mathsf{HostTag},\mathsf{EvidenceRefs},\Theta,A,V,\mathcal L,\mathcal N_\varphi,\mathsf{partialEvidence})$, whose fields are glossed in Subsubsection 11.1.2; its use-set is defined in Subsubsection 3.2.1, the reference graph of its circularity conditions in the Reference-graph paragraph of Subsubsection 5.6.5, the profile governing its audit's sources in Subsubsection 5.3.6, and $\mathsf{ClaimLog}(I)$ in Subsubsection 11.5.1: it carries an identifier, the target package $\mathcal T$, a finite declared claim-type tag, the claim content $\varphi$ with its use-set, a level profile and host tag, the source records consulted ($\mathsf{EvidenceRefs}$), threshold and audit records, a visibility record with its visibility bridges, and nonclaim records. The surrounding $\Gamma$ is judgment context, not a field of the tuple. The record is well formed exactly when it satisfies the conditions of Subsubsection 11.1.2. Membership of the claim-type tag in $\mathsf{ClaimTypes}_I$ is decided by the claim classifier. The shorthand

$$
I\;\vdash\;\varphi(\mathcal T)
$$

abbreviates $\Gamma;\mathcal T;I\vdash\varphi:\texttt{accepted}$ and is used in cross-references where the surrounding context is fixed; the shorthand never abbreviates instrument-free truth, and a statement of the form $I\vdash\varphi(\mathcal T)$ does not transfer to a different instrument $I'$ except through an explicit instrument-transfer bridge.
\end{claimdefinition}

### 4.8.2 Claim Status

The claim status set used for instrument-indexed claims is

$$
\begin{aligned}
\mathrm{ClaimStatus}\;=\;\{\,&\texttt{accepted},\;\texttt{rejected},\;\texttt{provisional},\;\texttt{blocked},\;\texttt{outside\_scope},\\
&\texttt{absent\_with\_record},\;\texttt{below\_threshold},\;\texttt{failed\_audit},\;\texttt{undefined\_circular}\,\}.
\end{aligned}
$$

The classifier defined by the claim-classifier table of Subsubsection 5.6.6 assigns one of these to every well-formed claim record. The values record specific verdicts:

- $\texttt{accepted}$: the claim is accepted by $I$ under $\Gamma,\mathcal T$ with admissible visibility, threshold, source, audit, and nonclaim data.
- $\texttt{rejected}$: the check rules of $I$ assign the rejection verdict, for example because a recomputed defect contradicts the claim or a required gate of the claim type fails.
- $\texttt{provisional}$: $\mathsf{partialEvidence}$ is true and the claim type lies in $\mathsf{ProvisionalTypes}_I$.
- $\texttt{blocked}$: the claim is in scope and a used record is suppressed without an admissible bridge or has unknown visibility, an entry of $\mathsf{EvidenceRefs}$ is not an admitted source record or fails $\Theta_{\mathrm{source}}$, or its audit records a failed source or visibility check; it is also the final default, for example when $\mathsf{partialEvidence}$ is true and the claim type is not in $\mathsf{ProvisionalTypes}_I$.
- $\texttt{outside\_scope}$: the claim's host tag is not in $\mathsf{Hosts}_I$, a level tag of its $\mathsf{LevelProfile}$ is not in $\mathsf{Levels}_I$, $\mathsf{Use}(\varphi)\not\subseteq\mathsf{Scope}_I$, or its claim type is not in $\mathsf{ClaimTypes}_I$.
- $\texttt{absent\_with\_record}$: a record that the content of $\varphi$ refers to is absent from $\Gamma$ or $\mathcal T$, and the absence is audited. An absent evidence source is not of this kind: an audited absence marker in $\mathsf{EvidenceRefs}$ does not resolve to a source record, so, unless the earlier $\texttt{outside\_scope}$ row applies, the claim receives $\texttt{blocked}$.
- $\texttt{below\_threshold}$: the audit's $\mathsf{ThresholdCheck}$ fails ($\texttt{threshold\_failure}\in\delta_6^{\mathrm{audit}}$), that is, a threshold of the family tested by $\mathsf{ThresholdCheck}$ (the claim's field $\Theta$, Subsubsection 4.9.2) does not evaluate to $\texttt{pass}$.
- $\texttt{failed\_audit}$: the audit record is missing, a recorded check result disagrees with its replay, or a nonclaim check fails (failure codes of the audit defect, Subsubsection 5.3.6).
- $\texttt{undefined\_circular}$: the claim depends on an unstratified circular support or audit loop, including the same-level self-audit case of Subsection 11.5.

The paper-facing claim strengths of Subsubsection 2.3.1 (theorem-grade, proposition-grade, schema-grade, model-only, countermodel-grade, future-work, excluded) and the per-claim instrument statuses above are different layers. Claim strength records how a numbered statement is presented in the manuscript; claim status records how an instrument classifies a finite claim record. A theorem-grade or proposition-grade statement, under the hypotheses recorded in its statement, is represented by an accepted instrument-indexed claim; a schema-grade record is a definition or rule that is not adjudicated as a claim unless separately wrapped as one; a model-only statement is adjudicated only inside its declared model host; a countermodel-grade statement is adjudicated with its finite countermodel record attached; future-work and excluded statements are not asserted as accepted claims in this paper.

## 4.9 Source, Provenance, and Audit Records (Reference)

*Used by:* The audit field $A$ of the directed-cell records used in Theorems 1--5 is an audit record of this subsection.

Source and audit records are the working format for the calculus's reproducibility and scope discipline. They are not themselves proofs, and admissibility under an instrument is not the same as instrument-free truth. This subsection records the source-record and audit-record schemas used throughout the paper, with explicit separation between the audit record $A$ and the inherited audit functional $\mathcal A$ of Foundations I.

### 4.9.1 Source Records

\begin{claimdefinition}{Source record}
A source record is a finite typed tuple

$$
\mathrm{src}\;=\;(\,\mathrm{id}_{\mathrm{src}},\;\mathrm{type}_{\mathrm{src}},\;\mathrm{trace}_{\mathrm{src}},\;\mathrm{valid}_{\mathrm{src}}\,),
$$

with the following finite components.

- $\mathrm{id}_{\mathrm{src}}$: a finite identifier under which the source is registered. Distinct source records carry distinct identifiers (Subsubsection 3.1.1).
- $\mathrm{type}_{\mathrm{src}}$: the source-type tag, drawn from the finite source-of-truth family

  $$
  \begin{aligned}
  \mathsf{SourceOfTruth}\;=\;\{\,&\texttt{committed\_state},\;\texttt{audited\_cell\_records},\;\texttt{independent\_pair\_witness},\\
  &\texttt{simulation\_trace},\;\texttt{ablation\_record},\;\texttt{fallback},\;\texttt{unknown},\;\texttt{contradictory}\,\},
  \end{aligned}
  $$

  The first five tags ($\texttt{committed\_state}$, $\texttt{audited\_cell\_records}$, $\texttt{independent\_pair\_witness}$, $\texttt{simulation\_trace}$, $\texttt{ablation\_record}$) are candidate source-of-truth tags whose force is determined by $\mathsf{SourcePolicy}_I$ and the surrounding profile; $\texttt{fallback}$ supports at most provisional pair-observable acceptance unless the record carries an audited source-upgrade bridge admitted by $\mathsf{SourcePolicy}_I$ and $\mathsf{BridgePolicy}_I$, and $\texttt{unknown}$ or $\texttt{contradictory}$ does not supply a full source-of-truth record.
- $\mathrm{trace}_{\mathrm{src}}$: a finite trace recording how the source was constructed and how it has been audited; entries are typed records consistent with $\mathsf{AuditPolicy}_I$ for the surrounding instrument.
- $\mathrm{valid}_{\mathrm{src}}$: a finite validity record, recording whether the source is currently within its declared validity window or condition.

A claim that depends on a source records the identifier of that source in its use-set. A claim whose source is $\texttt{unknown}$ or $\texttt{contradictory}$ does not supply a full source-of-truth record under any instrument that requires one; the resulting judgment is routed by the relevant source policy, typically to $\texttt{blocked}$ or $\texttt{outside\_scope}$. Provisional pair support comes only from an admitted fallback source or an admitted proxy source (row 4 of Subsubsection 5.6.3), never from an unknown or contradictory source.
\end{claimdefinition}

### 4.9.2 Audit Records

\begin{claimdefinition}{Audit record}
An audit record is a finite typed tuple

$$
\begin{aligned}
A\;=\;(\,&\mathsf{ClaimRef},\;\mathsf{EvidenceRefs},\;\mathsf{CheckRules},\;\mathsf{CheckResults},\;\mathsf{SourceRefs},\\
&\mathsf{VisibilityCheck},\;\mathsf{ThresholdCheck},\;\mathsf{CircularityCheck},\;\mathsf{Nonclaims},\;\mathsf{Provenance}\,),
\end{aligned}
$$

with the following components.

- $\mathsf{ClaimRef}$: a finite reference to the object or claim being audited. Targets include theory packages, directed cells, pair observables, promotion bridges, instrument-indexed claim records, dependency records, source records, visibility bridges ($A_L$), rotating-audit bridges, decorated squares ($A_\Xi$), absence markers, and branch-compatibility, attached-witness and feasibility records.
- $\mathsf{EvidenceRefs}$: the finite evidence references consulted by the audit. This field may name records of any type; it is distinct from the claim field $\mathsf{EvidenceRefs}$ (Subsubsection 11.1.2), which must name source records. Only $\mathsf{SourceRefs}$ is tested against the source policy.
- $\mathsf{CheckRules}$: the finite check rules, including the instrument and audit policy under which the audit is performed. An audit record without an instrumented check policy is malformed. An audit record filling the audit slot of a judgment under $I$, or the audit $A_L$ of a bridge registered under $I$, names $I$ in this field; so in the checks below the named instrument is the judging instrument.
- $\mathsf{CheckResults}$: the finite replay or check results produced by applying the check rules.
- $\mathsf{SourceRefs}$: the source records used by the audited claim or object.
- $\mathsf{VisibilityCheck}$: the finite visibility check under the named instrument. For the audit of a directed cell it is condition 8(a) of Subsubsection 4.3.3. For the audit of any other target $X$ it passes exactly when every record named by $\mathsf{EvidenceRefs}$ or $\mathsf{SourceRefs}$ lies in $\mathsf{Visible}_I$ or is bridged by an admissible bridge listed in the visibility field of $X$. For targets $X$ for which $\mathsf{AdmVisBridge}(L',I,X)$ is not defined, the bridged alternative is unavailable. For the audit $A_L$ of a visibility bridge $L=(\mathrm{id}_L,c,c',\ldots)$, its suppressed endpoint $c$ is exempt, but every other record named by $\mathsf{EvidenceRefs}$ or $\mathsf{SourceRefs}$ must be visible. The use-set of $X$ is tested by its classifier or gate ($\delta_{\mathrm{vis}}$, $G_{\mathrm{vis}}$), not by this check.
- $\mathsf{ThresholdCheck}$: the finite threshold check against the target's field $\Theta$ when present, and otherwise against the finite threshold family prescribed by $\mathsf{AuditPolicy}_I$, empty when none is prescribed. It passes exactly when $\mathsf{Eval}_\theta$ (Subsubsection 5.2.1) returns $\texttt{pass}$ for every threshold in that family; any other verdict ($\texttt{fail}$, $\texttt{not\_checked}$ or $\texttt{outside\_scope}$) makes it fail with code $\texttt{threshold\_failure}$.
- $\mathsf{CircularityCheck}$: the finite check that the audit does not rest on the verdict it supports. Let $X$ be the target of $\mathsf{ClaimRef}$ and $I$ the instrument named in $\mathsf{CheckRules}$. The check passes exactly when no record reachable from $\mathsf{EvidenceRefs}$ or $\mathsf{SourceRefs}$ (the named records themselves included) by resolved references (reachability in the reference graph of Subsubsection 5.6.5, whose edges go from each record to every record named by one of its resolved reference fields) is a verdict reference $\ulcorner X,I\urcorner$ naming the verdict of $X$ under $I$; its result is computed from these fields. A verdict reference to $X$ under an instrument other than $I$, in particular a higher one, does not by itself make the check fail.
- $\mathsf{Nonclaims}$: the nonclaim records required by the audited claim or object, namely those $\mathsf{AuditPolicy}_I$ lists for the target's record family or claim type (none if it lists none) and those its schema names (Subsubsections 11.7.3, 13.1.1). The check passes exactly when each required record is present in this field; its failure is the code $\texttt{nonclaim\_failure}$.
- $\mathsf{Provenance}$: the finite provenance trace of the audit record; every record it names is also named by $\mathsf{EvidenceRefs}$ or $\mathsf{SourceRefs}$, so the visibility and circularity checks cover it.

The audit passes only when its target resolves, its evidence resolves, the source-of-truth policy passes, visibility passes, thresholds pass, the circularity check passes, and the required nonclaims are present. The audit record family $\mathsf{Audit}$ of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is the finite collection of all such records used by judgments in the paper.

The audit record $A$ is distinct from the inherited audit functional $\mathcal A$ that lives inside a theory package $\mathcal T=(Z,f,\Sigma_f,E,\mathcal A)$: $\mathcal A$ is the package-internal audit functional, while $A$ is a finite audit record, certificate, trace, or evidence object. Compatibility with $\mathcal A$ is a separate typed condition when the inherited package audit functional is used. The two are not interchangeable, and a theorem that uses one does not by that fact use the other.

A drive certificate is a specialization of an audit record whose check data records the drive face $\mathrm{P6}_{\mathrm{drive}}$ — a nonzero cycle affinity, a nontrivial cohomology class, or another declared drive bridge — rather than a generic $P_6$ audit. A generic admissible audit record does not by itself supply a drive certificate; Subsubsection 5.3.6 records the drive-certificate schema and Section 8 states the no-drive theorems that constrain it.
\end{claimdefinition}

### 4.9.3 Evidence Hygiene

The discipline of the paper for using source and audit records is:

- a source record fixes which source a claim depends on, so that the claim's reliance on a real, fallback, dirty, proxy, unknown, or contradictory source is identifiable at the classifier step;
- an audit record fixes which checks a claim has passed or failed under a specific instrument, so that the claim is reproducible by anyone with access to the same records and the same audit policy;
- neither record asserts instrument-free truth. An audited record may be exact under one instrument and suppressed or outside-scope under another, and the instrument-transfer rule of Subsection 11.9 requires an admissible instrument-transfer bridge and a fresh verdict of the target instrument's classifier before a claim accepted under one instrument is classified under another; the no-overreading theorem of Section 11 separately ensures that an accepted claim uses suppressed content only through admissible bridges.

NC-15 of Subsection 15.2 records the corresponding nonclaim: $A$ passing under $I$, $\mathcal T$, and the surrounding scope yields acceptance under that scope, not instrument-free truth. Audits and source records record the hygiene of the calculus, not its conclusions; the conclusions are theorems whose proofs use the records together with the typed witness, update, profile, level, visibility, and threshold data of the surrounding judgments.

## 4.10 Domain Instance Admissibility (Reference)

*Used by:* the theorems of Sections 5 through 14, each of which assumes an admissible instance.

This subsection records the admissibility conditions on a full domain instance $\mathfrak D\in\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. Sections 5 through 14 work with admissible instances throughout, and the hypothesis "let $\mathfrak D$ be admissible" is implicit in every universally stated theorem.

### 4.10.1 Admissible Instance

A full domain instance $\mathfrak D\in\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is admissible, written

$$
\mathsf{AdmDomain}(\mathfrak D),
$$

when every component of the instance is finite and every record in every component meets its admissibility schema:

- $\mathbb P=\{P_1,\ldots,P_6\}$ is the fixed finite primitive set of Subsubsection 2.2.1.
- $\mathsf{Lev}=\{\mathsf{Beh},\mathsf{Ver},\mathsf{Str}\}$ is the fixed finite level set of Subsubsection 2.2.3.
- $\mathsf{Host}$ is a finite subfamily of the host inventory of Subsubsection 2.1.2; only hosts named in $\mathsf{Host}$ may appear on the host tag of any record in the instance.
- $\mathsf{Cont}$ is the finite content universe of the instance (Subsection 3.2): finite typed records, each with a host tag from $\mathsf{Host}$, a level tag from $\mathsf{Lev}$, an instrument-relative visibility class drawn from Subsection 3.5, and a profile attachment when required.
- All references among content records resolve, or else the missing reference is represented by an explicit absence record (a typed, audited absence record, Subsubsection 3.7.3).
- $\mathsf{Instr}$ is a finite family of admissible instruments, each meeting the conditions of Subsubsection 3.4.1.
- $\mathsf{Pkg}$ is a finite family of admissible theory packages, each meeting the conditions of Subsubsection 3.3.3.
- $\mathsf{Prof}$ is a finite family of finite typed profile records in the schema of Subsubsection 3.6.1; $\mathsf{AdmProfile}(\lambda,I,\mathcal T)$ is relative to the instrument and package of the judgment carrying $\lambda$ and is checked with that judgment (step 4 of Subsubsection 6.3.1), not as a condition on the instance.
- $\mathsf{Wit}$ and $\mathsf{Upd}$ are the witness and update maps of Subsubsections 3.7.1–3.7.2; their values on each $P_i$ are finite typed families, with the present-or-audited-absence slot rule of Subsubsection 3.7.3 enforced on every directed-cell record.
- $\mathsf{Def}$ is a finite family of admissible defect records in the schema of Subsubsection 5.2.1.
- $\mathsf{Judg}$ is the finite family of judgment forms introduced in Subsections 4.2 through 4.8 (role-channel, directed-cell, pair-observable, promotion, dependency, instrument-indexed claim), together with the model-realization judgment of Subsubsection 13.1.1.
- $\mathsf{Status}$ is the finite family of the seven status sets of Subsection 5.1: those of the role-channel, directed-cell, pair-observable, promotion and claim judgments, and those of gate and square records.
- Threshold records are finite and typed in the threshold schema of Subsection 5.2.
- The evaluation dependency graph of Subsubsection 5.3.6 is acyclic.
- $\mathsf{Gate}$ is the finite family of gate specifications used in Sections 10 and 11, with the gate status sets $\mathrm{GateStatus}$, $\mathrm{StrictGateStatus}$ and $\mathrm{LocGlobGateStatus}$ from Subsubsection 5.1.6; promotion gates are explicit whenever a promotion judgment is claimed.
- $\mathsf{Dep}$ is a finite family of admissible dependency records in the schema of Subsection 4.6.
- $\mathsf{Audit}$ and $\mathsf{Source}$ are finite families of admissible audit and source records in the schemas of Subsubsections 4.9.2 and 4.9.1.
- $\mathsf{Vis}$ is the finite family of visibility maps and visibility bridges of Subsection 3.5.
- $\mathsf{Nonclaim}$ is a finite family of admissible nonclaim records, attached either to instruments (as $\mathcal N_I$) or to individual judgments.
- $\mathsf{Real}$ is a finite family of admissible model-realization modules; admissibility of a model-realization module is the schema fixed in Section 13.

A full instance that satisfies all of the above is the working object of every theorem in Sections 5 through 11 and of every model-only realization statement in Section 13. Admissibility is a finite check on finite records: it composes the per-component admissibility checks of Sections 3 and 4 into a single instance-level condition and feeds the well-formedness, classifier, gate, and audit machinery of Sections 5 through 11.

### 4.10.2 Exclusion Conditions

A candidate instance is rejected as outside the scope of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ when any of the following holds:

- a component of the tuple is missing or infinite;
- a host tag on any record points to a host outside $\mathsf{Host}$ (in particular, outside the host inventory of Subsubsection 2.1.2);
- a level tag on any record points outside $\mathsf{Lev}$;
- a theory package fails $\mathsf{AdmPkg}$ from Subsubsection 3.3.3, including missing inherited Foundations I data $(Z,f,\Sigma_f,E,\mathcal A)$ or missing Foundations III attached records;
- an instrument fails the instrument admissibility conditions of Subsubsection 3.4.1;
- a profile record is not a finite typed record of the schema of Subsubsection 3.6.1;
- a present witness or update has the wrong primitive signature, or an absence marker lacks its required typed, passing audit;
- a directed-cell, pair-observable, promotion, dependency, or claim record has unresolved references, missing required fields, or status-family collapse where the record uses a status from one family in place of another;
- an audit record is malformed, has unresolved evidence/source references, or has no $\mathsf{Nonclaims}$ field;
- a source record is malformed or has unresolved references;
- a model-realization module lacks a declared fragment $\mathcal S$, or its nonclaim register lacks the model-realization nonclaims of Subsection 13.6 (clause 5 of Subsubsection 13.1.1; NC-19 of Subsection 15.2).

The exclusions concern the form of a record, not the outcome of its checks. A well-formed record whose visibility, threshold, audit or source check fails stays in the instance; where the applicable classifier has a matching condition, it assigns the status prescribed by Subsection 5.6. In particular, claim failures can receive $\texttt{blocked}$, $\texttt{below\_threshold}$, $\texttt{undefined\_circular}$ or $\texttt{failed\_audit}$, and every well-formed cell receives a cell status from one of the rows $\texttt{outside\_scope}$ through $\texttt{action}$ (Theorem 4). Role-channel records and theory packages are the exceptions: for in-scope role evidence, visibility and audit passage are well-formedness conditions (Subsubsection 5.6.1), and a package is admissible only when its audit functional passes every entry of its audit record family (Subsubsection 3.3.3), so a package with a failing audit entry falls under the fourth exclusion above. A candidate directed cell over $\mathfrak D$ (Theorem 3) is a tuple of the form of Subsubsection 4.3.1 whose fields are records of $\mathfrak D$ or audited absence markers; it is not assumed to be a record of $\mathfrak D$, and the exclusions above do not apply to it. Because $\mathsf{AdmDomain}(\mathfrak D)$ requires the $\mathsf{ClaimRef}$ of every audit record of $\mathfrak D$ to resolve in $\mathsf{Cont}$, a candidate whose audit slot holds a present record of $\mathfrak D$ meets condition 8(a) only if it is itself a record of $\mathfrak D$; a candidate outside $\mathfrak D$ can be well formed only with an audited absence marker in its audit slot. A malformed candidate receives no status and does not make $\mathfrak D$ inadmissible.

A claim, judgment, or theorem stated against a rejected candidate instance is not interpreted in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ and is excluded from the formal scope of this paper. Sections 5 through 14 work with admissible instances throughout, and a hypothesis "let $\mathfrak D$ be admissible" is implicit in every theorem statement.
