# 5. Status and Defect Semantics

This section gathers the full status families used by the calculus and the defect record schemas that feed the defect-to-status rules consumed by Sections 6 through 11. The role-channel, directed-cell, pair-observable, promotion, and claim status families were introduced per judgment in Section 4; the gate and square families were referenced there. This section consolidates all seven families, fixes the defect record schema, lists the primitive and promotion-specific defect families used by the paper, and states the defect-to-status rules that drive the classifiers. The definitions needed for Theorems 1–4 are listed in the reader's map (Subsection 1.4); the rest of this section is reference material.

## 5.1 Status-Family Separation

\begin{claimdefinition}{Status families}
The seven status families used in this paper are

$$
\begin{aligned}&\mathrm{RoleStatus},\quad\mathrm{CellStatus},\quad\mathrm{PairStatus},\quad\mathrm{PromotionStatus},\\&\mathrm{ClaimStatus},\quad\mathrm{GateStatus},\quad\mathrm{SqStatus}.\end{aligned}
$$

They are kept apart at the schema level: a value in one family is not by definition a value in another, and a status assigned to a judgment in one family does not by itself fix a status in another. Theorem 5 (Subsection 6.5) proves five non-implications between these families: role to cell, cell to pair, strict promotion to cell, strict promotion to same-level soundness (a consequence of Theorem 24, since that claim is never accepted), and strict promotion to accepted lifted soundness under a higher instrument. NC-4 of Subsection 15.2 records the general family separation.
\end{claimdefinition}

The table below sets the seven families side by side. Each row is one value name; an entry gives the value's place in the priority order of that family's classifier (1 is checked first), $\bullet$ marks a value of a family whose rules fix no priority order here, and -- marks a value the family does not have. The Gate column includes the refined values of $\mathrm{StrictGateStatus}$ (Subsubsection 5.1.6); the values $\texttt{glue\_pass}$, $\texttt{glue\_fail}$ and $\texttt{local\_only}$ of $\mathrm{LocGlobGateStatus}$ are not marked in that column, and the $\texttt{local\_only}$ row records the promotion status only. The same name can mean different things in different families: $\texttt{accepted}$ is a verdict on a claim in $\mathrm{ClaimStatus}$ and a promotion whose core gates pass in $\mathrm{PromotionStatus}$.

\begingroup\footnotesize\setlength{\tabcolsep}{3pt}
\begin{longtable}{@{}lccccccc@{}}
\toprule
Value & Role & Cell & Pair & Prom. & Claim & Gate & Square \\
\midrule
\endfirsthead
\toprule
Value & Role & Cell & Pair & Prom. & Claim & Gate & Square \\
\midrule
\endhead
\bottomrule
\endfoot
$\texttt{outside\_scope}$ & -- & 1 & -- & 1 & 1 & $\bullet$ & 1 \\
$\texttt{inapplicable\_outside\_scope}$ & 1 & -- & -- & -- & -- & -- & -- \\
$\texttt{absent}$ & -- & 2 & -- & -- & -- & -- & -- \\
$\texttt{absent\_with\_record}$ & 2 & -- & -- & -- & 3 & -- & -- \\
$\texttt{blocked}$ & -- & 3, 10 (final) & 1, 5 (final) & -- & 2, 10 (final) & -- & 2, 9 (final) \\
$\texttt{failed\_audit}$ & -- & -- & -- & 2 & 4 & -- & 3 \\
$\texttt{failed\_no\_smuggling}$ & -- & -- & -- & 3 & -- & -- & -- \\
$\texttt{failed\_descent}$ & -- & -- & -- & 4 & -- & -- & -- \\
$\texttt{failed\_stability}$ & -- & -- & -- & 5 & -- & -- & -- \\
$\texttt{undefined\_circular}$ & -- & 4 & -- & -- & 5 & -- & 4 \\
$\texttt{collapsed}$ & -- & 5 & -- & -- & -- & -- & -- \\
$\texttt{collapsed\_boundary\_case}$ & 3 & -- & -- & -- & -- & -- & -- \\
$\texttt{below\_threshold}$ & 4 & 6 & -- & -- & 6 & -- & -- \\
$\texttt{globally\_obstructed}$ & -- & -- & -- & 6 & -- & -- & -- \\
$\texttt{local\_only}$ & -- & -- & -- & 7 & -- & -- & -- \\
$\texttt{obstructed}$ & -- & -- & -- & -- & -- & -- & 5 \\
$\texttt{rejected}$ & -- & -- & -- & -- & 7 & -- & -- \\
$\texttt{candidate}$ & -- & -- & -- & 8, 12 (final) & -- & -- & -- \\
$\texttt{trivial}$ & -- & 7 & -- & -- & -- & -- & -- \\
$\texttt{implicit}$ & -- & 8 & -- & -- & -- & -- & -- \\
$\texttt{fail}$ & -- & -- & -- & -- & -- & $\bullet$ & -- \\
$\texttt{not\_checked}$ & -- & -- & -- & -- & -- & $\bullet$ & -- \\
$\texttt{not\_required}$ & -- & -- & -- & -- & -- & $\bullet$ & -- \\
$\texttt{provisional}$ & -- & -- & -- & -- & 8 & -- & 7 \\
$\texttt{real\_provisional}$ & -- & -- & 4 & -- & -- & -- & -- \\
$\texttt{real\_duplicated}$ & -- & -- & 2 & -- & -- & -- & -- \\
$\texttt{lax}$ & -- & -- & -- & -- & -- & -- & 6 \\
$\texttt{action}$ & -- & 9 & -- & -- & -- & -- & -- \\
$\texttt{active\_projection}$ & 5 & -- & -- & -- & -- & -- & -- \\
$\texttt{real}$ & -- & -- & 3 & -- & -- & -- & -- \\
$\texttt{strict}$ & -- & -- & -- & 9 & -- & -- & -- \\
$\texttt{non\_strict}$ & -- & -- & -- & 10 & -- & -- & -- \\
$\texttt{accepted}$ & -- & -- & -- & 11 & 9 & -- & -- \\
$\texttt{exact}$ & -- & -- & -- & -- & -- & -- & 8 \\
$\texttt{pass}$ & -- & -- & -- & -- & -- & $\bullet$ & -- \\
$\texttt{strict\_pass}$ & -- & -- & -- & -- & -- & $\bullet$ & -- \\
$\texttt{non\_strict\_pass}$ & -- & -- & -- & -- & -- & $\bullet$ & -- \\
$\texttt{bad\_audit}$ & -- & -- & -- & -- & -- & $\bullet$ & -- \\
\end{longtable}
\endgroup

### 5.1.1 Role-Channel Statuses

The role-channel status set $\mathrm{RoleStatus}$ is the inherited Foundations II set of five values, displayed with their meanings in Subsubsection 4.2.2.

### 5.1.2 Directed-Cell Statuses

The directed-cell status set $\mathrm{CellStatus}$, with nine values from $\texttt{action}$ to $\texttt{outside\_scope}$, is displayed in Subsubsection 4.3.4.

Its classifier priority order is displayed, with the per-status conditions that the classifier checks, in Subsubsection 5.6.2.

### 5.1.3 Pair-Observable Statuses

The pair-observable status set $\mathrm{PairStatus}$ is displayed, with its meanings and source-of-truth conditions, in Subsection 4.4.

### 5.1.4 Promotion Statuses

The promotion status set $\mathrm{PromotionStatus}$ is displayed in Subsubsection 4.5.3.

The values $\texttt{strict}$ and $\texttt{non\_strict}$ are accepted-status refinements; the failure-tagged values record specific gate failures, as in Subsubsection 4.5.3.

### 5.1.5 Claim Statuses

The instrument-indexed claim status set $\mathrm{ClaimStatus}$ is displayed in Subsubsection 4.8.2.

Subsubsection 4.8.2 records the meanings; Subsubsection 5.6.5 specifies the classifier, and Section 11 proves the no-overreading and same-level self-audit theorems against it.

### 5.1.6 Gate Statuses

A promotion or claim gate has status drawn from the finite set

$$
\mathrm{GateStatus}\;=\;\{\,\texttt{pass},\;\texttt{fail},\;\texttt{not\_required},\;\texttt{not\_checked},\;\texttt{outside\_scope}\,\}.
$$

A strictness gate has the refined set

$$
\begin{aligned}
\mathrm{StrictGateStatus}\;=\;\{\,&\texttt{strict\_pass},\;\texttt{non\_strict\_pass},\;\texttt{not\_required},\\
&\texttt{not\_checked},\;\texttt{bad\_audit},\;\texttt{outside\_scope}\,\}.
\end{aligned}
$$

The local-to-global gate has the refined set

$$
\begin{aligned}\mathrm{LocGlobGateStatus}\;=\;\{\,&\texttt{glue\_pass},\;\texttt{local\_only},\;\texttt{glue\_fail},\\&\texttt{not\_required},\;\texttt{not\_checked},\;\texttt{outside\_scope}\,\}:\end{aligned}
$$

$\texttt{glue\_fail}$ when a recorded gluing record has $\delta_4^{\mathrm{glue}}\neq\varnothing$; $\texttt{local\_only}$ when every local package on the recorded cover is admissible and no gluing record is present; and $\texttt{glue\_pass}$ when a gluing record with $\delta_4^{\mathrm{glue}}=\varnothing$ is present. $G_{\mathrm{suff}}$ checks the recorded value.

The core promotion gates used by the paper are

$$
\mathsf{CoreGates}\;=\;\{\,G_{\mathrm{suff}},\;G_{\mathrm{desc}},\;G_{\mathrm{stab}},\;G_{\mathrm{ctrl}},\;G_{\mathrm{nosmuggle}},\;G_{\mathrm{vis}},\;G_{\mathrm{audit}}\,\},
$$

with the additional strictness gate $G_{\mathrm{strict}}$ and the optional local-to-global gate $G_{\mathrm{locglob}}$. Their roles are fixed in Section 10.

### 5.1.7 Square Statuses

The high-structure module of Section 14 uses the square status set

$$
\begin{aligned}
\mathrm{SqStatus}\;=\;\{\,&\texttt{exact},\;\texttt{lax},\;\texttt{obstructed},\;\texttt{blocked},\;\texttt{outside\_scope},\\
&\texttt{failed\_audit},\;\texttt{undefined\_circular},\;\texttt{provisional}\,\}.
\end{aligned}
$$

The values have the meanings of an exact square ($\texttt{exact}$), an ordered or approximate square comparison ($\texttt{lax}$), a square in scope but with nonzero defect ($\texttt{obstructed}$), and the standard outside, failed-audit, circular, and provisional cases. Subsubsection 5.6.6 gives the square classifier.

## 5.2 General Defect Record (Reference)

*Used by:* The defect field $\delta$ of the directed-cell records used in Theorems 1--5 uses this record form.

### 5.2.1 Record Form

\begin{claimdefinition}{Typed defect record}
A typed defect record is the finite tuple

$$
\mathsf{Def}_i^{\lambda}(\mathcal T,I)\;=\;(\,\delta_i,\;\Omega_i,\;\Theta_i,\;\mathrm{polarity}_i,\;W_i,\;A_i,\;V_i,\;\sigma_i\,)
$$

attached to a primitive index $i\in\{1,\ldots,6\}$ (or to a non-primitive defect family in Subsections 5.4 and 5.5), under profile $\lambda$, theory package $\mathcal T$, and instrument $I$. The fields are finite and have the following roles:

- $\delta_i$: the defect value, a finite typed value drawn from the value type of $\Omega_i$.
- $\Omega_i$: the value object or defect type, naming the kind of value $\delta_i$ takes (numeric, Boolean, categorical, set-valued, cohomological, audit-valued).
- $\Theta_i$: the threshold or pass condition against which $\delta_i$ is evaluated.
- $\mathrm{polarity}_i$: the polarity tag, naming whether the defect is an obstruction, certificate, gap, residual, capacity loss, or other typed polarity drawn from a finite family fixed by the surrounding family.
- $W_i$: the witness, certificate, or counterexample supporting $\delta_i$.
- $A_i$: the audit record of the defect, in the schema of Subsubsection 4.9.2.
- $V_i$: the visibility record of the defect under $I$, in the schema of Subsection 3.5.
- $\sigma_i$: the induced status or status annotation, drawn from the status family appropriate to the surrounding judgment.

The general threshold rule for evaluating a defect is

$$
\mathsf{Eval}_{\Theta_i}(\delta_i)\;\in\;\{\,\texttt{pass},\;\texttt{fail},\;\texttt{not\_checked},\;\texttt{outside\_scope}\,\},
$$

producing one of four verdicts. The verdict feeds the defect-to-status rules of Subsection 5.6.
\end{claimdefinition}

### 5.2.2 Threshold Types

The threshold field $\Theta_i$ is drawn from the finite family

$$
\Theta_i\;\in\;\{\,\Theta_{=0},\;\Theta_{\neq0},\;\Theta_{\le\varepsilon},\;\Theta_{\ge\varepsilon},\;\Theta_{\in S},\;\Theta_{\notin S},\;\Theta_{\mathrm{pass}},\;\Theta_{\mathrm{source}},\;\Theta_{\mathrm{bridge}},\;\Theta_{\mathrm{audit}},\;\Theta_{\mathrm{vis}}\,\}.
$$

The eleven types have the following meanings, used by the per-defect rules of Subsections 5.3 through 5.5:

| Threshold | Meaning |
| --- | --- |
| $\Theta_{=0}$ | exact defect vanishes |
| $\Theta_{\neq0}$ | nontrivial witness exists |
| $\Theta_{\le\varepsilon}$ | approximate defect tolerated below $\varepsilon$ |
| $\Theta_{\ge\varepsilon}$ | activation passes a lower bound $\varepsilon$ |
| $\Theta_{\in S}$ | representability or membership condition holds |
| $\Theta_{\notin S}$ | exclusion or nonrepresentability holds |
| $\Theta_{\mathrm{pass}}$ | a Boolean audit or gate pass |
| $\Theta_{\mathrm{source}}$ | the source-of-truth requirement is met |
| $\Theta_{\mathrm{bridge}}$ | a required bridge exists and is strong enough |
| $\Theta_{\mathrm{audit}}$ | the audit policy passes |
| $\Theta_{\mathrm{vis}}$ | the visibility check passes |

Each threshold type has a fixed evaluation rule on values of the appropriate kind: $\Theta_{=0}$ checks $\delta=0$ for numeric defects and $\delta=\varnothing$ for set-valued defects, $\Theta_{\le\varepsilon}$ checks $|\delta|\le\varepsilon$, $\Theta_{\neq0}$ checks $\delta\neq0$ ($\delta\neq\varnothing$ for a set-valued defect), $\Theta_{\ge\varepsilon}$ checks $\delta\ge\varepsilon$, $\Theta_{\in S}$ and $\Theta_{\notin S}$ check $\delta\in S$ and $\delta\notin S$, $\Theta_{\mathrm{pass}}$ checks that the recorded Boolean is true, $\Theta_{\mathrm{source}}$ checks $\delta_6^{\mathrm{source}}\in\{\texttt{committed},\texttt{fallback\_admitted},\texttt{proxy\_admitted}\}$, $\Theta_{\mathrm{bridge}}$ checks $\delta_{\mathrm{reqbridge}}=\varnothing$, $\Theta_{\mathrm{audit}}$ checks that the evaluated audit record $A$ has its $\mathsf{CheckRules}$ field drawn from $\mathsf{CheckRules}_I$ and $\delta_6^{\mathrm{audit}}(A)=\texttt{audit\_passes}$, and $\Theta_{\mathrm{vis}}$ checks $\delta_{\mathrm{vis}}=\varnothing$. $\mathsf{Eval}$ tests scope on the record supplying the evaluated datum, using its host, level and content membership as in Subsubsection 3.4.1. It returns $\texttt{outside\_scope}$ when that record is out of scope; otherwise it returns $\texttt{not\_checked}$ when an audited absence marker replaces the datum, and $\texttt{pass}$ or $\texttt{fail}$ by the rules above when the datum is present. The threshold types are the finite vocabulary used throughout Sections 5 through 11; no theorem in the paper introduces a threshold type outside this list without explicitly extending the family. The named thresholds of later sections are instances: $\Theta_1^{\mathrm{desc}}$, $\Theta_5^{\mathrm{idem}}$, $\Theta_{\mathrm{nosmuggle}}$, $\Theta_{\mathrm{nonstrict}}$ and $\Theta_2^{\mathrm{forest}}$ (on the datum $\beta_1(G')$) of $\Theta_{=0}$; $\Theta_{\mathrm{strict}}$ of $\Theta_{\neq0}$; $\Theta_{\mathrm{rot}}$ of $\Theta_{\in S}$; and $\Theta_1^{\mathrm{closure}}$ of $\Theta_{=0}$ or $\Theta_{\le\varepsilon}$.

## 5.3 Primitive Defect Families (Reference)

*Used by:* Theorems 1--5 use the package-collapse and audit defects of Subsubsections 5.3.5--5.3.6; Theorems 7 and 10 state their results with defects of these families.

For each primitive $P_i$, the calculus declares a finite family of defect record types. Each entry below uses a named defect of the calculus. Full constructions and proofs that depend on these defects appear in Sections 6, 7, and 8.

### 5.3.1 $P_1$: Descent, Closure, Rewrite Defects

The $P_1$ defect family contains three named entries.

- **Exact quotient descent defect.** Given a finite quotient $q:X\to Y$ and a finite map $F:X\to X$, the split-pair set is

  $$
  \delta_1^{\mathrm{split}}(q,F)\;=\;\{\,(x,x')\;:\;q(x)=q(x')\;\wedge\;qF(x)\neq qF(x')\,\}.
  $$

  Threshold: $\Theta_1^{\mathrm{desc}}:\delta_1^{\mathrm{split}}=\varnothing$. Polarity: obstruction. The status rule is $\delta_1^{\mathrm{split}}=\varnothing\Rightarrow$ descent passes, while $\delta_1^{\mathrm{split}}\neq\varnothing$ records an active $P_1$ obstruction.
- **Candidate descended-map defect.** Let $q_{\mathrm{im}}:X\to\mathrm{im}(q)$ be $q$ with its codomain restricted to its image. For a candidate $F^\sharp:\mathrm{im}(q)\to\mathrm{im}(q)$, the defect is

  $$
  \delta_1^{\mathrm{cand}}(q,F,F^\sharp)\;=\;\{\,x:F^\sharp(q_{\mathrm{im}}(x))\neq q_{\mathrm{im}}F(x)\,\}.
  $$

  Threshold: $\Theta_{=0}$. Polarity: obstruction.
- **Markov closure deficit.** For finite Markov abstraction, the closure deficit is

  $$
  \mathrm{CD}_{\tau}^{\mu}(\Pi)\;=\;I(X_t;\Pi(X_{t+\tau})\mid\Pi(X_t)).
  $$

  Threshold: $\Theta_1^{\mathrm{closure}}:\mathrm{CD}_{\tau}^{\mu}(\Pi)=0$ for exact closure, or $\mathrm{CD}_{\tau}^{\mu}(\Pi)\le\varepsilon$ with $\varepsilon=\log\eta$ for a declared rational $\eta>1$ for approximate closure. Polarity: gap.

### 5.3.2 $P_2$: Representability and Gating Defects

The $P_2$ defect family contains two named entries.

- **Representability defect.** For a lens $f:Z\to O$ and predicate $s\subseteq Z$,

  $$
  \delta_2^{\mathrm{rep}}(s;f)\;=\;
  \begin{cases}
  0, & s\in\Sigma_f,\\
  1, & s\notin\Sigma_f.
  \end{cases}
  $$

  By definition of $\Sigma_f$ (Subsubsection 3.3.1), $s\in\Sigma_f$ iff $s=f^{-1}(B)$ for some $B\subseteq\mathrm{im}(f)$. A nonrepresentability witness is a pair $z,z'$ with $f(z)=f(z')$ and $\mathbf 1_s(z)\neq\mathbf 1_s(z')$. Threshold: $\Theta_{\in S}$ for representable, $\Theta_{\notin S}$ for nonrepresentable. Polarity: obstruction.
- **Gating / support-loss defect.** For graph/support gating $G\leadsto G'$,

  $$
  \delta_2^{\mathrm{cycle}}(G,G')\;=\;\beta_1(G)-\beta_1(G').
  $$

  The drive-suppression threshold is $\Theta_2^{\mathrm{forest}}$, the instance of $\Theta_{=0}$ whose evaluated datum is $\beta_1(G')$, not $\delta_2^{\mathrm{cycle}}$: it passes exactly when $\beta_1(G')=0$, and $\beta_1(G')=0\Rightarrow H^1(G')=0$. Polarity: capacity loss.

### 5.3.3 $P_3$: Route-Mismatch, Holonomy, Pasting Defects

The $P_3$ defect family contains the following formula-level entries.

- **Completion commutator defect.** For completions $E_1,E_2:C\to C$,

  $$
  \Delta_3^{\mathrm{comp}}(E_1,E_2)\;=\;\{\,c:E_1E_2(c)\neq E_2E_1(c)\,\}.
  $$

  Route mismatch is active when $\Delta_3^{\mathrm{comp}}\neq\varnothing$, and route coherence holds when $\Delta_3^{\mathrm{comp}}=\varnothing$. Polarity: obstruction.
- **Holonomy defect.** A $P_3$ transport record on a finite graph consists of a finite fiber $\Phi$ and a permutation $g_e$ of $\Phi$ for each oriented edge $e$, with $g_{\bar e}=g_e^{-1}$ for the reversed edge. The holonomy of a closed path $\gamma=e_1\cdots e_n$ is $\operatorname{Hol}(\gamma)=g_{e_n}\circ\cdots\circ g_{e_1}$, and the holonomy defect is

  $$
  \delta_3^{\mathrm{hol}}(\gamma)\;=\;\{\,\phi\in\Phi:\operatorname{Hol}(\gamma)(\phi)\neq\phi\,\}.
  $$

  It is active when it is nonempty, that is, when $\operatorname{Hol}(\gamma)\neq\mathrm{id}$. The associated nonclaim is

  $$
  P_3^{\mathrm{holonomy}}\not\Rightarrow \mathrm{P6}_{\mathrm{drive}}
  $$

  without an explicit bridge.

Pasting and critical-pair material belong to the $P_3$ role vocabulary and to the high-structure square module, but no additional primitive $P_3$ pasting-defect formula is introduced here beyond the named entries.

### 5.3.4 $P_4$: Refinement, Staging, Gluing Defects

The $P_4$ defect family contains two named entries.

- **Refinement factor defect.** For $f_0:Z\to O_0$, $f_1:Z\to O_1$, and forgetting map $\rho:O_1\to O_0$,

  $$
  \delta_4^{\mathrm{ref}}(f_0,f_1,\rho)\;=\;\{\,z:f_0(z)\neq\rho f_1(z)\,\}.
  $$

  Refinement passes iff $\delta_4^{\mathrm{ref}}=\varnothing$. Polarity: obstruction.
- **Gluing defect.** For local packages over an overlap,

  $$
  \delta_4^{\mathrm{glue}}(q_U,q_V)\;=\;\{\,x\in U\cap V:\mathrm{res}_{U,U\cap V}(q_U(x))\neq\mathrm{res}_{V,U\cap V}(q_V(x))\,\},
  $$

  for local packages $q_U:U\to O_U$ and $q_V:V\to O_V$ with restriction maps $\mathrm{res}_{U,U\cap V}:O_U\to O_{U\cap V}$ and $\mathrm{res}_{V,U\cap V}:O_V\to O_{U\cap V}$. With identity restrictions it is empty exactly when some $q:U\cup V\to O$ has $q|_U=q_U$ and $q|_V=q_V$. For a finite cover $\{U_\alpha\}$ with local packages $q_\alpha$ and restrictions $\mathrm{res}_{\alpha,\alpha\beta}$, set $\delta_4^{\mathrm{glue}}(\{q_\alpha\})=\{(\alpha,\beta,x):x\in U_\alpha\cap U_\beta,\ \mathrm{res}_{\alpha,\alpha\beta}(q_\alpha(x))\neq\mathrm{res}_{\beta,\alpha\beta}(q_\beta(x))\}$; with identity restrictions it is empty exactly when some $q:\bigcup_\alpha U_\alpha\to O$ has $q|_{U_\alpha}=q_\alpha$ for every $\alpha$, since pairwise agreement makes $q(x):=q_\alpha(x)$ independent of $\alpha$.

  Gluing passes iff $\delta_4^{\mathrm{glue}}=\varnothing$. If local data exist but gluing fails, the induced promotion status is $\texttt{globally\_obstructed}$.

### 5.3.5 $P_5$: Packaging, Completion, Objecthood Defects

The $P_5$ defect family contains three named entries.

- **Idempotence defect.** Given an endomap $E:X\to X$, the idempotence defect is

  $$
  \delta_5^{\mathrm{idem}}(E)\;=\;\{\,x:E^2(x)\neq E(x)\,\}.
  $$

  Threshold: $\Theta_5^{\mathrm{idem}}:\delta_5^{\mathrm{idem}}=\varnothing$. If $E^2=E$, then $E^n=E$ for $n\ge1$; an update that applies $E$ to a recorded input $s\in\mathrm{im}(E)$ is then a no-op, and the cell classifier assigns $\texttt{trivial}$ to every cell $P_5\leftarrow P_j$ with such an update, for any informant $P_j$, unless a row above it applies.
- **Fixed-point residual.** The fixed-point residual is

  $$
  \delta_5^{\mathrm{fix}}(E)\;=\;\{\,o:E(o)\neq o\,\},
  $$

  On a host with a declared norm, $\|E(o)-o\|$ measures a pointwise residual. The finite set $\delta_5^{\mathrm{fix}}(E)$ passes $\Theta_{=0}$ exactly when empty; an approximate threshold $\Theta_{\le\varepsilon}$ uses a separately declared scalar residual.
- **Package collapse defect.** The package-collapse values are $\texttt{identity\_package}$, $\texttt{total\_collapse}$ and $\texttt{singleton\_collapse}$. For a cell whose level/lens/interface record $L$ has lens $\ell_L$, $\texttt{total\_collapse}\in\delta$ exactly when $\ell_L$ is constant on a carrier with at least two elements; $\texttt{singleton\_collapse}\in\delta$ exactly when $\ell_L$ is not constant, the fields of $W$ whose declared type is the domain of $\ell_L$ record at least two distinct values, and $\ell_L$ maps every such recorded value to the same value; and $\texttt{identity\_package}\in\delta$ exactly when $U\in\mathsf{Upd}(P_5)$ installs a package map or completion equal to the one already recorded for its target. An identity lens or completion of the ambient package $\mathcal T$ produces no entry. The values $\texttt{total\_collapse}$ and $\texttt{singleton\_collapse}$ induce $\texttt{collapsed}$, and $\texttt{identity\_package}$ induces $\texttt{trivial}$ (Subsubsection 5.6.6).

### 5.3.6 $P_6$: Audit, Provenance, Drive Defects

The $P_6$ defect family contains three named entries.

- **Audit defect.** The audit defect is a finite set of failure codes,

  $$
  \begin{aligned}
  \delta_6^{\mathrm{audit}}\subseteq\{\,&\texttt{missing\_audit},\;\texttt{failed\_audit},\;\texttt{source\_failure},\\
  &\texttt{visibility\_failure},\;\texttt{threshold\_failure},\;\texttt{nonclaim\_failure},\;\texttt{circular\_audit}\,\},
  \end{aligned}
  $$

  and we write $\delta_6^{\mathrm{audit}}=\texttt{audit\_passes}$ for $\delta_6^{\mathrm{audit}}=\varnothing$. The code $\texttt{failed\_audit}$ (a failed $\mathsf{CheckResults}$ check) is distinct from the status $\texttt{failed\_audit}$; the classifier rows of Subsection 5.6 state which codes trigger each status. The audit threshold $\Theta_6^{\mathrm{audit}}$ is the instance of $\Theta_{\mathrm{audit}}$ (Subsubsection 5.2.2): it passes exactly when the $\mathsf{CheckRules}$ field of $A$ is drawn from $\mathsf{CheckRules}_I$ and $\delta_6^{\mathrm{audit}}(A)=\texttt{audit\_passes}$. Circular audit induces $\texttt{undefined\_circular}$. A code $c$ is present when $c\in\delta_6^{\mathrm{audit}}$, and a set $S$ of codes is met when $\delta_6^{\mathrm{audit}}\cap S\neq\varnothing$; the classifiers below read the audit defect only through these two tests, and when several codes are present their priority orders decide which row applies. A defect record written $\delta=\varnothing$, as in the running example of Subsection 3.8, has every defect set empty and every defect code at its passing value.

  The value of $\delta_6^{\mathrm{audit}}$ is computed from the audit record $A$ of Subsubsection 4.9.2: it is $\{\texttt{missing\_audit}\}$ when the audit slot carries an absence marker; otherwise it is the set of codes of the checks of $A$ that fail, the codes being $\mathsf{SourceRefs}$ against the source policy ($\texttt{source\_failure}$; this check fails exactly when some record $R$ of $\mathsf{SourceRefs}$ has $\delta_6^{\mathrm{source}}(R;I)\notin\{\texttt{committed},\texttt{fallback\_admitted},\texttt{proxy\_admitted}\}$, the values at which $\Theta_{\mathrm{source}}$ passes), $\mathsf{VisibilityCheck}$ ($\texttt{visibility\_failure}$), $\mathsf{CircularityCheck}$ ($\texttt{circular\_audit}$), $\mathsf{ThresholdCheck}$ ($\texttt{threshold\_failure}$), $\mathsf{Nonclaims}$ ($\texttt{nonclaim\_failure}$), and $\mathsf{CheckResults}$ ($\texttt{failed\_audit}$); it is empty, that is $\texttt{audit\_passes}$, when every check passes. An audit record $A$ *passes* $\mathsf{AuditPolicy}_I$ when its $\mathsf{CheckRules}$ field is drawn from $\mathsf{CheckRules}_I$ and $\delta_6^{\mathrm{audit}}(A)=\texttt{audit\_passes}$; this is the meaning of the phrase in Subsubsections 5.6.1 and 10.2.1, Theorem 22 and Model Theorem 34. The $\mathsf{CheckResults}$ check includes resolution of $\mathsf{ClaimRef}$ and every $\mathsf{EvidenceRefs}$ entry, validation of $\mathsf{Provenance}$ (resolution of each record named in the provenance trace, by a program of $\mathsf{CheckRules}_I$), and replay of $\mathsf{CheckRules}$, which fails exactly when a replayed output differs from the recorded $\mathsf{CheckResults}$ entry; a correctly recorded rejection is not a failure and is read by the $\texttt{rejected}$ row. Failure of any of these gives $\texttt{failed\_audit}$.
- **Provenance / source defect.** The source defect has values

  $$
  \begin{aligned}
  \delta_6^{\mathrm{source}}\in\{\,&\texttt{committed},\;\texttt{fallback\_admitted},\;\texttt{proxy\_admitted},\;\texttt{dirty},\\
  &\texttt{fallback\_forbidden},\;\texttt{unknown},\;\texttt{contradictory},\;\texttt{missing}\,\}.
  \end{aligned}
  $$

  In outline: $\delta_6^{\mathrm{source}}(R;I)$ is the first value in the eight-item list below that applies to the record $R$ in the source slot. Reading the list needs three conventions, fixed in the next two paragraphs: which values pass $\Theta_{\mathrm{source}}$, the governing profile $\lambda$ at which $\mathsf{SourcePolicy}_I$ is read, and what "admits" means.

  *Passing values.* The source threshold $\Theta_{\mathrm{source}}$ passes at $\texttt{committed}$, $\texttt{fallback\_admitted}$ and $\texttt{proxy\_admitted}$ and fails at the other values. Real pair claims require $\texttt{committed}$, or $\texttt{fallback\_admitted}$ with an audited source-upgrade bridge; $\texttt{fallback\_admitted}$ and $\texttt{proxy\_admitted}$ otherwise support at most $\texttt{real\_provisional}$.

*Governing profile.* The value is computed from the source slot, $\mathsf{SourcePolicy}_I$ and the governing profile $\lambda$. The governing profile is that of the judgment whose source slot holds $R$; for the role evidence $R_i$ of a role-channel record, which carries no profile (Subsection 3.6), it is the default entry; for $R$ in the $\mathsf{EvidenceRefs}$ of a claim record, whose level profile is not in $\mathsf{Prof}$, it is the default entry; for $R$ in the $\mathsf{SourceRefs}$ of an audit record it is the profile of the record named by $\mathsf{ClaimRef}$, or, if that record carries no profile of $\mathsf{Prof}$ (a claim record, whose level profile is not in $\mathsf{Prof}$, or a package, source or host record), the default entry that $\mathsf{SourcePolicy}_I$ declares; for $R$ named as the evaluated datum of a source threshold $\Theta_{\mathrm{source}}$ in the threshold record of a judgment, it is the profile of that judgment, or the default entry when that judgment carries no profile of $\mathsf{Prof}$.

*Fallback designation.* $\mathsf{SourcePolicy}_I$ is a finite relation between source-type tags, admission modes ($\texttt{full}$, $\texttt{fallback}$, $\texttt{provisional}$) and profiles. A record of type $\texttt{fallback}$ is a *designated fallback* under $\lambda$ when $(\texttt{fallback},m,\lambda)\in\mathsf{SourcePolicy}_I$ for some mode $m$, and then receives $\texttt{fallback\_admitted}$ when no earlier clause of the first-match list applies; the rules below do not distinguish the mode $\texttt{fallback}$ from the other modes. The $\texttt{real\_provisional}$ row needs $(\mathrm{type}_{\mathrm{src}}(R),\texttt{provisional},\mu)\in\mathsf{SourcePolicy}_I$, that is $(\texttt{fallback},\texttt{provisional},\mu)$ for a fallback source; a source-upgrade bridge needs $(\texttt{fallback},\texttt{full},\lambda)$.

  *Admission.* Throughout the paper, "$\mathsf{SourcePolicy}_I$ admits $t$" (or "admits a source of type $t$") means $(t,\texttt{full},\lambda)\in\mathsf{SourcePolicy}_I$ for every profile $\lambda$ of the instance and for the default entry, which every such instrument declares; for a profile $\lambda'$ that $\mathsf{SourcePolicy}_I$ does not list, $(t,m,\lambda')\in\mathsf{SourcePolicy}_I$ is read as $(t,m,\text{default})\in\mathsf{SourcePolicy}_I$, so extending or joining an instance changes no instrument record; admission for provisional use means $(t,\texttt{provisional},\lambda)\in\mathsf{SourcePolicy}_I$. A *source-upgrade bridge* for $R$ is a record named in $\mathrm{trace}_{\mathrm{src}}$, of type $\texttt{source-upgrade}$, both of whose endpoints are $R$; it relays no other source, so it is not in the set $B_R$ below. $\mathsf{BridgePolicy}_I$ admits it when it admits that type, and $\mathsf{SourcePolicy}_I$ admits it when $(\texttt{fallback},\texttt{full},\lambda)\in\mathsf{SourcePolicy}_I$. The value is the first of the following that holds:

  1. $\texttt{missing}$: the slot is an audited absence marker;
  2. $\texttt{contradictory}$ or $\texttt{unknown}$: $\mathrm{type}_{\mathrm{src}}$ is that tag;
  3. $\texttt{dirty}$: $\mathrm{trace}_{\mathrm{src}}$ records a failed audit or threshold check of $R$ itself (one whose target is $R$ or its construction; records that $R$ holds as data do not make $R$ dirty), or $\mathrm{valid}_{\mathrm{src}}$ records that $R$ is outside its validity condition;
  4. if $\mathrm{trace}_{\mathrm{src}}$ names a nonempty set $B_R$ of typed source-bridge records with target $R$ and another source record as source endpoint ($R$ is then a proxy source): $\texttt{proxy\_admitted}$ when some member of $B_R$ is admitted by $\mathsf{BridgePolicy}_I$ and has a passing audit, and $\texttt{unknown}$ otherwise;
  5. $\texttt{fallback\_forbidden}$: $\mathrm{type}_{\mathrm{src}}=\texttt{fallback}$ and $(\texttt{fallback},m,\lambda)\notin\mathsf{SourcePolicy}_I$ for every mode $m$;
  6. $\texttt{fallback\_admitted}$: $\mathrm{type}_{\mathrm{src}}=\texttt{fallback}$;
  7. $\texttt{committed}$: $\mathrm{type}_{\mathrm{src}}$ is one of the five candidate tags of Subsubsection 4.9.1 and $(\mathrm{type}_{\mathrm{src}},\texttt{full},\lambda)\in\mathsf{SourcePolicy}_I$;
  8. $\texttt{unknown}$ otherwise (in particular for a candidate-tag record not admitted with mode $\texttt{full}$).

  *Well-foundedness.* A source record $R'$ is a *source predecessor* of a proxy source $R$ when $R'$ lies in the $\mathsf{SourceRefs}$ of the audit of a member of $B_R$. Rule 4 terminates because the evaluations it actually queries follow the finite acyclic evaluation dependency graph below; cycles in the unqualified source-predecessor relation need not be evaluation cycles. Form also the finite *evaluation dependency graph*: its vertices are defect and threshold evaluations, including their record, instrument, profile and judgment context; an edge points from an evaluation to every evaluation queried by its defining checks, including source, audit, visibility and threshold checks. Admissibility (Subsubsection 4.10.1) requires this graph to be acyclic, and evaluations are defined by recursion along it. Reference reachability tests inspect records without evaluating the verdicts they reference.
- **Drive certificate.** The drive certificate is the separate typed record

  $$
  \kappa_6^{\mathrm{drive}},
  $$

  kept distinct from $\delta_6^{\mathrm{audit}}$. In the finite graph/cohomology host, the cohomological drive-certificate schema is

  $$
  [a]\neq0\in H^1(G)\;\Longleftrightarrow_{\mathrm{schema}}\;\exists\gamma:\oint_\gamma a\neq0.
  $$

  This schema is available only in the declared finite graph/cohomology host with the relevant cohomology-drive bridge. It is not supplied by a generic audit record.

The separation between the audit face $P_6$ and the drive face $\mathrm{P6}_{\mathrm{drive}}$ is preserved at the defect level: a generic audit defect is in the $P_6$ audit subfamily and does not by itself imply a drive certificate failure, and a missing drive certificate does not by itself imply an audit defect. The route-mismatch dependency $P_3\mathrel{\mathsf{dep}_{\texttt{requires\_bridge}}}\mathrm{P6}_{\mathrm{drive}}$ of Subsubsection 4.6.2 records this separation at the dependency level.

## 5.4 Promotion-Specific Defects (Reference)

*Used by:* Theorem 13 defines the factorization defect; the proofs of Theorems 20 and 21, the construction of Theorem 22, and Model Theorem 34 use it.

Promotion bridges carry a finite family of defect records that are not attached to any single primitive but to the bridge as a whole. Each entry below names the defect, the threshold it is checked against, and the promotion status it induces on failure, in the schema of Subsections 5.2 and 4.5.

### 5.4.1 Strictness / Factorization Defect

The strictness defect of a promotion bridge $B_{j\to j+1}$ with object maps $\pi_j,\pi_{j+1}$ on a finite carrier $S$ is

$$
\Delta_{\mathrm{fact}}(\pi_j,\pi_{j+1})\;=\;\{\,(s,s')\in S\times S\;:\;\pi_j(s)=\pi_j(s')\;\wedge\;\pi_{j+1}(s)\neq\pi_{j+1}(s')\,\}.
$$

The strict threshold $\Theta_{\mathrm{strict}}$ asks $\Delta_{\mathrm{fact}}\neq\varnothing$; the non-strict threshold $\Theta_{\mathrm{nonstrict}}$ asks $\Delta_{\mathrm{fact}}=\varnothing$. When the strictness gate $G_{\mathrm{strict}}$ of Subsubsection 10.2.1 is checked,

$$
G_{\mathrm{strict}}=\texttt{strict\_pass}\iff\Delta_{\mathrm{fact}}\neq\varnothing,\qquad G_{\mathrm{strict}}=\texttt{non\_strict\_pass}\iff\Delta_{\mathrm{fact}}=\varnothing;
$$

the other four values of $\mathrm{StrictGateStatus}$ record an unchecked or unauditable gate. The well-formedness gate $G_{\mathrm{suff}}$ verifies that a recorded checked value agrees with the recomputed defect (Subsection 10.2).

Strictness is a property of the typed object-map data $\pi_j,\pi_{j+1}$ alone; it is not by itself a closure or drive claim, and the nonclaim register of Subsection 15.2 records NC-10 and NC-11 against any such inference. Theorem 13 of Section 7 (factorization defect equivalence) states the equivalence between $\Delta_{\mathrm{fact}}=\varnothing$ and the existence of a factorization $\pi_{j+1}=\phi\,\pi_j$, and is the theorem-grade form of this defect.

### 5.4.2 No-Smuggling Defect

The no-smuggling defect $\delta_{\mathrm{nosmuggle}}(B)$ records violations of the bridge's declared scope. The violation kinds form the following finite list:

1. target-layer data used to prove target novelty,
2. suppressed content used without an admissible bridge,
3. simulation used as theorem,
4. local evidence used as global without a gluing record,
5. a $P_3$-witness used as a $\mathrm{P6}_{\mathrm{drive}}$ certificate without a drive bridge,
6. a lossy summary used as exact data.

Each record $r$ of $\mathsf{Use}(B)$ carries an audited origin tag $\tau(r)\in\{\texttt{target},\texttt{simulation},\texttt{local},\texttt{P3\_witness},\texttt{lossy\_summary},\texttt{other}\}$, and each use of $r$ an audited role tag $\rho(r)\in\{\texttt{novelty},\texttt{theorem},\texttt{global},\texttt{drive},\texttt{exact},\texttt{other}\}$. Then $\delta_{\mathrm{nosmuggle}}(B)$ is the set of pairs $(k,r)$ with: $k=1$ if an independent target-layer assertion or certificate, rather than a defining object map evaluated on the common carrier, is used as a premise for target novelty, that is, $\tau(r)=\texttt{target}$, $\rho(r)=\texttt{novelty}$ and $r$ is not the table of $\pi_{j+1}$; $k=2$ if $r$ lies in $\delta_{\mathrm{overread}}$ or $\delta_{\mathrm{unknown}}$, or is the first component of an entry of $\delta_{\mathrm{weakbridge}}$, for the bridge; $k=3$ if $\tau(r)=\texttt{simulation}$ and $\rho(r)=\texttt{theorem}$; $k=4$ if $\tau(r)=\texttt{local}$, $\rho(r)=\texttt{global}$, and $\mathsf{Use}(B)$ contains no gluing record with $\delta_4^{\mathrm{glue}}=\varnothing$; $k=5$ if $\tau(r)=\texttt{P3\_witness}$, $\rho(r)=\texttt{drive}$, and $V$ lists no admissible drive bridge; and $k=6$ if $\tau(r)=\texttt{lossy\_summary}$ and $\rho(r)=\texttt{exact}$.

The threshold is $\Theta_{\mathrm{nosmuggle}}:\delta_{\mathrm{nosmuggle}}=\varnothing$. Failure induces

$$
\mathrm{Promote}(B)\;:\;\texttt{failed\_no\_smuggling}
$$

in the promotion classifier of Subsubsection 5.6.4, and the no-smuggling gate $G_{\mathrm{nosmuggle}}$ of Subsubsection 10.2.1 records the gate verdict.

### 5.4.3 Stability Defect

Let $E$ be the completion endomap of the target package on its content space. When the content space is $\mathcal P(S)$ for the carrier $S$ of the target object map $\pi_{j+1}:S\to O_{j+1}$, the stability defect is

$$
\delta_{\mathrm{stab}}\;=\;\{\,o\in\mathrm{im}(\pi_{j+1})\;:\;E\bigl(\pi_{j+1}^{-1}(o)\bigr)\neq\pi_{j+1}^{-1}(o)\,\};
$$

otherwise the bridge records an embedding $\iota:O_{j+1}\to$ content space, and $\delta_{\mathrm{stab}}=\{\,o\in O_{j+1}:E(\iota o)\neq\iota o\,\}$,

or its approximate-residual analogue under threshold $\Theta_{\le\varepsilon}$ when an approximate completion is in scope. The stability gate $G_{\mathrm{stab}}$ is required when the bridge claims that the target objects are fixed points of $E$. Failure induces

$$
\mathrm{Promote}(B)\;:\;\texttt{failed\_stability}.
$$

When the bridge does not claim fixed-point structure on the target, the stability gate is recorded as $\texttt{not\_required}$ rather than enforced.

### 5.4.4 Descent Defect Inside Promotion

When a promotion bridge claims macro closure on the target package — that is, when the bridge claims a descended dynamics $F^\sharp$ on the target's quotient or interface — the descent gate $G_{\mathrm{desc}}$ is required. The gate uses the descent defect of Subsubsection 5.3.1 ($\delta_1^{\mathrm{split}}(q,F)$) on the relevant quotient and update data of the target package. Failure induces

$$
\mathrm{Promote}(B)\;:\;\texttt{failed\_descent}.
$$

If no closure or descended-dynamics claim is made on the bridge, the descent gate is recorded as $G_{\mathrm{desc}}=\texttt{not\_required}$ rather than enforced; in particular, the strictness gate alone does not require descent, since $\pi_{j+1}\not\factor\pi_j$ does not by itself entail any claim about a descended dynamics on the target. NC-10 of Subsection 15.2 is the corresponding nonclaim.

## 5.5 Claim-Level Visibility Defects (Reference)

The use-sets on which these defects are computed, $\mathsf{Use}(C)$, $\mathsf{Use}(B)$, $\mathsf{Use}(Q)$, $\mathsf{Use}(L)$ and $\mathsf{Use}(\Xi)$, are defined in Subsubsection 5.5.2 (paragraph *Use-sets of cells, bridges and squares*); $\mathsf{Use}(\varphi)$ in Subsubsection 3.2.1.

*Used by:* Theorems 1, 2 and 4 use the weak-bridge and required-bridge defects of Subsubsection 5.5.2; Theorem 23 states its result with the overreading defect of this subsection.

Instrument-indexed claim records carry a finite family of visibility defects, all aggregated into a single visibility defect record. The threshold and induced statuses are recorded here at schema-grade; the formal no-overreading theorem is Theorem 23 in Section 11.

The aggregated visibility defect of a claim $\varphi$ under instrument $I$ relative to a finite family $\mathcal L$ of registered, audited bridge candidates is

$$
\delta_{\mathrm{vis}}(I,\varphi,\mathcal L)\;=\;\delta_{\mathrm{overread}}\;\cup\;\delta_{\mathrm{weakbridge}}\;\cup\;\delta_{\mathrm{outside}}\;\cup\;\delta_{\mathrm{unknown}}.
$$

The threshold is $\Theta_{\mathrm{vis}}:\delta_{\mathrm{vis}}=\varnothing$. The components $\delta_{\mathrm{overread}}$, $\delta_{\mathrm{outside}}$ and $\delta_{\mathrm{unknown}}$ are finite sets of use-set records, and $\delta_{\mathrm{weakbridge}}$ is a finite set of pairs $(x,L)$; the union is taken as a disjoint union, and only its emptiness is used.

### 5.5.1 Hidden-Content Overread

The hidden-content overread defect is

$$
\delta_{\mathrm{overread}}(I,\varphi,\mathcal L)\;=\;\{\,x\in\mathsf{Use}(\varphi)\cap\mathsf{Suppressed}_I\;:\;\text{no }L\in\mathcal L\text{ bridges }x\,\}
$$

(a bridge $L$ *bridges* $x$ when its suppressed endpoint $c$ equals $x$, Subsubsection 5.5.2).

A nonempty $\delta_{\mathrm{overread}}$ records that the claim depends on suppressed content for which no bridge has been registered or audited under $\mathsf{BridgePolicy}_I$. The no-overreading theorem (Theorem 23 of Section 11) later uses the condition $\delta_{\mathrm{overread}}=\varnothing$ in its acceptance argument; this subsection only records the defect schema.

### 5.5.2 Weak Bridge

The weak-bridge defect $\delta_{\mathrm{weakbridge}}(I,\varphi,\mathcal L)$ records suppressed content that has a registered bridge in $\mathcal L$ but no bridge in $\mathcal L$ that is admissible for the claim, for instance because every registered bridge is weaker than the claim requires ($\mathsf{Strength}(L)<\mathsf{RequiredStrength}(\varphi)$), unaudited, or circular:

$$
\begin{aligned}
\delta_{\mathrm{weakbridge}}(I,\varphi,\mathcal L)\;=\;\{\,(x,L)\;:\;&x\in\mathsf{Use}(\varphi)\cap\mathsf{Suppressed}_I,\;L\in\mathcal L\text{ bridges }x,\\
&\text{and no }L'\in\mathcal L\text{ with }\mathsf{AdmVisBridge}(L',I,\varphi)\text{ bridges }x\,\}.
\end{aligned}
$$

Here a bridge $L=(\mathrm{id}_L,c,c',\ldots)$ of Subsubsection 3.5.3 *bridges* $x$ when its suppressed endpoint is $c=x$. Bridge strengths are values in a finite totally ordered set $(\mathsf{Strength}_I,\le)$ declared by $\mathsf{BridgePolicy}_I$; $\mathsf{Strength}(L)\in\mathsf{Strength}_I$ is a field of $L$, $\mathsf{RequiredStrength}(\varphi)=\mathsf{ReqStrength}_I(\mathsf{ClaimType}(\varphi))\in\mathsf{Strength}_I$ is the strength that the policy requires for the claim type of $\varphi$, and $<$ is the strict order of $\mathsf{Strength}_I$. 

*Use-sets of cells, bridges and squares.* The same defects are defined for a directed cell $C$, with $\varphi$ replaced by $C$: the use-set $\mathsf{Use}(C)$ is the set of content references in the fields $W_j,U_i,L,\Theta,A$ of $C$ (a content reference in these fields is the record the field holds or names together with each record named by a reference field of that record, except the instrument named in an audit record's $\mathsf{CheckRules}$ field; this expansion is applied once, not iterated, and a claim's declared $\mathsf{Refs}(\varphi)$ is included directly, without expanding those records' reference fields), and $\mathsf{RequiredStrength}(C)\in\mathsf{Strength}_I$ is the value that $\mathsf{BridgePolicy}_I$ assigns to the pair $(\mathsf{BridgeType}_\lambda,\mathsf{Regime}_\lambda)$ of the profile of $C$. Reachability tests, unlike use-sets, follow the full reference graph of Subsubsection 5.6.5. The same defects are defined for a promotion bridge $B$: $\mathsf{Use}(B)$ is the set of content references in the fields $\mathcal T_j,\mathcal T_{j+1},S,O_j,O_{j+1},\pi_j,\pi_{j+1},L,\Theta,A,\mathcal N$ of its expanded record, $\mathcal L_B$ is the set of bridges listed in its visibility field $V$, and $\mathsf{RequiredStrength}(B)$ is the value that $\mathsf{BridgePolicy}_I$ assigns to $(\mathsf{BridgeType},\mathsf{Regime})$ of the profile in the last field of its expanded record ($\lambda_{\mathrm{prom}}$ of Subsubsection 10.6.1 in Theorem 22, $\lambda_{\mathrm{Cantor}}$ in Model Theorem 34). For a visibility bridge $L$, $\mathsf{Use}(L)$ is the set of content references in $c,c',\mathsf{Guarantee}_L,A_L,V_L,\mathcal N_L$. For a decorated square $\Xi$ of Section 14, $\mathsf{Use}(\Xi)$ is the set of content references in its fields $X,F,q,F^\sharp,\mathrm{src}_\Xi,\mathrm{tgt}_\Xi,\mathsf{Decor}_\Xi,A_\Xi$; $\mathcal L_\Xi$ is the set of bridges listed in $V_\Xi$; $\mathsf{RequiredStrength}(\Xi)=\mathsf{ReqStrength}_{I_{\mathrm{DC}}}(\mathrm{type}_\Xi)$, declared on square types as $\mathsf{ProvisionalTypes}_I$ is; the host tag of $\Xi$ is that of $X$. 

*Square well-formedness.* $\Xi$ is well formed when its fields are finite and typed, its boundary edges match (Subsubsection 14.1.2), its references resolve, and $\delta_\Xi$ and its audit defect equal their recomputed values.

For a claim $\varphi$, let $\mathcal L_\varphi$ be its visibility-bridge field; for a directed cell $C$, let $\mathcal L_C$ be the registered bridges listed in its visibility field $V$. The same defects are defined for a pair record $Q=\mathsf{PairObs}^{\mu}_{\{i,j\}}$: $\mathsf{Use}(Q)$ is the set of content references in its joint-witness, source-of-truth, branch-compatibility, threshold and audit fields, $\mathcal L_Q$ is the set of bridges listed in its visibility record, and $\mathsf{RequiredStrength}(Q)$ is the value $\mathsf{BridgePolicy}_I$ assigns to $(\mathsf{BridgeType}_\mu,\mathsf{Regime}_\mu)$. For a claim, directed cell, pair record, promotion bridge or decorated square $X$ (with the corresponding registered bridge family $\mathcal L_X$ defined above), the bridge-admissibility predicate $\mathsf{AdmVisBridge}(L,I,X)$ holds if and only if (i) $L\in\mathcal L_X$, the registered bridges of $X$; (ii) $c\in\mathsf{Use}(X)\cap\mathsf{Suppressed}_I$ and $c'\in\mathsf{Visible}_I$; (iii) $\mathsf{BridgeType}_L$ is admitted by $\mathsf{BridgePolicy}_I$ (for a cell or pair record with profile $\lambda$, the pair $(\mathsf{BridgeType}_L,\mathsf{Regime}_\lambda)$ is an admitted (bridge type, regime) pair of $\mathsf{BridgePolicy}_I$, so that its strength value is defined, Subsubsection 3.4.1); (iv) $\mathsf{Strength}_L\ge\mathsf{RequiredStrength}(X)$ in $\mathsf{Strength}_I$; (v) the audit defect of $A_L$ is $\texttt{audit\_passes}$; and (vi) $\ulcorner X,I\urcorner$ is not reachable from $\mathsf{Use}(L)$ by resolved references.

Each entry pairs a suppressed use-set element $x$ with a registered bridge $L$ at $x$. It is recorded when no registered bridge at $x$ meets conditions (i)–(vi) of $\mathsf{AdmVisBridge}$ above: for instance, every bridge at $x$ is weaker than required, has a failing audit, has a type the policy does not admit, or reaches the verdict reference of the claim. The promotion-gate semantics of Section 10 give the later promotion-specific use of this comparison. A nonempty $\delta_{\mathrm{weakbridge}}$ is reported separately from $\delta_{\mathrm{overread}}$ so that "no bridge" and "bridge failed" failures are distinguishable in the classifier output and the audit record.

A directed cell may also require a bridge because of its profile, whether or not any of its content is suppressed. The required bridge types of a cell $C$ with profile $\lambda$ are

$$
\mathsf{ReqBridge}(C)\;=\;\begin{cases}\{\texttt{drive}\}&\text{if }\mathsf{Regime}_\lambda=\texttt{drive-certification},\\ \varnothing&\text{otherwise,}\end{cases}
$$

A required bridge of type $\beta$ for $C$ is a bridge $L$ listed in $V$ with $\mathsf{BridgeType}_L=\beta$, admitted by $\mathsf{BridgePolicy}_I$ for $\lambda$, named by the bridge-check field of $U$ (for $\mathsf{CertifyDrive}$, its drive-check field), bridging the record named by the field of $U$ that carries the certified datum (for $\mathsf{CertifyDrive}$, its entry field), with $A_L$ at $\texttt{audit\_passes}$ and $\mathsf{Strength}_L\ge\mathsf{RequiredStrength}(C)$, and, for $\beta=\texttt{drive}$, $L$ is admissible as a drive bridge in the sense of Subsubsection 9.3.5: $\mathsf{BridgePolicy}_I$ admits the type $\texttt{drive}$, and the guarantee record of $L$ holds a declared finite graph $G$, a cochain $a\in C^1(G)$ and a cycle $\gamma\in Z_1(G)$ with $\oint_\gamma a\neq0$. When that record is visible under $I$, a required bridge of type $\texttt{drive}$ is instead a drive bridge of Subsubsection 9.3.5 named by the drive-check field of $U$ whose guarantee record is that record, admitted by $\mathsf{BridgePolicy}_I$ for $\lambda$, with $A_L$ at $\texttt{audit\_passes}$ and $\mathsf{Strength}_L\ge\mathsf{RequiredStrength}(C)$. The required-bridge defect is

$$
\delta_{\mathrm{reqbridge}}(C)\;=\;\{\,\beta\in\mathsf{ReqBridge}(C):\text{no such bridge of type }\beta\text{ exists}\,\}.
$$

For a pair record $Q$ with profile $\mu$, $\mathsf{ReqBridge}(Q)=\{\texttt{drive}\}$ when $\mathsf{Regime}_\mu=\texttt{drive-certification}$, and is empty otherwise. A required bridge is listed in $Q$'s visibility record, admitted for $\mu$, referenced by its threshold or audit check, and audited as certifying its declared datum at the strength required by $\mu$, and, for the type $\texttt{drive}$, admissible in the sense of Subsubsection 9.3.5. The set $\delta_{\mathrm{reqbridge}}(Q)$ contains each required type for which no such bridge exists.

### 5.5.3 Outside and Unknown Content

The outside and unknown components of $\delta_{\mathrm{vis}}$ record use-set entries that lie outside $I$'s scope or in the $\texttt{unknown}$ visibility class:

$$
\delta_{\mathrm{outside}}(I,\varphi)\;=\;\mathsf{Use}(\varphi)\cap\mathsf{Outside}_I,\qquad \delta_{\mathrm{unknown}}(I,\varphi)\;=\;\mathsf{Use}(\varphi)\cap\mathsf{Unknown}_I.
$$

A nonempty $\delta_{\mathrm{outside}}$ records that the claim refers to content the surrounding instrument does not adjudicate at all; a nonempty $\delta_{\mathrm{unknown}}$ records that the claim refers to content within $I$'s scope whose visibility verdict has not yet been resolved. Both record use-set entries that $I$ cannot treat as visible, independently of any bridge strength; the classifier of Subsubsection 5.6.5 routes such records away from $\texttt{accepted}$.

The table illustrates visibility-related outcomes; the first applicable row of each classifier determines the final status, and a nonempty $\delta_{\mathrm{outside}}$ routes claims and cells to $\texttt{outside\_scope}$ first:

| Claim family | Induced status |
| --- | --- |
| ordinary instrument-indexed claim | $\texttt{blocked}$ |
| directed cell | $\texttt{blocked}$ |
| pair observable | $\texttt{blocked}$ |
| promotion bridge | the first applicable promotion-classifier status, including $\texttt{outside\_scope}$, $\texttt{failed\_audit}$, $\texttt{failed\_no\_smuggling}$ or $\texttt{candidate}$ as its gates require |
| same-level audit | $\texttt{undefined\_circular}$ when the failure is circular, unless a status of higher priority in Subsubsection 5.6.5 applies first |

The promotion case routes through the no-smuggling defect of Subsubsection 5.4.2 because a visibility failure on a promotion bridge is recorded as a no-smuggling violation in the gate semantics of Section 10 (content outside scope is caught earlier, by the $\texttt{outside\_scope}$ row of the promotion classifier); the same-level audit case is the special-case overreading of self-soundness recorded as circularity in Subsection 11.5.

## 5.6 Defect-to-Status Rules

The classifier rules below convert finite defect-record verdicts into status assignments per judgment family. Each rule is a finite check on the surrounding judgment, and each rule is consumed by the corresponding theorem in Sections 6, 10, or 11. The rules are stated as priority orders: when more than one condition matches, the highest-priority match is recorded.

### 5.6.1 Role-Status Rules

For a designated role-channel record $C_i=(\mathrm{Chan}_i,R_i,\Theta_i^{\mathrm{act}},A_{R_i},V_{R_i},\mathsf{collapse}_i)$ in $\Gamma$, the role-channel classifier $\mathsf{RoleClassify}(C_i;\Gamma,\mathcal T,I)$ assigns a value in $\mathrm{RoleStatus}$ in the following priority order

1. $\texttt{inapplicable\_outside\_scope}$, when the role evidence $R_i$ lies outside $\mathsf{Scope}_I$ or the host of $\mathcal T$;
2. $\texttt{absent\_with\_record}$, when a required witness for the role is absent and the absence is audited;
3. $\texttt{collapsed\_boundary\_case}$, when the role-channel record's declared Boolean field $\mathsf{collapse}_i$ is true;
4. $\texttt{below\_threshold}$, when role evidence is present but the activation threshold is not met;
5. $\texttt{active\_projection}$, otherwise, when role evidence is visible and audited.

A role record whose required witness is absent without an audited absence record is malformed, as for directed cells (Subsubsection 3.7.3). A role-channel judgment with present evidence in $\mathsf{Scope}_I$ and in the host of $\mathcal T$ is well formed only when that evidence is visible under $I$ and its audit passes $\mathsf{AuditPolicy}_I$; a record failing either check receives no $\mathrm{RoleStatus}$. Present evidence outside $\mathsf{Scope}_I$ or outside the host of $\mathcal T$ is well formed and receives $\texttt{inapplicable\_outside\_scope}$ by rule 1. For well-formed role-channel judgments, rules 1–5 are exhaustive.

A role-channel record is a tuple $(\mathrm{Chan}_i,R_i,\Theta_i^{\mathrm{act}},A_{R_i},V_{R_i},\mathsf{collapse}_i)$, where $R_i$ is a record with signature in $\mathsf{Wit}(P_i)$ or an audited absence marker, $\Theta_i^{\mathrm{act}}$ is a declared activation threshold, a finite check on $R_i$, $A_{R_i}$ is the audit record of $R_i$ and $V_{R_i}$ its visibility under $I$; and $\mathsf{collapse}_i$ is a declared Boolean field, which decides rule 3; the classifier reads only these fields. Role evidence is *present* when $R_i$ is a witness record; a required witness is *absent* when $R_i$ is an absence marker; the evidence is *visible and audited* when $R_i\in\mathsf{Visible}_I$ and its audit record passes $\mathsf{AuditPolicy}_I$; and the activation threshold is *not met* when the check $\Theta_i^{\mathrm{act}}$ fails on $R_i$.

### 5.6.2 Cell-Status Rules

The classifier is defined by the table of Subsubsection 5.6.6; the list below glosses its rows. The directed-cell classifier consumes the cell record together with the per-cell defect records of Subsection 5.3 and the visibility defect of Subsection 5.5. The priority order is

$$
\begin{aligned}
&\texttt{outside\_scope}\;\succ\;\texttt{absent}\;\succ\;\texttt{blocked}\;\succ\;\texttt{undefined\_circular}\;\succ\\
&\texttt{collapsed}\;\succ\;\texttt{below\_threshold}\;\succ\;\texttt{trivial}\;\succ\;\texttt{implicit}\;\succ\;\texttt{action}.
\end{aligned}
$$

The per-status conditions are:

- $\texttt{outside\_scope}$: the cell's host tag is not in $\mathsf{Hosts}_I$, a level tag is not in $\mathsf{Levels}_I$, or $\delta_{\mathrm{outside}}(I,C)=\mathsf{Use}(C)\cap\mathsf{Outside}_I\neq\varnothing$.
- $\texttt{absent}$: $W$ or $U$ is an audited absence marker and $\delta_6^{\mathrm{audit}}$ contains neither $\texttt{missing\_audit}$ nor $\texttt{failed\_audit}$; a cell whose audit is missing or failed is caught by the next row.
- $\texttt{blocked}$: the cell uses a missing or weak bridge, hidden suppressed content or unknown content, or its audit records a failed source or visibility check, is missing, failed, or fails its nonclaim check.
- $\texttt{undefined\_circular}$: the verdict reference $\ulcorner C,I\urcorner$ of the cell under the judging instrument is reachable from the evidence or source references of its audit ($\texttt{circular\_audit}\in\delta_6^{\mathrm{audit}}$).
- $\texttt{collapsed}$: $\delta$ contains $\texttt{total\_collapse}$ or $\texttt{singleton\_collapse}$, computed from the lens of $L$ and $W$ (Subsubsection 5.3.5).
- $\texttt{below\_threshold}$: $W$ and $U$ are present and the audit's $\mathsf{ThresholdCheck}$ fails ($\texttt{threshold\_failure}\in\delta_6^{\mathrm{audit}}$).
- $\texttt{trivial}$: $\mathsf{noopU}$ holds, or $\delta$ contains $\texttt{identity\_package}$; in particular, if the update applies an idempotent completion $E$ to a recorded input $s\in\mathrm{im}(E)$, then $\mathsf{noopU}$ holds and the cell is $\texttt{trivial}$ unless a row above it applies.
- $\texttt{implicit}$: $\mathsf{implicitW}$ holds: $W$ is attached to $\mathcal T$ and no threshold of $\Theta$ evaluates $W$ (a threshold evaluates $W$ when its evaluated datum is a field of $W$, a direct check on values of $W$ in the sense of Subsubsection 4.3.3, or a primitive defect computed from fields of $W$).
- $\texttt{action}$: the cell is well-formed, its witness and update are present, all required defects pass their thresholds, the visibility defect is empty (with admissible bridges in the bridge family $\mathcal L$ of Subsection 5.5 for any suppressed content used), and the audit and source policies pass.
- $\texttt{blocked}$ (final rule): included so that the table is total by construction; by Theorem 4 no well-formed cell reaches it.

For the running example of Subsection 3.8, no rule above $\texttt{action}$ applies: the cell is in scope, its witness and update are present, it uses no bridge and no suppressed content, its audit is not circular, its content does not collapse, its threshold is met, its update is not the identity, and $\mathsf{implicitW}$ is false, since $W_3\notin W_{\mathcal T}=\varnothing$ and the threshold of $\Theta$ evaluates $W_3$. The classifier therefore assigns $\texttt{action}$.

The final rule makes the classifier total on well-formed cells; the covered-cell uniqueness theorem (Theorem 4 of Section 6) proves that it assigns each of them exactly one status using this priority order.

### 5.6.3 Pair-Status Rules

The pair-observable classifier consumes the pair record together with its source-of-truth record and visibility defect, and assigns a value in the set $\mathrm{PairStatus}$ of Subsection 4.4. The priority order is

1. $\texttt{blocked}$, when any of the source, visibility, threshold, or audit defects fails its threshold; or $\delta_{\mathrm{reqbridge}}\neq\varnothing$; or when the source-of-truth record has type $\texttt{unknown}$ or $\texttt{contradictory}$ (then $\delta_6^{\mathrm{source}}$ fails $\Theta_{\mathrm{source}}$); or when the pair contract forbids the available source class entirely; or when the branch-compatibility record has $\mathsf{compatible}=\mathrm{false}$ or an audit defect other than $\texttt{audit\_passes}$; or the host tag of the pair record, which is the host tag $h_{\mathcal T}$ of its package as for a cell, is not in $\mathsf{Hosts}_I$, or a level tag of $\mu$ is not in $\mathsf{Levels}_I$;
2. $\texttt{real\_duplicated}$, when the pair record carries an explicit duplicate-pair record and the conditions of $\texttt{real}$ below hold;
3. $\texttt{real}$, when both (a) $\delta_6^{\mathrm{source}}=\texttt{committed}$ (so $(\mathrm{type}_{\mathrm{src}},\texttt{full},\mu)\in\mathsf{SourcePolicy}_I$), or $\delta_6^{\mathrm{source}}=\texttt{fallback\_admitted}$ and $R$ carries an audited source-upgrade bridge admitted by $\mathsf{SourcePolicy}_I$ and $\mathsf{BridgePolicy}_I$, and (b) the visibility defect is empty, $\mathsf{partialEvidence}$ is false, and the audit and threshold policies pass;
4. $\texttt{real\_provisional}$, when $\delta_6^{\mathrm{source}}\in\{\texttt{fallback\_admitted},\texttt{proxy\_admitted}\}$, $\mathsf{SourcePolicy}_I$ admits $R$ for provisional use under $\mu$, the visibility defect is empty, $\mathsf{partialEvidence}$ is false, and every bridge this row needs is admissible (the first row excludes $\delta_{\mathrm{reqbridge}}\neq\varnothing$, and $\texttt{proxy\_admitted}$ already requires an admitted, audited source bridge, Subsubsection 5.3.6);
5. $\texttt{blocked}$, as a final rule, when none of the conditions above applies; with it the pair classifier assigns every well-formed pair record a status.

### 5.6.4 Promotion-Status Rules

The gates are defined in Subsubsection 10.2.1. Here $\mathsf{ReqCoreGates}(B)=\{G_{\mathrm{suff}},G_{\mathrm{ctrl}},G_{\mathrm{nosmuggle}},G_{\mathrm{vis}},G_{\mathrm{audit}}\}$, together with $G_{\mathrm{desc}}$ when $B$ claims macro closure or descended dynamics and $G_{\mathrm{stab}}$ when it claims fixed-point targets; $G_{\mathrm{locglob}}$ is present only when $B$ claims a global package built from local packages. In brief: $G_{\mathrm{suff}}$ checks well-formedness and recorded gate values; $G_{\mathrm{desc}}$ and $G_{\mathrm{stab}}$ are required only for closure or fixed-point claims; $G_{\mathrm{ctrl}}$ and $G_{\mathrm{nosmuggle}}$ test the defect of Subsubsection 5.4.2; $G_{\mathrm{vis}}$ tests $\delta_{\mathrm{vis}}$ on $\mathsf{Use}(B)$; $G_{\mathrm{audit}}$ tests the bridge audit; $G_{\mathrm{strict}}$ records whether $\Delta_{\mathrm{fact}}$ is nonempty; $G_{\mathrm{locglob}}$ records gluing.

The promotion classifier consumes the bridge $B_{j\to j+1}$, its gate record $\mathsf{GateResults}(B)$, its strictness defect, no-smuggling defect, stability defect, and descent defect, and assigns a value in $\mathrm{PromotionStatus}$. It applies to bridges $B$ whose $G_{\mathrm{suff}}$ checks (Subsubsection 10.2.1), computed from the bridge data, all hold, written $\mathrm{WF}(B)$; $\mathsf{GateResults}(B)$ records $G_{\mathrm{suff}}=\texttt{pass}$ exactly when $\mathrm{WF}(B)$. A bridge with $\neg\mathrm{WF}(B)$ is not a well-formed promotion bridge and receives no promotion status, as a malformed directed-cell record receives no cell status (Subsubsection 4.3.3). The priority order is

1. $\texttt{outside\_scope}$, when the host tag $h_B$ of $B$ is not in $\mathsf{Hosts}_I$, a level tag of its profile or of $L$ is not in $\mathsf{Levels}_I$, or $\mathsf{Use}(B)\not\subseteq\mathsf{Scope}_I$ ($B\in\mathsf{Use}(B)$, since the $\mathsf{ClaimRef}$ of its audit names $B$);
2. $\texttt{failed\_audit}$, when the audit gate fails;
3. $\texttt{failed\_no\_smuggling}$, when the no-smuggling gate, the visibility gate, or the control gate $G_{\mathrm{ctrl}}$ fails (a failed control gate is the first violation kind of the no-smuggling defect of Subsubsection 5.4.2);
4. $\texttt{failed\_descent}$, when the descent gate fails on a bridge that requires descent;
5. $\texttt{failed\_stability}$, when the stability gate fails on a bridge that requires stability;
6. $\texttt{globally\_obstructed}$, when the optional local-to-global gate has $G_{\mathrm{locglob}}=\texttt{glue\_fail}$;
7. $\texttt{local\_only}$, when $G_{\mathrm{locglob}}=\texttt{local\_only}$;
8. $\texttt{candidate}$, when at least one required core gate has status $\texttt{not\_checked}$, or a required $G_{\mathrm{locglob}}$ is $\texttt{not\_checked}$;
9. $\texttt{strict}$, when every $G\in\mathsf{ReqCoreGates}(B)$ passes and $G_{\mathrm{strict}}=\texttt{strict\_pass}$, that is $\Delta_{\mathrm{fact}}\neq\varnothing$, and $G_{\mathrm{locglob}}\in\{\texttt{glue\_pass},\texttt{not\_required}\}$;
10. $\texttt{non\_strict}$, when every $G\in\mathsf{ReqCoreGates}(B)$ passes, $G_{\mathrm{strict}}=\texttt{non\_strict\_pass}$, that is $\Delta_{\mathrm{fact}}=\varnothing$, and the factorization is witnessed: the bridge records a map $\phi$ with $\pi_{j+1}=\phi\circ\pi_j$, and $G_{\mathrm{locglob}}\in\{\texttt{glue\_pass},\texttt{not\_required}\}$;
11. $\texttt{accepted}$, when every required core gate passes and the bridge does not require a strictness verdict, and $G_{\mathrm{locglob}}\in\{\texttt{glue\_pass},\texttt{not\_required}\}$;
12. $\texttt{candidate}$, as a final rule, when none of the conditions above applies; with it the promotion classifier assigns every well-formed bridge a status.

The promotion-gate-soundness theorem (Theorem 19 of Section 10) later proves the accepted-status consequence for verdicts in $\{\texttt{accepted},\texttt{strict},\texttt{non\_strict}\}$; this rule supplies only the classifier schema.

### 5.6.5 Claim-Status Rules

The claim classifier is defined by the table of Subsubsection 5.6.6; the list below glosses its rows. It consumes the claim record, its use-set, the visibility defect of Subsection 5.5 computed with the claim's own bridge field $\mathcal L_\varphi$ (Subsubsection 11.1.2), the threshold and source records, the audit record, and the bridge policy of $I$. The priority order is

$$
\begin{aligned}
&\texttt{outside\_scope}\;\succ\;\texttt{blocked}\;\succ\;\texttt{absent\_with\_record}\;\succ\;\texttt{failed\_audit}\;\succ\\
&\texttt{undefined\_circular}\;\succ\;\texttt{below\_threshold}\;\succ\;\texttt{rejected}\;\succ\;\texttt{provisional}\;\succ\;\texttt{accepted}.
\end{aligned}
$$

*Reference graph.* For reachability, form the finite directed graph whose vertices are the records of $\mathsf{Cont}$ in the instance, with an edge from a record to each record named by one of its resolved reference fields; every reachability condition of the paper (the conditions on claims in Section 2, $\mathsf{CircularityCheck}$ of Subsubsection 4.9.2, the visibility defects of Subsubsection 5.5.2, the rules below and the stack defects of Section 11) refers to this graph. Reachability from a set of records, in particular from $\mathsf{Use}(\varphi)$ and from the records named by the $\mathsf{EvidenceRefs}$ or $\mathsf{SourceRefs}$ of an audit record, includes paths of length zero. A field of a record is a reference field exactly when its declared type is a record identifier or a finite set of record identifiers, unless the schema lists its reference fields explicitly; in either case, the record's own identifier field is not a reference field. The following schemas declare their reference fields explicitly; every other schema (packages, pair records, promotion bridges, decorated squares, threshold, defect, context and claim-log records, absence markers) follows the default rule of the previous sentence: those of an audit record are $\mathsf{ClaimRef}$, $\mathsf{EvidenceRefs}$, $\mathsf{SourceRefs}$ and the instrument named in $\mathsf{CheckRules}$; of a claim record, $\mathcal T$, $\mathsf{EvidenceRefs}$, $\Theta$, $A$, $V$, $\mathcal L$ and the identifiers of $\mathsf{Refs}(\varphi)$; of a directed cell, the records in $W_j,U_i,L,V,\Theta,A$; of a visibility bridge, $c,c',\mathsf{Guarantee}_L,A_L,V_L,\mathcal N_L$; of a source record, the records named in $\mathrm{trace}_{\mathrm{src}}$. For an instrument record they are the named programs of $\mathsf{CheckRules}_I$; the sets $\mathsf{Scope}_I$, $\mathsf{Visible}_I$, $\mathsf{Suppressed}_I$ and the policy tables are data fields, not reference fields, and $\mathsf{ClaimLog}(I)$ is a separate record that $I$ does not reference. A verdict reference $\ulcorner\varphi,I\urcorner$ has exactly two reference fields, naming the record $\varphi$ and the instrument $I$. Cont may hold several records with these two reference fields; a condition that $\ulcorner\varphi,I\urcorner$ is reachable means that some such record is reachable, and a condition that it is not reachable means that none is.

The per-status conditions are:

- $\texttt{outside\_scope}$: the claim's host tag is not in $\mathsf{Hosts}_I$, a level tag of its $\mathsf{LevelProfile}$ is not in $\mathsf{Levels}_I$, $\mathsf{Use}(\varphi)\not\subseteq\mathsf{Scope}_I$, or its claim type is not in $\mathsf{ClaimTypes}_I$.
- $\texttt{blocked}$: a visibility check, missing bridge, wrong evidence type, an evidence source failing $\Theta_{\mathrm{source}}$, or a failed audit source check; threshold failures are routed separately to $\texttt{below\_threshold}$.
- $\texttt{absent\_with\_record}$: the claim refers to records that are absent in $\Gamma$ or $\mathcal T$, with the absence audited (an absent entry of $\mathsf{EvidenceRefs}$ is caught earlier by the $\texttt{blocked}$ row).
- $\texttt{failed\_audit}$: the audit defect of the claim's audit record (Subsubsection 5.3.6) contains $\texttt{missing\_audit}$, $\texttt{failed\_audit}$ or $\texttt{nonclaim\_failure}$; the other failing codes are routed to $\texttt{blocked}$, $\texttt{undefined\_circular}$ and $\texttt{below\_threshold}$.
- $\texttt{undefined\_circular}$: the claim's audit defect contains $\texttt{circular\_audit}$, or the claim refers to its own verdict under the judging instrument $I$, that is, the verdict reference $\ulcorner\varphi,I\urcorner$ is reachable from its use-set $\mathsf{Use}(\varphi)$ by resolved references (as in $\mathsf{CircularityCheck}$, Subsubsection 4.9.2), $\ulcorner\varphi,I\urcorner$ being a record of $\mathsf{Cont}$ that names the verdict of $\varphi$ under $I$; or the claim type is $\texttt{soundness}$ and $\mathsf{Use}(\varphi)$ contains a verdict reference $\ulcorner\psi,I'\urcorner$ with $\mathsf{Level}(I')\ge\mathsf{Level}(I)$. Reachability is a finite graph check and does not require evaluating the referenced verdict. The third condition is a stratification rule, not a cycle test: it applies whenever a soundness claim uses the verdict of any instrument $I'$ whose level is not below $\mathsf{Level}(I)$, including $I'\ne I$ with no reference cycle.
- $\texttt{below\_threshold}$: a threshold check fails.
- $\texttt{rejected}$: the claim is well-formed but the check rules of $I$ assign a rejection verdict.
- $\texttt{provisional}$: $\mathsf{partialEvidence}$ is true and $\mathsf{ClaimType}\in\mathsf{ProvisionalTypes}_I$.
- $\texttt{accepted}$: the claim is well-formed, $\mathsf{partialEvidence}$ is false, the visibility defect is empty (with all required bridges admissible), the threshold and source policies pass, the audit policy passes, and the claim is not circular at the same level.
- $\texttt{blocked}$, as a final rule, when none of the conditions above applies; with it the claim classifier assigns every well-formed claim record a status.

If the check rules of $I$ for the claim type of $\varphi$ reject exactly when the recomputed finite witnesses falsify the content of $\varphi$ (condition 6 of Subsubsection 2.4.1), then acceptance implies that those witnesses do not falsify it, and the content holds when it is a decidable property of them; without that condition, $\texttt{accepted}$ records only that the listed checks passed.

The no-overreading theorem (Theorem 23 of Section 11) later uses the constraint $\delta_{\mathrm{overread}}=\varnothing$ in the acceptance argument, and the same-level self-audit failure theorem (Theorem 24 of Section 11) later applies the circularity rule to complete same-level self-audit attempts without a level shift.

### 5.6.6 Classifier Conditions on Record Fields

The tables below restate the conditions of Subsubsections 5.6.1 through 5.6.5 as conditions on named fields of the classified record and on the defect values of Subsections 5.3 through 5.5. Each classifier returns the first status in its table whose condition holds. For the directed-cell classifier, the last column evaluates each condition on the running example of Subsection 3.8.

*Key.* $\delta_{\mathrm{reqbridge}}$: profile-required bridge types with no admissible bridge (5.5.2); $\delta_{\mathrm{weakbridge}}$: suppressed uses whose registered bridges are all inadmissible (5.5.2); $\delta_{\mathrm{overread}},\delta_{\mathrm{unknown}},\delta_{\mathrm{outside}}$: unbridged suppressed, unknown-class and out-of-scope uses (5.5.1, 5.5.3); $\delta_6^{\mathrm{audit}}$: codes of failed audit checks (5.3.6); $\texttt{total\_collapse}$, $\texttt{singleton\_collapse}$, $\texttt{identity\_package}$: package-collapse entries (5.3.5); $\mathsf{noopU}$: the update fixes its target; $\mathsf{implicitW}$: the witness is attached to $\mathcal T$ and evaluated by no threshold (4.3.4).

*Directed-cell classifier*, for a well-formed cell record $C=(P_i\leftarrow P_j,W,U,L,V,\Theta,A,\delta)^{\lambda}$ under $I$ and $\mathcal T$ (Subsubsection 4.3.3); a malformed record receives no status:

\begingroup\small
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.2\linewidth}>{\raggedright\arraybackslash}p{0.5\linewidth}>{\raggedright\arraybackslash}p{0.24\linewidth}@{}}
\toprule
Status & Condition & Running example \\
\midrule
\endfirsthead
\toprule
Status & Condition & Running example \\
\midrule
\endhead
\bottomrule
\endfoot
$\texttt{outside\_scope}$ & the host tag of $C$ is not in $\mathsf{Hosts}_I$, a level tag of $L$ is not in $\mathsf{Levels}_I$, or $\delta_{\mathrm{outside}}(I,C)=\mathsf{Use}(C)\cap\mathsf{Outside}_I\neq\varnothing$ & false \\
$\texttt{absent}$ & $W$ or $U$ is an audited absence marker, and $\delta_6^{\mathrm{audit}}$ contains neither $\texttt{missing\_audit}$ nor $\texttt{failed\_audit}$ & false: $W$, $U$ present \\
$\texttt{blocked}$ & a bridge required by $\lambda$ is missing or weak ($\delta_{\mathrm{reqbridge}}\neq\varnothing$), or a suppressed use has registered bridges but none admissible ($\delta_{\mathrm{weakbridge}}\neq\varnothing$); or $\delta_{\mathrm{overread}}\neq\varnothing$ or $\delta_{\mathrm{unknown}}\neq\varnothing$; or $\delta_6^{\mathrm{audit}}$ contains one of $\texttt{source\_failure}$, $\texttt{visibility\_failure}$, $\texttt{missing\_audit}$, $\texttt{failed\_audit}$, $\texttt{nonclaim\_failure}$ & false \\
$\texttt{undefined\_circular}$ & $\texttt{circular\_audit}\in\delta_6^{\mathrm{audit}}$ & false \\
$\texttt{collapsed}$ & $\delta$ contains $\texttt{total\_collapse}$ or $\texttt{singleton\_collapse}$ & false: $\delta=\varnothing$ \\
$\texttt{below\_threshold}$ & $W$ and $U$ are present and $\texttt{threshold\_failure}\in\delta_6^{\mathrm{audit}}$, that is (condition 8 of Subsubsection 4.3.3), some threshold of $\Theta$ does not evaluate to $\texttt{pass}$ & false: $\Theta$ met \\
$\texttt{trivial}$ & $\mathsf{noopU}$ holds, or $\delta$ contains $\texttt{identity\_package}$ & false \\
$\texttt{implicit}$ & $\mathsf{implicitW}$ holds: $W$ is attached to $\mathcal T$ and no threshold of $\Theta$ evaluates $W$ & false \\
$\texttt{action}$ & none of the above; $W$ and $U$ are present; $C$ is well-formed; every threshold of $\Theta$ returns $\texttt{pass}$; the visibility defect is empty; $\delta_6^{\mathrm{audit}}=\texttt{audit\_passes}$ & true \\
$\texttt{blocked}$ & none of the above (unreachable for well-formed cells, Theorem 4) & false \\
\end{longtable}
\endgroup

A well-formed cell whose audit defect contains $\texttt{missing\_audit}$, $\texttt{failed\_audit}$ or $\texttt{nonclaim\_failure}$ is caught by the first $\texttt{blocked}$ row unless an earlier row applies. By Theorem 4 no well-formed cell reaches the final row; it makes the classifier total by construction. Every well-formed cell therefore meets some row.

$\mathsf{implicitW}$ holds exactly when $W\in W_{\mathcal T}$, the witness family attached to $\mathcal T$ (Subsubsection 3.3.1), and no threshold of $\Theta$ evaluates $W$; step 8 of Subsubsection 6.3.1 recomputes it. The field $\mathsf{noopU}$ is computed: it is $[e_U(r)=r]$ when the update $U$ records its effect on its target record $r$ as a finite map $e_U$, including a declared completion, and false otherwise; step 8 of Subsubsection 6.3.1 rechecks it. Some conditions in these tables are not reduced to other record fields: whether content collapses to a degenerate record, whether the pair contract forbids an available source class, whether partial evidence is present, and whether the branches of a pair are compatible. Each is a Boolean field of the classified record, set by the instance: $\mathsf{collapse}$ on a role-channel record (deciding $\texttt{collapsed\_boundary\_case}$; on a directed cell the package-collapse values of $\delta$ play this part and are computed entries of the defect record, rechecked in step 8 of Subsubsection 6.3.1), $\mathsf{forbidsSource}$ on a pair record, $\mathsf{partialEvidence}$ on a claim, pair or square record, and $\mathsf{compatible}$ on a branch-compatibility record. The classifiers read these fields like any other, so every classifier is a finite computation on the record's fields; what the fields assert about the instance is the instance's declaration, recorded and audited with the record.

*Pair-observable classifier*, for a pair record $\mathsf{PairObs}_{\{i,j\}}^{\mu}$ with source-of-truth record $R$:

\begingroup\small
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.22\linewidth}>{\raggedright\arraybackslash}p{0.72\linewidth}@{}}
\toprule
Status & Condition \\
\midrule
\endfirsthead
\toprule
Status & Condition \\
\midrule
\endhead
\bottomrule
\endfoot
$\texttt{blocked}$ & a source, visibility, threshold or audit defect fails its threshold; or $\delta_{\mathrm{reqbridge}}\neq\varnothing$; or $R$ has type $\texttt{unknown}$ or $\texttt{contradictory}$ (then $\delta_6^{\mathrm{source}}$ fails $\Theta_{\mathrm{source}}$); or the pair contract forbids the available source class; or the branch-compatibility record has $\mathsf{compatible}=\mathrm{false}$ or an audit defect other than $\texttt{audit\_passes}$; or the host tag of the pair record, which is the host tag $h_{\mathcal T}$ of its package as for a cell, is not in $\mathsf{Hosts}_I$, or a level tag of $\mu$ is not in $\mathsf{Levels}_I$ \\
$\texttt{real\_duplicated}$ & the record carries an explicit duplicate-pair record and the conditions of the $\texttt{real}$ row hold \\
$\texttt{real}$ & both (a) $\delta_6^{\mathrm{source}}=\texttt{committed}$ (so $(\mathrm{type}_{\mathrm{src}},\texttt{full},\mu)\in\mathsf{SourcePolicy}_I$), or $\delta_6^{\mathrm{source}}=\texttt{fallback\_admitted}$ and $R$ carries an audited source-upgrade bridge admitted by $\mathsf{SourcePolicy}_I$ and $\mathsf{BridgePolicy}_I$, and (b) the visibility defect is empty, $\mathsf{partialEvidence}$ is false, and the audit and threshold policies pass \\
$\texttt{real\_provisional}$ & $\delta_6^{\mathrm{source}}\in\{\texttt{fallback\_admitted},\texttt{proxy\_admitted}\}$, $\mathsf{SourcePolicy}_I$ admits $R$ for provisional use under $\mu$, the visibility defect is empty, $\mathsf{partialEvidence}$ is false, and every bridge this row needs is admissible (the first row excludes $\delta_{\mathrm{reqbridge}}\neq\varnothing$, and $\texttt{proxy\_admitted}$ already requires an admitted, audited source bridge, Subsubsection 5.3.6) \\
$\texttt{blocked}$ & none of the above: no row above assigns a status, for instance any source with $\mathsf{partialEvidence}$ true, or a $\texttt{fallback\_admitted}$ source that $\mathsf{SourcePolicy}_I$ does not admit for provisional use under $\mu$ \\
\end{longtable}
\endgroup

*Promotion classifier*, for a well-formed bridge $B$ (its gate $G_{\mathrm{suff}}$ passes) with gate record $\mathsf{GateResults}(B)$:

\begingroup\small
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.22\linewidth}>{\raggedright\arraybackslash}p{0.72\linewidth}@{}}
\toprule
Status & Condition \\
\midrule
\endfirsthead
\toprule
Status & Condition \\
\midrule
\endhead
\bottomrule
\endfoot
$\texttt{outside\_scope}$ & the host tag $h_B$ of $B$ is not in $\mathsf{Hosts}_I$, a level tag of its profile or of $L$ is not in $\mathsf{Levels}_I$, or $\mathsf{Use}(B)\not\subseteq\mathsf{Scope}_I$ ($B\in\mathsf{Use}(B)$, since the $\mathsf{ClaimRef}$ of its audit names $B$) \\
$\texttt{failed\_audit}$ & $G_{\mathrm{audit}}=\texttt{fail}$ \\
$\texttt{failed\_no\_smuggling}$ & $G_{\mathrm{nosmuggle}}$, $G_{\mathrm{vis}}$ or $G_{\mathrm{ctrl}}$ has status $\texttt{fail}$ \\
$\texttt{failed\_descent}$ & $G_{\mathrm{desc}}$ is required and $G_{\mathrm{desc}}=\texttt{fail}$ \\
$\texttt{failed\_stability}$ & $G_{\mathrm{stab}}$ is required and $G_{\mathrm{stab}}=\texttt{fail}$ \\
$\texttt{globally\_obstructed}$ & $G_{\mathrm{locglob}}=\texttt{glue\_fail}$ \\
$\texttt{local\_only}$ & $G_{\mathrm{locglob}}=\texttt{local\_only}$ \\
$\texttt{candidate}$ & some $G\in\mathsf{ReqCoreGates}(B)$ has status $\texttt{not\_checked}$, or a required $G_{\mathrm{locglob}}$ is $\texttt{not\_checked}$ \\
$\texttt{strict}$ & every $G\in\mathsf{ReqCoreGates}(B)$ passes and $G_{\mathrm{strict}}=\texttt{strict\_pass}$ ($\Delta_{\mathrm{fact}}\neq\varnothing$), and $G_{\mathrm{locglob}}\in\{\texttt{glue\_pass},\texttt{not\_required}\}$ \\
$\texttt{non\_strict}$ & every $G\in\mathsf{ReqCoreGates}(B)$ passes, $G_{\mathrm{strict}}=\texttt{non\_strict\_pass}$ ($\Delta_{\mathrm{fact}}=\varnothing$), and $B$ records a map $\phi$ with $\pi_{j+1}=\phi\circ\pi_j$, and $G_{\mathrm{locglob}}\in\{\texttt{glue\_pass},\texttt{not\_required}\}$ \\
$\texttt{accepted}$ & every $G\in\mathsf{ReqCoreGates}(B)$ passes and the bridge does not require a strictness verdict, and $G_{\mathrm{locglob}}\in\{\texttt{glue\_pass},\texttt{not\_required}\}$ \\
$\texttt{candidate}$ & none of the above: no row above assigns a status, for instance strictness is required and $G_{\mathrm{strict}}$ is $\texttt{not\_checked}$ or $\texttt{bad\_audit}$, or a core gate or $G_{\mathrm{locglob}}$ is $\texttt{outside\_scope}$ \\
\end{longtable}
\endgroup

*Claim classifier*, for a claim record $\varphi$ under $I$ with use-set $\mathsf{Use}(\varphi)$:

\begingroup\small
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.22\linewidth}>{\raggedright\arraybackslash}p{0.72\linewidth}@{}}
\toprule
Status & Condition \\
\midrule
\endfirsthead
\toprule
Status & Condition \\
\midrule
\endhead
\bottomrule
\endfoot
$\texttt{outside\_scope}$ & the claim's host tag is not in $\mathsf{Hosts}_I$, a level tag of its $\mathsf{LevelProfile}$ is not in $\mathsf{Levels}_I$, $\mathsf{Use}(\varphi)\not\subseteq\mathsf{Scope}_I$, or its claim type is not in $\mathsf{ClaimTypes}_I$ \\
$\texttt{blocked}$ & a visibility check fails ($\delta_{\mathrm{overread}}\neq\varnothing$, $\delta_{\mathrm{unknown}}\neq\varnothing$, or $\texttt{visibility\_failure}\in\delta_6^{\mathrm{audit}}$), a required bridge is missing or weak ($\delta_{\mathrm{weakbridge}}\neq\varnothing$), some entry $R$ of $\mathsf{EvidenceRefs}$ does not resolve to a source record of Subsubsection 4.9.1 whose type tag $\mathsf{EvidencePolicy}_I$ admits, or has $\delta_6^{\mathrm{source}}(R;I)\notin\{\texttt{committed},\texttt{fallback\_admitted},\texttt{proxy\_admitted}\}$ (governing profile: the default entry, Subsubsection 5.3.6), or the source check fails ($\texttt{source\_failure}\in\delta_6^{\mathrm{audit}}$) \\
$\texttt{absent\_with\_record}$ & $\varphi$ refers to records absent from $\Gamma$ or $\mathcal T$, and the absence is audited \\
$\texttt{failed\_audit}$ & $\delta_6^{\mathrm{audit}}\cap\{\texttt{missing\_audit},\texttt{failed\_audit},\texttt{nonclaim\_failure}\}\neq\varnothing$ \\
$\texttt{undefined\_circular}$ & $\ulcorner\varphi,I\urcorner$ is reachable from $\mathsf{Use}(\varphi)$ by resolved references, or $\texttt{circular\_audit}\in\delta_6^{\mathrm{audit}}$, or the claim type is $\texttt{soundness}$ and some $\ulcorner\psi,I'\urcorner\in\mathsf{Use}(\varphi)$ has $\mathsf{Level}(I')\ge\mathsf{Level}(I)$ \\
$\texttt{below\_threshold}$ & a threshold check fails ($\texttt{threshold\_failure}\in\delta_6^{\mathrm{audit}}$) \\
$\texttt{rejected}$ & $\varphi$ is well-formed and the check rules of $I$ assign a rejection \\
$\texttt{provisional}$ & $\mathsf{partialEvidence}$ is true and $\mathsf{ClaimType}\in\mathsf{ProvisionalTypes}_I$ \\
$\texttt{accepted}$ & none of the above; $\varphi$ is well-formed, $\mathsf{partialEvidence}$ is false, the visibility defect is empty with all required bridges admissible, and the threshold, source and audit policies pass \\
$\texttt{blocked}$ & none of the above: no row above assigns a status \\
\end{longtable}
\endgroup

*Role-channel classifier*, for a primitive $P_i$ under $\mathcal T$ and $I$:

\begingroup\small
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.3\linewidth}>{\raggedright\arraybackslash}p{0.64\linewidth}@{}}
\toprule
Status & Condition \\
\midrule
\endfirsthead
\toprule
Status & Condition \\
\midrule
\endhead
\bottomrule
\endfoot
$\texttt{inapplicable\_outside\_scope}$ & the role evidence $R_i$ lies outside $\mathsf{Scope}_I$ or the host of $\mathcal T$ \\
$\texttt{absent\_with\_record}$ & a required witness for the role is absent and the absence is audited \\
$\texttt{collapsed\_boundary\_case}$ & the role-channel record's declared Boolean field $\mathsf{collapse}_i$ is true \\
$\texttt{below\_threshold}$ & role evidence is present and the activation threshold is not met \\
$\texttt{active\_projection}$ & none of the above; role evidence is visible and audited \\
\end{longtable}
\endgroup

*Square classifier*, for a well-formed decorated square $\Xi$ of Section 14 under $I_{\mathrm{DC}}$. For a square whose decoration declares an order comparison, $\delta_\Xi$ records the failures of that comparison; otherwise it records the failures of the exactness condition of its type (for a descent square, the candidate defect $\delta_1^{\mathrm{cand}}$).

\begingroup\small
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.22\linewidth}>{\raggedright\arraybackslash}p{0.72\linewidth}@{}}
\toprule
Status & Condition \\
\midrule
\endfirsthead
\toprule
Status & Condition \\
\midrule
\endhead
\bottomrule
\endfoot
$\texttt{outside\_scope}$ & the host tag or part of the content of $\Xi$ lies outside the scope of the instrument \\
$\texttt{blocked}$ & the visibility defect of $\Xi$ is nonempty, or the audit defect of $A_\Xi$ contains $\texttt{source\_failure}$ or $\texttt{visibility\_failure}$ \\
$\texttt{failed\_audit}$ & $\delta_6^{\mathrm{audit}}(A_\Xi)\cap\{\texttt{missing\_audit},\texttt{failed\_audit},\texttt{nonclaim\_failure},\texttt{threshold\_failure}\}\neq\varnothing$ \\
$\texttt{undefined\_circular}$ & the audit defect of $A_\Xi$ contains $\texttt{circular\_audit}$ \\
$\texttt{obstructed}$ & $\delta_\Xi\neq\varnothing$ \\
$\texttt{lax}$ & the decoration declares an order comparison, $\mathsf{partialEvidence}_\Xi$ is false, $\delta_\Xi=\varnothing$, and the equality of the two boundary composites fails \\
$\texttt{provisional}$ & $\mathsf{partialEvidence}$ is true and $\mathrm{type}_\Xi\in\mathsf{ProvisionalTypes}_I$ \\
$\texttt{exact}$ & none of the above: $\mathsf{partialEvidence}$ is false, the exactness condition of the square's type holds and $\delta_\Xi=\varnothing$ \\
$\texttt{blocked}$ & none of the above: the recorded decoration and defect do not complete a per-type exactness or order-comparison check \\
\end{longtable}
\endgroup

Theorems 30–32 use *mathematical exactness* as defined in Subsubsection 14.1.2. A mathematically exact square receives classifier status $\texttt{exact}$ only after the preceding scope, visibility, audit and evidence rows have been ruled out.
