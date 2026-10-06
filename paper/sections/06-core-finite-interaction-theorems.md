# 6. Core Finite Interaction Theorems

*Reading key.* The status computations below use the directed-cell table of Subsubsection 5.6.6: rows are tested from top to bottom and the first that holds gives the status. Theorem 1 needs two records on one pair that trigger the $\texttt{action}$ row and the $\texttt{blocked}$ row (a too-weak bridge). Theorem 2 needs one $\texttt{action}$ cell with $i\neq j$. Theorem 4 is the first-match rule plus exhaustiveness of the rows $\texttt{outside\_scope}$ through $\texttt{action}$. Theorem 5 compares first-match outputs of different tables on records that share data. In order, the rows test: $\texttt{outside\_scope}$ (a host or level tag outside $I$, or a use outside $\mathsf{Scope}_I$); $\texttt{absent}$ (an audited absence marker in the $W$ or $U$ slot, with neither $\texttt{missing\_audit}$ nor $\texttt{failed\_audit}$); $\texttt{blocked}$ (a nonempty required-bridge, weak-bridge, overread or unknown defect, or one of the codes $\texttt{source\_failure}$, $\texttt{visibility\_failure}$, $\texttt{missing\_audit}$, $\texttt{failed\_audit}$, $\texttt{nonclaim\_failure}$); $\texttt{undefined\_circular}$ ($\texttt{circular\_audit}$); $\texttt{collapsed}$ ($\texttt{total\_collapse}$ or $\texttt{singleton\_collapse}$); $\texttt{below\_threshold}$ ($W$ and $U$ present and $\texttt{threshold\_failure}$); $\texttt{trivial}$ ($\mathsf{noopU}$ or $\texttt{identity\_package}$); $\texttt{implicit}$ ($\mathsf{implicitW}$); $\texttt{action}$ (none of the above, with the remaining conditions of its row); and a final default row $\texttt{blocked}$ that no well-formed cell reaches.

Sections 2 through 5 declared the finite audited interaction calculus, its judgment families, and the status and defect schemas. This section proves the core theorems of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$: directed-cell status does not factor through the primitive pair, active typed interaction does not identify primitive roles, well-formedness of directed cells is decidable, every covered well-formed directed cell receives a unique status, and the five judgment-attached status families are not collapsed into one. All five theorems are theorem-grade, stated under explicit host, instrument, and admissibility assumptions, and proved finitely.

Theorems 1–4 use the definitions listed in the reader's map of Subsection 1.4, together with the profile grammar of Subsubsection 3.6.1, the source-record schema of Subsubsection 4.9.1 and $\delta_{\mathrm{vis}}$ at the head of Subsection 5.5; a reader who starts here needs no other part of Sections 3–5. Theorem 5 also uses Subsubsections 5.6.1, 5.6.3 and 5.6.4, Subsubsection 11.5.1, and one fact from each of three later theorems: the bridge $B^{\mathrm{Toy22}}_{0\to1}$ of Theorem 22 is admissible and classified $\texttt{strict}$ under $I_{\mathrm{prom}}$, by Theorem 24 no admissible instrument $I$ accepts the claim $\mathrm{Sound}(I)$ about itself, and clause 4 of Theorem 25 applies to the one-instrument chain $(I_{\mathrm{prom}})$ with $N=0$. Theorems 22, 24 and 25 do not use Theorem 5 (Appendix G lists these as cross-stage edges), so there is no circularity; cases (a)–(c) can be read now and cases (d)–(e) after Subsections 11.5 and 11.8.

## 6.1 Theorem 1: No Total Six-Symbol Algebra

The two records of Theorem 1 are the running example of Subsection 3.8, the cell $P_6\leftarrow P_3$ classified $\texttt{action}$, and the cell described at the end of that subsection, with the same pair, a drive-certification update and a registered drive bridge too weak for the drive-certification profile, classified $\texttt{blocked}$. Subsubsection 6.1.1 lists the fields of both.

\begin{claimtheorem}{Theorem 1 (NoTotalAlgebra)}
Across admissible instances of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$, let $\mathsf{CellData}$ be the class of typed directed-cell records together with their instance and judgment context, with the projection

$$
\mathsf{pair}\colon\mathsf{CellData}\to\mathbb P\times\mathbb P,\qquad C\mapsto(P_i,P_j)
$$

extracting the actor and informant primitive labels of $C$, and the status assignment

$$
\mathsf{status}\colon\mathsf{CoveredCell}\to\mathrm{CellStatus}
$$

returning, on the covered records $\mathsf{CoveredCell}\subseteq\mathsf{CellData}$ of Subsubsection 4.3.3, the directed-cell status of $C$ given by the rows of the directed-cell table of Subsubsection 5.6.6 (glossed in Subsubsection 5.6.2). There exist covered records $C_{\mathrm{act}},C_{\mathrm{blk}}\in\mathsf{CoveredCell}$ with

$$
\mathsf{pair}(C_{\mathrm{act}})\;=\;\mathsf{pair}(C_{\mathrm{blk}})\;=\;(P_6,P_3),\qquad\mathsf{status}(C_{\mathrm{act}})\;=\;\texttt{action},\qquad\mathsf{status}(C_{\mathrm{blk}})\;=\;\texttt{blocked}.
$$

Consequently $\mathsf{status}$ does not factor through the restriction of $\mathsf{pair}$ to $\mathsf{CoveredCell}$:

$$
\mathsf{status}\;\not\factor\;\mathsf{pair}|_{\mathsf{CoveredCell}}.
$$

In particular, there are no maps $*\colon\mathbb P\times\mathbb P\to\mathbb P$ and $d\colon\mathbb P\to\mathrm{CellStatus}$ with $\mathsf{status}=d\circ *\circ\mathsf{pair}$ on $\mathsf{CoveredCell}$. Both records lie in one admissible instance: the variant of the instance of Subsection 3.8 that adds $C_{\mathrm{blk}}$, $V'$, $A'$ and the verdict reference of $C_{\mathrm{blk}}$, with these records added to $\mathsf{Scope}_I$ and $\mathsf{Visible}_I$ (item *Scope* of Subsection 3.8). Moreover, $C_{\mathrm{blk}}$ can be replaced by the record $C_{\mathrm{reg}}$ that differs from $C_{\mathrm{act}}$ only in the regime of its profile, set to $\texttt{drive-certification}$, in the target of its audit, and in its recomputed defect record, which contains $\delta_{\mathrm{reqbridge}}=\{\texttt{drive}\}$ (Subsubsection 3.6.3); $C_{\mathrm{reg}}$ is covered with status $\texttt{blocked}$. Finally, status is non-constant on every fibre of $\mathsf{pair}|_{\mathsf{CoveredCell}}$: for every $(P_i,P_j)\in\mathbb P^2$, including $i=j$, the instance of Subsection 3.8 with two cells on $(P_i,P_j)$ added, together with their visibility, audit and verdict-reference records, in the same way, contains covered cells of statuses $\texttt{absent}$ and $\texttt{blocked}$.
\end{claimtheorem}

### 6.1.1 Witness Records

The theorem is stated under the following finite admissibility assumptions:

- $\mathbb P=\{P_1,\ldots,P_6\}$ is the fixed finite primitive set of Subsubsection 2.2.1.
- $\mathsf{CellData}$ is the class of typed directed-cell records of Subsection 4.3, finite typed tuples $(P_i\leftarrow P_j,W_j,U_i,L,V,\Theta,A,\delta)^{\lambda}$ together with $\Gamma,\mathcal T,I$; its subclass $\mathsf{CoveredCell}$ consists of the covered records of Subsubsection 4.3.3 (by Theorem 4, exactly the well-formed records; the proof below checks the rows of both records directly and does not use Theorem 4).
- $\mathrm{CellStatus}$ is the directed-cell status set fixed in Subsubsection 4.3.4 and Subsubsection 5.1.2.
- $\mathsf{status}$ is the classifier of Subsubsection 5.6.2, applied to covered records.
- $C_{\mathrm{act}}$ is the running example $\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}$ of Subsection 3.8, with the fields listed there. Both witnesses occur in the running-example instance extended by $C_{\mathrm{blk}}$; the counterexample shows that no pair decoder works across the calculus.
- $C_{\mathrm{blk}}=\mathsf{Cell}_{63}^{\lambda_{\mathrm{drive}}}=(P_6\leftarrow P_3,W_3,U_6',L,V',\Theta,A',\delta')$ has the following fields. $W_3=\mathsf{RouteMismatchWit}$, $L$ and $\Theta$ are those of $C_{\mathrm{act}}$. The update is $U_6'=\mathsf{CertifyDrive}\in\mathsf{Upd}(P_6)$. The profile $\lambda_{\mathrm{drive}}$ agrees with $\lambda_{\mathrm{audit}}$ except that its regime is drive certification and its bridge type is $\texttt{drive}$, admitted by $\mathsf{BridgePolicy}_I$. Let $x\in\mathsf{Cont}$ be the candidate drive-certificate record named by the entry field of $U'_6$ (a record-identifier field, so $x\in\mathsf{Use}(C_{\mathrm{blk}})$), with $x\in\mathsf{Suppressed}_I$. The visibility record $V'$ marks $x$ suppressed and every other field of the cell and record of $\mathsf{Use}(C_{\mathrm{blk}})$ visible, and lists $L_{\mathrm{drive}}$ as the sole member of $\mathcal L=\{L_{\mathrm{drive}}\}$ bridging $x$, an audited bridge of the drive type registered by $\mathsf{BridgePolicy}_I$. The bridge is registered but has strength below that required by $\lambda_{\mathrm{drive}}$: $\mathsf{Strength}(L_{\mathrm{drive}})=\texttt{weak}<\texttt{strong}=\mathsf{RequiredStrength}(C_{\mathrm{blk}})$ (item *Bridge strengths*, Subsection 3.8). The drive-check field of $U'_6$ names $L_{\mathrm{drive}}$. The audit record $A'$ has the cell as target, recomputes the two composites at $\{a\}$ as in $C_{\mathrm{act}}$, records the failed strength comparison and that no drive certificate is asserted, and its source references and nonclaim field are as in $C_{\mathrm{act}}$; its $\mathsf{VisibilityCheck}$ fails, because of that strength comparison, and its other checks pass.
- *Computed defects of $C_{\mathrm{blk}}$.* The defect record $\delta'$ records the computed values of Subsection 5.5 and Subsubsection 5.3.6. Since $x\in\mathsf{Use}(C_{\mathrm{blk}})$ is suppressed, $L_{\mathrm{drive}}$ bridges $x$, $\mathsf{Strength}(L_{\mathrm{drive}})<\mathsf{RequiredStrength}(C_{\mathrm{blk}})$, and $L_{\mathrm{drive}}$, the only bridge at $x$, is therefore not admissible, the computed weak-bridge defect is $\delta'_{\mathrm{weakbridge}}=\{(x,L_{\mathrm{drive}})\}$; since $x$ has a registered bridge, $\delta'_{\mathrm{overread}}=\varnothing$; the other use-set elements are visible, so the remaining visibility defects are empty; the regime of $\lambda_{\mathrm{drive}}$ is drive certification and $L_{\mathrm{drive}}$ is too weak, so $\delta'_{\mathrm{reqbridge}}=\{\texttt{drive}\}$; and the visibility check of $A'$ fails while its other checks pass, so $\delta_6^{\mathrm{audit}}=\{\texttt{visibility\_failure}\}$.

\begin{proof}
Both records pass the checks of Subsubsection 6.3.1: their labels are in $\mathbb P$, $W_3\in\mathsf{Wit}(P_3)$, $\mathsf{AddAuditRecord},\mathsf{CertifyDrive}\in\mathsf{Upd}(P_6)$, the profiles are admissible and every reference resolves. Both project to $(P_6,P_3)$. By Subsubsection 5.6.6, $C_{\mathrm{act}}$ meets no row above $\texttt{action}$ and meets the $\texttt{action}$ row, so it is covered with status $\texttt{action}$. For $C_{\mathrm{blk}}$, the row $\texttt{outside\_scope}$ fails since its host, levels and content are those of $C_{\mathrm{act}}$; the row $\texttt{absent}$ fails since $W_3$ and $U_6'$ are present; and the row $\texttt{blocked}$ holds since the registered bridge is too weak, as witnessed by $(x,L_{\mathrm{drive}})\in\delta'_{\mathrm{weakbridge}}$. So $C_{\mathrm{blk}}$ is covered with status $\texttt{blocked}$.

Suppose for contradiction that $\mathsf{status}$ factored through $\mathsf{pair}$: that is, suppose there were a map

$$
g\colon\mathbb P\times\mathbb P\to\mathrm{CellStatus}
$$

such that $\mathsf{status}(C)=g(\mathsf{pair}(C))$ for every $C\in\mathsf{CoveredCell}$. Apply this to the two records $C_{\mathrm{act}},C_{\mathrm{blk}}$ constructed in the first paragraph. Since $\mathsf{pair}(C_{\mathrm{act}})=\mathsf{pair}(C_{\mathrm{blk}})$, evaluating $g$ at this common pair gives

$$
\mathsf{status}(C_{\mathrm{act}})\;=\;g\bigl(\mathsf{pair}(C_{\mathrm{act}})\bigr)\;=\;g\bigl(\mathsf{pair}(C_{\mathrm{blk}})\bigr)\;=\;\mathsf{status}(C_{\mathrm{blk}}),
$$

contradicting $\mathsf{status}(C_{\mathrm{act}})=\texttt{action}\neq\texttt{blocked}=\mathsf{status}(C_{\mathrm{blk}})$. Hence no such $g$ exists, and $\mathsf{status}$ does not factor through $\mathsf{pair}$.

A total operation $*\colon\mathbb P\times\mathbb P\to\mathbb P$ followed by a decoder $d\colon\mathbb P\to\mathrm{CellStatus}$ is the special case $g=d\circ *$, which is itself a map $\mathbb P\times\mathbb P\to\mathrm{CellStatus}$. The same argument applies, and no such $(*,d)$ pair can encode $\mathsf{status}$ faithfully.

For $C_{\mathrm{reg}}$: its profile is admissible, since $(\texttt{fine},\texttt{drive-certification},\texttt{local},\mathsf H_{\mathrm{fin}})\in\mathsf{Compat}_I$ and its bridge type and mode are those of $\lambda_{\mathrm{audit}}$. It uses no suppressed record, so its visibility defects are empty. $\delta_{\mathrm{reqbridge}}$ is not part of the visibility defect, so its audit checks are those of $C_{\mathrm{act}}$, retargeted to $C_{\mathrm{reg}}$, and it passes steps 1–8 of Subsubsection 6.3.1. The rows $\texttt{outside\_scope}$ and $\texttt{absent}$ fail as for $C_{\mathrm{act}}$. $\mathsf{AddAuditRecord}$ has no bridge-check field, so $\delta_{\mathrm{reqbridge}}(C_{\mathrm{reg}})=\{\texttt{drive}\}$ and the first $\texttt{blocked}$ row holds. For the last clause, fix $(P_i,P_j)$, including $i=j$. Extend the running instance by two cells and their supporting records, all typed on $\mathsf H_{\mathrm{fin}}$ at $\mathsf{Ver}$, and include every new record in the instrument's scope and visible set. Both cells use the $L$ and $\lambda_{\mathrm{audit}}$ of $C_{\mathrm{act}}$, typed audited absence markers for $P_j$ and $P_i$ in their witness and update slots, and $\Theta_{\mathrm{audit}}$ on the witness marker's distinct passing absence audit. Give the first cell a passing audit naming it and the second a typed, audited absence marker in its audit slot. For each cell construct a visibility record marking every field and every record of its use-set visible, and recompute its defect record and audit checks as required by Subsubsection 6.3.1. Both cells are well formed and in scope. The first meets the $\texttt{absent}$ row. The second has $\delta_6^{\mathrm{audit}}=\{\texttt{missing\_audit}\}$ by condition 8(b), so the $\texttt{absent}$ row fails and the first $\texttt{blocked}$ row holds.
\end{proof}

### 6.1.2 Consequence

The running example of Subsection 3.8 supplies the hypothesis of Theorem 1. Its cell on $P_6\leftarrow P_3$ has status $\texttt{action}$, and the blocked cell constructed in Subsubsection 6.1.1 and restated in $\mathsf{CM}_7$ keeps the same pair but replaces the update by $\mathsf{CertifyDrive}$ under a profile that requires a drive bridge; its only registered drive bridge is too weak for that profile, so that cell is $\texttt{blocked}$.

Directed cells $P_i\leftarrow P_j$ are typed bridge judgments, not primitive products. The notation is closed against algebraic interpretation: there is no underlying multiplication of primitives whose values can determine cell status, and the typed witness, update, profile, level, visibility, threshold, audit, and defect data carried by every cell record are essential for the classifier's verdict. NC-1 of Subsection 15.2 is the corresponding nonclaim. Subsequent sections of this paper use directed-cell records, not primitive-pair labels, as the working unit of typed interaction; in particular, Section 13's PICA model-realization sheet does not interpret the $6\times 6$ table as a universal interaction algebra.

## 6.2 Theorem 2: Typed Non-Collapse

The running example of Subsection 3.8 is a well-formed active cell whose actor $P_6$ and informant $P_3$ differ.

\begin{claimtheorem}{Theorem 2 (TypedNonCollapse)}
There exists a well-formed active directed cell

$$
\mathsf{Cell}_{ij}^{\lambda}\;=\;(\,P_i\leftarrow P_j,\;W_j,\;U_i,\;L,\;V,\;\Theta,\;A,\;\delta\,)
$$

in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ with $i\neq j$ and status $\texttt{action}$. Therefore active typed interaction does not imply equality of the actor and informant primitives:

$$
\mathsf{Cell}_{ij}^{\lambda}\;:\;\texttt{action}\;\;\not\Rightarrow\;\;P_i\;=\;P_j.
$$

More generally, for each $\sigma\in\mathrm{CellStatus}$ there is an admissible instance containing a well-formed cell on the pair $(P_6,P_3)$ with status $\sigma$; so no cell status forces actor and informant to coincide.
\end{claimtheorem}

\begin{proof}
The proof uses the type separation of the witness and update families of Subsection 3.7 and the finite active-cell record supplied by the calculus.

A directed cell is a record

$$
(P_i\leftarrow P_j,\;W_j,\;U_i,\;L,\;V,\;\Theta,\;A,\;\delta)
$$

with the typing rules of Subsubsection 3.7.3:

$$
W_j\;\in\;\mathsf{Wit}(P_j),\qquad U_i\;\in\;\mathsf{Upd}(P_i).
$$

The rules carry both primitive labels as part of the data of the cell; they do not assert any equality relation between $P_i$ and $P_j$. The record constructor permits distinct primitive labels, for example $P_1\leftarrow P_5$ for descent through a package or $P_3\leftarrow P_5$ for noncommuting completions, with witness data drawn from the informant family and update data drawn from the actor family. The running example $\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}$ of Subsection 3.8 is such a cell: it is well formed, the table of Subsubsection 5.6.6 gives it $\texttt{action}$ (last column), and $6\neq3$. This single admissible active cross-primitive cell refutes the implication from active directed-cell status to primitive equality.

The typing rule constrains $W_j$ and $U_i$ separately and states no relation between $i$ and $j$, so the judgment form does not entail $P_i=P_j$; the nine variants below exhibit, for every status, a well-formed cell whose actor $P_6$ differs from its informant $P_3$.

The typing rule also admits diagonal cells $P_i\leftarrow P_i$, whose witness and update are drawn from the distinct families $\mathsf{Wit}(P_i)$ and $\mathsf{Upd}(P_i)$; the last clause of Theorem 1 exhibits, on every diagonal pair, covered cells of statuses $\texttt{absent}$ and $\texttt{blocked}$.

For each of the nine cell statuses there is moreover a well-formed cell on the pair $(6,3)$, with $P_6\neq P_3$, that receives it; each is a coherent finite variant of the running-example template of Subsection 3.8: change the indicated status-determining datum, then recompute its dependent audit, threshold, visibility, defect, and instance records as required by Subsubsection 6.3.1, step 8, and check the result against the table of Subsubsection 5.6.6. Except where stated, each variant keeps $W_3$, $U_6$, $L$, $V$ and $\Theta$, has empty visibility and required-bridge defects, no package-collapse entry, $\mathsf{implicitW}=\mathsf{noopU}=\mathrm{false}$ and $\delta_6^{\mathrm{audit}}=\varnothing$, so every row before the one named fails.

- $\texttt{outside\_scope}$: judge the cell under a new instrument $I'$ with a fresh identifier that otherwise differs from $I$ only in $\mathsf{Scope}$, $\mathsf{Visible}$ and $\mathsf{vis}$; $I$ stays in the instance, so the records naming $I$ still resolve: its scope keeps the host and level tags of $I$ and the record $x$ but omits every record of $\mathsf{Use}(C)$, including $C$ itself, which the $\mathsf{ClaimRef}$ of $A$ names, $\mathsf{Suppressed}_{I'}=\{x\}$ and $\mathsf{Visible}_{I'}=\mathsf{Scope}_{I'}\setminus\{x\}$. $I'$ is admissible, since its check rules and the audit's rules are those of $I$. Reissue $V$ and $A$ under $I'$, so that $A$ names $I'$ in its $\mathsf{CheckRules}$ field. Step 8 then gives $\delta_{\mathrm{outside}}=\mathsf{Use}(C)$ and $\delta_6^{\mathrm{audit}}=\{\texttt{visibility\_failure},\texttt{threshold\_failure}\}$: the threshold datum lies in $W_3\notin\mathsf{Scope}_{I'}$, so $\mathsf{Eval}$ returns $\texttt{outside\_scope}$ and the $\mathsf{ThresholdCheck}$ fails (Subsubsections 5.2.2 and 4.9.2). The first row holds and takes priority.
- $\texttt{absent}$: the witness slot is replaced by an audited absence marker, $\Theta$ is replaced by $\Theta_{\mathrm{audit}}$ on the audit defect of the marker's absence audit (a record distinct from $A$, at $\texttt{audit\_passes}$), and $A$ records the absence with passing check results; the cell is in scope, so the second row holds.
- $\texttt{blocked}$: the cell $C_{\mathrm{blk}}$ of Theorem 1, with $\delta'_{\mathrm{reqbridge}}=\{\texttt{drive}\}$ and $\delta_6^{\mathrm{audit}}=\{\texttt{visibility\_failure}\}$.
- $\texttt{undefined\_circular}$: the $\mathsf{EvidenceRefs}$ of $A$ are extended by the verdict reference $\ulcorner C,I\urcorner$ of this variant cell $C$, so the recomputed $\mathsf{CircularityCheck}$ fails while its other checks pass, and $\delta_6^{\mathrm{audit}}=\{\texttt{circular\_audit}\}$; the blocked row fails because no bridge or visibility defect occurs and neither $\texttt{source\_failure}$ nor $\texttt{visibility\_failure}$ is in $\delta_6^{\mathrm{audit}}$.
- $\texttt{collapsed}$: the lens of $L$ is replaced by the constant map $\mathcal P(\{a,b,c\})\to\{*\}$, so step 8 computes $\texttt{total\_collapse}\in\delta$.
- $\texttt{below\_threshold}$: replace the threshold by $\Theta_{\ge2}$ on the datum $|E_1E_2(\{a\})\,\triangle\,E_2E_1(\{a\})|$ (the two recomputed images differ in at least two elements). The images $\{a,b\}$ and $\{a,b,c\}$ differ only in $c$, so the $\mathsf{ThresholdCheck}$ fails and $\delta_6^{\mathrm{audit}}=\{\texttt{threshold\_failure}\}$. This is the cell $C_{\mathrm{thr}}$ reused in Theorem 5.
- $\texttt{trivial}$: the audit log is recorded as a finite set $\Lambda$ with an entry $\epsilon_0\in\Lambda$, and $\mathsf{AddAuditRecord}$ carries the effect map $e_U(\Lambda)=\Lambda\cup\{\epsilon_0\}=\Lambda$, so step 8 computes $\mathsf{noopU}=\mathrm{true}$.
- $\texttt{implicit}$: $W_3$ is added to the witness family $W_{\mathcal T}$ attached to $\mathcal T$, with its own visibility, source and audit records (Subsubsection 3.3.3), and $\Theta$ is replaced by $\Theta_{\mathrm{pass}}$ on the recorded Boolean of the package audit entry of $\mathcal T$ that recomputes the tables of $E_1$ and $E_2$, a record distinct from $A$ whose value is true. No threshold then evaluates $W_3$, so step 8 computes $\mathsf{implicitW}=\mathrm{true}$.
- $\texttt{action}$: the running example itself.

So the non-implication holds for every status.

\end{proof}

The running example of Subsection 3.8 is an instance: the cell $P_6\leftarrow P_3$ has status $\texttt{action}$ and distinct actor and informant.

### 6.2.1 Corollary

Pair labels alone do not determine cell status. The same primitive pair $(P_i,P_j)$, with different witness, update, profile, threshold, visibility, audit, or defect data, can produce different cell statuses; this was the working content of Theorem 1, and Theorem 2 records the underlying typed-record discipline that licenses it. No theorem in this paper infers the equality of two primitive labels from the existence of a directed-cell judgment between them; in particular, no theorem in Sections 7, 10, or 13 does so even when the cell receives status $\texttt{action}$.

## 6.3 Theorem 3: Cell Well-Formedness Decidability

\begin{claimtheorem}{Theorem 3 (CellWellFormednessDecidability)}
In $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$, well-formedness of a candidate directed cell is decidable, provided (a) its numerical fields take values in declared types with decidable equality and order (the record-signature convention of Subsubsection 3.1.1 supplies effective equality and every order comparison used by the procedure), and (b) every threshold that step 8 evaluates, directly or through an audit or source check it replays, has an evaluated datum computable in its type; these are all threshold vertices reachable from step 8 in the evaluation dependency graph (Subsubsection 5.3.6, paragraph Well-foundedness), including thresholds of $\Theta$ and thresholds of audits queried by visibility, required-bridge, source or audit-defect checks. For each candidate cell record (a tuple of the form of Subsubsection 4.3.1 whose fields are records of the instance or audited absence markers; last paragraph of Subsubsection 4.10.2)

$$
C\;=\;(\,P_i\leftarrow P_j,\;W,\;U,\;L,\;V,\;\Theta,\;A,\;\delta\,)^{\lambda},
$$

together with $\Gamma,\mathcal T,I$, there is a finite decision procedure $\mathsf{WFCell}(C)\in\{\texttt{wf},\texttt{not\_wf}\}$ that returns $\texttt{wf}$ exactly when $C$ is well-formed in the sense of Subsubsection 4.3.3.
\end{claimtheorem}

### 6.3.1 Algorithm

The procedure runs the following finite checks in order; the cell is well-formed iff every step returns $\texttt{wf}$.

1. **Primitive labels.** Verify $P_i,P_j\in\mathbb P$. This is a finite membership test on the six-element set.
2. **Witness slot.** Verify either a witness with signature in $\mathsf{Wit}(P_j)$ or a typed, audited absence marker for that slot. The family $\mathsf{Wit}(P_j)$ is a finite typed family (Subsubsection 3.7.1); the test is a finite membership check.
3. **Update slot.** Verify either an update with signature in $\mathsf{Upd}(P_i)$ or a typed, audited absence marker for that slot. The family $\mathsf{Upd}(P_i)$ is finite (Subsubsection 3.7.2); the test is a finite membership check.
4. **Profile admissibility.** Verify $\mathsf{AdmProfile}(\lambda,I,\mathcal T)$. The check is the finite per-field comparison of Subsubsection 3.6.2.
5. **Resolution of $L,V,\Theta,A,\delta,\lambda$.** Verify that each component is a finite typed record on the host of $\mathcal T$, with all references in its fields resolved against $\mathsf{Cont}$ or recorded as audited absences. In particular, verify that the level tags of $L$ equal the actor and informant level tags of $\lambda$, that a present $U$ carries the tag $\ell_i$ and a present $W$ the tag $\ell_j$, and that $W$ and $U$ are records on the host of $\mathcal T$, and, if the actor and informant level tags of $\lambda$ differ, that $L$ contains a level-bridge record of one of the types of Subsubsection 2.2.3. Verify also that $V$ assigns each field $x$ of the cell, and each record $x$ of the finite set $\mathsf{Use}(C)$ (Subsubsection 5.5.2), the class $\mathsf{vis}_I(x)$ determined by $\mathsf{Visible}_I$, $\mathsf{Suppressed}_I$ and $\mathsf{Scope}_I$ (Subsubsection 3.5.2); this is a finite membership test.
6. **Reference resolution.** Verify that every reference in $W,U,\delta,A$ — to a quotient, a kernel, a defect record, an audit entry, a source identifier, or any other element of $\mathsf{Cont}$ — resolves to a record of $\mathsf{Cont}$ of the declared type, or to an audited absence record. (Admissibility of the records of $\mathsf{Cont}$ is the standing hypothesis $\mathsf{AdmDomain}(\mathfrak D)$ of Subsection 4.10, not a step of $\mathsf{WFCell}$.)
7. **Host and instrument typing.** Verify that the host and instrument tags are declared and every content reference is resolved or recorded as an audited absence. Whether the content is in $\mathsf{Scope}_I$ is decided by the cell classifier.
8. **Defect agreement.** Compute the visibility defects and the required-bridge defect of Subsection 5.5 from the finite use-set $\mathsf{Use}(C)$, the profile $\lambda$, the classes $\mathsf{vis}_I(x)$ and the bridges listed in $V$, and the finite bridge family, and the audit defect of Subsubsection 5.3.6 from $A$. Verify that the visibility, required-bridge and audit entries of $\delta$ equal these values. Verify that $\delta$ contains exactly the type-(iii) defects of Subsubsection 4.3.3 named by $\Theta$, each with its recomputed value and carrying exactly the threshold that $\Theta$ assigns to it, and that its package-collapse entries equal the values computed from $L$, $W$ and $U$ as in Subsubsection 5.3.5. When $A$ is present, verify that its $\mathsf{ClaimRef}$ names $C$, that its $\mathsf{CheckRules}$ names $I$, and that its $\mathsf{VisibilityCheck}$, $\mathsf{ThresholdCheck}$ and $\mathsf{CircularityCheck}$ results agree with the computed visibility defect, with the evaluation of $\Theta$, and with the finite reachability test of Subsubsection 4.9.2; when $A$ is an audited absence marker, verify that $\delta_6^{\mathrm{audit}}=\{\texttt{missing\_audit}\}$. This is a finite computation. Verify also that the field $\mathsf{noopU}$ equals its computed value (Subsubsection 5.6.6): $[e_U(r)=r]$ for an update whose effect on its target record $r$ is recorded as a finite map $e_U$, and false otherwise, and that $\mathsf{implicitW}$ equals its value computed from the records attached to $\mathcal T$ and from $\Theta$; this includes an update that applies a declared completion $E$ to a recorded input $s$, with $e_U=E$ and $r=s$.

\begin{proof}
Each step of the procedure is a finite decidable check: a membership test in a finite set, a finite per-field record comparison, or a finite policy comparison against a finite policy record. Step 8 also evaluates every threshold reachable from its evaluations in that graph, which terminate by hypothesis (the defect and threshold evaluations follow the acyclic evaluation dependency graph of Subsubsection 5.3.6; memoization keyed by record, instrument, profile and judgment context evaluates each reachable vertex at most once), and replays the check rules of each present $A$ and $A_L$, which terminate by admissibility of $I$, including the reference-resolution and provenance checks of Subsubsection 5.3.6, which are finite lookups in $\mathsf{Cont}$. The composition of finitely many decidable checks is decidable, hence $\mathsf{WFCell}$ is decidable. It returns $\texttt{wf}$ exactly when the cell is well-formed in the sense of Subsubsection 4.3.3, because steps 1, 2--3, 4, 5, 6 and 7 decide conditions 1--6 of that definition and step 8 decides conditions 7 and 8, and each step terminates.

The procedure is the well-formedness step that the classifier of Subsubsection 5.6.2 invokes before assigning a cell status. Theorem 4 will use this decidability step when proving uniqueness of the status assigned to a covered well-formed cell.
\end{proof}

The hypothesis of Theorem 3 holds for the closure-deficit threshold of Subsubsection 5.3.1 when the kernel and the law $\mu$ of $X_t$ are rational, $\varepsilon=\log\eta$ with $\eta$ rational, and logarithms are natural. Record $\mathrm{CD}$ in the type of finite lists $((r_k,s_k))_k$ of positive rationals, read as $\sum_k r_k\log s_k$; two such values $a,b$ satisfy $a=b$ (resp. $a\le b$) exactly when $\prod s_k^{Nr_k}=\prod {s'_k}^{Nr'_k}$ (resp. $\le$) for a common denominator $N$, a rational test, so equality and order in this type are decidable. Explicitly, $\mathrm{CD}=\sum\mu(x)p_x(y')\log\bigl(p_x(y')/\bar p_{\Pi(x)}(y')\bigr)$ over $\mu(x)>0$, $p_x(y')>0$, where $p_x(y')=\sum_{\Pi(x')=y'}M^\tau(x,x')$ and $\bar p_y(y')=\sum_{\Pi(x)=y}\mu(x)p_x(y')/\sum_{\Pi(x)=y}\mu(x)$, which is at least $\mu(x)p_x(y')/\sum_{\Pi(x)=y}\mu(x)>0$; for rational $M,\mu$ each coefficient and ratio is a positive rational. Then $\mathrm{CD}=\sum_k r_k\log s_k$ with $r_k,s_k\in\mathbb Q_{>0}$, so $e^{\mathrm{CD}}=\prod_k s_k^{r_k}$ is algebraic. For $\varepsilon=0$, $\mathrm{CD}=0$ exactly when $\prod_k s_k^{Nr_k}=1$ for a common denominator $N$ of the $r_k$, an exact rational test. For $\varepsilon=\log\eta$ with $\eta\in\mathbb Q_{>1}$, $\mathrm{CD}\le\log\eta$ exactly when $\prod_k s_k^{Nr_k}\le\eta^N$ for a common denominator $N$, a rational comparison; with multiplication and natural-number powers declared among the operations of the rational type, it is a rule of $\mathcal R$.

## 6.4 Theorem 4: Covered Cell Status Uniqueness

A cell is *covered* when it is well formed and one of the nine rows $\texttt{outside\_scope}$ through $\texttt{action}$ of Subsubsection 5.6.6 holds at it (Subsubsection 4.3.3). The coverage clause of Theorem 4 shows that every well-formed cell is covered, so the final $\texttt{blocked}$ row is never used; uniqueness of the status follows from the first-match rule.

\begin{claimtheorem}{Theorem 4 (CoveredCellUniqueStatus)}
Every well-formed directed cell satisfies at least one of the nine rows $\texttt{outside\_scope}$ through $\texttt{action}$ of the table of Subsubsection 5.6.6; a well-formed cell meeting none of the rows $\texttt{outside\_scope}$ through $\texttt{implicit}$ meets the $\texttt{action}$ row. Hence $\mathsf{CoveredCell}$ is the set of well-formed cells, decidable under the hypotheses of Theorem 3, and the first-match classifier $\mathsf{CellClassify}$ is a total function from it to $\mathrm{CellStatus}$, computable under those hypotheses and never using the final row:

$$
\forall\,C\;\;\bigl(\mathsf{WFCell}(C)=\texttt{wf}\;\Rightarrow\;\exists\,r\in\{\texttt{outside\_scope},\ldots,\texttt{action}\}:\ \text{row }r\text{ holds at }C\bigr);
$$

$\mathsf{CellClassify}(C)=\sigma$ exactly when the first row holding at $C$ is a row of $\sigma$. In particular, a well-formed cell whose audit defect contains $\texttt{missing\_audit}$ or $\texttt{failed\_audit}$ receives $\texttt{outside\_scope}$ or $\texttt{blocked}$, since the $\texttt{absent}$ row excludes $\texttt{missing\_audit}$ and $\texttt{failed\_audit}$, and one whose audit defect contains $\texttt{nonclaim\_failure}$ receives $\texttt{outside\_scope}$, $\texttt{absent}$ or $\texttt{blocked}$.
\end{claimtheorem}

### 6.4.1 Classifier Priority

The status set is fixed in Subsubsection 5.1.2, and the priority order is frozen in Subsubsections 4.3.4 and 5.6.2:

$$
\begin{aligned}
&\texttt{outside\_scope}\;\succ\;\texttt{absent}\;\succ\;\texttt{blocked}\;\succ\;\texttt{undefined\_circular}\;\succ\\
&\texttt{collapsed}\;\succ\;\texttt{below\_threshold}\;\succ\;\texttt{trivial}\;\succ\;\texttt{implicit}\;\succ\;\texttt{action}.
\end{aligned}
$$

A cell whose data simultaneously matches more than one per-status condition is assigned the highest-priority match; the per-status conditions are the rows of the directed-cell table of Subsubsection 5.6.6, glossed in Subsubsection 5.6.2.

\begin{proof}
The classifier is a finite first-match procedure over the fixed priority order. The proof has two parts: coverage (every well-formed cell meets one of the rows $\texttt{outside\_scope}$ through $\texttt{action}$), proved in the coverage paragraph below, and uniqueness, which follows from the first-match rule; by coverage the final row is never used.

Existence of a status follows: the classifier walks the priority list, evaluates each per-status condition in order, and stops at the first match. Since, by the coverage paragraph below, one of the nine rows holds at every well-formed cell, the classifier returns some $\sigma\in\mathrm{CellStatus}$ without reaching the final row.

Uniqueness follows from the priority discipline: if more than one condition matches a cell, the classifier records only the highest-priority one. The output is therefore a single value in $\mathrm{CellStatus}$. Each per-status check in Subsubsection 5.6.2 is a finite test on finite records; the entire classifier is a finite first-match procedure. Hence $\mathsf{CellClassify}$ is a total function on $\mathsf{CoveredCell}$ with codomain $\mathrm{CellStatus}$, and assigns exactly one status to each covered well-formed cell.

By the coverage argument of the coverage paragraph below, one of those nine rows holds at every well-formed cell. Hence $\mathsf{CoveredCell}$ is exactly the set of well-formed cells and is decidable under the hypotheses of Theorem 3. The first $\texttt{blocked}$ row tests the codes $\texttt{missing\_audit}$, $\texttt{failed\_audit}$ and $\texttt{nonclaim\_failure}$, so a cell whose audit defect contains $\texttt{missing\_audit}$ or $\texttt{failed\_audit}$ receives $\texttt{outside\_scope}$ if that row holds and $\texttt{blocked}$ otherwise, since the $\texttt{absent}$ row excludes these codes; a cell whose audit defect contains $\texttt{nonclaim\_failure}$ receives $\texttt{outside\_scope}$ or $\texttt{absent}$ if one of those rows holds, and $\texttt{blocked}$ otherwise.

For the coverage clause, let $C$ be well formed and meet none of the rows $\texttt{outside\_scope}$ through $\texttt{implicit}$. If $W$ or $U$ were an audited absence marker, $C$ would meet the $\texttt{absent}$ row, or, when $\delta_6^{\mathrm{audit}}$ contains $\texttt{missing\_audit}$ or $\texttt{failed\_audit}$, the first $\texttt{blocked}$ row; so $W$ and $U$ are present. The first $\texttt{blocked}$ row excludes the audit codes $\texttt{missing\_audit}$, $\texttt{failed\_audit}$, $\texttt{nonclaim\_failure}$, $\texttt{source\_failure}$ and $\texttt{visibility\_failure}$, a nonempty required-bridge defect and a nonempty $\delta_{\mathrm{overread}}$, $\delta_{\mathrm{weakbridge}}$ or $\delta_{\mathrm{unknown}}$; the $\texttt{outside\_scope}$ row excludes a nonempty $\delta_{\mathrm{outside}}$; the $\texttt{undefined\_circular}$ row excludes $\texttt{circular\_audit}$; the $\texttt{collapsed}$ row excludes the collapse entries; and the $\texttt{below\_threshold}$ row excludes $\texttt{threshold\_failure}$. So the audit record is present and $\delta_6^{\mathrm{audit}}=\texttt{audit\_passes}$, and by well-formedness condition 8 its $\mathsf{ThresholdCheck}$ equals the evaluation of $\Theta$, which therefore passes, so every threshold of $\Theta$ returns $\texttt{pass}$. The visibility defect is empty. Hence $C$ meets the $\texttt{action}$ row.

The proof uses the priority order of Subsubsection 5.6.2 and introduces no other ordering. Subsubsection 5.6.2 supplies the per-status conditions; this subsection only records that the priority assignment is well-defined and produces a unique value on each covered cell.
\end{proof}

## 6.5 Theorem 5: Status-Family Separation

\begin{claimtheorem}{Theorem 5 (StatusFamilySeparation)}
In each of the five displayed non-implications below, some admissible instance satisfies the left judgment and not the right one; items (a)–(e) name the witnessing instances, and (d)–(e) use $\mathrm{Sound}(I)$ and $\mathsf{ClaimLog}(I)$ of Subsubsection 11.5.1 and the constructions of Theorems 22 and 25. The five judgment-attached status families

$$
\mathrm{RoleStatus},\quad\mathrm{CellStatus},\quad\mathrm{PairStatus},\quad\mathrm{PromotionStatus},\quad\mathrm{ClaimStatus}
$$

satisfy the following five non-implications in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. In each, some admissible instance satisfies the left judgment and not the right one. The fourth holds in the stronger form $\mathrm{Promote}(B):\texttt{strict}\mathrel{\mathsf{dep}_{\texttt{blocks}}}\mathrm{Sound}(I^{+}_{\mathrm{prom}}):\texttt{accepted}$ of Subsubsection 4.6.1: by Theorem 24 the right judgment fails in every admissible instance, and the first instance of (d) shows that it fails with the claim in scope, visible, sourced and audited, at exactly $\texttt{undefined\_circular}$; in the fifth, the right judgment holds in another instance:

$$
\mathrm{Chan}_i\;:\;\texttt{active\_projection}\;\wedge\;\mathsf{Cell}_{ij}^{\lambda}\text{ well formed with }W_j,U_i\text{ present}\;\;\not\Rightarrow\;\;\mathsf{Cell}_{ij}^{\lambda}\;:\;\texttt{action},
$$

$$
\mathsf{Cell}_{ij}^{\lambda}\;:\;\texttt{action}\;\;\not\Rightarrow\;\;\mathsf{PairObs}_{\{i,j\}}^{\mu}\;:\;\texttt{real},
$$

$$
\mathrm{Promote}(B)\;:\;\texttt{strict}\;\;\not\Rightarrow\;\;\exists i,j,\lambda\;\mathsf{Cell}_{ij}^{\lambda}\;:\;\texttt{action},
$$

$$
\mathrm{Promote}(B)\;:\;\texttt{strict}\;\;\not\Rightarrow\;\;\Gamma;\mathcal T_0;I^{+}_{\mathrm{prom}}\vdash\mathrm{Sound}(I^{+}_{\mathrm{prom}})\;:\;\texttt{accepted},
$$

$$
\mathrm{Promote}(B)\;:\;\texttt{strict}\;\;\not\Rightarrow\;\;\Gamma;\mathcal T^{\mathrm{audit}}_{\le 0};I^{\mathrm{stack}}_1\vdash\mathrm{Sound}^{\uparrow}_0\;:\;\texttt{accepted}.
$$

Here $\mathrm{Sound}(I)$ is the claim, of type $\texttt{soundness}$, that every verdict $I$ has recorded (including its verdict on this claim) equals the status its claim classifier assigns (Subsubsection 11.5.1); $\mathrm{Sound}^{\uparrow}_0$ is the same assertion about the recorded verdicts of $I_{\mathrm{prom}}$, judged by an instrument one level higher (Theorem 25); $I_{\mathrm{prom}}^{+}$ is $I_{\mathrm{prom}}$ with a fresh identifier, $\texttt{soundness}$ added to its claim types, the use-set of $\mathrm{Sound}(I^{+}_{\mathrm{prom}})$ added to its scope and visible set, and its required-strength map extended by $\mathsf{ReqStrength}_{I_{\mathrm{prom}}^+}(\texttt{soundness})=\texttt{weak}$, retaining its old values; and $\mathrm{Sound}^{\uparrow}_0$, $\mathcal T^{\mathrm{audit}}_{\le 0}$ and $I^{\mathrm{stack}}_1$ are the lifted soundness claim, audit package and extension instrument of Theorem 25 for the one-instrument chain $(I_{\mathrm{prom}})$, at the level $\mathsf{Str}$ above $\mathsf{Level}(I_{\mathrm{prom}})=\mathsf{Ver}$. Each non-implication asserts the existence of an admissible instance of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ in which the left judgment holds and the right one fails for the records listed:

- (a) for $i=6$, $j=3$, the instance obtained from the running example of Subsection 3.8 by replacing its cell with the cell $C_{\mathrm{thr}}$, the running-example cell with threshold $\Theta_{\ge2}$ on the datum $|E_1E_2(\{a\})\,\triangle\,E_2E_1(\{a\})|$ (the two recomputed images differ in at least two elements), keeping $U_6'$, $x$ and $L_{\mathrm{drive}}$ in $\mathsf{Cont}$ and adding the role-channel record $(\mathrm{Chan}_6,R_6,\Theta_6^{\mathrm{act}},A_{R_6},V_{R_6},\mathrm{false})$ with its audit record $A_{R_6}$ (Subsubsection 3.7.1); there the role channel of $P_6$ is $\texttt{active\_projection}$, and $C_{\mathrm{thr}}$, the only directed cell of the instance, is $\texttt{below\_threshold}$, so no directed cell on the pair $(6,3)$ is $\texttt{action}$;
- (b) for $i=6$, $j=3$, the instance of countermodel $\mathsf{CM}_4$, in which the running-example cell $\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}$ is $\texttt{action}$ and the pair observable $\mathsf{PairObs}_{\{3,6\}}^{\mu_{\mathrm{drive}}}$ on the same two primitives is $\texttt{blocked}$;
- (c) the instance obtained by joining the records of the instance of Theorem 22 and of the instance of (a): its bridge is $\texttt{strict}$, and its only directed cell, $C_{\mathrm{thr}}$ on the pair $(6,3)$, is $\texttt{below\_threshold}$, so that no directed cell of the instance is $\texttt{action}$;
- (d) for the fourth display, the instance of (c) extended, with fresh identifiers, by $I^{+}_{\mathrm{prom}}$, by the visibility, audit and gate records of the bridge of Theorem 22 reissued under $I^{+}_{\mathrm{prom}}$, and by $\mathrm{Sound}(I^{+}_{\mathrm{prom}})$, with host tag $\mathsf H_{\mathrm{fin}}$ and level profile $(\mathsf{Ver},\mathsf{Ver})$, $\mathsf{ClaimLog}(I^{+}_{\mathrm{prom}})$ and the verdict references of its use-set, all in the scope and visible set of $I^{+}_{\mathrm{prom}}$; there the copied bridge is again $\texttt{strict}$ and $\mathrm{Sound}(I_{\mathrm{prom}}^{+})$, with a fresh $\texttt{committed\_state}$ evidence source admitted by $I_{\mathrm{prom}}^{+}$ and an audit record whose checks pass, receives exactly $\texttt{undefined\_circular}$. For the variant with $I_{\mathrm{prom}}$ in place of $I^{+}_{\mathrm{prom}}$, extend the instance of (c) instead, with fresh identifiers, by $\mathrm{Sound}(I_{\mathrm{prom}})$ of Subsubsection 11.5.1, $\mathsf{ClaimLog}(I_{\mathrm{prom}})$ and the verdict references of its use-set, each outside the scope of $I_{\mathrm{prom}}$; the bridge stays $\texttt{strict}$ and $\mathrm{Sound}(I_{\mathrm{prom}})$ receives $\texttt{outside\_scope}$;
- (e) the instance of Theorem 22 extended, with fresh identifiers, by one claim record of type promotion in $\mathsf{ClaimLog}(I_{\mathrm{prom}})$ whose recorded verdict differs from the status the claim classifier of $I_{\mathrm{prom}}$ assigns it, and by the records of Theorem 25 for the chain $(I_{\mathrm{prom}})$ with $N=0$; the bridge stays $\texttt{strict}$, $\delta_{\mathrm{status}}$ has an entry with index $0$, and by clause 4 of Theorem 25 $\mathrm{Sound}^{\uparrow}_0$ is not $\texttt{accepted}$. With an empty claim log the same clause accepts $\mathrm{Sound}^{\uparrow}_0$, so the right judgment of the fifth case can hold.

By Theorem 24, in every admissible instance containing a strict bridge and a candidate record $\mathrm{Sound}(I)$ for the instrument $I$ that classifies it, that record is not $\texttt{accepted}$ under $I$.
\end{claimtheorem}

\begin{proof}
Each non-implication is established by exhibiting finite admissible records, or a finite admissible record schema, satisfying the antecedent without satisfying the consequent. The channel and promotion separations use the classifier-input distinctions of Sections 4 and 5; the cell-to-pair separation is the countermodel-backed case, with the explicit construction recorded as $\mathsf{CM}_4$ in Section 9 and Appendix C.

**Channel does not imply cell.** Let $C_{\mathrm{thr}}$ be the running-example cell with its exact threshold replaced by the threshold $\Theta_{\ge2}$ on the datum $|E_1E_2(\{a\})\,\triangle\,E_2E_1(\{a\})|$ (the two recomputed images differ in at least two elements). The images $\{a,b\}$ and $\{a,b,c\}$ differ only in $c$, so this threshold is not met. Keep the underlying maps, witness, update, profile and visibility data. The audit's threshold check, recomputed for the new threshold, fails, while its source, visibility, circularity, nonclaim and other checks pass as before; so the computed audit defect of Subsubsection 5.3.6 is $\delta_6^{\mathrm{audit}}=\{\texttt{threshold\_failure}\}$, and the visibility defects remain empty. This is a well-formed directed cell $P_6\leftarrow P_3$ whose informant witness $W_3\in\mathsf{Wit}(P_3)$ is present but fails a threshold check of its threshold record. The rows of Subsubsection 5.6.6 above $\texttt{below\_threshold}$ do not apply: the cell is in scope, as the running example is; $W_3$ and $U_6$ are present; it uses no bridge, has empty overread and weak-bridge defects, and its audit defect contains neither $\texttt{source\_failure}$ nor $\texttt{visibility\_failure}$; its audit defect does not contain $\texttt{circular\_audit}$; and $\delta$ contains no package-collapse value. The $\texttt{below\_threshold}$ row holds, since $W_3$ and $U_6$ are present and $\texttt{threshold\_failure}\in\delta_6^{\mathrm{audit}}$; so $C_{\mathrm{thr}}$ is $\texttt{below\_threshold}$, not $\texttt{action}$. In the instance whose only directed cell is $C_{\mathrm{thr}}$, take the role-channel record $(\mathrm{Chan}_6,R_6,\Theta_6^{\mathrm{act}},A_{R_6},V_{R_6},\mathrm{false})$ of Subsubsection 5.6.1, whose role evidence is the source-of-truth record $R_6\in\mathsf{Wit}(P_6)$ of $E_1$ and $E_2$ to which the audit record refers, with activation threshold $\Theta_6^{\mathrm{act}}$ the instance of $\Theta_{\mathrm{source}}$ on $R_6$, which passes since $\delta_6^{\mathrm{source}}(R_6;I)=\texttt{committed}$ under the default entry. This record is unchanged by the replacement: it is in scope, visible, audited under $\mathsf{AuditPolicy}_I$, its declared field $\mathsf{collapse}_6$ is false, and it satisfies the source policy. By Subsubsection 5.6.1 the role channel of $P_6$ is $\texttt{active\_projection}$. Thus an active role channel does not by itself produce a directed cell with status $\texttt{action}$; the channel and the cell are adjudicated by separate classifiers with separate inputs.

**Cell does not imply pair.** Take a directed cell $\mathsf{Cell}_{ij}^{\lambda}$ that is well-formed and classified $\texttt{action}$ under $\Gamma,\mathcal T,I$. Now consider the unordered pair observable $\mathsf{PairObs}_{\{i,j\}}^{\mu}$ on the same primitives, with a drive profile, whose source slot is an audited absence ($\delta_6^{\mathrm{source}}=\texttt{missing}$) and which has no drive bridge ($\delta_{\mathrm{reqbridge}}=\{\texttt{drive}\}$) (either defect alone triggers the first $\texttt{blocked}$ row), as in $\mathsf{CM}_4$. The cell is $\texttt{action}$, but the source defect of the pair record fails its threshold, so the first condition of the $\texttt{blocked}$ row of the pair-observable table (Subsubsection 5.6.6) holds and the pair classifier assigns the pair record status $\texttt{blocked}$. Countermodel $\mathsf{CM}_4$ of Section 9 supplies the explicit construction; the cell-to-pair non-implication is therefore witnessed by a finite admissible pair of records.

**Strict promotion does not imply cell action.** Take a promotion bridge $B_{j\to j+1}$ classified $\texttt{strict}$ under $\Gamma,\mathcal T_j,I$ — that is, an admissible bridge whose strictness gate $G_{\mathrm{strict}}$ is $\texttt{strict\_pass}$, equivalently $\Delta_{\mathrm{fact}}(\pi_j,\pi_{j+1})\neq\varnothing$. Strictness is a property of the typed object-map data alone (Subsubsection 5.4.1) and does not by itself produce a directed cell of any specific primitive pair. A directed-cell record on the target package, with its own witness, update, profile, threshold, audit, visibility, and defect data, is required to obtain a $\texttt{action}$ verdict on a cell. For case (c), join the records of the instance of Theorem 22 and of the instance of case (a); the two record sets are disjoint and each judgment keeps its own instrument. In the joined instance, give the records of the two instances distinct identifiers and leave $I$ and $I_{\mathrm{prom}}$ unchanged; since visibility is determined by scope (Subsubsection 3.5.2), the Theorem 22 records are $\texttt{outside}$ for $I$ and the records of case (a) are $\texttt{outside}$ for $I_{\mathrm{prom}}$; no record used by either judgment changes class, so every row computation is unchanged, and the bridge remains $\texttt{strict}$ by Theorem 22 and the cell $C_{\mathrm{thr}}$ remains $\texttt{below\_threshold}$ by case (a). Hence strict promotion does not imply directed-cell action.

**Strict promotion does not imply acceptance of a same-level soundness claim.** By Theorem 24, which applies to every admissible instrument, neither $\mathrm{Sound}(I_{\mathrm{prom}})$ nor $\mathrm{Sound}(I^{+}_{\mathrm{prom}})$ is accepted. The same claim-classifier rows are checked directly for the Toy22 instruments below. These constructions and Theorem 22 do not use Theorem 5. In the Theorem 22 instance, $I_{\mathrm{prom}}$ classifies the bridge as $\texttt{strict}$, while the candidate same-level claim $\mathrm{Sound}(I_{\mathrm{prom}})$ receives $\texttt{outside\_scope}$: its claim-type tag $\texttt{soundness}$ is excluded from $\mathsf{ClaimTypes}_{I_{\mathrm{prom}}}$. This follows directly from the first row of the claim classifier. Take $I_{\mathrm{prom}}^+$ with a fresh identifier, copying the finite promotion policies of $I_{\mathrm{prom}}$ and extending the required-strength map by $\mathsf{ReqStrength}_{I_{\mathrm{prom}}^+}(\texttt{soundness})=\texttt{weak}$, adding $\texttt{soundness}$ to its claim types, and the self-soundness use-set together with the reissued bridge record and its visibility, audit and gate records to its scope and visible set. Reissue, with a fresh bridge identifier, the Toy22 bridge's instrument-indexed visibility, audit and gate records under $I_{\mathrm{prom}}^+$, and recompute their checks; the same finite tables give passing core gates and $\texttt{strict\_pass}$, so the copied bridge is $\texttt{strict}$ under $I_{\mathrm{prom}}^+$. The soundness claim contains its own verdict reference and receives $\texttt{undefined\_circular}$ unless a higher-priority row applies. In neither case is the claim $\texttt{accepted}$.

For $I_{\mathrm{prom}}^{+}$ in (d), the host tag $\mathsf H_{\mathrm{fin}}$ and level tag $\mathsf{Ver}$ of $\mathrm{Sound}(I_{\mathrm{prom}}^{+})$ lie in $\mathsf{Hosts}$ and $\mathsf{Levels}$ of $I_{\mathrm{prom}}^{+}$, which are those of $I_{\mathrm{prom}}$, the use-set of $\mathrm{Sound}(I_{\mathrm{prom}}^{+})$ is in scope and visible, its evidence resolves to an admitted source, no record is absent and its audit defect is empty, so the rows above $\texttt{undefined\_circular}$ fail; the third condition of the $\texttt{undefined\_circular}$ row holds by membership. For the stronger form, the dependency is judged, as in Subsubsection 9.1.1, by a fresh local copy of $I_{\mathrm{prom}}^{+}$ that also admits the claim type $\texttt{dependency}$; since $\mathrm{Sound}(I_{\mathrm{prom}}^{+})$ is accepted in no admissible instance (Theorem 24), every instance of its class $\Sigma$ satisfying the left side fails the right side.

**Strict promotion does not imply accepted lifted soundness.** For (e), give the promotion-type claim a fresh $\texttt{committed\_state}$ evidence source outside the scope of $I_{\mathrm{prom}}$, complete typed fields and correctly recomputed audit defects. Its classifier status under $I_{\mathrm{prom}}$ is then $\texttt{outside\_scope}$; record $\texttt{accepted}$ for it in $\mathsf{ClaimLog}(I_{\mathrm{prom}})$. The bridge records are unchanged, so the bridge stays $\texttt{strict}$. The one-instrument chain $(I_{\mathrm{prom}})$ satisfies the hypotheses of Theorem 25 with $N=0$, since $\mathsf{Level}(I_{\mathrm{prom}})=\mathsf{Ver}$ lies below $\mathsf{Str}$; the log entry puts $(0,\varphi)$ in $\delta_{\mathrm{status}}$, so clause 4 rejects acceptance of $\mathrm{Sound}^{\uparrow}_0$. With an empty log, $\delta_{\mathrm{status}}$ has no entry with index $0$ and the same clause accepts $\mathrm{Sound}^{\uparrow}_0$.

The gate and square families of Subsubsections 5.1.6 and 5.1.7 are likewise distinct from these five: their classifier inputs are gate records (per the gate semantics of Section 10) and square fillers (per the high-structure semantics of Section 14), not the cell, pair, promotion, or claim records.

\end{proof}

### 6.5.1 Consequence

In the running example of Subsection 3.8, the cell $P_6\leftarrow P_3$ is $\texttt{action}$, while the pair observable on $\{P_3,P_6\}$ with a drive profile, whose source slot is an audited absence ($\delta_6^{\mathrm{source}}=\texttt{missing}$) and which has no drive bridge ($\delta_{\mathrm{reqbridge}}=\{\texttt{drive}\}$) (either defect alone triggers the first $\texttt{blocked}$ row), is $\texttt{blocked}$; this is the cell-to-pair separation, constructed as $\mathsf{CM}_4$. For the separation of strict promotion from cell activity, the bridge of Theorem 22 is classified $\texttt{strict}$ (Subsubsection 10.6.2), and nothing in its record asserts an active directed cell.

The paper does not infer pair-observable realness from directed-cell action, promotion strictness from package or channel activity, or claim acceptance from raw visibility alone. The status discipline of the calculus is the working content of the separation theorem: each status family is consulted only for its own judgments, and a status-level inference between families is recorded only through an explicit bridge or theorem. NC-3, NC-4, NC-5, and NC-6 of Subsection 15.2 are the corresponding nonclaims, and the no-overreading theorem of Section 11 gives the claim-level analogue at theorem-grade.
