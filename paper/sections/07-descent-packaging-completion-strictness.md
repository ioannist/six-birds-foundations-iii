# 7. Descent, Packaging, Completion, and Strictness

This section proves the finite theorems on descent, packaging, completion and strictness. Theorem 6 gives the descent condition for a finite update through a quotient or finite map: an update induces a map on classes exactly when it respects the fibres. This is the universal property of a finite quotient, the set-level analogue of the descent question of \citet{Grothendieck1959Descent}, not an instance of that theory. Theorem 7 shows that the update descends exactly when its descent defect, the set of split pairs, is empty. Theorem 8 is the Markov closure-deficit theorem, the only theorem in this paper that lives on the stochastic host $\mathsf H_{\mathrm{prob}}$; its information-theoretic quantities are those of \citet{CoverThomas2006}. Theorems 9 and 10 record noncommuting completions and the resulting pasting defect. Theorem 11 is idempotent saturation. Theorems 12 and 13 record strict-extension nonfactorization and its defect equivalence. Theorem 14 is the fixed-interface definability bound.

## 7.1 Theorem 6: Descent Through Quotient / Finite Map

\begin{claimtheorem}{Theorem 6 (DescentThroughQuotient)}
Let $X$ and $Y$ be finite sets on the host $\mathsf H_{\mathrm{fin}}$, let $q:X\to Y$ be a finite package, quotient, or abstraction map, and let $F:X\to X$ be a finite update. Let $q_{\mathrm{im}}:X\to\mathrm{im}(q)$ denote the effective-image map. There exists a finite descended update $F^\sharp:\mathrm{im}(q)\to\mathrm{im}(q)$ with

$$
F^\sharp\,q_{\mathrm{im}}\;=\;q_{\mathrm{im}}\,F
$$

if and only if

$$
\forall\,x,x'\in X,\quad q(x)=q(x')\;\Longrightarrow\;qF(x)=qF(x').
$$

Equivalently, for a quotient $X/\!\sim$ with quotient map $q$,

$$
\exists\,F^\sharp\colon\;qF=F^\sharp q\;\;\Longleftrightarrow\;\;\bigl(x\sim x'\;\Longrightarrow\;F(x)\sim F(x')\bigr).
$$
The equivalence, with the same proof, holds for arbitrary sets $X,Y$ and arbitrary maps $q,F$; finiteness only makes the descent condition a finite check.
\end{claimtheorem}

### 7.1.1 Data

The hypotheses are: a finite set $X$ on the host $\mathsf H_{\mathrm{fin}}$, a finite map $q:X\to Y$ with effective image $\mathrm{im}(q)\subseteq Y$, a finite update $F:X\to X$. The conclusion quantifies over candidate descended updates $F^\sharp:\mathrm{im}(q)\to\mathrm{im}(q)$; none is given in advance. The judgment is registered under an admissible finite profile whose lens data include the effective-image map $q_{\mathrm{im}}$.

\begin{proof}
For the forward direction, suppose $F^\sharp$ exists with $F^\sharp q_{\mathrm{im}}=q_{\mathrm{im}}F$. Take $x,x'\in X$ with $q(x)=q(x')$. Then $q_{\mathrm{im}}(x)=q_{\mathrm{im}}(x')$, so

$$
q_{\mathrm{im}}F(x)\;=\;F^\sharp q_{\mathrm{im}}(x)\;=\;F^\sharp q_{\mathrm{im}}(x')\;=\;q_{\mathrm{im}}F(x').
$$

Taking the underlying values in the subset $\mathrm{im}(q)\subseteq Y$ gives $qF(x)=qF(x')$, establishing the fiber-constancy condition.

For the reverse direction, suppose $q(x)=q(x')\Rightarrow qF(x)=qF(x')$. Define $F^\sharp$ on $\mathrm{im}(q)$ by

$$
F^\sharp(q_{\mathrm{im}}(x))\;=\;q_{\mathrm{im}}(F(x)),\qquad x\in X.
$$

The fiber-constancy hypothesis ensures this is well-defined: if $q(x)=q(x')$, then $qF(x)=qF(x')$, so the value does not depend on the chosen representative in the fiber. Restricting the codomain to $\mathrm{im}(q)$ gives a finite map $F^\sharp:\mathrm{im}(q)\to\mathrm{im}(q)$, and the relation $F^\sharp q_{\mathrm{im}}=q_{\mathrm{im}}F$ holds by construction.

Both directions are finite checks on finite sets, so the proof is finitary throughout.
\end{proof}

### 7.1.2 Role Interpretation

The theorem records the $P_1/P_5/P_6$ descent condition: $P_1$ supplies the update $F$, $P_5$ supplies the package $q$, and $P_6$ records the audit trail under which the descended map $F^\sharp$ is accepted. Descent through $q$ is admissible exactly when the descent defect $\delta_1^{\mathrm{split}}(q,F)$ of Subsubsection 5.3.1 vanishes; Theorem 7 states this equivalence at the defect level.

## 7.2 Theorem 7: Descent Defect Equivalence

\begin{claimtheorem}{Theorem 7 (DescentDefectEquivalence)}
With $X,Y,q,F$ as in Theorem 6, define the descent defect

$$
\delta_1^{\mathrm{split}}(q,F)\;=\;\{\,(x,x')\in X\times X\;:\;q(x)=q(x')\;\wedge\;qF(x)\neq qF(x')\,\}.
$$

Then

$$
\delta_1^{\mathrm{split}}(q,F)\;=\;\varnothing\;\;\Longleftrightarrow\;\;F\;\text{descends through}\;q,
$$

and equivalently

$$
\delta_1^{\mathrm{split}}(q,F)\;\neq\;\varnothing\;\;\Longleftrightarrow\;\;\nexists\,F^\sharp\colon F^\sharp\,q_{\mathrm{im}}=q_{\mathrm{im}}\,F.
$$

With the same proof, this holds for arbitrary sets and maps; finiteness only makes it a finite check.
\end{claimtheorem}

\begin{proof}
By definition, $\delta_1^{\mathrm{split}}(q,F)$ collects exactly the pairs $(x,x')$ that violate the fiber-constancy condition of Theorem 6. The set is empty iff the fiber-constancy condition holds for every pair, which by Theorem 6 is equivalent to the existence of a descended update $F^\sharp$. The set is nonempty iff there exists a violating pair, which by Theorem 6 is equivalent to the nonexistence of any $F^\sharp$.

Both directions are finite checks on the finite set $X\times X$.

The theorem makes the descent obstruction a finite typed record: a non-empty $\delta_1^{\mathrm{split}}$ is the witness used by the descent gate of Subsubsection 5.4.4 in promotion records that claim macro closure on the target package, and a vanishing $\delta_1^{\mathrm{split}}$ is the corresponding passing condition for that gate.
\end{proof}

## 7.3 Theorem 8: Markov Closure-Deficit Theorem

In this subsection only, $P$ denotes a probability and $I(\cdot\,;\cdot\mid\cdot)$ a conditional mutual information; neither refers to a role label or an instrument.

\begin{claimtheorem}{Theorem 8 (FiniteMarkovClosureDeficit)}
On the finite stochastic host $\mathsf H_{\mathrm{prob}}$, fix a finite state space $X$, a stochastic matrix $M$ on $X$, a distribution $\mu$ on $X$, a finite abstraction $\Pi:X\to Y$ to a finite set $Y$, and a lag $\tau\in\mathbb N_{\ge1}$. Let the pair $(X_t,X_{t+\tau})$ have the joint law $P(X_t=x,\ X_{t+\tau}=x')=\mu(x)\,M^\tau(x,x')$, and write $Y_t=\Pi(X_t)$ and $Y_{t+\tau}=\Pi(X_{t+\tau})$; all probabilities and expectations below are taken under this law. For a stochastic kernel $K:Y\to\Delta(Y)$, the KL predictive closure loss is
$$
\mathcal L_\tau(K)=\mathbb E\Bigl[\,D_{\mathrm{KL}}\bigl(P(Y_{t+\tau}\mid X_t)\,\big\|\,K(\,\cdot\,\mid Y_t)\bigr)\Bigr],
$$
where $D_{\mathrm{KL}}(p\,\|\,q)=\sum_{y}p(y)\log\bigl(p(y)/q(y)\bigr)$, a term with $p(y)=0$ is $0$, and a term with $p(y)>0=q(y)$ is $+\infty$; the expectation is $\sum_{x:\mu(x)>0}\mu(x)\,D_{\mathrm{KL}}\bigl(P(Y_{t+\tau}\mid X_t=x)\,\big\|\,K(\,\cdot\,\mid\Pi(x))\bigr)$, so states of zero $\mu$-mass do not contribute. Let $\mathcal K_{\mathrm{adm}}$ be a declared class of such kernels containing a kernel $K^\ast$ with $K^\ast(\cdot\mid y)=P(Y_{t+\tau}\mid Y_t=y)$ for every $y$ in the support of $Y_t$. Then the minimum predictive closure loss over admissible macro kernels exists, is attained at $K^\ast$, and is

$$
\min_{K\in\mathcal K_{\mathrm{adm}}}\;\mathcal L_\tau(K)\;=\;I\bigl(X_t\,;\,\Pi(X_{t+\tau})\,\big|\,\Pi(X_t)\bigr),
$$

where $I(\,\cdot\,;\,\cdot\,|\,\cdot\,)$ is the conditional mutual information. Moreover, for every kernel $K:Y\to\Delta(Y)$,

$$
\mathcal L_\tau(K)\;=\;I\bigl(X_t\,;\,\Pi(X_{t+\tau})\,\big|\,\Pi(X_t)\bigr)\;+\;\sum_{y\in\operatorname{supp}(Y_t)}P(Y_t=y)\,D_{\mathrm{KL}}\bigl(P(Y_{t+\tau}\mid Y_t=y)\,\big\|\,K(\,\cdot\,\mid y)\bigr),
$$

where the equality is in the extended nonnegative reals: if $K$ gives zero mass to an outcome of positive supported conditional probability, both sides are $+\infty$. So for any class $\mathcal K$ of kernels $\inf_{K\in\mathcal K}\mathcal L_\tau(K)\ge I\bigl(X_t\,;\,\Pi(X_{t+\tau})\,\big|\,\Pi(X_t)\bigr)$, and the minimum over $\mathcal K$ exists and equals this conditional mutual information exactly when $\mathcal K$ contains a kernel that agrees with $K^\ast$ on the support of $Y_t$. In particular $I(X_t;\Pi(X_{t+\tau})\mid\Pi(X_t))=0$ if and only if, for every $x$ with $\mu(x)>0$, the law $\sum_{\Pi(x')=\cdot}M^\tau(x,x')$ depends on $x$ only through $\Pi(x)$; that is, the $\tau$-step kernel $M^\tau$ satisfies the Kemeny--Snell lumpability condition for $\Pi$ at every state of positive $\mu$-mass (implied by Kemeny–Snell lumpability of $M$ for $\Pi$, and in general strictly weaker, since it constrains only $M^\tau$ and only states of positive $\mu$-mass), and then $\mathcal L_\tau(K^\ast)=0$.
\end{claimtheorem}

### 7.3.1 Assumptions

The theorem requires the following finite assumptions, all carried explicitly on the judgment line:

- $\mathsf H_{\mathrm{prob}}$ is the host: a finite state space $X$ with a stochastic matrix $M$ and a distribution $\mu$, which together fix the joint law of $(X_t,X_{t+\tau})$.
- $\Pi:X\to Y$ is a finite abstraction to a finite macro space $Y$.
- $\tau$ is a positive integer lag, and $P(Y_{t+\tau}=y'\mid X_t=x)=\sum_{x':\Pi(x')=y'}M^\tau(x,x')$.
- $\mathcal L_\tau$ is the declared closure loss, the KL predictive loss of the statement.
- The admissible macro-kernel class $\mathcal K_{\mathrm{adm}}$ is a declared class of stochastic kernels $K:Y\to\Delta(Y)$ over which the minimization is taken, and it contains $K^\ast$; values of $K^\ast(\cdot\mid y)$ for $y$ outside the support of $Y_t$ do not affect $\mathcal L_\tau$.

The theorem is theorem-grade only under these declared assumptions; it is not a universal stochastic-emergence statement.

\begin{proof}
Write $Y_t=\Pi(X_t)$ and $Y_{t+\tau}=\Pi(X_{t+\tau})$. For each macro state $y\in Y$ in the support of $Y_t$, decompose the conditional KL loss into a sum of two non-negative terms:

$$
\begin{aligned}
&\mathbb E\Bigl[\,D_{\mathrm{KL}}\bigl(P(Y_{t+\tau}\mid X_t)\,\big\|\,K(\,\cdot\,\mid y)\bigr)\;\Big|\;Y_t=y\,\Bigr]\\
&\qquad=\;\mathbb E\Bigl[\,D_{\mathrm{KL}}\bigl(P(Y_{t+\tau}\mid X_t)\,\big\|\,P(Y_{t+\tau}\mid Y_t=y)\bigr)\;\Big|\;Y_t=y\,\Bigr]\\
&\qquad\quad+\;D_{\mathrm{KL}}\bigl(P(Y_{t+\tau}\mid Y_t=y)\,\big\|\,K(\,\cdot\,\mid y)\bigr).
\end{aligned}
$$

The decomposition is the chain rule for relative entropy: since $Y_t$ is a function of $X_t$, $\mathbb E[P(Y_{t+\tau}\mid X_t)\mid Y_t=y]=P(Y_{t+\tau}\mid Y_t=y)$, and the cross term is the expectation of $\log\bigl(P(Y_{t+\tau}\mid Y_t=y)/K(\cdot\mid y)\bigr)$ under that averaged law. When $K(\cdot\mid y)$ vanishes where $P(Y_{t+\tau}\mid Y_t=y)$ does not, both sides are $+\infty$. The first term does not depend on the choice of $K$. The second term is non-negative and is minimized by the admissible choice $K^\ast(\,\cdot\,\mid y)\;=\;P(Y_{t+\tau}\mid Y_t=y)$, at which it vanishes. Taking expectation over $Y_t=y$ and minimizing over $K\in\mathcal K_{\mathrm{adm}}$,

$$
\min_{K\in\mathcal K_{\mathrm{adm}}}\;\mathcal L_\tau(K)\;=\;\mathbb E\Bigl[\,D_{\mathrm{KL}}\bigl(P(Y_{t+\tau}\mid X_t)\,\big\|\,P(Y_{t+\tau}\mid Y_t)\bigr)\,\Bigr]\;=\;I\bigl(X_t\,;\,Y_{t+\tau}\,\big|\,Y_t\bigr).
$$

Substituting back $Y_t=\Pi(X_t)$ and $Y_{t+\tau}=\Pi(X_{t+\tau})$ gives the stated equality. Taking the expectation of the decomposition without minimizing gives the displayed identity for every kernel $K$, since the expectation of the first term is the conditional mutual information. The second term is nonnegative, which gives the lower bound for any class; it vanishes exactly when $K(\cdot\mid y)=P(Y_{t+\tau}\mid Y_t=y)$ for every $y$ in the support of $Y_t$, which gives the characterization of attainment. Support-zero cases are handled by restricting to the support of the finite distribution; the minimizer is $K^\ast$ on that support, and no convexity of $\mathcal K_{\mathrm{adm}}$ is used.

For the lumpability clause, the conditional mutual information equals $\sum_{\mu(x)>0}\mu(x)D_{\mathrm{KL}}\bigl(P(Y_{t+\tau}\mid X_t=x)\,\|\,P(Y_{t+\tau}\mid Y_t=\Pi(x))\bigr)$, a sum of nonnegative terms; it vanishes if and only if each conditional law equals its fibre average, which is the lumpability condition.

\end{proof}

### 7.3.2 Caution

The theorem is assumption-scoped: the equality holds only when the host is $\mathsf H_{\mathrm{prob}}$ and the assumptions of Subsubsection 7.3.1 are met. It is not a universal stochastic-emergence theorem and does not by itself imply package-implies-closure or strictness-implies-closure; NC-7 of Subsection 15.2 records the corresponding nonclaim. The closure deficit is a finite information-theoretic quantity on a declared finite Markov host; its interpretation outside that host requires a separate bridge.

## 7.4 Theorem 9: Noncommuting Completions

\begin{claimtheorem}{Theorem 9 (NoncommutingCompletions)}
There exist finite idempotent completion operators $E_1,E_2:C\to C$ on the finite power-set lattice $C=\mathcal P(U)$ of a finite set $U$, which are closure operators on $(C,\subseteq)$ (extensive, monotone and idempotent), with

$$
E_1^2\;=\;E_1,\qquad E_2^2\;=\;E_2,
$$

but

$$
E_1\,E_2\;\neq\;E_2\,E_1.
$$

Equivalently, there exists $S\in C$ with $E_1E_2(S)\neq E_2E_1(S)$.
\end{claimtheorem}

### 7.4.1 Construction

Take $U=\{a,b,c\}$ and $C=\mathcal P(U)$, the finite power set of $U$. Define

$$
E_1(S)\;=\;\begin{cases}\,S\cup\{b\}, & a\in S,\\[2pt] S, & a\notin S,\end{cases}\qquad E_2(S)\;=\;\begin{cases}\,S\cup\{c\}, & b\in S,\\[2pt] S, & b\notin S.\end{cases}
$$

Each map is a finite endomap of $C$.

**Extensivity and monotonicity.** $S\subseteq E_1(S)$ is clear. If $S\subseteq T$ and $a\in S$, then $a\in T$ and $E_1(S)=S\cup\{b\}\subseteq T\cup\{b\}=E_1(T)$; if $a\notin S$, then $E_1(S)=S\subseteq T\subseteq E_1(T)$. The argument for $E_2$ is the same with $b$ in place of $a$ and $c$ in place of $b$.

**Idempotence.** For $E_1$: if $a\in S$, then $E_1(S)=S\cup\{b\}$ still contains $a$, so $E_1(E_1(S))=(S\cup\{b\})\cup\{b\}=S\cup\{b\}=E_1(S)$. If $a\notin S$, then $E_1(S)=S$, hence $E_1(E_1(S))=E_1(S)$. So $E_1^2=E_1$. The argument for $E_2$ is symmetric (with $b$ in place of $a$ and $c$ in place of $b$): $E_2^2=E_2$.

**Noncommutation.** Take $S_0=\{a\}$. Then

$$
E_1\,E_2(\{a\})\;=\;E_1(\{a\})\;=\;\{a,b\},
$$

since $E_2$ leaves $\{a\}$ fixed (because $b\notin\{a\}$). On the other hand,

$$
E_2\,E_1(\{a\})\;=\;E_2(\{a,b\})\;=\;\{a,b,c\},
$$

since $E_1$ adds $b$ (because $a\in\{a\}$) and then $E_2$ adds $c$ (because $b\in\{a,b\}$). Hence $E_1E_2(\{a\})\neq E_2E_1(\{a\})$.

\begin{proof}
The construction above is a finite witness: $E_1$ and $E_2$ are finite idempotent endomaps of a finite carrier $C$ with $E_1E_2(\{a\})\neq E_2E_1(\{a\})$. The theorem is established.

\end{proof}

### 7.4.2 Interpretation

Route mismatch is a real defect even when each individual completion is exact and idempotent. The result rules out the overclaim targeted by NC-8 (no idempotence-implies-commutation) of Subsection 15.2 at theorem-grade: $E_1^2=E_1\wedge E_2^2=E_2$ does not imply $E_1E_2=E_2E_1$. Theorem 10 will record the equivalence between non-vanishing route-mismatch defect $\Delta_3^{\mathrm{comp}}(E_1,E_2)$ and noncommutation; the construction here is the finite witness behind that equivalence.

## 7.5 Theorem 10: Completion-Pasting Defect

\begin{claimtheorem}{Theorem 10 (CompletionPastingDefect)}
For any endomaps $E_1,E_2:C\to C$ of a finite carrier $C$ (in particular finite completion endomaps), define the route-mismatch defect

$$
\Delta_3^{\mathrm{comp}}(E_1,E_2)\;=\;\{\,c\in C\;:\;E_1E_2(c)\;\neq\;E_2E_1(c)\,\}.
$$

Then

$$
\Delta_3^{\mathrm{comp}}(E_1,E_2)\;\neq\;\varnothing\;\;\Longleftrightarrow\;\;E_1E_2\;\neq\;E_2E_1.
$$

The defect $\Delta_3^{\mathrm{comp}}$ is a $P_3$-route/pasting defect (Subsubsection 5.3.3); when $E_1,E_2$ are recorded completion endomaps, their completion records supply the $P_5$ witnesses (Subsubsection 5.3.5).

With the same proof, this holds for arbitrary sets and maps; finiteness only makes it a finite check.
\end{claimtheorem}

\begin{proof}
By definition, $\Delta_3^{\mathrm{comp}}(E_1,E_2)$ collects exactly the points $c\in C$ at which the two composites disagree.

If $\Delta_3^{\mathrm{comp}}=\varnothing$, then for every $c\in C$, $E_1E_2(c)=E_2E_1(c)$, so $E_1E_2=E_2E_1$ as maps on $C$.

If $\Delta_3^{\mathrm{comp}}\neq\varnothing$, then there exists some $c\in C$ with $E_1E_2(c)\neq E_2E_1(c)$, so $E_1E_2\neq E_2E_1$ as maps on $C$.

Both directions are finite checks on the finite carrier $C$.

Together with Theorem 9, the result records that the route-mismatch defect is a finite typed record: any noncommutation of finite completions is witnessed by a non-empty $\Delta_3^{\mathrm{comp}}$, and the construction of Theorem 9 is a finite explicit instance with $\{a\}\in\Delta_3^{\mathrm{comp}}(E_1,E_2)$. The high-structure pasting-square fragment of Section 14 later uses this route-mismatch record as the finite input for decorated-square pasting defects.
\end{proof}

## 7.6 Theorem 11: Idempotent Saturation

\begin{claimtheorem}{Theorem 11 (IdempotentSaturation)}
Let $X$ be a finite set on $\mathsf H_{\mathrm{fin}}$, and let $E:X\to X$ be a finite self-map. If $E^2=E$, then for every $n\ge 1$,

$$
E^n\;=\;E.
$$

Pointwise: $\forall n\ge 1\;\forall x\in X,\;E^n(x)=E(x)$.

With the same proof, this holds for arbitrary sets and maps; finiteness only makes it a finite check.
\end{claimtheorem}

\begin{proof}
Induct on $n$.

**Base case** ($n=1$). $E^1=E$ by definition.

**Inductive step.** Assume $E^n=E$ for some $n\ge 1$. Then

$$
E^{n+1}\;=\;E\circ E^n\;=\;E\circ E\;=\;E^2\;=\;E.
$$

At each induction step, the equality $E^n=E$ is an equality of finite functions on the finite carrier $X$; the argument is the ordinary induction on positive integers using the idempotence equation $E^2=E$.
\end{proof}

### 7.6.1 Consequence

Repeated application of a fixed exact completion does not produce theory growth: the saturation $E,E^2,E^3,\ldots$ collapses to $E$ once $E^2=E$. Strict theory growth requires a new object map, bridge, refinement, or nonfactorization witness, not iteration of a fixed completion; NC-9 of Subsection 15.2 is the corresponding nonclaim. For the directed cell, if $U$ applies $E$ to a recorded input $s\in\mathrm{im}(E)$, then $E(s)=s$ by idempotence ($s=E(t)$ gives $E(s)=E^2(t)=E(t)=s$), so $\mathsf{noopU}$ holds, and every cell $P_5\leftarrow P_j$ carrying this update, whatever its informant, is $\texttt{trivial}$ in the classifier of Subsubsection 5.6.2 unless a row above it applies.

## 7.7 Theorem 12: Strict-Extension Nonfactorization

\begin{claimtheorem}{Theorem 12 (StrictExtensionNonfactorization)}
Let $S$ be a finite set on $\mathsf H_{\mathrm{fin}}$, and let

$$
\pi_0\colon S\to O_0,\qquad \pi_1\colon S\to O_1
$$

be finite object maps with effective codomain $O_0^{\mathrm{eff}}=\mathrm{im}(\pi_0)\subseteq O_0$. Then $\pi_1$ does not factor through $\pi_0$, written $\pi_1\not\factor\pi_0$, meaning

$$
\nexists\,\phi\colon O_0^{\mathrm{eff}}\to O_1\;\;\text{with}\;\;\pi_1\;=\;\phi\,\pi_0,
$$

if and only if

$$
\exists\,s,s'\in S\;:\;\pi_0(s)=\pi_0(s')\;\wedge\;\pi_1(s)\neq\pi_1(s').
$$

The equivalence, with the same proof, holds for an arbitrary set $S$ and arbitrary maps $\pi_0,\pi_1$; finiteness only makes the witness search a finite check.
\end{claimtheorem}

### 7.7.1 Data

The hypotheses are: a finite carrier $S$, finite object maps $\pi_0,\pi_1$, the effective codomain $O_0^{\mathrm{eff}}=\mathrm{im}(\pi_0)$; the conclusion quantifies over candidate factorizations $\phi:O_0^{\mathrm{eff}}\to O_1$. The theorem treats $\pi_0,\pi_1$ as the old and new interface of a promotion bridge or extension; the strict-extension condition is the absence of $\phi$.

\begin{proof}
For the reverse direction, suppose there exist $s,s'\in S$ with $\pi_0(s)=\pi_0(s')$ and $\pi_1(s)\neq\pi_1(s')$. Suppose for contradiction that some $\phi:O_0^{\mathrm{eff}}\to O_1$ satisfies $\pi_1=\phi\,\pi_0$. Then

$$
\phi(\pi_0(s))\;=\;\pi_1(s)\;\neq\;\pi_1(s')\;=\;\phi(\pi_0(s')),
$$

contradicting that $\phi$ is well-defined as a function on the common value $\pi_0(s)=\pi_0(s')$. Hence no $\phi$ exists, and $\pi_1\not\factor\pi_0$.

For the forward direction, argue by contraposition: suppose no such pair $(s,s')$ exists, that is, $\pi_0(s)=\pi_0(s')\Rightarrow\pi_1(s)=\pi_1(s')$ for every $s,s'\in S$. Define $\phi$ on $O_0^{\mathrm{eff}}$ by $\phi(\pi_0(s))=\pi_1(s)$ for $s\in S$. The fiber-constancy condition just stated ensures that $\phi$ does not depend on the choice of $s$ in the fiber, so $\phi$ is well-defined. Thus there is a finite map $\phi:O_0^{\mathrm{eff}}\to O_1$ with $\pi_1=\phi\,\pi_0$. Therefore, if no witness pair exists, $\pi_1$ factors through $\pi_0$; equivalently, nonfactorization forces such a witness pair.

Both directions are finite checks on the finite set $S\times S$.
\end{proof}

### 7.7.2 Consequence

The strict-extension condition is exactly nonfactorization of the new interface through the old interface; this is the strictness-gate comparison of Subsubsection 5.4.1 at theorem grade. Strictness does not imply closure (NC-10) or drive (NC-11); the theorem records only the nonfactorization equivalence on the typed object-map data, and the no-go countermodels of Section 9 supply finite explicit instances in which strictness coexists with absent macro closure or absent drive certificates.

## 7.8 Theorem 13: Factorization Defect Equivalence

\begin{claimtheorem}{Theorem 13 (FactorizationDefectEquivalence)}
With $S,\pi_0,\pi_1$ as in Theorem 12, define the factorization defect

$$
\Delta_{\mathrm{fact}}(\pi_0,\pi_1)\;=\;\{\,(s,s')\in S\times S\;:\;\pi_0(s)=\pi_0(s')\;\wedge\;\pi_1(s)\neq\pi_1(s')\,\}.
$$

Then

$$
\Delta_{\mathrm{fact}}(\pi_0,\pi_1)\;\neq\;\varnothing\;\;\Longleftrightarrow\;\;\pi_1\;\not\factor\;\pi_0,
$$

and equivalently

$$
\Delta_{\mathrm{fact}}(\pi_0,\pi_1)\;=\;\varnothing\;\;\Longleftrightarrow\;\;\pi_1\;\factor\;\pi_0.
$$

With the same proof, this holds for arbitrary sets and maps; finiteness only makes it a finite check.
\end{claimtheorem}

\begin{proof}
By definition, $\Delta_{\mathrm{fact}}(\pi_0,\pi_1)$ collects exactly the witness pairs of Theorem 12. The equivalence then follows immediately: nonfactorization holds iff a witness pair exists iff $\Delta_{\mathrm{fact}}$ is nonempty; factorization holds iff no witness pair exists iff $\Delta_{\mathrm{fact}}$ is empty.

Both directions are finite checks on the finite set $S\times S$.

The theorem makes the strictness condition a finite typed record: $\Delta_{\mathrm{fact}}$ is the strictness defect of Subsubsection 5.4.1 read in the present setting, and when the strictness gate $G_{\mathrm{strict}}$ is checked, it is $\texttt{strict\_pass}$ exactly when $\Delta_{\mathrm{fact}}\neq\varnothing$ (Subsubsection 5.4.1).
\end{proof}

## 7.9 Theorem 14: Fixed-Interface Definability Bound

\begin{claimtheorem}{Theorem 14 (FixedInterfaceDefinabilityBound)}
Let $f:X\to Y$ be a finite map on $\mathsf H_{\mathrm{fin}}$, and define the full finite-lens definability of $f$ as

$$
\mathrm{Definable}(f)\;=\;\{\,f^{-1}(B)\;:\;B\subseteq\mathrm{im}(f)\,\}.
$$

Then

$$
|\,\mathrm{Definable}(f)\,|\;=\;2^{|\mathrm{im}(f)|}.
$$

For an arbitrary map $f$, $B\mapsto f^{-1}(B)$ is still a bijection from the subsets of $\mathrm{im}(f)$ onto $\mathrm{Definable}(f)$, so the identity holds with $2^{|\mathrm{im}(f)|}$ read as a cardinal.
\end{claimtheorem}

\begin{proof}
Consider the map $\Phi:\mathcal P(\mathrm{im}(f))\to\mathrm{Definable}(f)$ defined by $\Phi(B)=f^{-1}(B)$. The map is well-defined and surjective onto $\mathrm{Definable}(f)$ by construction.

**Injectivity.** Suppose $B,B'\subseteq\mathrm{im}(f)$ with $B\neq B'$. Without loss of generality, take $y\in B\setminus B'$. Since $y\in\mathrm{im}(f)$, there is some $x\in X$ with $f(x)=y$. Then $x\in f^{-1}(B)$ but $x\notin f^{-1}(B')$, so $f^{-1}(B)\neq f^{-1}(B')$, that is, $\Phi(B)\neq\Phi(B')$.

**Surjectivity.** By definition, every element of $\mathrm{Definable}(f)$ is of the form $f^{-1}(B)$ for some $B\subseteq\mathrm{im}(f)$, hence in the image of $\Phi$.

Therefore $\Phi$ is a bijection $\mathcal P(\mathrm{im}(f))\to\mathrm{Definable}(f)$, and

$$
|\,\mathrm{Definable}(f)\,|\;=\;|\mathcal P(\mathrm{im}(f))|\;=\;2^{|\mathrm{im}(f)|}.
$$

\end{proof}

### 7.9.1 Consequence

For a fixed finite interface $f$, the number of definable package distinctions is exactly $2^{|\mathrm{im}(f)|}$. Open-ended definability requires changing the interface, the package, the instrument, or the host; it does not arise from repeated application of a fixed completion (Theorem 11) or from the same lens at a deeper level. Combined with the strict-extension theorems (Theorems 12 and 13), the bound makes the discipline of Section 10 explicit: strict promotion is recorded as an interface change rather than as theory growth at fixed interface.
