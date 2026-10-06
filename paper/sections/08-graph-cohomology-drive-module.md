# 8. Graph/Cohomology Drive Module

This section proves the scoped no-drive and drive-separation results that the calculus uses to keep the drive face $\mathrm{P6}_{\mathrm{drive}}$ distinct from generic $P_6$ audit. The graph cohomology used is the elementary cycle/cochain theory of a finite graph \citep{Hatcher2002AT}. A drive is a circulation that no potential explains: a $1$-cochain whose integral around some cycle is nonzero, that is, a nonzero class in $H^1$. The motivating case is a Markov chain on the graph whose transitions have positive probability in both directions: the cochain $a(x\to y)=\log(P_{xy}/P_{yx})$ integrates around a cycle to that cycle's affinity, and a nonzero cycle affinity rules out detailed balance on that bidirectional Markov support. The theorems below say when such a drive can and cannot exist. All theorems in this section live on the host $\mathsf H_{\mathrm{graph}}$ of finite graphs and finite cycle/cochain data, and all theorems are scoped to cycle-supported cohomological drive on a declared finite graph. The module is not a universal theory of drive: it does not classify all thermodynamic force, all entropy production, or all directionality. The negative scope of Subsubsection 2.4.3 records the corresponding nonclaims, NC-12 and NC-32 of Subsection 15.2 in particular.

## 8.1 Finite Graph/Cohomology Support Model

This subsection fixes the finite graph/cohomology support model used by Theorems 15 through 18. It is a schema-grade declaration of the host data, the drive certificate format, and the gating operations admitted on the host. The no-drive and gating results are stated and proved in Subsections 8.2 through 8.5.

### 8.1.1 Graph Data

The host $\mathsf H_{\mathrm{graph}}$ provides finite graph data:

- a finite vertex set $V(G)$;
- a finite set $E(G)$ of oriented edges (an unoriented graph is given a fixed orientation, with one oriented edge for each unordered adjacent pair and $a(\bar e)=-a(e)$ for the reversed edge $\bar e$; self-loops $x\to x$ are omitted (the log-ratio cochain vanishes on them); Theorems 15–18 are stated for graphs without self-loops);
- the finite first Betti number $\beta_1(G)\;=\;|E(G)|\;-\;|V(G)|\;+\;c(G)$, where $c(G)$ is the number of connected components of $G$;
- the finite-dimensional (finitely generated free) cycle complex $Z_*(G)$ and cochain complex $C^*(G)$ with coboundary $d:C^0\to C^1$, $(d\phi)(e)=\phi(\mathrm{head}(e))-\phi(\mathrm{tail}(e))$, and boundary $\partial:k^{E(G)}\to k^{V(G)}$, $\partial e=\mathrm{head}(e)-\mathrm{tail}(e)$, with $Z_1(G)=\ker\partial$, taken over a fixed coefficient field or, more generally, a declared commutative ring $k$ with identity such as $\mathbb Z$ (a *free coefficient host*: $C^0$, $C^1$ and $Z_1$ are then free $k$-modules, with bases the vertices, the edges and the fundamental cycles of a spanning forest), with dimensions read as free ranks;
- the first cohomology $H^1(G)\;=\;C^1(G)/\mathrm{im}(d)$, a free module of rank $\beta_1(G)$ over the declared coefficients (Theorem 17).

The cycle integral of a finite $1$-cochain $a\in C^1(G)$ around a cycle $\gamma=\sum_e\gamma(e)\,e\in Z_1(G)$ is

$$
\oint_\gamma a\;:=\;\sum_{e\in E(G)}\gamma(e)\,a(e).
$$

For a closed walk $e_1\cdots e_n$ with signs $\varepsilon_k=\pm1$ ($+1$ when $e_k$ is traversed from tail to head), this equals $\sum_k\varepsilon_k\,a(e_k)$. The map $\gamma\mapsto\oint_\gamma a$ is linear. Every record in this section carries a host tag $\mathsf H_{\mathrm{graph}}$, a level tag drawn from $\mathsf{Lev}$, and an instrument annotation. Cycle-supported drive is the only drive notion adjudicated here.

### 8.1.2 Drive Certificate

The drive face $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ on $\mathsf H_{\mathrm{graph}}$ is a finite typed record stating that some cohomology class $[a]\in H^1(G)$ is nonzero. A positive cycle-supported cohomological drive certificate consists of

- a finite $1$-cochain $a\in C^1(G)$;
- a finite cycle $\gamma\in Z_1(G)$ with $\oint_\gamma a\neq 0$;
- the audit and source records required by $\mathsf{AuditPolicy}_I$ and $\mathsf{SourcePolicy}_I$ for the surrounding instrument.

A no-drive certificate is a $P_6$ threshold-check witness record of Subsubsection 3.7.4 containing the graph $G$, the cochain $a$, a declared finite basis of $Z_1(G)$, and the checked equalities $\oint_\gamma a=0$ for every basis cycle, together with the same audit and source data. By linearity these equalities hold on every cycle.

A generic $P_6$ audit record is not a drive certificate: it does not record cycle integrals or cohomology data. The separation between the audit face $P_6$ and the drive face $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ is preserved at the certificate level throughout this section.

### 8.1.3 Gating

A $P_2$-style gate on $\mathsf H_{\mathrm{graph}}$ is a finite admissible map $G\mapsto G'$ obtained by deleting a finite set of edges or by restricting to a finite induced subgraph. A forest-producing gate is a gate whose output $G'$ has $\beta_1(G')=0$. Gates are recorded as finite typed records on the surrounding judgment; an admissible gate is one that conforms to the scope and bridge policy of the surrounding instrument.

## 8.2 Theorem 15: Forest No-Drive

\begin{claimtheorem}{Theorem 15 (ForestNoDrive)}
For a finite graph $G$ on $\mathsf H_{\mathrm{graph}}$, if $\beta_1(G)=0$, then

$$
Z_1(G)\;=\;0\quad\text{and}\quad H^1(G)\;=\;0.
$$

In particular, no cycle-supported cohomological drive certificate $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ is admissible on $G$.
\end{claimtheorem}

\begin{proof}
If $\beta_1(G)=0$ then $|E(G)|=|V(G)|-c(G)$, the edge count of any spanning forest, so $G$ is a forest. Then $Z_1(G)=0$ over any coefficient ring: for $\gamma\neq0$ the edges with $\gamma(e)\neq0$ form a nonempty forest, which has a vertex $v$ on exactly one such edge $e$, and $(\partial\gamma)(v)=\pm\gamma(e)\neq0$. The first cohomology

$$
H^1(G)\;=\;C^1(G)/\mathrm{im}(d)
$$

vanishes over any coefficient ring. Indeed, $G$ is a forest, since $\beta_1(G)=0$. Fix a root in each component and, for $a\in C^1(G)$, define $\phi(v)$ as the sum of $\pm a(e)$ over the edges $e$ of the unique path from the root of $v$'s component to $v$, with sign $+$ when $e$ is traversed from tail to head and $-$ otherwise; the path is unique, so $\phi$ is well defined. For each edge $e$, the path to $\mathrm{head}(e)$ is the path to $\mathrm{tail}(e)$ extended by $e$, or the path to $\mathrm{tail}(e)$ is the path to $\mathrm{head}(e)$ extended by $e$ reversed, so $d\phi(e)=\phi(\mathrm{head}(e))-\phi(\mathrm{tail}(e))=a(e)$. Hence $a=d\phi$ for every $a\in C^1(G)$, and $H^1(G)=0$.

With $H^1(G)=0$ and $Z_1(G)=0$, the only cycle is $\gamma=0$, and $\oint_0a=0$ by linearity, so no nonzero cycle affinity is recorded. Hence no cycle-supported drive certificate is admissible: a positive certificate would require some $\gamma\in Z_1(G)$ with $\oint_\gamma a\neq 0$, but no such cycle exists.

\end{proof}

## 8.3 Theorem 16: Exact-Form Null-Drive

\begin{claimtheorem}{Theorem 16 (ExactFormNullDrive)}
Let $G$ be a finite graph on $\mathsf H_{\mathrm{graph}}$. If a finite $1$-cochain $a\in C^1(G)$ is exact, that is,

$$
a\;=\;d\phi\quad\text{for some }0\text{-cochain }\phi\in C^0(G),
$$

then for every cycle $\gamma\in Z_1(G)$,

$$
\oint_\gamma a\;=\;0.
$$
\end{claimtheorem}

\begin{proof}
Let $\gamma$ be a closed walk $v_0,\ldots,v_n=v_0$ whose $k$-th step traverses the edge $e_k$ with sign $\varepsilon_k=+1$ along its orientation and $\varepsilon_k=-1$ against it. By definition of the coboundary $d\phi(e)=\phi(\mathrm{head}(e))-\phi(\mathrm{tail}(e))$, in either direction $\varepsilon_k\,d\phi(e_k)=\phi(v_k)-\phi(v_{k-1})$, so the cycle integral telescopes:

$$
\oint_\gamma a\;=\;\sum_{k=1}^{n}\,\varepsilon_k\,a(e_k)\;=\;\sum_{k=1}^{n}\bigl(\phi(v_k)\;-\;\phi(v_{k-1})\bigr)\;=\;\phi(v_n)\;-\;\phi(v_0)\;=\;0,
$$

since $v_n=v_0$ on the walk. For a general $\gamma\in Z_1(G)$, $\oint_\gamma d\phi=\sum_e\gamma(e)\bigl(\phi(\mathrm{head}(e))-\phi(\mathrm{tail}(e))\bigr)=\sum_v\phi(v)(\partial\gamma)(v)=0$, since $\partial\gamma=0$ (as in Appendix B.2.2), so $\oint_\gamma a=0$ for every $\gamma\in Z_1(G)$.

The result records that exact $1$-cochains carry no cycle drive: any cohomology class supported on an exact cochain is zero, and the corresponding drive certificate is empty on every cycle.
\end{proof}

## 8.4 Theorem 17: Nonzero-Affinity Equivalence

\begin{claimtheorem}{Theorem 17 (NonzeroAffinityEquivalence)}
Let $G$ be a finite graph on $\mathsf H_{\mathrm{graph}}$ with the fixed coefficient field or declared free coefficient host of Subsubsection 8.1.1, and let $a\in C^1(G)$ with cohomology class $[a]\in H^1(G)$. Then

$$
[a]\;\neq\;0\;\;\Longleftrightarrow\;\;\exists\,\gamma\in Z_1(G)\;:\;\oint_\gamma a\;\neq\;0.
$$

Moreover, for any spanning forest $T\subseteq E(G)$, $[a]\neq0$ if and only if $\oint_{\gamma_e}a\neq0$ for some $e\notin T$, where $\gamma_e$ is the fundamental cycle of $e$; so testing the $\beta_1(G)$ fundamental cycles suffices; indeed $a\mapsto(\oint_{\gamma_e}a)_{e\notin T}$ induces an isomorphism $H^1(G)\cong k^{\beta_1(G)}$, where $k$ is the coefficient field or free coefficient host. In particular, when $1\neq0$ in $k$, $H^1(G)=0$ if and only if $\beta_1(G)=0$; for $e\notin T$ the cochain $\mathbf 1_e$ has $\oint_{\gamma_e}\mathbf 1_e=1\neq0$, so a graph, or the output of a gate, admits a cochain and a cycle with nonzero integral, the mathematical part of a positive drive certificate of Subsubsection 8.1.2, exactly when its first Betti number is positive.
\end{claimtheorem}

\begin{proof}
For the reverse direction, suppose some $\gamma\in Z_1(G)$ satisfies $\oint_\gamma a\neq 0$. By the contrapositive of Theorem 16, $a$ is not exact: if $a=d\phi$ for some $\phi$, then $\oint_\gamma a=0$, contradicting $\oint_\gamma a\neq 0$. Hence $[a]\neq 0\in H^1(G)$.

For the forward direction, we prove the contrapositive: if $\oint_\gamma a=0$ for every $\gamma\in Z_1(G)$, then $a$ is exact. Choose a spanning forest $T\subseteq E(G)$ and a root vertex in each connected component. For a vertex $v$, let $\phi(v)$ be the sum of $a$ along the unique path in $T$ from the root of its component to $v$, each edge counted with sign $+1$ when traversed from tail to head and $-1$ otherwise; so $\phi(\text{root})=0$. For an edge $e\in T$ from $u$ to $v$, the $T$-path to $v$ is the $T$-path to $u$ followed by $e$, or the $T$-path to $u$ passes through $v$ and ends with $e$ traversed backwards; in both cases $\phi(v)-\phi(u)=a(e)$, that is, $a(e)=d\phi(e)$. For an edge $e\notin T$ from $u$ to $v$, let $\gamma_e\in Z_1(G)$ be its fundamental cycle: $e$ followed by the $T$-path from $v$ back to $u$, with the same sign convention. Along $T$, $a=d\phi$, so the path part contributes $\phi(u)-\phi(v)$, and

$$
0\;=\;\oint_{\gamma_e}a\;=\;a(e)\;+\;\phi(u)\;-\;\phi(v),
$$

hence again $a(e)=d\phi(e)$. So $a=d\phi$ and $[a]=0$. The argument uses only addition and subtraction of coefficients, so it holds over the coefficient field and over any declared free coefficient host. Therefore $[a]\neq 0$ implies that some cycle $\gamma$ has $\oint_\gamma a\neq 0$. The contrapositive used only the cycles $\gamma_e$ with $e\notin T$, which gives the Moreover clause; the reverse direction of that clause is the reverse direction above. For the isomorphism, the map $a\mapsto(\oint_{\gamma_e}a)_{e\notin T}$ is linear, and its kernel is $\mathrm{im}(d)$ by the argument above and Theorem 16. It is surjective: given $(c_e)_{e\notin T}$, set $a(e)=c_e$ off $T$ and $a=0$ on $T$; $\gamma_e$ contains exactly one edge outside $T$, namely $e$ with coefficient $1$, so $\oint_{\gamma_e}a=c_e$. Since $|E(G)\setminus T|=|E(G)|-|V(G)|+c(G)=\beta_1(G)$, $H^1(G)\cong k^{\beta_1(G)}$.

The theorem records the equivalence between the cohomological drive certificate $[a]\neq 0$ and the cycle-affinity drive certificate $\oint_\gamma a\neq 0$ on $\mathsf H_{\mathrm{graph}}$ with the declared coefficients; both carry the same cycle-supported cohomological drive face $\mathrm{P6}_{\mathrm{drive}}^{H^1}$.
\end{proof}

## 8.5 Theorem 18: Gating-Affinity Suppression

\begin{claimtheorem}{Theorem 18 (GatingAffinitySuppression)}
Let $G$ be a finite graph on $\mathsf H_{\mathrm{graph}}$, and let $G\mapsto G'$ be a $P_2$-style gate that produces a forest, that is,

$$
\beta_1(G')\;=\;0.
$$

Then

$$
H^1(G')\;=\;0,
$$

and no positive cycle-supported cohomological drive certificate $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ exists on $G'$. For every $a\in C^1(G')$, every cycle integral vanishes. Since $\beta_1(G')=0$, the declared finite basis of $Z_1(G')$ is empty, and the vanishing record on it is a no-drive certificate whenever it is accompanied by the source and audit records required by the surrounding instrument.
\end{claimtheorem}

\begin{proof}
By Theorem 15 applied to $G'$, the cohomology $H^1(G')$ vanishes when $\beta_1(G')=0$. Since the drive certificate $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ requires a cycle $\gamma\in Z_1(G')$ with $\oint_\gamma a\neq 0$, and $Z_1(G')=0$ by Theorem 15, no such certificate exists on $G'$. For the same reason $\oint_\gamma a=0$ holds for every cycle of $G'$ and every $a\in C^1(G')$. Thus the vanishing-integral condition holds for every $a$. Attaching the source and audit records required by the surrounding instrument gives the no-drive certificate of Subsubsection 8.1.2.

\end{proof}

### 8.5.1 Nonclaim

The theorem concerns cycle-supported cohomological drive on a declared finite graph and gate. It does not classify all drive, all thermodynamic force, all entropy production, or all directionality. A drive notion that does not reduce to a cycle-cohomology certificate on a finite graph is outside the scope of this theorem; its adjudication requires a separate drive bridge.

The dependency

$$
P_3\;\mathrel{\mathsf{dep}_{\texttt{requires\_bridge}}}\;\mathrm{P6}_{\mathrm{drive}}
$$

of Subsubsection 4.6.2 remains active: route mismatch alone does not establish a drive certificate, even when route mismatch is recorded as a $P_3$ defect. NC-12 of Subsection 15.2 records the corresponding nonclaim.
