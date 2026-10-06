# 12. Abstract Interpretation Model Family

This section treats abstract interpretation \citep{CousotCousot1977,CousotCousot1979}, with its Galois connections \citep{Ore1944Galois}, as a finite model family for $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ and proves the four model-family theorems that establish its scope. Subsection 12.1 fixes the finite host data and the realized role fragment. Subsections 12.2–12.4 prove Theorems 26, 27, and 28: closure as packaging, descent as sound transformer, and representability as fixedness. Subsection 12.5 proves Model Theorem 29, that a finite family of admissible abstract-interpretation hosts realizes the $P_1/P_2/P_5/P_6$ fragment of the calculus, and $P_1/P_2/P_4/P_5/P_6$ when its refinement records contain a strict refinement. Subsection 12.6 records the abstract-interpretation nonclaims that fix the boundaries of this realization.

*The model-realization convention.* A model-realization statement $\Gamma;\mathcal T;I\vdash\mathcal M\models\mathcal S:\texttt{model\_realization}$ says that a finite realization object $\mathcal M$, which carries host data, an instrument $I$, and source, audit, visibility and nonclaim policies, realizes a declared finite fragment $\mathcal S$ of the calculus. A finite family of assignments sends host data of $\mathcal M$ to every component of $\mathcal S$; each assignment is audited by $I$; the source and visibility policies of $\mathcal M$ meet those that $\mathcal S$ requires; and the nonclaim register of $\mathcal M$ contains the model-realization nonclaims. The verdict $\texttt{model\_realization}$ is not the verdict $\texttt{accepted}$ of a theorem, and it says nothing about fragments larger than $\mathcal S$. Subsection 13.1 gives the full definition; the proof of Model Theorem 29 checks its seven clauses: (1) every component assigned, (2) each assignment audited, (3) sources admitted, (4) required records visible, (5) model-realization nonclaims present, (6) witnesses and updates typed by $\mathsf{Wit}$ and $\mathsf{Upd}$, (7) every realized directed cell, pair observable or promotion bridge carries the status its classifier assigns (Subsection 5.6); role-channel statuses enter through clause 1.

The discipline of the section is the model-realization discipline of Subsection 13.1: abstract interpretation realizes a declared fragment of the calculus and not the whole calculus. In particular, the family additionally realizes $P_3$ when two host closures fail to commute, and the section does not claim that sound abstraction is complete representation, that closure implies transformer soundness, or that the AI fragment is a foundation for the calculus.

## 12.1 Abstract-Interpretation Host

This subsection fixes the finite host data — concrete and abstract domains, abstraction and concretization maps, the closure operator, sound transformers, and audit records — and identifies the role fragment that the host realizes inside $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.

### 12.1.1 Host Data

A finite abstract-interpretation host is a tuple

$$
H\;=\;(\,C,\;A,\;\alpha,\;\gamma,\;\rho,\;F,\;F^{\sharp},\;A_{\mathrm{AI}}\,)
$$

with the following components:

- $(C,\le_C)$ is a finite concrete domain: a finite set $C$ together with a partial order $\le_C$. Concreteness and finiteness are imposed throughout: every supremum, infimum, and fixed point used by the host is taken in a finite poset and is decidable on finite records.
- $(A,\le_A)$ is a finite abstract domain: a finite set $A$ together with a partial order $\le_A$. In this section $A$ always denotes the abstract domain; the audit record of the host is written $A_{\mathrm{AI}}$.
- $\alpha:C\to A$ is a monotone abstraction map, and $\gamma:A\to C$ is a monotone concretization map. The pair forms a Galois connection
$$
\alpha(c)\;\le_A\;a\quad\Longleftrightarrow\quad c\;\le_C\;\gamma(a),
$$
written $\alpha\dashv\gamma$. Equivalently, $\alpha$ and $\gamma$ satisfy unit $c\le_C\gamma\alpha(c)$ and counit $\alpha\gamma(a)\le_A a$.
- $\rho:C\to C$ is the host closure operator, defined by $\rho=\gamma\circ\alpha$. The fixedness set is $\mathrm{Fix}(\rho)=\{c\in C:\rho(c)=c\}$.
- $F:C\to C$ is a monotone concrete transformer, and $F^{\sharp}:A\to A$ is a monotone abstract transformer; transformer soundness is not assumed.
- $A_{\mathrm{AI}}$ is a finite audit record on the host data: it verifies the structural clauses above ($C$ and $A$ are finite ordered domains, $\alpha$ and $\gamma$ are monotone, $\alpha\dashv\gamma$, $\rho=\gamma\alpha$, and $F$ and $F^{\sharp}$ are monotone) and records the Boolean result of checking $\alpha F\le_A F^\sharp\alpha$, which may be false. The audit record is finite and indexed by a host-level instrument $I_{\mathrm{AI}}$.

These data form an *AI pre-host*. An AI host is admissible, written $\mathsf{AdmAIHost}(H)$, exactly when $A_{\mathrm{AI}}$, with $\mathsf{CheckRules}$ drawn from $\mathsf{CheckRules}_{I_{\mathrm{AI}}}$, has $\delta_6^{\mathrm{audit}}(A_{\mathrm{AI}})=\texttt{audit\_passes}$ (in particular its structural checks pass) and the recorded soundness Boolean is true, that is, $\alpha F\le_A F^\sharp\alpha$ holds. Theorems 26–28 use only the pre-host clauses; soundness enters as the $P_1$ witness of an admissible host.

The instrument-indexed claim form for any AI-host theorem in this section is

$$
\Gamma\,;\;\mathsf H_{\mathrm{AI}}\,;\;I_{\mathrm{AI}}\;\vdash\;\varphi\;:\;\chi,
$$

with $\mathsf H_{\mathrm{AI}}$ the AI-host context recording $H$ and $I_{\mathrm{AI}}$ the instrument that audits the host.

### 12.1.2 BirdInt Realized Fragment

Every nonempty admissible finite family of abstract-interpretation hosts sharing one concrete domain $C$ and one concrete transformer $F$, equipped with the witness, source and instrument records constructed in the proof of Model Theorem 29 (Subsection 12.5), realizes the role fragment $P_1/P_2/P_5/P_6$ of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$; it also realizes $P_4$, giving the fragment

$$
P_1\;/\;P_2\;/\;P_4\;/\;P_5\;/\;P_6,
$$

when its refinement records contain a pair with $\rho_k\ne\rho_\ell$. The realization map is fixed as follows:

- $P_5$ (packaging) is realized by the closure operator $\rho=\gamma\alpha$. Theorem 26 of Subsection 12.2 records that $\rho$ is extensive, monotone, and idempotent, hence supplies the finite packaging/objecthood record for the AI host.
- $P_1$ (descent) is realized by the soundness inequality $\alpha F\le_A F^{\sharp}\alpha$, equivalently $F\gamma\le_C\gamma F^{\sharp}$. Theorem 27 of Subsection 12.3 records that the equivalence is the descent-square soundness condition for the AI host.
- $P_2$ (representability) is realized by exact representability $p\,\text{representable}\iff\exists a\in A:\gamma(a)=p$. Theorem 28 of Subsection 12.4 records the equivalence with fixedness $\rho(p)=p$ and with $\mathrm{im}(\gamma)$.
- $P_4$ (refinement) is realized by audited refinement records between abstract domains within a finite family of hosts: a refinement record $A_k\leadsto A_\ell$ is a finite audited bridge comparing the precision of two abstract domains within $\mathsf H_{\mathrm{AI}}$, and it realizes $P_4$ when $\rho_k\ne\rho_\ell$.
- $P_6$ (audit) is realized by the host audit record $A_{\mathrm{AI}}$ of Subsubsection 12.1.1, indexed by $I_{\mathrm{AI}}$.

The role $P_3$ (route mismatch) is not realized by the bare AI host. The route mismatch primitive of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ requires a route record and a route-mismatch defect, neither of which is supplied by a single Galois pair. The realized fragment of a family is $P_1/P_2/P_5/P_6$, extended to $P_1/P_2/P_4/P_5/P_6$ when the refinement records contain a strict refinement. The family additionally realizes $P_3$ when two host closures fail to commute.

The fragment discipline of Subsection 13.1 then applies: realization of the fragment $P_1/P_2/P_4/P_5/P_6$ does not imply realization of the whole calculus, and the abstract-interpretation host is not a foundation for $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ but a model family within it.

## 12.2 Theorem 26: Closure as Packaging

This subsection proves Theorem 26: in any finite AI pre-host, the composite $\rho=\gamma\alpha$ is a closure operator and so realizes the $P_5$ packaging role of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.

Let $H=(C,A,\alpha,\gamma,\rho,F,F^{\sharp},A_{\mathrm{AI}})$ be a finite AI pre-host of Subsubsection 12.1.1, not assumed sound, with Galois connection $\alpha\dashv\gamma$ and $\rho=\gamma\alpha$.

\begin{claimtheorem}{Theorem 26 (AIClosureAsPackaging)}
The map $\rho:C\to C$ is a closure operator on $(C,\le_C)$: it is extensive, monotone, and idempotent, that is,

$$
c\;\le_C\;\rho(c)\quad\text{(extensive)},
$$

$$
c\;\le_C\;c'\;\Longrightarrow\;\rho(c)\;\le_C\;\rho(c')\quad\text{(monotone)},
$$

$$
\rho^{2}\;=\;\rho\quad\text{(idempotent)}.
$$

In particular, $\rho$ is a finite packaging operator on $C$ in the sense required by the $P_5$ role of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.

The three closure-operator clauses, with the same proof, hold for arbitrary posets and a Galois connection between them.
\end{claimtheorem}

\begin{proof}
The three closure-operator clauses follow directly from the Galois unit, the monotonicity of $\alpha$ and $\gamma$, and the Galois counit, applied to the finite ordered domains $(C,\le_C)$ and $(A,\le_A)$.

*Extensivity.* The Galois unit asserts $c\le_C\gamma\alpha(c)$ for every $c\in C$. By definition $\rho(c)=\gamma\alpha(c)$, so $c\le_C\rho(c)$.

*Monotonicity.* Suppose $c\le_C c'$. Monotonicity of $\alpha$ gives $\alpha(c)\le_A\alpha(c')$. Monotonicity of $\gamma$ then gives $\gamma\alpha(c)\le_C\gamma\alpha(c')$, that is, $\rho(c)\le_C\rho(c')$.

*Idempotence.* Apply the Galois counit at $a=\alpha(c)$: $\alpha\gamma\alpha(c)\le_A\alpha(c)$. Monotonicity of $\gamma$ gives $\gamma\alpha\gamma\alpha(c)\le_C\gamma\alpha(c)$, that is, $\rho^{2}(c)\le_C\rho(c)$. Conversely, extensivity applied at $\rho(c)$ gives $\rho(c)\le_C\rho(\rho(c))=\rho^{2}(c)$. Antisymmetry of $\le_C$ on the finite poset $(C,\le_C)$ yields $\rho^{2}(c)=\rho(c)$ for every $c\in C$, hence $\rho^{2}=\rho$.

Each clause is verified by a finite check on the finite host data $H$ and recorded in the host audit record $A_{\mathrm{AI}}$. The mathematical conclusion uses only the pre-host clauses.

The closure operator $\rho$ is the host's $P_5$ packaging witness: it supplies the finite extensive, monotone, idempotent map on $C$ that the realization map of Subsubsection 12.1.2 requires. Theorems 27 and 28 of Subsections 12.3 and 12.4 then state how the host's $P_1$ and $P_2$ roles are read off from $\alpha$, $\gamma$, $F$, $F^{\sharp}$, and $\rho$.
\end{proof}

## 12.3 Theorem 27: Descent as Sound Transformer

This subsection proves Theorem 27: in any finite AI pre-host, the abstract-side soundness inequality $\alpha F\le_A F^{\sharp}\alpha$ is equivalent to the concrete-side soundness inequality $F\gamma\le_C\gamma F^{\sharp}$. The equivalence gives a finite test for the $P_1$ soundness condition; a $P_1$ descent witness is supplied when either, hence both, inequalities hold.

Let $H=(C,A,\alpha,\gamma,\rho,F,F^{\sharp},A_{\mathrm{AI}})$ be a finite AI pre-host of Subsubsection 12.1.1, not assumed sound, with Galois connection $\alpha\dashv\gamma$ and monotone transformers $F:C\to C$ and $F^{\sharp}:A\to A$.

\begin{claimtheorem}{Theorem 27 (AIDescentAsSoundTransformer)}
The two soundness inequalities

$$
\alpha F\;\le_A\;F^{\sharp}\alpha\qquad\text{and}\qquad F\gamma\;\le_C\;\gamma F^{\sharp}
$$

are equivalent: each holds iff the other does. Equivalently,

$$
\alpha F(c)\;\le_A\;F^{\sharp}\alpha(c)\;\;\text{for every}\;c\in C\quad\Longleftrightarrow\quad F\gamma(a)\;\le_C\;\gamma F^{\sharp}(a)\;\;\text{for every}\;a\in A.
$$

The equivalence gives a finite test for the $P_1$ soundness condition; a $P_1$ descent witness is supplied when either, hence both, inequalities hold.

Moreover, $\alpha F=F^{\sharp}\alpha$ holds if and only if $F$ descends through $\alpha$ in the sense of Theorem 6 and $F^{\sharp}|_{\mathrm{im}\,\alpha}$ is its descended update. The soundness inequality is thus the lax form of the descent square of Theorem 6.

The soundness-inequality equivalence and the equality/descent characterization hold, with the same proof, for arbitrary posets, a Galois connection, and monotone transformers $F,F^\sharp$.
\end{claimtheorem}

\begin{proof}
Each direction follows from the Galois adjunction together with monotonicity of $\alpha$, $\gamma$, $F$, and $F^{\sharp}$.

*Forward direction.* Assume $\alpha F\le_A F^{\sharp}\alpha$. Fix $a\in A$; we show $F\gamma(a)\le_C\gamma F^{\sharp}(a)$. By the Galois adjunction $\alpha\dashv\gamma$, this is equivalent to $\alpha F\gamma(a)\le_A F^{\sharp}(a)$. Apply the assumption at $c=\gamma(a)$:

$$
\alpha F\gamma(a)\;\le_A\;F^{\sharp}\alpha\gamma(a).
$$

The Galois counit gives $\alpha\gamma(a)\le_A a$, and monotonicity of $F^{\sharp}$ gives $F^{\sharp}\alpha\gamma(a)\le_A F^{\sharp}(a)$. Combining the two inequalities yields $\alpha F\gamma(a)\le_A F^{\sharp}(a)$. Re-applying the adjunction returns $F\gamma(a)\le_C\gamma F^{\sharp}(a)$, as required.

*Reverse direction.* Assume $F\gamma\le_C\gamma F^{\sharp}$. Fix $c\in C$; we show $\alpha F(c)\le_A F^{\sharp}\alpha(c)$. By the Galois adjunction, this is equivalent to $F(c)\le_C\gamma F^{\sharp}\alpha(c)$. The Galois unit gives $c\le_C\gamma\alpha(c)$, and monotonicity of $F$ gives $F(c)\le_C F\gamma\alpha(c)$. Apply the assumption at $a=\alpha(c)$:

$$
F\gamma\alpha(c)\;\le_C\;\gamma F^{\sharp}\alpha(c).
$$

Combining the two inequalities yields $F(c)\le_C\gamma F^{\sharp}\alpha(c)$. Re-applying the adjunction returns $\alpha F(c)\le_A F^{\sharp}\alpha(c)$, as required.

*Equality and descent.* If $\alpha F=F^{\sharp}\alpha$ and $\alpha(c)=\alpha(c')$, then $\alpha F(c)=F^{\sharp}\alpha(c)=F^{\sharp}\alpha(c')=\alpha F(c')$, so $F$ descends through $\alpha$ by Theorem 6; since $F^{\sharp}(\alpha(c))=\alpha(F(c))$, the map $F^{\sharp}$ sends $\mathrm{im}(\alpha)$ into itself, and its restriction satisfies the descent equation, so it is the descended update. Conversely, if $F$ descends with descended update $D:\mathrm{im}(\alpha)\to\mathrm{im}(\alpha)$ and $F^{\sharp}$ agrees with $D$ on $\mathrm{im}(\alpha)$, then $F^{\sharp}\alpha(c)=D(\alpha(c))=\alpha F(c)$ for every $c$.

Each step uses only the Galois unit, the Galois counit, monotonicity of $\alpha$, $\gamma$, $F$, $F^{\sharp}$, and antisymmetry/transitivity of $\le_C$ and $\le_A$ on the finite posets. Every check is finite and is recorded in the host audit record $A_{\mathrm{AI}}$. The mathematical conclusion uses only the pre-host clauses.

The equivalence gives a finite test for the $P_1$ soundness condition, and a $P_1$ descent witness is supplied when either, hence both, inequalities hold, in either form: the abstract-side $\alpha F\le_A F^{\sharp}\alpha$ is the upper-soundness inequality used when reasoning about $F^{\sharp}$ as an over-approximation of $F$ on the abstract side, and the concrete-side $F\gamma\le_C\gamma F^{\sharp}$ is the descent inequality used when reasoning about the concretized abstract step as a finite over-approximation of the concrete step. The two inequalities are interchangeable under the Galois adjunction, and the host carries either form indifferently as its $P_1$ record.
\end{proof}

## 12.4 Theorem 28: Representability as Fixedness

This subsection proves Theorem 28: in any finite AI pre-host, exact representability of a concrete element coincides with fixedness under the closure operator $\rho$ and with membership in the image of the concretization map $\gamma$. The equivalence supplies the host's $P_2$ representability witness.

Let $H=(C,A,\alpha,\gamma,\rho,F,F^{\sharp},A_{\mathrm{AI}})$ be a finite AI pre-host of Subsubsection 12.1.1, not assumed sound, with Galois connection $\alpha\dashv\gamma$ and $\rho=\gamma\alpha$. For $p\in C$, define exact representability by

$$
p\;\text{representable}\quad\Longleftrightarrow\quad\exists\,a\in A:\;\gamma(a)=p.
$$

\begin{claimtheorem}{Theorem 28 (AIRepresentabilityAsFixedness)}
For every $p\in C$,

$$
p\;\text{representable}\quad\Longleftrightarrow\quad\rho(p)=p.
$$

Equivalently,

$$
\mathrm{Rep}_{\gamma}(C)\;=\;\mathrm{Fix}(\rho)\;=\;\mathrm{im}(\gamma),
$$

where $\mathrm{Rep}_{\gamma}(C)=\{p\in C:p\text{ representable}\}$, $\mathrm{Fix}(\rho)=\{p\in C:\rho(p)=p\}$, and $\mathrm{im}(\gamma)=\{p\in C:\exists\,a\in A,\;\gamma(a)=p\}$.

The theorem identifies three finite, equally decidable subsets of $C$ — the representable elements, the $\rho$-fixed points, and the image of $\gamma$ — and so supplies the host's $P_2$ representability witness as a finite, audit-checkable predicate on $C$.

The equivalences, with the same proof, hold for arbitrary posets $(C,\le_C)$, $(A,\le_A)$ and a Galois connection between them; finiteness only makes the three subsets decidable.
\end{claimtheorem}

\begin{proof}
The two implications follow from the Galois adjunction $\alpha\dashv\gamma$ and the definition $\rho=\gamma\alpha$.

*Forward direction.* Suppose $p$ is representable, so there exists $a\in A$ with $\gamma(a)=p$. Then

$$
\rho(p)\;=\;\gamma\alpha\gamma(a).
$$

The standard Galois-adjunction identity $\gamma\alpha\gamma=\gamma$ follows from the unit and counit. The counit gives $\alpha\gamma(a)\le_A a$; applying the monotone map $\gamma$ gives

$$
\gamma\alpha\gamma(a)\;\le_C\;\gamma(a).
$$

The unit at the concrete element $\gamma(a)$ gives

$$
\gamma(a)\;\le_C\;\gamma\alpha\gamma(a).
$$

By antisymmetry, $\gamma\alpha\gamma(a)=\gamma(a)$. Hence $\rho(p)=\gamma\alpha\gamma(a)=\gamma(a)=p$.

*Reverse direction.* Suppose $\rho(p)=p$, so $\gamma\alpha(p)=p$. Set $a=\alpha(p)\in A$. Then $\gamma(a)=\gamma\alpha(p)=p$, so $p$ is representable.

The two directions together yield $\mathrm{Rep}_{\gamma}(C)=\mathrm{Fix}(\rho)$. The remaining equality $\mathrm{Fix}(\rho)=\mathrm{im}(\gamma)$ is now immediate: if $p=\rho(p)$, then $p=\gamma\alpha(p)\in\mathrm{im}(\gamma)$; conversely, if $p=\gamma(a)$ for some $a\in A$, then $\rho(p)=\gamma\alpha\gamma(a)=\gamma(a)=p$, so $p\in\mathrm{Fix}(\rho)$.

Each step uses only the Galois unit and counit and the identity $\gamma\alpha\gamma=\gamma$ that is read off from them on the finite posets $(C,\le_C)$ and $(A,\le_A)$. Every check is finite and is recorded in the host audit record $A_{\mathrm{AI}}$. The mathematical conclusion uses only the pre-host clauses.

The fixed set $\mathrm{Fix}(\rho)$ is the host's $P_2$ representability witness. Together with Theorem 26 (which makes $\rho$ a packaging operator) and Theorem 27 (which makes the soundness inequalities equivalent), Theorem 28 closes the local circle: representable elements are exactly the $\rho$-fixed elements, which are exactly the $\gamma$-images, and packaging, descent, and representability are read off from $\rho$, $F^{\sharp}$, and $\gamma$ via the Galois adjunction.
\end{proof}

## 12.5 Model Theorem 29: AI Model-Family Theorem

This subsection proves Model Theorem 29: every nonempty admissible finite family of abstract-interpretation hosts sharing one concrete domain $C$ and one concrete transformer $F$ realizes $P_1/P_2/P_5/P_6$, and it also realizes $P_4$ when its refinement records contain a pair with $\rho_k\ne\rho_\ell$, giving the $P_1/P_2/P_4/P_5/P_6$ fragment of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. The theorem assembles the per-host realizations of $P_5$, $P_1$, and $P_2$ (Theorems 26, 27, 28) with the audited refinement records between hosts and the per-host audit records. The theorem is model-grade rather than theorem-grade: its acceptance verdict is $\texttt{model\_realization}$, not $\texttt{accepted}$, in the sense fixed in Subsection 13.1.

Let

$$
\mathsf{AIFam}_{\mathrm{fin}}\;=\;\{\,H_k\,\}_{k\in\mathcal J}
$$

be a finite family, indexed by a finite set $\mathcal J$, of admissible abstract-interpretation hosts in the sense of Subsubsection 12.1.1:

$$
H_k\;=\;(\,C,\;A_k,\;\alpha_k,\;\gamma_k,\;\rho_k,\;F,\;F_k^{\sharp},\;A_{\mathrm{AI},k}\,),
$$

with $\alpha_k\dashv\gamma_k$ and $\rho_k=\gamma_k\alpha_k$ for each $k\in\mathcal J$, and with $\mathsf{AdmAIHost}(H_k)$ holding for each $k$. For $k,\ell\in\mathcal J$ with $\rho_k\le_C\rho_\ell$ pointwise, equivalently $\mathrm{im}(\gamma_\ell)\subseteq\mathrm{im}(\gamma_k)$ (for closure operators, $\rho_k\le\rho_\ell$ iff $\mathrm{Fix}(\rho_\ell)\subseteq\mathrm{Fix}(\rho_k)$, and $\mathrm{Fix}(\rho)=\mathrm{im}(\gamma)$ by Theorem 28), let $R_{k\to\ell}$ be the audited finite certificate of the inequalities $\rho_k(c)\le_C\rho_\ell(c)$, $c\in C$: the abstract domain $A_k$ is at least as precise as $A_\ell$. Let $\mathsf{Refine}=\{(k,\ell,R_{k\to\ell}):\rho_k\le_C\rho_\ell\}$, and let $\mathcal J\ne\varnothing$. The $P_4$ assignment below uses a pair $(k,\ell,R_{k\to\ell})\in\mathsf{Refine}$ with $\rho_k\neq\rho_\ell$, a strict refinement; the trivial records $(k,k,R_{k\to k})$ do not count: the activation threshold $\Theta_4^{\mathrm{act}}$ of the $P_4$ role-channel record checks that $\rho_k(c)\neq\rho_\ell(c)$ for some $c\in C$, so a record with $\rho_k=\rho_\ell$, including every trivial record, receives $\texttt{below\_threshold}$ and supplies no $P_4$ evidence. If $C$ has a top element and some $\rho_k$ is not constantly $\top_C$, adjoining the one-point host with $\alpha(c)=*$, $\gamma(*)=\top_C$, and $F^\sharp(*)=*$ gives such a pair.

For each $k$, the realization uses finite tagged witness records: a $P_5$ package-map record carrying $\rho_k$; a $P_1$ descent record carrying the two compared maps and the verified inequality; a $P_2$ representability record carrying the finite fixed-point comparison; a $P_6$ audit record carrying $A_{\mathrm{AI},k}$; and, for each selected $(k,\ell)$, a $P_4$ refinement record carrying $R_{k\to\ell}$. For each pair of hosts whose closures fail to commute, choose a point $c_{k\ell}\in\Delta_3^{\mathrm{comp}}(\rho_k,\rho_\ell)$ by finite enumeration, declare the corresponding $\mathsf{RouteMismatchWit}$ record and its defect record visible under $I_{\mathrm{AI}}$, reference the admitted host sources, and add a family audit recomputing both composites at every $c\in C$. Their named signatures belong, respectively, to $\mathsf{Wit}(P_5)$, $\mathsf{Wit}(P_1)$, $\mathsf{Wit}(P_2)$, $\mathsf{Wit}(P_6)$, and $\mathsf{Wit}(P_4)$. Each selected tagged witness $R_i$ is placed in $\Gamma$, $\mathsf{Scope}_{I_{\mathrm{AI}}}$ and $\mathsf{Visible}_{I_{\mathrm{AI}}}$, and supplies a role-channel record $(\mathrm{Chan}_i,R_i,\Theta_i^{\mathrm{act}},A_{R_i},V_{R_i},\mathrm{false})$ of Subsubsection 5.6.1, judged as $\Gamma;\mathcal T_{\mathrm{AI},k};I_{\mathrm{AI}}\vdash\mathrm{Chan}_i:\rho_i$ under the canonical AI package $\mathcal T_{\mathrm{AI},k}=(C,\alpha_k,\Sigma_{\alpha_k},\rho_k,\mathcal A_{\mathrm{AI},k})$ of host $H_k$, with $\Sigma_{\alpha_k}=\{\alpha_k^{-1}(B):B\subseteq A_k\}$ and $\mathcal A_{\mathrm{AI},k}$ assembled from $A_{\mathrm{AI},k}$ (Subsubsection D.3.2), hosted on $\mathsf H_{\mathrm{AI}}$. Its passing audit checks its carried witness data: the refinement audit for $P_4$, the family composite audit for $P_3$, and finite audits of the selected per-host records otherwise. The activation thresholds are: for $P_1$, $\alpha_kF(c)\le F_k^{\sharp}\alpha_k(c)$ rechecked at every $c\in C$; for $P_2$, the recorded representable set equals the recomputed $\mathrm{Fix}(\rho_k)$ and $\mathrm{im}(\gamma_k)$; for $P_5$, extensivity, monotonicity and idempotence of $\rho_k$ rechecked on $C$; for $P_6$, $\delta_6^{\mathrm{audit}}(A_{\mathrm{AI},k})=\texttt{audit\_passes}$; for $P_3$, $\rho_k\rho_\ell(c_{k\ell})\neq\rho_\ell\rho_k(c_{k\ell})$; for $P_4$, $\Theta_4^{\mathrm{act}}$ above. By Theorems 26 and 28 the $P_2$ and $P_5$ thresholds pass for every admissible host. The displayed role map denotes these records through their mathematical payloads. The family record is $(\mathsf{AIFam}_{\mathrm{fin}},\mathsf{Refine},\mathcal N_{\mathrm{AI}})$, where $\mathcal N_{\mathrm{AI}}$ contains the nonclaims of Subsection 12.6 and of Subsubsection 13.6.2; $\mathsf{Visible}_{I_{\mathrm{AI}}}$ contains every host record and every $R_{k\to\ell}$, and for each $k$ a source record $\mathrm{src}_{\mathrm{AI},k}=(\mathrm{id}_k,\texttt{committed\_state},\text{the recorded host data of }H_k,\texttt{valid})$ is audited by $A_{\mathrm{AI},k}$; $\mathsf{SourcePolicy}_{I_{\mathrm{AI}}}$ admits these source records.

\begin{claimtheorem}{Model Theorem 29 (AIModelFamily)}
Fix $k\in\mathcal J$. The four assignments displayed below for $P_5$, $P_1$, $P_2$ and $P_6$, taken at this $k$, realize the role fragment $P_1/P_2/P_5/P_6$ of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. If moreover $\mathsf{Refine}$ contains a triple $(k,\ell,R_{k\to\ell})$ with this first index and $\rho_k\neq\rho_\ell$, the five displayed assignments, with $P_4$ taken at that triple, realize $P_1/P_2/P_4/P_5/P_6$ of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. Such a $k$ exists whenever $\mathsf{Refine}$ contains any triple with $\rho_k\ne\rho_\ell$. The assignments are:

$$
P_5\;\mapsto\;\rho_k,\qquad P_1\;\mapsto\;\alpha_k F\;\le_{A_k}\;F_k^{\sharp}\alpha_k,\qquad P_2\;\mapsto\;\bigl(p\;\text{representable}\;\Longleftrightarrow\;\rho_k(p)=p\bigr),
$$

$$
P_4\;\mapsto\;A_k\leadsto A_\ell\;\text{via}\;R_{k\to\ell},\qquad P_6\;\mapsto\;A_{\mathrm{AI},k}.
$$

In schematic form, when $\mathsf{Refine}$ contains a pair with $\rho_k\neq\rho_\ell$,

$$
\mathsf{AIFam}_{\mathrm{fin}}\;\models\;\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{P_1/P_2/P_4/P_5/P_6}.
$$

Here the $P_4$ assignment is taken at such a pair. If $C$ has a top element and some $\rho_k$ is not constantly $\top_C$, then adjoining the one-point host gives a family whose $\mathsf{Refine}$ contains such a pair, so that family realizes $P_1/P_2/P_4/P_5/P_6$: $A_k$ is strictly more precise than the adjoined one-point host. If $\rho_k\rho_\ell\neq\rho_\ell\rho_k$ for some $\ell$, the assignments at $k$ together with $P_3\mapsto(\rho_k,\rho_\ell,c_{k\ell})$, the route-mismatch record with $c_{k\ell}\in\Delta_3^{\mathrm{comp}}(\rho_k,\rho_\ell)$ (the defect of Theorem 10), realize $P_1/P_2/P_3/P_5/P_6$, and all of $P_1,\ldots,P_6$ when $\mathsf{Refine}$ also contains $(k,\ell',R_{k\to\ell'})$ with $\rho_k\neq\rho_{\ell'}$; such $k,\ell$ are incomparable, since comparable closures commute.

The realization also holds for host-dependent monotone concrete transformers $F_k$, with $P_1\mapsto\alpha_kF_k\le_{A_k}F_k^{\sharp}\alpha_k$.
\end{claimtheorem}

\begin{proof}
The proof verifies, host by host and bridge by bridge, that the components required by the fragment are present, finite, and audited.

*$P_5$ packaging.* For each $k\in\mathcal J$, Theorem 26 of Subsection 12.2 applied to $H_k$ asserts that $\rho_k=\gamma_k\alpha_k$ is a finite closure operator on $(C,\le_C)$. Hence the assignment $P_5\mapsto\rho_k$ supplies a per-host packaging witness recorded in $A_{\mathrm{AI},k}$.

*$P_1$ descent.* For each $k\in\mathcal J$, $\mathsf{AdmAIHost}(H_k)$ gives $\alpha_k F\le_{A_k}F_k^{\sharp}\alpha_k$, and by Theorem 27 of Subsection 12.3 so does $F\gamma_k\le_C\gamma_k F_k^{\sharp}$; this is the host's $P_1$ witness in either form. The assignment $P_1\mapsto(\alpha_k F\le_{A_k}F_k^{\sharp}\alpha_k)$ records the abstract-side form on $H_k$, recorded in $A_{\mathrm{AI},k}$.

*$P_2$ representability.* For each $k\in\mathcal J$, Theorem 28 of Subsection 12.4 applied to $H_k$ asserts $p\,\text{representable}\iff\rho_k(p)=p$ for every $p\in C$, with $\mathrm{Rep}_{\gamma_k}(C)=\mathrm{Fix}(\rho_k)=\mathrm{im}(\gamma_k)$. The assignment $P_2\mapsto(p\,\text{representable}\iff\rho_k(p)=p)$ records the host's $P_2$ representability witness, recorded in $A_{\mathrm{AI},k}$.

*$P_4$ refinement.* Each refinement record $R_{k\to\ell}\in\mathsf{Refine}$ is a finite audited bridge of the form fixed in Subsubsection 12.1.2: it certifies $\rho_k(c)\le_C\rho_\ell(c)$ for every $c$ in the same concrete domain $C$, with audit conditions internal to $\mathsf H_{\mathrm{AI}}$ and audit record contributing to the family-level audit aggregation. The assignment $P_4\mapsto(A_k\leadsto A_\ell)$ thus supplies a $P_4$ refinement witness at every recorded pair with $\rho_k\neq\rho_\ell$, where it records a strict precision comparison. For the one-point host, $\rho(c)=\top_C$ for every $c$, so $\rho_k\le_C\rho$ pointwise and $\rho_k\neq\rho$ when $\rho_k$ is not constantly $\top_C$. Without such a pair no $P_4$ assignment is made, and the other four assignments realize $P_1/P_2/P_5/P_6$.

*$P_6$ audit.* Each per-host audit record $A_{\mathrm{AI},k}$ supplies the $P_6$ audit witness for $H_k$, indexed by the family-level instrument $I_{\mathrm{AI}}$. The aggregation $\bigcup_{k\in\mathcal J}A_{\mathrm{AI},k}$ together with the bridge audit records of $\mathsf{Refine}$ is the family-level audit witness.

*$P_3$ route mismatch.* If $\rho_k\rho_\ell\neq\rho_\ell\rho_k$ for hosts $k,\ell$, then $\rho_k,\rho_\ell$ are idempotent completions on the finite carrier $C$ (Theorem 26), and $\Delta_3^{\mathrm{comp}}(\rho_k,\rho_\ell)=\{c:\rho_k\rho_\ell(c)\neq\rho_\ell\rho_k(c)\}$ is nonempty; the record $(\rho_k,\rho_\ell,c_{k\ell})$, where $c_{k\ell}\in\Delta_3^{\mathrm{comp}}(\rho_k,\rho_\ell)$, is a route-mismatch record in $\mathsf{Wit}(P_3)$, as $W_3$ is in the running example of Subsection 3.8, audited by the family audit of the construction. If $\rho_k\le_C\rho_\ell$ pointwise, then $\rho_\ell\rho_k=\rho_\ell$ and $\rho_k\rho_\ell=\rho_\ell$ (since $\rho_\ell(c)\le\rho_k\rho_\ell(c)\le\rho_\ell\rho_\ell(c)=\rho_\ell(c)$, and $\rho_\ell(c)\le\rho_\ell\rho_k(c)\le\rho_\ell\rho_\ell(c)=\rho_\ell(c)$ by monotonicity and $\rho_k\le\rho_\ell$), so the two closures commute; hence the pair is incomparable. The noncommuting closures $E_1,E_2$ of Theorem 9 arise in this way from the hosts $A_i=\mathrm{Fix}(E_i)$, $\alpha_i=E_i$, $\gamma_i$ the inclusion, $F=\mathrm{id}$ and $F_i^\sharp=\mathrm{id}$.

*Closure of the realization map.* The five assignments above are typed: each maps a role of the declared fragment to a finite, audited datum on $\mathsf{AIFam}_{\mathrm{fin}}$ and $\mathsf{Refine}$, recorded as a witness of that role, so clause 6 of Subsubsection 13.1.1 holds. Clause 1 holds because each role-channel record $(\mathrm{Chan}_i,R_i,\Theta_i^{\mathrm{act}},A_{R_i},V_{R_i},\mathrm{false})$ built above receives $\texttt{active\_projection}$: $R_i$ is in scope on $\mathsf H_{\mathrm{AI}}$ and present, $\mathsf{collapse}_i$ is false, $\Theta_i^{\mathrm{act}}$ passes (by $\mathsf{AdmAIHost}$ for $P_1$, by Theorems 28 and 26 for $P_2$ and $P_5$, because $A_{\mathrm{AI},k}$ passes for $P_6$, because $\rho_k\ne\rho_\ell$ for $P_4$, and because $c_{k\ell}\in\Delta_3^{\mathrm{comp}}$ for $P_3$), and $R_i$ is visible with a passing audit; clause 2 because each datum is audited in $A_{\mathrm{AI},k}$ or in the audit of its refinement record; clause 3 because $\mathsf{SourcePolicy}_{I_{\mathrm{AI}}}$ admits the audited host source records; clause 4 because every host record and refinement record is visible; and clause 5 because $\mathcal N_{\mathrm{AI}}$ contains the nonclaims of Subsubsection 13.6.2. Clause 7 is vacuous for this realization, since its refinement records are not declared promotion bridges and it records no directed cell or pair observable. The family additionally realizes $P_3$ when two host closures fail to commute, by the assignment of the $P_3$ paragraph above. The instrument $I_{\mathrm{AI}}$ records the model-realization judgment, which holds when the realization map satisfies clauses 1--7 of Subsubsection 13.1.1, once the per-host admissibility, the per-host theorems, the bridge admissibility, and the family-level audit records have all been recorded.

The verdict is therefore $\texttt{model\_realization}$, in the sense fixed in Subsection 13.1: the family realizes the declared fragment, and not the whole calculus.

The model-realization verdict is the model-grade analogue of the $\texttt{accepted}$ verdict of Theorems 26, 27, and 28: it records that the host family supplies a finite, audited realization of the declared role fragment, while no realization datum is supplied for the unrealized role $P_3$ on a bare host. The nonclaims of Subsection 12.6 record the boundaries of this realization: the family supplies no cell, pair or promotion realization, sound abstraction is not complete representation, and closure does not imply transformer soundness.

For the last clause, the one-point host has $A=\{*\}$, $\alpha(c)=*$ and $\gamma(*)=\top_C$; this is a Galois connection because $c\le_C\top_C$ for every $c$, and $F^\sharp(*)=*$ satisfies the soundness inequality trivially. Equip the one-point host with the finite audit record checking its order, maps, adjunction, closure and soundness; it then satisfies $\mathsf{AdmAIHost}$. Its closure $\rho$ is constantly $\top_C$, so $\rho_k\le_C\rho$ for every $k$, with $\rho_k\neq\rho$ for the $\rho_k$ that is not constantly $\top_C$.

*Host-dependent transformers.* The assignments at $k$, the certificates $R_{k\to\ell}$ and the defects $\Delta_3^{\mathrm{comp}}(\rho_k,\rho_\ell)$ read only $C$ and the data of the hosts involved; the one-point host satisfies $\alpha F_k(c)=*=F^\sharp\alpha(c)$ for every $F_k$.
\end{proof}

## 12.6 AI Nonclaims

This subsection records the abstract-interpretation nonclaims that fix the boundaries of the realization established in Subsections 12.2–12.5. Each nonclaim is a scoped negative statement attached to the AI model family: it is a record of what the family does not establish, in the sense of the nonclaim discipline of Subsection 2.4. The nonclaims here support the global nonclaim discipline of Section 2 and record the three AI-specific exclusions: no AI totality, no soundness-as-completeness, and no closure-implies-soundness.

### 12.6.1 No AI Totality

Abstract interpretation does not realize the whole calculus $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$: a family may realize all six role channels (Model Theorem 29), but no directed cell, pair observable or promotion bridge. Theorem 29 of Subsection 12.5 asserts the realization of the fragment $P_1/P_2/P_5/P_6$, extended by $P_4$ when the refinement records contain a strict refinement and by $P_3$ when two host closures fail to commute. The bare AI host of Subsubsection 12.1.1 does not supply a route record or a route-mismatch defect, and so does not realize the route-mismatch primitive $P_3$ described in Subsubsection 2.2.2. A single bare host supplies no $P_3$ data; a family supplies $P_3$ data when two of its closures fail to commute (Model Theorem 29). The realization map of Model Theorem 29 assigns no directed cell, pair observable or promotion bridge, so it does not realize the whole calculus; such extensions are not asserted here.

In particular, the family-level claim

$$
\Gamma\,;\;\mathsf H_{\mathrm{AI}}\,;\;I_{\mathrm{AI}}\;\vdash\;\mathsf{AIFam}_{\mathrm{fin}}\;\models\;\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}\;:\;\chi
$$

does not receive verdict $\texttt{model\_realization}$ for the whole calculus on the bare host. The verdict $\texttt{model\_realization}$ is assigned only to the declared fragment: $P_1/P_2/P_5/P_6$, and $P_1/P_2/P_4/P_5/P_6$ when the refinement records contain a strict refinement. The family additionally realizes $P_3$ when two host closures fail to commute.

### 12.6.2 No Soundness-as-Completeness

Sound abstraction does not imply complete representation. The $P_1$ descent witness of Theorem 27 records the inequality $\alpha F\le_A F^{\sharp}\alpha$ (equivalently $F\gamma\le_C\gamma F^{\sharp}$): the abstract transformer $F^{\sharp}$ over-approximates the concrete transformer $F$. The corresponding equality $\alpha F=F^{\sharp}\alpha$, which would assert that $F^{\sharp}$ is a complete (exact) representation of $F$ through the Galois package $(\alpha,\gamma,\rho)$, is not implied by Theorem 27 and is not part of the host's $P_1$ realization datum.

The formal distinction is the inequality/equality distinction itself: $\alpha F\le_A F^{\sharp}\alpha$ is the soundness condition, while $\alpha F=F^{\sharp}\alpha$ is the exactness condition. The host therefore records the descent inequality, not the descent equality, and the AI fragment does not commit to completeness.

### 12.6.3 No Closure-Implies-Soundness

The closure-operator status of $\rho=\gamma\alpha$ from Theorem 26 does not imply the soundness of the abstract transformer $F^{\sharp}$ from Theorem 27. The Galois adjunction $\alpha\dashv\gamma$ is sufficient to establish that $\rho$ is extensive, monotone, and idempotent (Theorem 26), and in particular this establishes the $P_5$ packaging role of the host. It does not, by itself, establish $\alpha F\le_A F^{\sharp}\alpha$, which is an additional, separate condition on the pair $(F,F^{\sharp})$.

The host records the closure operator $\rho$ and the soundness inequality $\alpha F\le_A F^{\sharp}\alpha$ as independent data. Theorem 26 commits only to the closure-operator properties of $\rho$, and Theorem 27 commits only to the equivalence of the two soundness inequalities; neither theorem implies the other. The audit record $A_{\mathrm{AI}}$ of Subsubsection 12.1.1 records both checks separately, and the realization map of Subsubsection 12.1.2 maps $P_5$ to $\rho$ and $P_1$ to the soundness inequality, not from one to the other.

The three nonclaims above together fix the local boundary of the AI model family within $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$: the family does not realize the whole calculus, sound abstraction is not exact representation, and the packaging role does not imply the descent role. The model-realization verdict of Theorem 29 is therefore scoped: it records realization of the fragment $P_1/P_2/P_5/P_6$, extended by $P_4$ when the refinement records contain a strict refinement and by $P_3$ when two host closures fail to commute, and is silent on the rest.
