# 14. Secondary High-Structure Semantics

This section defines, in the setting of double categories \citep{Ehresmann1963Doubles,GrandisPare1999}, a finite decorated-square semantics for $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ and proves three high-structure recovery theorems: descent data appear as decorated squares (Theorem 30), noncommuting completions give a completion-square defect (Theorem 31), and strict extensions appear as no-filler conditions (Theorem 32). The semantics is *secondary*: it is an organizational layer over the core calculus, recording how finite categorical decorations recover descent, completion, and strict-extension data, and is not a replacement for the core calculus or its status families. Subsection 14.1 fixes the finite double-category fragment, Subsections 14.2–14.4 prove the three theorems, and Subsection 14.5 records the high-structure nonclaims.

The discipline of the section is the secondary-organization discipline: the decorated-square fragment supplies a finite, audit-checkable representation of selected core constructions, and does not assert that the core calculus is reducible to the decorated-square fragment. Status families remain separate, in keeping with the no-total-algebra and status-family-separation results of Section 6.

## 14.1 Finite Double-Category Fragment

This subsection records the finite double-category data used by the section: package objects as objects, two classes of finite maps as horizontal and vertical arrows, and the decorated squares carrying descent, quotient, completion, promotion, visibility, audit, and factorization data. The fragment is finite throughout: the object class, horizontal class, vertical class, and square class are all finite typed records audited by the host instrument $I_{\mathrm{DC}}$.

### 14.1.1 Objects, Horizontal Arrows, Vertical Arrows

The finite double-category fragment $\mathsf H_{\mathrm{DC}}$ is the finite typed record

$$
\mathsf H_{\mathrm{DC}}\;=\;(\,\mathrm{Ob},\;\mathrm{Hor},\;\mathrm{Ver},\;\mathrm{Sq},\;A_{\mathrm{DC}},\;V_{\mathrm{DC}},\;\mathcal N_{\mathrm{DC}}\,),
$$

with:

- $\mathrm{Ob}$, the finite class of *package objects*: each object is a finite typed package $\mathcal T$ in the schema of Subsection 3.3, recording carrier, object map, visible interface, closure, and audit record;
- $\mathrm{Hor}$, the finite class of *horizontal arrows*: each horizontal arrow is a finite typed map within or between packages, such as an update, a refinement, a lens, a package morphism in the sense of Subsection 3.3, or a promotion bridge when the square type requires one;
- $\mathrm{Ver}$, the finite class of *vertical arrows*: each vertical arrow is a finite typed map within or between packages, such as a quotient, a completion or a transformation, with decorations such as audit, source and visibility drawn from the witness/update discipline of Subsection 3.7. Here $\mathrm{Ver}$ names the vertical arrows, not the verification level $\mathsf{Ver}$.
- $\mathrm{Sq}$, the finite class of *decorated squares*, defined in Subsubsection 14.1.2;
- $A_{\mathrm{DC}}$, the host audit record, recording verifications that $\mathrm{Ob}$, $\mathrm{Hor}$, and $\mathrm{Ver}$ are finite and that their boundary and composition data are admissible;
- $V_{\mathrm{DC}}$, the host visibility record;
- $\mathcal N_{\mathrm{DC}}$, the host nonclaim register of Subsection 14.5.

Which maps sit on which side depends on the square: in the descent square of Theorem 30 the update $F$ is horizontal and the quotient $q$ vertical; in the completion square of Theorem 31 one completion is horizontal and the other vertical; in the factorization square of Theorem 32 the two object maps are horizontal.

An arrow at a package object $X$ is a map on the carrier of $X$; $F:X\to X$ abbreviates such a map. A boundary set that is not the carrier of an object of $\mathrm{Ob}$, such as $\mathrm{im}(q)$ in Theorem 30, is adjoined to $\mathrm{Ob}$ as the carrier of an identity-lens package, as Theorem 32 does for $\mathrm{im}(\pi_0)$ and $O_1$.

Composition of horizontal arrows is along shared targets/sources, and composition of vertical arrows is along shared targets/sources, with both compositions admitted only when the resulting boundary records are finite and audited under $I_{\mathrm{DC}}$. $\mathsf H_{\mathrm{DC}}$ is not required to satisfy the double-category axioms (identities, associativity, interchange); the name refers only to the shape of its squares.

### 14.1.2 Decorated Squares

A decorated square $\Xi\in\mathrm{Sq}$ is a finite typed record

$$
\Xi\;=\;(\,X,\;F,\;q,\;F^{\sharp},\;\mathrm{src}_{\Xi},\;\mathrm{tgt}_{\Xi},\;\mathrm{type}_{\Xi},\;\mathsf{Decor}_{\Xi},\;A_{\Xi},\;V_{\Xi},\;\delta_{\Xi},\;\mathcal N_{\Xi},\;\mathsf{partialEvidence}_{\Xi}\,),
$$

with:

- $X$, the source object of the square (an element of $\mathrm{Ob}$);
- $F$ and $q$, the top horizontal edge and the vertical edge data of the square's boundary, drawn from $\mathrm{Hor}$ and $\mathrm{Ver}$: the vertical data is either a single arrow $q$, used on both sides, or a pair $q=(v_{\mathrm{left}},v_{\mathrm{right}})$ of vertical arrows;
- $F^{\sharp}$, the second horizontal arrow forming the bottom edge, drawn from $\mathrm{Hor}$;
- $\mathrm{src}_{\Xi}$ and $\mathrm{tgt}_{\Xi}$, the source and target boundary tuples;
- $\mathrm{type}_{\Xi}\in\{\,\texttt{descent},\;\texttt{quotient},\;\texttt{completion},\;\texttt{promotion},\;\texttt{visibility},\;\texttt{audit},\;\texttt{factorization}\,\}$, the square type;
- $\mathsf{Decor}_{\Xi}$, the decoration record carrying the type-specific data of the square: descent data for $\texttt{descent}$, quotient data for $\texttt{quotient}$, completion data for $\texttt{completion}$, promotion data for $\texttt{promotion}$, visibility-bridge data for $\texttt{visibility}$, audit-bridge data for $\texttt{audit}$, and factorization data for $\texttt{factorization}$;
- $A_{\Xi}$ and $V_{\Xi}$, the per-square audit and visibility records, with $\mathsf{ClaimRef}(A_{\Xi})=\Xi$;
- $\delta_{\Xi}$, the per-square defect record drawn from the general defect-record schema of Subsection 5.2 and classified in the square-status family of Subsection 5.1;
- $\mathcal N_{\Xi}$, the per-square nonclaim register;
- $\mathsf{partialEvidence}_{\Xi}\in\{\mathrm{true},\mathrm{false}\}$, the instance's declaration that the evidence for the square is incomplete (as for claims, Subsubsection 11.1.2).

The four boundary edges must match: $F$ runs from the source of $v_{\mathrm{left}}$ to the source of $v_{\mathrm{right}}$, and $F^{\sharp}$ from the target of $v_{\mathrm{left}}$ to the target of $v_{\mathrm{right}}$. The square *commutes* when $v_{\mathrm{right}}\circ F=F^{\sharp}\circ v_{\mathrm{left}}$. A *frame* is such a boundary with one edge left open, and a *filler* of a frame is an arrow of the appropriate kind that, placed on the open edge, makes the square exact. A decorated square is (mathematically) *exact* when the per-type exactness condition recorded in $\mathsf{Decor}_{\Xi}$ holds and $\delta_{\Xi}=\varnothing$. The exactness condition is type-specific: for $\texttt{descent}$, it is the descent commutation equality of Subsection 14.2; for $\texttt{completion}$, it is the completion-commutation equality of Subsection 14.3; for $\texttt{factorization}$, it is commutation of the square of Subsection 14.4, with defect $\delta_{\Xi}(\phi)=\{\,s:\phi(\pi_0(s))\ne\pi_1(s)\,\}$; for $\texttt{visibility}$, it is $\mathsf{AdmVisBridge}(L,I_{\mathrm{DC}},Y)$ of Subsubsection 5.5.2, where $\mathsf{Decor}_\Xi$ records the bridge $L$ and its target record $Y$, of a claim, directed-cell, pair-observable or promotion-bridge schema; for $\texttt{audit}$, it is $\mathsf{AdmRotAuditBridge}$ of Subsubsection 11.7.3 for the bridge recorded in $\mathsf{Decor}_\Xi$; for these two types $F$, $q$ and $F^{\sharp}$ are the identity map of the carrier of $X$, adjoined to $\mathrm{Hor}$ and $\mathrm{Ver}$ for this purpose, so the boundary commutes and exactness is decided by the decoration alone; for $\texttt{quotient}$ and $\texttt{promotion}$, it is commutation $v_{\mathrm{right}}\circ F=F^{\sharp}\circ v_{\mathrm{left}}$, with $\delta_{\Xi}$ the set of points of the source object where it fails. The pasting law of Subsubsection 14.1.3 applies to squares whose exactness condition is commutation. A decorated square is *well formed* when its fields are finite and typed, its boundary edges match as above, its references resolve, and $\delta_\Xi$ and its audit defect equal their recomputed values (Subsubsection 5.5.2); the square classifier of Subsubsection 5.6.6 applies only to well-formed squares.

### 14.1.3 Pasting

The decorated-square fragment supports finite *strict pasting*: given two decorated squares $\Xi_{1}$ and $\Xi_{2}$ that share a horizontal or vertical edge, their pasted square $\Xi_{1}\cdot\Xi_{2}$ is recorded as a single decorated square with concatenated boundary and concatenated decoration. The pasted square is exact when its outer boundary commutes, and $\delta_{\Xi_{1}\cdot\Xi_{2}}$ is the set of points where it fails to commute. For a horizontal paste with top edges $F_1,F_2$,

$$
\delta_{\Xi_{1}\cdot\Xi_{2}}\;\subseteq\;\delta_{\Xi_{1}}\;\cup\;F_1^{-1}(\delta_{\Xi_{2}}),
$$

since at a point $x$ with $x\notin\delta_{\Xi_1}$ and $F_1(x)\notin\delta_{\Xi_2}$ both squares commute along the path. For a vertical paste, with $\Xi_1$ above $\Xi_2$, left edges $v_1,v_2$, right edges $w_1,w_2$ and shared edge $F_1^{\sharp}$, $\delta_{\Xi_1\cdot\Xi_2}\subseteq\delta_{\Xi_1}\cup v_1^{-1}(\delta_{\Xi_2})$: if $x\notin\delta_{\Xi_1}$ and $v_1(x)\notin\delta_{\Xi_2}$, then $w_2w_1F_1(x)=w_2F_1^{\sharp}v_1(x)=F_2^{\sharp}v_2v_1(x)$. The paste defect $\delta_{\mathrm{paste}}(\Xi_{1},\Xi_{2})=\{e:\text{the shared edge }e\text{ is recorded differently in }\Xi_{1}\text{ and }\Xi_{2}\}$ is empty whenever pasting is admissible, and a nonempty paste defect makes the paste inadmissible. Pasting is admissible when the shared edge data agree on $\mathrm{Hor}$ or $\mathrm{Ver}$ and the per-square admissibility conditions hold for both factors. Strict pasting is the only pasting form admitted in this section: pseudo-pasting and weak pasting are out of scope, and the paste-defect record is the locus where any pasting failure is recorded.

The fragment $\mathsf H_{\mathrm{DC}}$ together with the strict-pasting law is the finite decorated double-category fragment used by Theorems 30, 31, and 32 of Subsections 14.2, 14.3, and 14.4.

## 14.2 Theorem 30: Descent-Square Recovery

This subsection proves Theorem 30: in the finite decorated double-category fragment of Subsection 14.1, descent data are recovered as decorated squares of type $\texttt{descent}$, with exactness recorded as the commutation equality between the concrete map $F$ and the quotient map $q$ followed by the descended map $F^{\sharp}$.

Let $X\in\mathrm{Ob}$ be a finite package object, $F\in\mathrm{Hor}$ a horizontal map $F:X\to X$, $q\in\mathrm{Ver}$ a quotient map $q:X\to Y$, drawn through its corestriction $q_{\mathrm{im}}:X\to\mathrm{im}(q)$, and $F^{\sharp}\in\mathrm{Hor}$ the candidate descended horizontal map $F^{\sharp}:\mathrm{im}(q)\to\mathrm{im}(q)$. Form the decorated square

$$
\Xi_{\mathrm{desc}}\;:\;
\begin{array}{ccc}
X & \xrightarrow{F} & X\\
{\scriptstyle q}\downarrow & \Downarrow\,\Xi_{\mathrm{desc}} & \downarrow{\scriptstyle q}\\
\mathrm{im}(q) & \xrightarrow{F^{\sharp}} & \mathrm{im}(q)
\end{array}
$$

with $\mathrm{type}_{\Xi}=\texttt{descent}$ and $\mathsf{Decor}_{\Xi}$ recording the descent data $(F,q,F^{\sharp})$.

\begin{claimtheorem}{Theorem 30 (DescentSquareRecovery)}
Let $\Xi_{\mathrm{desc}}$ be well formed (Subsubsection 14.1.2, with $\delta_\Xi$ recomputed as in the square classifier of Subsubsection 5.6.6), so that $\delta_\Xi=\delta_1^{\mathrm{cand}}(q,F,F^\sharp)$. The decorated square $\Xi_{\mathrm{desc}}$ is exact iff the descent commutation equality

$$
F^{\sharp}\circ q_{\mathrm{im}}\;=\;q_{\mathrm{im}}\circ F
$$

holds on $X$, where $q_{\mathrm{im}}:X\to\mathrm{im}(q)$ is the corestriction of $q$ to its image. Moreover, a map $F^{\sharp}:\mathrm{im}(q)\to\mathrm{im}(q)$ with $F^{\sharp}\circ q_{\mathrm{im}}=q_{\mathrm{im}}\circ F$, a *set-map filler* of $\Xi_{\mathrm{desc}}$ (a filler in the sense of Subsubsection 14.1.2 when it also belongs to $\mathrm{Hor}$), exists iff the well-definedness condition

$$
q(x)\;=\;q(x')\quad\Longrightarrow\quad qF(x)\;=\;qF(x')
$$

holds for all $x,x'\in X$. In the finite completion of $\mathsf H_{\mathrm{DC}}$ that adjoins every map $\mathrm{im}(q)\to\mathrm{im}(q)$ to $\mathrm{Hor}$, with the corresponding candidate descent squares and their boundary, defect and audit records, every set-map filler is a filler, so a filler of $\Xi_{\mathrm{desc}}$ exists there iff this condition holds.

\end{claimtheorem}

\begin{proof}
The proof has two parts: exactness of $\Xi_{\mathrm{desc}}$ is equivalent to the commutation equality for the given $F^{\sharp}$, and the existence of a set-map filler is equivalent to the well-definedness condition. Both parts use only the finite set-theoretic structure of $X$ and $\mathrm{im}(q)$.

*Exactness.* The descent square is exact when its per-type condition, the commutation equality $F^{\sharp}\circ q_{\mathrm{im}}=q_{\mathrm{im}}\circ F$, holds and its defect record is empty; for a descent square that record is the candidate defect $\delta_1^{\mathrm{cand}}(q,F,F^\sharp)=\{x:F^\sharp(q_{\mathrm{im}}(x))\neq q_{\mathrm{im}}F(x)\}$ of Subsubsection 5.3.1, which is empty exactly when the commutation equality holds. So the square is exact iff the commutation equality holds. The split defect $\delta_1^{\mathrm{split}}(q,F)$ (Subsubsection 5.3.1) is the obstruction in the filler clause: some set-map filler exists iff $\delta_1^{\mathrm{split}}(q,F)=\varnothing$; in the completed host of the theorem, some filler exists iff $\delta_1^{\mathrm{split}}(q,F)=\varnothing$.

*Set-map filler from well-definedness.* Suppose $q(x)=q(x')\Rightarrow qF(x)=qF(x')$. Define $G:\mathrm{im}(q)\to\mathrm{im}(q)$ by $G(y)=qF(x)$ for any $x\in X$ with $q(x)=y$. The well-definedness condition guarantees that the value does not depend on the choice of representative $x$, so $G$ is a well-defined function, and by construction $G\circ q_{\mathrm{im}}=q_{\mathrm{im}}\circ F$: $G$ is a set-map filler.

*Well-definedness from a set-map filler.* Suppose $G\circ q_{\mathrm{im}}=q_{\mathrm{im}}\circ F$ for some map $G$, and suppose $q(x)=q(x')$. Then $q_{\mathrm{im}}(x)=q_{\mathrm{im}}(x')$, so $G(q_{\mathrm{im}}(x))=G(q_{\mathrm{im}}(x'))$. Applying the equality on both sides gives $q_{\mathrm{im}}F(x)=q_{\mathrm{im}}F(x')$, that is, $qF(x)=qF(x')$.

The two parts together give both clauses of the theorem. Each step is a finite check on the finite host data of $\mathsf H_{\mathrm{DC}}$, recorded in $A_{\mathrm{DC}}$ and $A_{\Xi}$.

The descent square thus recovers descent data inside the decorated double-category fragment: a descent record $(F,q,F^{\sharp})$ is exact in $\mathsf H_{\mathrm{DC}}$ iff $F^{\sharp}$ is the well-defined descended map of $F$ along $q$. The recovery is a representational result; it does not assert that every descent fact about the core calculus is reducible to a descent square, in keeping with the secondary-organization discipline of the section.
\end{proof}

## 14.3 Theorem 31: Completion-Pasting Recovery

This subsection proves Theorem 31: in the finite decorated double-category fragment of Subsection 14.1, the noncommutation of two finite completions is recorded as the square defect $\delta_\Xi=\Delta_3^{\mathrm{comp}}(E_1,E_2)$ of Subsubsection 5.3.3, and the completion square is exact iff the two completions commute.

Let $C\in\mathrm{Ob}$ be a finite package object and let $E_{1},E_{2}:C\to C$ be two endomaps of $C$ (for instance the completions of Subsection 7.4; Theorem 31 uses no further property of them), with $E_{2}$ used as the horizontal edge and $E_{1}$ used as the vertical edge of the square. Form the decorated square

$$
\Xi_{\mathrm{comp}}\;:\;
\begin{array}{ccc}
C & \xrightarrow{E_{2}} & C\\
{\scriptstyle E_{1}}\downarrow & \Downarrow\,\Xi_{\mathrm{comp}} & \downarrow{\scriptstyle E_{1}}\\
C & \xrightarrow{E_{2}} & C
\end{array}
$$

with $\mathrm{type}_{\Xi}=\texttt{completion}$, $\mathsf{Decor}_{\Xi}$ recording the completion pair $(E_{1},E_{2})$, and $\delta_{\Xi}:=\Delta_3^{\mathrm{comp}}(E_1,E_2)$.

\begin{claimtheorem}{Theorem 31 (CompletionPastingRecovery)}
The decorated square $\Xi_{\mathrm{comp}}$ is exact, in the sense of Subsubsection 14.1.2, iff the two completions commute, that is,

$$
E_{1}\,E_{2}\;=\;E_{2}\,E_{1}\;\;\text{on}\;\;C,
$$

and its defect record is $\delta_\Xi=\Delta_3^{\mathrm{comp}}(E_1,E_2)$. If moreover $\Xi_{\mathrm{comp}}$ is well formed (Subsubsection 14.1.2, with $\delta_\Xi$ recomputed as in the square classifier of Subsubsection 5.6.6) and in scope under $I_{\mathrm{DC}}$, its visibility defect is empty, its audit defect is $\texttt{audit\_passes}$, no partial evidence is declared and its decoration declares no order comparison, then the square classifier of Subsubsection 5.6.6 assigns $\texttt{obstructed}$ iff there exists $c\in C$ with $E_{1}E_{2}(c)\neq E_{2}E_{1}(c)$, and $\texttt{exact}$ otherwise. In the noncommuting case the noncommutation defect

$$
\Delta_3^{\mathrm{comp}}\bigl(E_{1},E_{2}\bigr)\;=\;\bigl\{\,c\in C\;:\;E_{1}E_{2}(c)\neq E_{2}E_{1}(c)\,\bigr\}
$$

is a finite typed defect record under $I_{\mathrm{DC}}$, and the noncommutation $E_{1}E_{2}\neq E_{2}E_{1}$ is recorded as the square defect $\delta_\Xi=\Delta_3^{\mathrm{comp}}(E_1,E_2)$, the $P_3$ completion-commutator defect of Subsubsection 5.3.3. For a third completion $E_3$ on $C$, the horizontal paste $\Xi_{\mathrm{comp}}(E_1,E_2)\cdot\Xi_{\mathrm{comp}}(E_1,E_3)$, in which the right vertical edge $E_1$ of the first square is the left vertical edge of the second, so that the outer square has top and bottom edges $E_3E_2$ and both vertical edges $E_1$, has defect

$$
\{\,c\in C:E_1E_3E_2(c)\neq E_3E_2E_1(c)\,\}\;\subseteq\;\Delta_3^{\mathrm{comp}}(E_1,E_2)\;\cup\;E_2^{-1}\bigl(\Delta_3^{\mathrm{comp}}(E_1,E_3)\bigr),
$$

and this inclusion can be strict.

\end{claimtheorem}

\begin{proof}
The decorated square $\Xi_{\mathrm{comp}}$ has both horizontal edges equal to $E_{2}$ and both vertical edges equal to $E_{1}$. Exactness in the sense of Subsubsection 14.1.2 is the commutation equality of the boundary composition: the upper-right path $E_{1}\circ E_{2}:C\to C$ equals the lower-left path $E_{2}\circ E_{1}:C\to C$. By pointwise equality of maps on the finite carrier $C$, this is the equation $E_{1}E_{2}=E_{2}E_{1}$ on $C$.

*Forward direction.* Suppose $\Xi_{\mathrm{comp}}$ is exact. Then by definition $E_{1}E_{2}(c)=E_{2}E_{1}(c)$ for every $c\in C$, hence $E_{1}E_{2}=E_{2}E_{1}$ on $C$.

*Reverse direction.* Suppose $E_{1}E_{2}=E_{2}E_{1}$ on $C$. Then the boundary composition of $\Xi_{\mathrm{comp}}$ commutes pointwise on the finite carrier $C$, so by the exactness criterion of Subsubsection 14.1.2 the square is exact.

For the obstruction direction, suppose there exists $c_{0}\in C$ with $E_{1}E_{2}(c_{0})\neq E_{2}E_{1}(c_{0})$. The set

$$
\Delta_3^{\mathrm{comp}}(E_{1},E_{2})\;=\;\bigl\{\,c\in C:E_{1}E_{2}(c)\neq E_{2}E_{1}(c)\,\bigr\}
$$

is a finite subset of $C$ containing $c_{0}$, and is recorded as the finite typed defect record $\delta_{\Xi}$ of the square. Since $\delta_{\Xi}\neq\varnothing$, the completion square is not exact. Under the additional hypotheses of the status clause, the scope, visibility, audit and circularity rows of the square classifier do not apply, so it assigns $\texttt{obstructed}$ exactly when $\delta_\Xi\ne\varnothing$, and otherwise, with no order comparison and no partial evidence, $\texttt{exact}$. As in the completion-pasting defect of Subsection 7.5, this noncommutation of two finite completions is the route/pasting witness for $P_{3}$. Hence $E_{1}E_{2}\neq E_{2}E_{1}$ is recovered as a $P_{3}$-pasting defect.

Each step is a finite check on the finite host data of $\mathsf H_{\mathrm{DC}}$, recorded in $A_{\mathrm{DC}}$ and $A_{\Xi}$.

The completion square records noncommutation through $\delta_\Xi=\Delta_3^{\mathrm{comp}}(E_1,E_2)$; commuting completions yield exact squares.
For the paste, if $s\notin\Delta_3^{\mathrm{comp}}(E_1,E_2)$ and $E_2s\notin\Delta_3^{\mathrm{comp}}(E_1,E_3)$, then $E_1E_3E_2s=E_3E_1E_2s=E_3E_2E_1s$. The inclusion is strict for the running completions $E_1,E_2$ with $E_3$ the constant map to $\{a,b,c\}$: $E_3$ is idempotent and commutes with $E_1$, both outer composites are the constant map to $\{a,b,c\}$, so the paste has empty defect, while $\Delta_3^{\mathrm{comp}}(E_1,E_2)$ contains $\{a\}$.
\end{proof}

## 14.4 Theorem 32: Strict Extension as No-Filler

This subsection proves Theorem 32: in the finite decorated double-category fragment of Subsection 14.1, a strict extension between two object maps $\pi_{0},\pi_{1}$ on a common carrier $S$ is recovered as the absence of a factorization filler in a decorated square of type $\texttt{factorization}$. The theorem connects the strict-bridge nonfactorization witness of Section 7 (and its Cantor instance in Subsection 13.3) to the no-filler condition in $\mathsf H_{\mathrm{DC}}$.

Let $S$ be a finite carrier object and let $\pi_{0}\in\mathrm{Hor}$ and $\pi_{1}\in\mathrm{Hor}$ be two horizontal object maps $\pi_{0}:S\to O_{0}$ and $\pi_{1}:S\to O_{1}$ with finite codomains. Write $\mathrm{im}(\pi_{0})$ for the effective old interface, and let $\phi:\mathrm{im}(\pi_{0})\to O_{1}$ be a candidate vertical filler map. For this factorization construction, take the finite completion of $\mathsf H_{\mathrm{DC}}$ that adjoins interface package objects for $\mathrm{im}(\pi_0)$ and $O_1$, the corestriction $S\to\mathrm{im}(\pi_0)$ to $\mathrm{Hor}$, $\mathrm{id}_S$ and every map $\phi:\mathrm{im}(\pi_0)\to O_1$ to $\mathrm{Ver}$, and the corresponding candidate factorization squares, with their boundary, defect and audit records, to $\mathrm{Sq}$. In $\Xi_{\mathrm{fact}}(\phi)$ the top edge labelled $\pi_0$ is this corestriction. This completion is finite because the carriers are finite. Every $\Xi_{\mathrm{fact}}(\phi)$ in Theorem 32 is evaluated in this completed host. Form the decorated factorization square

$$
\Xi_{\mathrm{fact}}(\phi)\;:\;
\begin{array}{ccc}
S & \xrightarrow{\pi_{0}} & \mathrm{im}(\pi_{0})\\
{\scriptstyle\mathrm{id}_{S}}\downarrow & \Downarrow\,\Xi_{\mathrm{fact}}(\phi) & \downarrow{\scriptstyle\phi}\\
S & \xrightarrow{\pi_{1}} & O_{1}
\end{array}
$$

with $\mathrm{type}_{\Xi}=\texttt{factorization}$ and $\mathsf{Decor}_{\Xi}$ recording the factorization candidate $(\pi_{0},\pi_{1},\phi)$.

\begin{claimtheorem}{Theorem 32 (StrictExtensionAsNoFiller)}
For every $\phi:\mathrm{im}(\pi_{0})\to O_{1}$, with $\Xi_{\mathrm{fact}}(\phi)$ well formed (Subsubsection 14.1.2, with $\delta_\Xi$ recomputed as in the square classifier of Subsubsection 5.6.6), so that $\delta_\Xi(\phi)=\{s:\phi(\pi_0(s))\neq\pi_1(s)\}$, the factorization square $\Xi_{\mathrm{fact}}(\phi)$ is exact, that is, $\phi$ is a filler of its frame, iff

$$
\pi_{1}\;=\;\phi\circ\pi_{0}\;\;\text{on}\;\;S.
$$

Hence

$$
\pi_{1}\not\factor\pi_{0}\quad\Longleftrightarrow\quad\text{no exact factorization filler exists for}\;(\pi_{0},\pi_{1}),
$$

with $\mathrm{Fill}(\pi_{0},\pi_{1})\;=\;\bigl\{\,\phi:\mathrm{im}(\pi_{0})\to O_{1}\;:\;\pi_{1}=\phi\circ\pi_{0}\,\bigr\}$ and

$$
\mathrm{Fill}(\pi_{0},\pi_{1})\;=\;\varnothing\quad\Longleftrightarrow\quad\exists\,s,s'\in S:\;\pi_{0}(s)=\pi_{0}(s')\;\land\;\pi_{1}(s)\neq\pi_{1}(s').
$$

\end{claimtheorem}

\begin{proof}
The proof translates the nonfactorization witness $\pi_{1}\not\factor\pi_{0}$ of Subsection 7.7 into the no-filler condition for $\Xi_{\mathrm{fact}}$.

*Filler iff factorization.* Suppose $\phi:\mathrm{im}(\pi_{0})\to O_{1}$ satisfies $\pi_{1}=\phi\circ\pi_{0}$ on $S$. Then the boundary composition of $\Xi_{\mathrm{fact}}(\phi)$ commutes pointwise: for every $s\in S$, the upper-right path returns $\phi(\pi_{0}(s))=\pi_{1}(s)$, and the lower-left path returns $\pi_{1}(\mathrm{id}_{S}(s))=\pi_{1}(s)$. By the exactness criterion of Subsubsection 14.1.2, $\Xi_{\mathrm{fact}}(\phi)$ is exact, that is, $\phi$ is a filler. Conversely, if $\phi$ is a filler, then by definition the boundary composition commutes pointwise, so $\pi_{1}(s)=\phi(\pi_{0}(s))$ for every $s\in S$, that is, $\pi_{1}=\phi\circ\pi_{0}$ on $S$.

*No filler iff nonfactorization witness.* Suppose $\mathrm{Fill}(\pi_{0},\pi_{1})=\varnothing$. By the equivalence above, no $\phi$ satisfies $\pi_{1}=\phi\circ\pi_{0}$. Equivalently, the assignment $\pi_{0}(s)\mapsto\pi_{1}(s)$ is not a well-defined function on $\mathrm{im}(\pi_{0})$, so there exist $s,s'\in S$ with $\pi_{0}(s)=\pi_{0}(s')$ and $\pi_{1}(s)\neq\pi_{1}(s')$. Conversely, suppose there exist such $s,s'\in S$. Then any candidate $\phi$ with $\pi_{1}=\phi\circ\pi_{0}$ would require $\phi(\pi_{0}(s))=\pi_{1}(s)$ and $\phi(\pi_{0}(s))=\phi(\pi_{0}(s'))=\pi_{1}(s')$, contradicting $\pi_{1}(s)\neq\pi_{1}(s')$. Hence $\mathrm{Fill}(\pi_{0},\pi_{1})=\varnothing$.

The two equivalences together yield the theorem: $\pi_{1}\not\factor\pi_{0}$ on $S$ in the sense of Subsection 7.7 holds iff no exact filler exists for $\Xi_{\mathrm{fact}}$, iff there exist $s,s'\in S$ with $\pi_{0}(s)=\pi_{0}(s')$ and $\pi_{1}(s)\neq\pi_{1}(s')$. Each step is a finite check on the finite host data of $\mathsf H_{\mathrm{DC}}$, recorded in $A_{\mathrm{DC}}$ and $A_{\Xi}$.

The factorization square thus records the strict-extension nonfactorization witness inside the decorated double-category fragment: a strict extension is exactly the absence of an exact filler for the factorization square. The Cantor strict-bridge realization of Subsection 13.3 supplies a concrete instance: the finite witness set $W$ of the audited shell carries $\pi_{1}\not\factor\pi_{0}$ on $W$, so $\mathrm{Fill}(\pi_{0},\pi_{1})=\varnothing$ on $W$, and $\Xi_{\mathrm{fact}}$ has no filler there.
\end{proof}

## 14.5 High-Structure Nonclaims

This subsection records the high-structure nonclaims that fix the boundaries of Section 14: the decorated-square fragment is secondary, the status family discipline is preserved, and the general propagation of pasting defects is future work.

### 14.5.1 No Double-Category Completeness

The finite decorated double-category fragment $\mathsf H_{\mathrm{DC}}$ of Subsection 14.1 does not replace the core calculus $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. Theorems 30, 31, and 32 record three specific recovery results — descent data as descent squares, completion noncommutation as completion squares, and strict-extension nonfactorization as factorization squares — and not a general claim that every theorem-grade fact about the calculus is reducible to a decorated-square fact.

In particular, the section does not claim:

- that $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ embeds into $\mathsf H_{\mathrm{DC}}$ as a sub-double-category;
- that every directed-cell judgment of Subsection 4.3 is recovered by a decorated square;
- that the priority order of the classifier of Subsubsection 11.2.1 is recovered by the per-square exactness conditions of Subsubsection 14.1.2.

The decorated-square fragment is a secondary organizational layer over the core calculus; it supplies finite, audit-checkable representations of selected core constructions where those representations are useful, and does not promote those representations to a completeness statement about the calculus.

### 14.5.2 No Status Erasure

The decorated-square fragment does not collapse the status families of Subsection 5.1 into a single square-status family. The role-status, cell-status, pair-status, promotion-status, claim-status, gate-status, and square-status families remain separate judgment-indexed families, in keeping with the no-total-algebra and status-family-separation results of Section 6.

In particular, the per-square exactness conditions of Subsubsection 14.1.2 do not assert that:

- every directed-cell status of Subsubsection 5.6.2 is determined by the exactness of a decorated square that contains the cell;
- every pair-observable status of Subsubsection 5.6.3 is determined by the exactness of a decorated square that contains the pair;
- every claim status of Subsubsection 11.2.1 is determined by the exactness of a decorated square.

A decorated square carries its own square-status verdict only as part of a full decorated/audited record: witness and update data, language, visibility, threshold, audit, defect, square status, and nonclaim data must be present when the square is used as a $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ claim. A bare commutative diagram is not an admissible claim. The square-status verdict does not export to the other status families, and the status-separation discipline of the calculus is preserved by Section 14.

### 14.5.3 No General Obstruction Propagation Theorem

The pasting law of Subsubsection 14.1.3 bounds the defect of an admissible horizontal paste: $\delta_{\Xi_1\cdot\Xi_2}\subseteq\delta_{\Xi_1}\cup F_1^{-1}(\delta_{\Xi_2})$, with $\delta_{\mathrm{paste}}(\Xi_1,\Xi_2)=\varnothing$; the inclusion can be strict (Theorem 31). This bound is a computation on the finite paste, not a propagation theorem.

In particular, Section 14 does not claim a general theorem of the form

> a defect at one square in a finite pasting diagram propagates to a defect at every square downstream of it,

nor does it claim a general theorem of the form

> the absence of a defect at one square in a finite pasting diagram suffices for the absence of a defect at every square in the diagram.

Both directions of general defect propagation are future work. Specific propagation facts under specific pasting diagrams may be admissible under the per-diagram audit data of $A_{\Xi_{1}\cdot\Xi_{2}}$, but no general propagation theorem is asserted by the calculus in this paper.

The three nonclaims above together fix the local boundary of the secondary high-structure semantics within $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$: the decorated-square fragment supplies finite recoveries of descent, completion, and strict-extension data, preserves the separation of the status families, and records pasted defects as finite aggregated records without a general propagation theorem.
