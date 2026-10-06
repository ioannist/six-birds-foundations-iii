# Appendix B. Long Proofs

This appendix records long-form proofs that are referenced from the main text. The proofs of Sections 6, 7, 8, 10, 11, 12, and 14 are written in full where feasible inside the main text; this appendix supplements them with the longer technical content of the closure-deficit theorem, the cohomological theorems of Section 8 and the fixed-interface definability bound of Section 7; Subsection B.3 points to the main-text proofs of Theorems 9 and 31.

Each of Subsections B.1, B.2 and B.4 records the long-form proof of a main-text result, ends with the instrument-indexed form of that result (listed for all numbered results in Appendix I), and adds technical lemmas only where the main-text proof would otherwise become unreadable. The full statements remain at their main-text locations; this appendix is a pointer-and-extension document, not a re-statement of theorems.

## B.1 Closure-Deficit Proof

The closure-deficit theorem of Subsection 7.3 (Theorem 8) is the finite Markov/KL result on the host $\mathsf H_{\mathrm{prob}}$. The main-text proof gives the decomposition; this subsection records the same calculation in long form and identifies the associated $P_1$ closure-deficit record. It does not introduce a new theorem.

*Statement (recall).* Fix a finite state space $X$, a finite stochastic kernel on $X$, a fixed distribution, a finite abstraction $\Pi:X\to Y$, a time lag $\tau$, the declared KL predictive closure loss $\mathcal L_\tau$, and an admissible macro-kernel class $\mathcal K_{\mathrm{adm}}$ containing the conditional macro kernel

$$
K^\ast(\cdot\mid y)=P(\Pi(X_{t+\tau})\mid\Pi(X_t)=y)
$$

on the support of $\Pi(X_t)$. Then

$$
\min_{K\in\mathcal K_{\mathrm{adm}}}\mathcal L_\tau(K)
\;=\;
I\bigl(X_t;\Pi(X_{t+\tau})\mid\Pi(X_t)\bigr).
$$

*Proof.* Write

$$
Y_t=\Pi(X_t),\qquad Y'=\Pi(X_{t+\tau}).
$$

For a macro kernel $K:Y\to\Delta(Y)$, the declared loss is

$$
\mathcal L_\tau(K)
\;=\;
\mathbb E\!\left[
D_{\mathrm{KL}}\bigl(P(Y'\mid X_t)\,\|\,K(\cdot\mid Y_t)\bigr)
\right].
$$

Because the state space is finite, the expectation decomposes over the finite support of $Y_t$. For any $y$ with $P(Y_t=y)>0$, expand the conditional loss:

$$
\mathbb E\!\left[
D_{\mathrm{KL}}\bigl(P(Y'\mid X_t)\,\|\,K(\cdot\mid y)\bigr)
\mid Y_t=y
\right].
$$

Insert and subtract the conditional macro law $P(Y'\mid Y_t=y)$. The finite KL projection identity gives

$$
\begin{aligned}
&\mathbb E\!\left[
D_{\mathrm{KL}}\bigl(P(Y'\mid X_t)\,\|\,K(\cdot\mid y)\bigr)
\mid Y_t=y
\right] \\
&\quad =
\mathbb E\!\left[
D_{\mathrm{KL}}\bigl(P(Y'\mid X_t)\,\|\,P(Y'\mid Y_t=y)\bigr)
\mid Y_t=y
\right]
+D_{\mathrm{KL}}\bigl(P(Y'\mid Y_t=y)\,\|\,K(\cdot\mid y)\bigr).
\end{aligned}
$$

The first term is independent of $K$. The second term is non-negative and is minimized, with value zero, by

$$
K^\ast(\cdot\mid y)=P(Y'\mid Y_t=y),
$$

which belongs to $\mathcal K_{\mathrm{adm}}$ by hypothesis. Therefore the minimizing loss is the expectation of the first term:

$$
\min_{K\in\mathcal K_{\mathrm{adm}}}\mathcal L_\tau(K)
\;=\;
\mathbb E\!\left[
D_{\mathrm{KL}}\bigl(P(Y'\mid X_t)\,\|\,P(Y'\mid Y_t)\bigr)
\right].
$$

For finite variables this expectation is the conditional mutual information $I(X_t;Y'\mid Y_t)$. Substituting $Y_t=\Pi(X_t)$ and $Y'=\Pi(X_{t+\tau})$ proves the equality.

Support-zero cases are ignored by restricting the calculation to the finite support of $Y_t$, equivalently by the standard convention that zero-probability conditioning events do not contribute to the expectation. The finite-state hypothesis makes every sum a finite sum of terms in $[0,+\infty]$ (as in Theorem 8), and the minimizer $K^\ast$ a finite macro kernel with finite loss.

The associated $P_1$ closure-deficit value is

$$
\mathrm{CD}_{\tau}^{\mu}(\Pi)
\;=\;
I\bigl(X_t;\Pi(X_{t+\tau})\mid\Pi(X_t)\bigr),
$$

with exact-closure threshold $\Theta_1^{\mathrm{closure}}:\mathrm{CD}_{\tau}^{\mu}(\Pi)=0$ and approximate threshold $\mathrm{CD}_{\tau}^{\mu}(\Pi)\le\varepsilon$, as in the defect schema of Subsubsection 5.3.1. Written as a defect record,

$$
\delta_{\mathrm{cl}}^{\mathrm{prob}}
\;=\;
(\,\mathrm{CD}_{\tau}^{\mu}(\Pi),\;\Omega_{\mathrm{cl}},\;\Theta_1^{\mathrm{closure}},\;\mathrm{polarity}_{\mathrm{gap}},\;W_{\mathrm{cl}},\;A_{\mathrm{prob}},\;V_{\mathrm{prob}},\;\sigma_{\mathrm{cl}}\,),
$$

where $W_{\mathrm{cl}}$ is the finite collection of conditional-distribution entries used in the KL calculation, $A_{\mathrm{prob}}$ is the host audit record, $V_{\mathrm{prob}}$ is the visibility record, and $\sigma_{\mathrm{cl}}$ is the status annotation assigned by the later classifier. This record is a supporting defect record, not an additional theorem statement.

The instrument-indexed verdict remains the main-text theorem line

$$
\Gamma\,;\;\mathsf H_{\mathrm{prob}}\,;\;I_{\mathrm{prob}}\;\vdash\;\textsc{FiniteMarkovClosureDeficit}\;:\;\texttt{accepted}.
$$

## B.2 Graph/Cohomology Proofs

This subsection records long-form proofs of the four graph/cohomology theorems of Section 8: forest no-drive (Theorem 15), exact-form null-drive (Theorem 16), nonzero-affinity equivalence (Theorem 17), and gating-affinity suppression (Theorem 18). The main-text proofs in Section 8 are sufficient for the headline statements; this subsection records the long-form arguments and the associated $P_2$ and $\mathrm{P6}_{\mathrm{drive}}^{H^{1}}$ defect bookkeeping.

### B.2.1 Forest No-Drive (Theorem 15)

*Statement (recall).* Let $G=(V,E)$ be a finite graph with first Betti number $\beta_{1}(G)=0$, that is, $G$ is a forest. Let $C^{0}(G;k)$, $C^{1}(G;k)$, and $d:C^{0}(G;k)\to C^{1}(G;k)$ be the finite-dimensional (finitely generated free) cochain complex over the declared coefficient field or free coefficient host $k$. Then $Z_{1}(G;k)=0$ and $H^{1}(G;k)=0$.

*Proof.* For a finite graph over the declared coefficient field, or over a declared free coefficient host with the corresponding free-rank interpretation, finite graph cohomology satisfies

$$
H^{1}(G;k)\cong\mathrm{Hom}_k(H_{1}(G;k),k),
$$

by the universal coefficient theorem: the Ext term vanishes because $H_0(G;\mathbb Z)$ is free, and $H_1(G;k)=H_1(G;\mathbb Z)\otimes k$ is free since $H_1(G;\mathbb Z)$ is a free abelian group of rank $\beta_1(G)$ (the proof of Theorem 17 gives a direct argument by spanning forests).

The first Betti number is the finite dimension, or free rank, of $H_1(G;k)$:

$$
\dim H_1(G;k)=\beta_1(G).
$$

If $\beta_1(G)=0$, then $H_1(G;k)=0$; since $G$ has no 2-cells, $H_1(G;k)=Z_1(G;k)$, so $Z_1(G;k)=0$. Therefore $\mathrm{Hom}(H_1(G;k),k)=0$, and hence $H^1(G;k)=0$. Equivalently, a forest has no nontrivial cycle space, so there is no nonzero cycle-supported first cohomology.

The associated no-drive defect record is

$$
\delta_{6}^{\mathrm{forest}}\;=\;(\,H^{1}(G;k),\;\Omega_{\mathrm{drive}},\;\Theta_{=0},\;\mathrm{polarity}_{\mathrm{no\text{-}drive}},\;W_{\mathrm{forest}},\;A_{\mathrm{graph}},\;V_{\mathrm{graph}},\;\sigma_{\mathrm{no\text{-}drive}}\,),
$$

with $W_{\mathrm{forest}}$ the finite forest-witness data (the absence of cycles in $G$).

The instrument-indexed verdict is

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;\textsc{ForestNoDrive}\;:\;\texttt{accepted}.\quad\square
$$

### B.2.2 Exact-Form Null-Drive (Theorem 16)

*Statement (recall).* Let $a\in C^{1}(G;k)$ be a $1$-cochain with $a=d\phi$ for some $\phi\in C^{0}(G;k)$. Then for every cycle $\gamma\in\mathsf{Cycles}(G)$, the cycle integral satisfies $\oint_{\gamma}a=0$.

*Proof.* By definition, the cycle integral is the linear pairing $\oint_{\gamma}a=\langle a,\gamma\rangle=\sum_{e}\gamma(e)\,a(e)$ of the cochain $a$ with the coefficients $\gamma(e)\in k$ of $\gamma\in Z_1(G;k)$. Substituting $a=d\phi$, we have $a(e)=\phi(e^{+})-\phi(e^{-})$ for edge $e$ with head $e^{+}$ and tail $e^{-}$, so

$$
\oint_{\gamma}d\phi\;=\;\sum_{e}\gamma(e)\bigl(\phi(e^{+})-\phi(e^{-})\bigr)\;=\;\sum_{v}\phi(v)\,(\partial\gamma)(v)\;=\;0,
$$

since $\partial\gamma=0$ for $\gamma\in Z_1(G;k)$.

The associated no-drive defect record is

$$
\begin{aligned}\delta_{6}^{\mathrm{exact}}=\bigl(&\{\oint_{\gamma}a:\gamma\in\mathsf{Cycles}(G)\},\Omega_{\mathrm{drive}},\Theta_{=0},\mathrm{polarity}_{\mathrm{no\text{-}drive}},\\&W_{\mathrm{exact}}=\phi,A_{\mathrm{graph}},V_{\mathrm{graph}},\sigma_{\mathrm{no\text{-}drive}}\bigr).\end{aligned}
$$

The instrument-indexed verdict is $\Gamma;\mathsf H_{\mathrm{graph}};I_{\mathrm{graph}}\vdash\textsc{ExactFormNullDrive}:\texttt{accepted}$. $\square$

### B.2.3 Nonzero-Affinity Equivalence (Theorem 17)

*Statement (recall).* For $a\in C^{1}(G;k)$, the cohomology class $[a]\neq 0$ in $H^{1}(G;k)$ iff there exists a cycle $\gamma\in\mathsf{Cycles}(G)$ with $\oint_{\gamma}a\neq 0$.

*Proof.* Forward direction, by contraposition. Suppose $\oint_{\gamma}a=0$ for every cycle $\gamma$. Fix a spanning forest $F$ of $G$ with a root in each component, and let $\phi(v)$ be the signed sum of $a$ along the $F$-path from the root to $v$. Then $a(e)=\phi(\mathrm{head}(e))-\phi(\mathrm{tail}(e))$ for every $e\in F$ by construction, and for every $e\notin F$ because the fundamental cycle of $e$ with respect to $F$ has zero integral. So $a=d^{0}\phi$ and $[a]=0$. The argument uses only the additive group of $k$ (Subsection 8.4 gives the details).

Reverse direction. Suppose there exists $\gamma\in\mathsf{Cycles}(G)$ with $\oint_{\gamma}a\neq 0$. By the exact-form null-drive theorem (Subsubsection B.2.2), an exact $1$-cochain has zero cycle integral on every cycle. Hence $a$ is not exact, so $[a]\neq 0$ in $H^{1}(G;k)$.

The associated drive certificate record is

$$
\kappa_{6}^{\mathrm{drive}}(a)\;=\;(\,[a]\neq 0,\;\Omega_{\mathrm{drive}},\;\Theta_{\neq0},\;\mathrm{polarity}_{\mathrm{drive}},\;W=\gamma,\;A_{\mathrm{graph}},\;V_{\mathrm{graph}},\;\sigma_{\mathrm{drive}}\,).
$$

The instrument-indexed verdict is $\Gamma;\mathsf H_{\mathrm{graph}};I_{\mathrm{graph}}\vdash\textsc{NonzeroAffinityEquivalence}:\texttt{accepted}$. $\square$

### B.2.4 Gating-Affinity Suppression (Theorem 18)

*Statement (recall).* Let $G\rightsquigarrow G'=(V',E')$ be a $P_{2}$-gating that sends $G$ to a forest, that is, $\beta_{1}(G')=0$. Then $H^{1}(G';k)=0$, and no positive cycle-supported cohomological drive certificate $\mathrm{P6}_{\mathrm{drive}}^{H^1}$ exists on $G'$; for every $a\in C^{1}(G';k)$ every cycle integral vanishes, which is a no-drive certificate once the source and audit records required by the surrounding instrument are attached.

*Proof.* By the forest no-drive theorem (Subsubsection B.2.1), $\beta_{1}(G')=0$ implies $H^{1}(G';k)=0$. Hence every cohomology class on $G'$ is zero; in particular, the restriction $[a|_{G'}]$ is the zero class in $H^{1}(G';k)$, so the drive certificate $\kappa_{6}^{\mathrm{drive}}(a)$ does not survive the gating $G\rightsquigarrow G'$. Since $\beta_{1}(G')=0$, the graph $G'$ has no nonzero cycle, so every cycle integral on $G'$ vanishes for every $a\in C^{1}(G';k)$; with the source and audit records required by the surrounding instrument, this is the no-drive certificate.

The cycle-rank loss defect $\delta_{2}^{\mathrm{cycle}}(G,G')=\beta_{1}(G)-\beta_{1}(G')$ records the number of cycles destroyed by the gating; the forest threshold $\Theta_{2}^{\mathrm{forest}}:\beta_{1}(G')=0$ records the gating-to-forest condition.

The instrument-indexed verdict is $\Gamma;\mathsf H_{\mathrm{graph}};I_{\mathrm{graph}}\vdash\textsc{GatingAffinitySuppression}:\texttt{accepted}$. $\square$

The four graph/cohomology theorems together record the no-drive boundary of the graph/cohomology realization of Subsection 13.4: forest hosts have no cycle-supported cohomological drive, exact $1$-cochains have no cycle drive, nonzero cohomology is equivalent to a nonzero cycle integral, and gating to a forest kills cycle-supported drive.

## B.3 Completion and Pasting Proofs

The proofs of Theorems 9 and 31 are complete in Subsubsection 7.4.1 and Subsection 14.3 and are not repeated here.

## B.4 Definability Bound Proof

This subsection records the long-form proof of the fixed-interface definability bound (Theorem 14) of Section 7. The main-text proof is in Subsection 7.9; this subsection records the explicit counting argument and the definability set on a fixed visible interface.

*Statement (recall).* Let $f:X\to Y$ be a finite map on $\mathsf H_{\mathrm{fin}}$. The full finite-lens definability of $f$ is

$$
\mathrm{Definable}(f)\;=\;\{\,f^{-1}(B):B\subseteq\mathrm{im}(f)\,\}.
$$

Then $\mathrm{Definable}(f)$ has cardinality

$$
|\mathrm{Definable}(f)|\;=\;2^{|\mathrm{im}(f)|}.
$$

*Proof.* The set $\mathrm{Definable}(f)$ is in bijection with the powerset of $\mathrm{im}(f)$. Define

$$
\Phi:\mathcal P(\mathrm{im}(f))\longrightarrow\mathrm{Definable}(f),
\qquad
\Phi(B)=f^{-1}(B).
$$

The map is well-defined because each $B\subseteq\mathrm{im}(f)$ gives a subset $f^{-1}(B)\subseteq X$, and by definition this subset lies in $\mathrm{Definable}(f)$.

*Injectivity.* Suppose $B,B'\subseteq\mathrm{im}(f)$ and $B\neq B'$. Choose $y\in B\triangle B'$. Without loss of generality, let $y\in B\setminus B'$. Since $y\in\mathrm{im}(f)$, there exists $x\in X$ with $f(x)=y$. Then $x\in f^{-1}(B)$ but $x\notin f^{-1}(B')$, so $f^{-1}(B)\neq f^{-1}(B')$. Hence $\Phi(B)\neq\Phi(B')$.

*Surjectivity.* By definition, every element of $\mathrm{Definable}(f)$ is of the form $f^{-1}(B)$ for some $B\subseteq\mathrm{im}(f)$. Hence every definable predicate lies in the image of $\Phi$.

The map $\Phi$ is therefore a bijection, and

$$
|\mathrm{Definable}(f)|
\;=\;
|\mathcal P(\mathrm{im}(f))|
\;=\;
2^{|\mathrm{im}(f)|}.
$$

The fixed-interface definability bound records that the number of package distinctions definable through the fixed lens $f$ depends only on the finite interface $\mathrm{im}(f)$. It does not count open-ended definability after changing the interface, the package, the instrument, or the host.

The instrument-indexed verdict is

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{FixedInterfaceDefinabilityBound}\;:\;\texttt{accepted}.\quad\square
$$

The bound is finite and decidable on the finite records. It supports the fixed-interface discipline used in Section 10: strict promotion is recorded as an interface change rather than as theory growth at the same fixed interface.
