# 11. Instruments, Visibility, and Rotating Audit

This section specifies the instrument-indexed claim semantics, whose finite self-certification limits invite comparison with work on incompleteness and reflection \citep{Goedel1931Incompleteness,Feferman1962Progressions}, the visibility discipline that the calculus uses to prevent overreading, and the rotating audits by which one instrument audits another without certifying itself. Subsections 11.1 and 11.2 fix the claim semantics and the classifier priority. Subsection 11.3 states the visibility and suppression rules that the proofs use. Subsections 11.4 and 11.5 prove Theorems 23 and 24. Subsection 11.6 isolates the $P_6\leftarrow P_6$ status separation. Subsection 11.7 records the rotating-audit chain. Subsection 11.8 proves Theorem 25. Subsection 11.9 discusses instrument transfer and marks its full classifier as future work.

## 11.1 Instrument-Indexed Claim Semantics

This subsection records the instrument record schema, the claim record schema, and the form of the acceptance judgment. The classifier rules and the no-overreading and same-level self-audit theorems that depend on them are stated in Subsections 11.4 and 11.5.

### 11.1.1 Instrument Record

The instrument record $I$ is the thirteen-field finite record of Subsubsection 3.4.1. Every component is finite. In a fixed finite instance, admissibility of $I$ is decidable from its fields and the audit records judged under it: rule-language membership and inclusion of each audit's check rules in $\mathsf{CheckRules}_I$ are finite syntactic checks; write $\mathsf{AdmInstrument}(I)$ for this instance-relative predicate.

### 11.1.2 Claim Record

A claim record under instrument $I$ is a finite typed tuple

$$
\begin{aligned}
\varphi(\mathcal T)\;=\;(\,&\mathrm{id}_{\varphi},\;\mathcal T,\;\mathsf{ClaimType},\;\mathsf{Content},\;\mathsf{LevelProfile},\\
&\mathsf{HostTag},\;\mathsf{EvidenceRefs},\;\Theta,\;A,\;V,\;\mathcal L,\;\mathcal N_{\varphi},\;\mathsf{partialEvidence}\,).
\end{aligned}
$$

The tuple fields record:

- $\mathrm{id}_{\varphi}$ and $\mathsf{Content}$: the claim's identifier and its content $\varphi$, with finite use-set $\mathsf{Use}(\varphi)\subseteq\mathsf{Cont}$;
- $\mathsf{ClaimType}$: a finite declared claim-type tag; membership in $\mathsf{ClaimTypes}_I$ is tested by the claim classifier;
- $\mathcal T$: the target package (the surrounding context $\Gamma$ is not a field of the record);
- $\mathsf{LevelProfile}$ and $\mathsf{HostTag}$: the level profile, a pair $(\ell,\ell')$ of level tags with an optional level-bridge record of a type of Subsubsection 2.2.3, and the host tag of the claim; the level tags of the claim are $\ell$ and $\ell'$;
- $\mathsf{EvidenceRefs}$: the source field of the claim, references to the source records consulted, drawn from the source-of-truth schema of Subsubsection 4.9.1; the classifier's source check reads this field;
- the threshold and audit records, drawn from the threshold and audit schemas of Subsection 5.2 and Subsubsection 4.9.2; each threshold of $\Theta$ names its evaluated datum as for a directed cell (Subsubsection 4.3.3), a recorded field or computed defect of a record named by the threshold record, which then lies in $\mathsf{Use}(\varphi)$ (Subsubsection 3.2.1);
- the visibility record $V$ and the visibility bridges $\mathcal L$ used to bring suppressed content into admissible reach, drawn from $\mathsf{BridgePolicy}_I$;
- the nonclaim record $\mathcal N_\varphi$ attached to the claim;
- $\mathsf{partialEvidence}\in\{\mathrm{true},\mathrm{false}\}$: the instance's declaration that the evidence is incomplete.

A candidate claim record is well formed when its fields are present, finite, and correctly typed, its audit slot holds an audit record whose $\mathsf{ClaimRef}$ names the claim, or a typed, audited absence marker, whose audit defect is $\{\texttt{missing\_audit}\}$ (Subsubsection 5.3.6), and every record identifier occurring in its statement lies in $\mathsf{Refs}(\varphi)$ (Subsubsection 3.2.1), and, when $\ell\neq\ell'$ or a record of $\mathsf{Use}(\varphi)$ carries a level tag other than $\ell,\ell'$, its $\mathsf{LevelProfile}$ carries a level-bridge record of a type of Subsubsection 2.2.3 (the stack claims of Subsection 11.8 carry the reflection bridge); policy failures, including claim-type exclusion, are classifier outcomes. Well-formedness is a finite check on finite records.

### 11.1.3 Acceptance Rule

The general claim form is

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\varphi\;:\;\chi,
$$

with $\chi$ in the claim status set $\mathrm{ClaimStatus}$ of Subsubsection 4.8.2.

The classifier of Subsubsection 5.6.5 consumes the claim record, the visibility partition $\mathsf{Visible}_I/\mathsf{Suppressed}_I/\mathsf{Outside}_I/\mathsf{Unknown}_I$, the threshold and source records, the audit record, the bridge family $\mathcal L$, and the nonclaim records, and assigns a value $\chi\in\mathrm{ClaimStatus}$ to the claim. The verdict $\chi=\texttt{accepted}$ records that the required in-scope, visibility, evidence, threshold, audit, circularity, and nonclaim checks have passed under $I$; the other statuses record the specific failure or scope condition that prevented acceptance.

The shorthand $I\vdash\varphi(\mathcal T)$ abbreviates $\Gamma;\mathcal T;I\vdash\varphi:\texttt{accepted}$ and never abbreviates instrument-free truth, in the sense fixed in Subsubsection 3.4.2.

## 11.2 Claim Classifier Priority

### 11.2.1 Priority Order

The claim classifier of Subsubsection 5.6.5 is a finite first-match procedure with the priority order displayed there. Theorems 23–25 use only these inputs: the claim record and its well-formedness (Subsubsection 11.1.2); $\mathsf{Use}(\varphi)$ (Subsubsection 3.2.1); the reference graph (paragraph *Reference graph*, Subsubsection 5.6.5); the audit record and its visibility, threshold and circularity checks (Subsubsection 4.9.2); the audit-defect codes (Subsubsection 5.3.6); the four visibility defects (Subsubsections 5.5.1–5.5.3); and the claim table of Subsubsection 5.6.6.

A claim record matching multiple per-status conditions is assigned the highest-priority match. The order encodes the intended discipline: an outside-scope claim is recorded outside scope rather than rejected; a claim whose use-set contains suppressed unbridged content is blocked rather than rejected; audited absence and failed audits are recorded before threshold or refutation outcomes; circularity is recorded once the earlier scope, visibility, source, and audit checks do not already determine the status; and the accepted verdict is the lowest-priority match, reached only when every higher condition has been ruled out.

### 11.2.2 Soundness Role

The classifier prevents suppressed content from supporting overstrong claims. Its priority order first routes claims with outside-scope use-set entries to $\texttt{outside\_scope}$; for in-scope visibility failures, a nonempty visibility defect $\delta_{\mathrm{vis}}$ of Subsection 5.5 routes the claim to $\texttt{blocked}$ before $\texttt{accepted}$ can be reached. Likewise, a same-level circular self-reference routes to $\texttt{undefined\_circular}$ once the earlier scope, visibility, source, and audit checks have not already determined the status. The no-overreading and same-level self-audit failure theorems of Subsections 11.4 and 11.5 are the theorem-grade form of these routing rules.

## 11.3 Visibility and Suppression

The visibility map $\mathsf{vis}_I$, the classes $\mathsf{Visible}_I$ and $\mathsf{Suppressed}_I$, visibility bridges and the bridge family $\mathcal L$ are those of Subsection 3.5; the predicate $\mathsf{AdmVisBridge}$ and the four visibility defects $\delta_{\mathrm{overread}}$, $\delta_{\mathrm{weakbridge}}$, $\delta_{\mathrm{outside}}$ and $\delta_{\mathrm{unknown}}$, with $\delta_{\mathrm{vis}}$ their union and threshold $\Theta_{\mathrm{vis}}:\delta_{\mathrm{vis}}=\varnothing$, are those of Subsection 5.5. The proofs below use $\delta_{\mathrm{overread}}$ and $\delta_{\mathrm{weakbridge}}$ (Subsubsections 5.5.1 and 5.5.2).

## 11.4 Theorem 23: No-Overreading Suppression

\begin{claimtheorem}{Theorem 23 (NoOverreadingSuppression)}
Let $I$ be an admissible instrument, $\varphi$ a finite claim, and $\mathcal L_\varphi$ the visibility-bridge field of the claim record of $\varphi$ (Subsubsection 11.1.2), with which the classifier computes $\delta_{\mathrm{vis}}$. If

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\varphi\;:\;\texttt{accepted},
$$

then

$$
\delta_{\mathrm{vis}}(I,\varphi,\mathcal L)\;=\;\varnothing,\quad\text{in particular}\quad\delta_{\mathrm{overread}}(I,\varphi,\mathcal L)\;=\;\varnothing,
$$

for every finite $\mathcal L\supseteq\mathcal L_\varphi$ of registered, audited candidates under $I$.

Moreover, under the accepted-status hypothesis, every $x\in\mathsf{Use}(\varphi)\cap\mathsf{Suppressed}_I$ is bridged by some $L\in\mathcal L_\varphi$ for which $\mathsf{AdmVisBridge}(L,I,\varphi)$ holds.
\end{claimtheorem}

\begin{proof}
By the classifier priority order of Subsubsection 11.2.1, the verdict $\texttt{accepted}$ is reached only after every higher-priority condition has been ruled out. The $\texttt{accepted}$ row is reached only if no earlier row holds: a nonempty $\delta_{\mathrm{outside}}$ gives $\mathsf{Use}(\varphi)\not\subseteq\mathsf{Scope}_I$, the $\texttt{outside\_scope}$ row; a nonempty $\delta_{\mathrm{overread}}$, $\delta_{\mathrm{weakbridge}}$ or $\delta_{\mathrm{unknown}}$ gives the $\texttt{blocked}$ row. Hence $\texttt{accepted}$ implies $\delta_{\mathrm{vis}}(I,\varphi,\mathcal L_\varphi)=\varnothing$, and in particular $\delta_{\mathrm{overread}}(I,\varphi,\mathcal L_\varphi)=\varnothing$. The overread defect is antitone in the bridge family: enlarging $\mathcal L$ can only supply more bridges, so $\delta_{\mathrm{overread}}(I,\varphi,\mathcal L)\subseteq\delta_{\mathrm{overread}}(I,\varphi,\mathcal L_\varphi)=\varnothing$ for every $\mathcal L\supseteq\mathcal L_\varphi$.

Hence also $\delta_{\mathrm{weakbridge}}(I,\varphi,\mathcal L)=\varnothing$ for $\mathcal L\supseteq\mathcal L_\varphi$, since each suppressed $x$ in the use-set is bridged by an admissible $L'\in\mathcal L_\varphi\subseteq\mathcal L$, and $\delta_{\mathrm{outside}}$, $\delta_{\mathrm{unknown}}$ do not depend on $\mathcal L$.

For the second statement, let $x\in\mathsf{Use}(\varphi)\cap\mathsf{Suppressed}_I$. Since $\delta_{\mathrm{overread}}(I,\varphi,\mathcal L_\varphi)=\varnothing$, some $L\in\mathcal L_\varphi$ bridges $x$; since $\delta_{\mathrm{weakbridge}}(I,\varphi,\mathcal L_\varphi)=\varnothing$, the pair $(x,L)$ is not in the weak-bridge defect, so by its definition some $L'\in\mathcal L_\varphi$ with $\mathsf{AdmVisBridge}(L',I,\varphi)$ bridges $x$.

\end{proof}

The second statement applies to accepted claims that use suppressed content. Take $I'$, with a fresh identifier, in the instance of Theorem 22 extended by the records below, by extending $I_{\mathrm{prom}}$ of Subsubsection 10.6.1 to admit the claim type $\texttt{injectivity}$, declaring $\mathsf{ReqStrength}_{I'}(\texttt{injectivity})=\texttt{strong}$ and $\mathsf{Strength}(L_t)=\texttt{strong}$ in the ordered strengths $\{\texttt{weak}<\texttt{strong}\}$, a $\texttt{committed\_state}$ evidence source, and a rule checking the two recorded values of $\pi_1$. Put the recorded table $t$ of $\pi_1$, a recomputed copy $t'$, a visibility bridge $L_t$, a claim $\varphi$ and their evidence, threshold and audit records in $\mathsf{Scope}_{I'}$. Make all these records visible except $t$, and set $\mathsf{Suppressed}_{I'}=\{t\}$. Let an audited $L_t$ certify $t'=t$ at the required strength without using $\ulcorner\varphi,I'\urcorner$. Give $\varphi$ host $\mathsf H_{\mathrm{fin}}$, level $\mathsf{Ver}$, claim type $\texttt{injectivity}$, the statement that $\pi_1$, recorded by its table $t$, is injective, so that $t\in\mathsf{Use}(\varphi)\cap\mathsf{Suppressed}_{I'}$, passing checks, bridge field $\{L_t\}$ and $\mathsf{partialEvidence}=\mathrm{false}$. Since $t'$ records $\pi_1(a)=u\ne v=\pi_1(b)$, the claim reaches $\texttt{accepted}$ with $t$ bridged by $L_t$.

### 11.4.1 Corollaries

The no-overreading constraint specializes to three corollaries on the judgment families of Section 4.

**Directed-cell corollary.** A directed-cell judgment with status $\texttt{action}$ has empty visibility defect, computed with the bridges listed in its visibility record: by the same argument, every suppressed field of the cell record (every element of $\mathsf{Use}(C)\cap\mathsf{Suppressed}_I$, Subsubsection 5.5.2) is bridged by a bridge of that list that is admissible for the cell.

**Pair-observable corollary.** A pair-observable judgment with status $\texttt{real}$ has empty overread defect on the source-of-truth record and the branch-compatibility record. By the classifier of Subsubsection 5.6.3, the source is either a real-source class admitted by $\mathsf{SourcePolicy}_I$ or a fallback source with an audited source-upgrade bridge admitted by $\mathsf{SourcePolicy}_I$ and $\mathsf{BridgePolicy}_I$; any suppressed dependency must be bridged.

**Promotion corollary.** For a promotion bridge with status $\texttt{strict}$, the visibility gate $G_{\mathrm{vis}}$ and the no-smuggling gate $G_{\mathrm{nosmuggle}}$ pass, and by Theorem 19 the visibility defect of the bridge's use-set is empty: no suppressed content is used without an admissible bridge.

## 11.5 Theorem 24: Same-Level Self-Audit Failure

### 11.5.1 Target

Let $I_0$ be an admissible instrument under an admissible package $\mathcal T_0$ on any host of Subsubsection 2.1.2. Consider the candidate same-level self-soundness claim $\mathrm{Sound}(I_0)$, presented as the attempted judgment

$$
\Gamma\,;\;\mathcal T_0\,;\;I_0\;\vdash\;\mathrm{Sound}(I_0):\chi.
$$

If $\chi=\texttt{accepted}$, this would be written in shorthand as $I_0\vdash\mathrm{Sound}(I_0)$. The target claim asserts that $I_0$ certifies its own soundness without a level shift to a higher instrument.

*Claim log.* Write $\mathsf{ClaimLog}(I_0)$ for the finite set of claim records, of claim types in $\mathsf{ClaimTypes}(I_0)$, for which the instance records a verdict of $I_0$ (the instance declares this set), each paired with the verdict that $I_0$ recorded for it. Each entry also records the finite judgment context $\Gamma_\psi$, stored as a single context record whose reference fields name the members of the context, and the admissible package or host $\mathcal T_\psi$ under which $\psi$ was judged; we keep writing $(\psi,\chi)$ for the entry, and "the status the claim classifier of $I_0$ assigns to $\psi$" means the status it assigns under $\Gamma_\psi;\mathcal T_\psi;I_0$.

*Complete soundness.* Complete soundness of $I_0$ means here that every verdict in $\mathsf{ClaimLog}(I_0)$ equals the status the claim classifier assigns under the corresponding recorded context; when $\mathrm{Sound}(I_0)$ is logged this includes $I_0$'s recorded verdict on it; it is not instrument-free truth. The claim log, including these context records, is a finite record of the instance, kept with $I_0$ under its identifier $\mathrm{id}_{I_0}$; it is not a component of the instrument tuple of Subsubsection 3.4.1, so equality of instruments does not depend on it, and $\mathsf{ClaimLog}(I)$ is defined in the same way for every instrument $I$ of the instance. Unlike the lifted claims of Theorem 25 (Subsection 11.8), which concern only the declared logs of lower instruments, $\mathrm{Sound}(I_0)$ names its own verdict through $\ulcorner\mathrm{Sound}(I_0),I_0\urcorner$, which lies in its use-set whether or not that verdict is logged; unlogged verdicts are not records and are not audited by these claims.

*The record $\mathrm{Sound}(I_0)$.* As a record, $\mathrm{Sound}(I_0)$ is the claim record with claim-type tag $\texttt{soundness}$ whose statement is that the verdict of $I_0$ on each claim in $\mathsf{ClaimLog}(I_0)$, and, if logged, on $\mathrm{Sound}(I_0)$ itself, is the status that the claim classifier of Subsubsection 5.6.5 assigns to that claim; the designated verdict-reference subset $\mathsf{Use}_{\mathrm{verdict}}(\mathrm{Sound}(I_0))$ of its use-set is the finite set

$$
\mathsf{Use}_{\mathrm{verdict}}(\mathrm{Sound}(I_0))\;=\;\{\ulcorner\psi,I_0\urcorner:\exists\chi\,(\psi,\chi)\in\mathsf{ClaimLog}(I_0)\}\;\cup\;\{\ulcorner\mathrm{Sound}(I_0),I_0\urcorner\}
$$

of verdict references. Its declared reference set $\mathsf{Refs}(\mathrm{Sound}(I_0))$ consists of $\mathsf{Use}_{\mathrm{verdict}}(\mathrm{Sound}(I_0))$, the records $I_0$, $\mathrm{Sound}(I_0)$ and $\mathsf{ClaimLog}(I_0)$, and each logged $\psi$ with $\Gamma_\psi$ and $\mathcal T_\psi$ (the statement names each of them, so Subsubsection 3.2.1 requires this), and by Subsubsection 3.2.1 the use-set is $\mathsf{Refs}(\mathrm{Sound}(I_0))$ together with the source records of $\mathsf{EvidenceRefs}$ and the records referenced by the claim's threshold and audit fields. In particular the use-set contains $\ulcorner\mathrm{Sound}(I_0),I_0\urcorner$. For a newly constructed candidate, adjoin the claim and its own verdict-reference record together, using fresh identifiers and mutually resolved references, along with its required audit, source and threshold records. For an existing well-formed candidate of this specified form, the verdict-reference record is already present. Evaluate the candidate in the resulting instance. The theorem below follows from membership of its own verdict reference in its use-set and the circularity rule of the claim classifier.

### 11.5.2 Outside-Scope Case

Suppose $\texttt{soundness}\notin\mathsf{ClaimTypes}(I_0)$, that is, $I_0$ is not configured to evaluate claims about its own soundness. By the classifier of Subsubsection 5.6.5, the $\texttt{outside\_scope}$ condition holds because the claim type is not in $\mathsf{ClaimTypes}(I_0)$ (the other condition of that row, a use-set not contained in $\mathsf{Scope}_{I_0}$, would give the same status), and the priority routing of Subsection 11.2 returns

$$
\Gamma\,;\;\mathcal T_0\,;\;I_0\;\vdash\;\mathrm{Sound}(I_0)\;:\;\texttt{outside\_scope}.
$$

This is the case for instruments configured to evaluate object-level claims only.

### 11.5.3 Circular Case

Suppose the claim's host tag is in $\mathsf{Hosts}_{I_0}$, its level tags are in $\mathsf{Levels}_{I_0}$, $\texttt{soundness}\in\mathsf{ClaimTypes}(I_0)$, and the use-set of $\mathrm{Sound}(I_0)$ is contained in $\mathsf{Scope}_{I_0}$. By Subsubsection 11.5.1 that use-set contains $\ulcorner\mathrm{Sound}(I_0),I_0\urcorner$. The classifier records this circular self-reference at the same level and, when no higher-priority $\texttt{blocked}$, $\texttt{absent\_with\_record}$ or $\texttt{failed\_audit}$ condition is present, returns

$$
\Gamma\,;\;\mathcal T_0\,;\;I_0\;\vdash\;\mathrm{Sound}(I_0)\;:\;\texttt{undefined\_circular}.
$$

This verdict follows from the same-level verdict reference explicitly included in $\mathsf{Use}(\mathrm{Sound}(I_0))$.

### 11.5.4 Statement and Proof

*Setting.* $I_0$ is an admissible instrument under an admissible package $\mathcal T_0$ on any host of Subsubsection 2.1.2, and $\mathrm{Sound}(I_0)$ is the complete same-level self-soundness claim of Subsubsection 11.5.1, judged by the claim classifier of Subsubsection 5.6.5.

\begin{claimtheorem}{Theorem 24 (SameLevelSelfAuditFailure)}
Let $\mathrm{Sound}(I_0)$ be the claim record of Subsubsection 11.5.1, whose use-set contains its own verdict reference $\ulcorner\mathrm{Sound}(I_0),I_0\urcorner$. The claim classifier of Subsubsection 5.6.5 does not assign this same-level self-soundness claim the verdict $\texttt{accepted}$ under $I_0$. The content of $\mathrm{Sound}(I_0)$ can nevertheless be true: if every verdict in $\mathsf{ClaimLog}(I_0)$ equals the classifier's status and $I_0$ records for $\mathrm{Sound}(I_0)$ the status the classifier assigns it, its statement holds, and it is still not $\texttt{accepted}$; so for this claim truth does not imply acceptance, whereas for claims whose check rules meet condition 6 of Subsubsection 2.4.1 and whose content is a decidable property of the recomputed witnesses, acceptance implies truth (Subsubsection 5.6.5). If $\mathrm{Sound}(I_0)$ is well formed (Subsubsection 11.1.2), the classifier returns $\texttt{outside\_scope}$ if the claim's host tag is not in $\mathsf{Hosts}_{I_0}$, a level tag is not in $\mathsf{Levels}_{I_0}$, its type is not in $I_0$'s claim types or its use-set is not contained in $I_0$'s scope, and otherwise returns $\texttt{undefined\_circular}$ or a status of higher priority; if $\mathrm{Sound}(I_0)$ is not well formed, the classifier assigns it no status. In either case it is not accepted. More generally, under $I_0$ the classifier accepts no well-formed claim of type $\texttt{soundness}$ whose use-set contains a verdict reference $\ulcorner\psi,I'\urcorner$ with $\mathsf{Level}(I')\ge\mathsf{Level}(I_0)$ (by that stratification condition; no reference cycle is required). Whatever its claim-type tag, no well-formed claim whose statement includes $I_0$'s verdict on that claim is accepted under $I_0$, since $\ulcorner\varphi,I_0\urcorner\in\mathsf{Use}(\varphi)$ and the first condition of the $\texttt{undefined\_circular}$ row applies.

\end{claimtheorem}

The result follows from the membership of the verdict reference $\ulcorner\mathrm{Sound}(I_0),I_0\urcorner$ in the use-set of the claim and the stratification condition of the $\texttt{undefined\_circular}$ row of Subsubsection 5.6.5; it uses no other property of $I_0$.

\begin{proof}
For the complete same-level self-audit target, the classifier has the two cases of Subsubsections 11.5.2 and 11.5.3. If the target claim's host tag is not in $\mathsf{Hosts}_{I_0}$, a level tag is not in $\mathsf{Levels}_{I_0}$, its type is not in $\mathsf{ClaimTypes}(I_0)$, or its use-set is not contained in $\mathsf{Scope}_{I_0}$, the $\texttt{outside\_scope}$ rule applies, and $\texttt{outside\_scope}$ has the highest priority. Otherwise the claim is in scope. By Subsubsection 11.5.1, the use-set of $\mathrm{Sound}(I_0)$ then contains $\ulcorner\mathrm{Sound}(I_0),I_0\urcorner$; since the claim type is $\texttt{soundness}$ and $\mathsf{Level}(I_0)\ge\mathsf{Level}(I_0)$, the third condition of the $\texttt{undefined\_circular}$ rule holds, a condition that tests membership rather than reachability. The classifier then returns $\texttt{undefined\_circular}$, or $\texttt{blocked}$, $\texttt{absent\_with\_record}$ or $\texttt{failed\_audit}$ if one of those higher-priority rules also applies. Each of these statuses precedes $\texttt{accepted}$ in the priority order of Subsubsection 5.6.5, so $\texttt{accepted}$ is not reached. Hence the classifier does not accept the same-level self-soundness claim under $I_0$. The same argument applies verbatim to the general statement, since the third condition tests membership: a well-formed soundness claim whose use-set contains such a verdict reference receives $\texttt{outside\_scope}$, $\texttt{undefined\_circular}$ or a status of higher priority. A level shift does not change this verdict: it judges the claim under a higher instrument instead of $I_0$.

The theorem is a statement about the routing of the claim classifier of this calculus: its priority rules send a complete same-level self-soundness claim to a status that precedes $\texttt{accepted}$ in the classifier's priority order. It is not a general impossibility result about self-certification for instruments outside this classifier.

NC-16 of Subsection 15.2 is the corresponding nonclaim. A positive soundness claim about a lower instrument requires a level shift to a higher instrument $I_1$ (Subsubsection 5.6.5), and an admissible audit bridge through which $I_1$ audits $I_0$ records it; Subsection 11.7 records the rotating-audit chain that supplies such bridges, and Subsection 11.8 records that a rotating audit can certify the lower stack but does not certify itself, so the rotating audit is non-final (NC-17).
\end{proof}

A same-level claim of a type other than $\texttt{soundness}$ from whose use-set its own verdict reference is not reachable is not covered by Theorem 24; one from whose use-set it is reachable receives $\texttt{undefined\_circular}$ or a status of higher priority by the same rule of the claim classifier.

## 11.6 $P_6\leftarrow P_6$ Status Separation

This subsection records a schema-level distinction between three judgments that all carry the same primitive pair $P_6\leftarrow P_6$: the object-level audit update, the fixed audit refresh, and the complete same-level self-audit. They differ in profile and update. The first two can differ in directed-cell status ($\texttt{action}$ for an object-level audit whose records pass, $\texttt{trivial}$ for a refresh, since $\mathsf{noopU}$ holds); the third is separated at the level of its claim record, which Theorem 24 keeps away from $\texttt{accepted}$. Theorem 1 of Section 6 covers the formal non-factorization of cell status through the primitive pair.

### 11.6.1 Object-Level Audit Update

A directed cell $P_6\leftarrow P_6$ in which the actor update $U_6$ records an audit on a specific object-level record — a directed cell, a pair observable, a promotion bridge, or a claim record other than $I$'s own soundness — is admissible. Its profile $\lambda_{\mathrm{obj}}$ has the audit-only instrument mode of Subsubsection 3.6.1, at object level. The cell may receive directed-cell status $\texttt{action}$ in the classifier of Subsubsection 5.6.2 when its witness, threshold, audit, and visibility records pass the standard cell admissibility checks.

### 11.6.2 Fixed Audit Refresh

A directed cell $P_6\leftarrow P_6$ in which the actor update is a fixed-instrument audit refresh — re-running an existing audit policy on an already present, unchanged audit record under a profile $\lambda_{\mathrm{refresh}}$ with the audit-only instrument mode — records the identity effect map on the audit record, since the refresh leaves that record unchanged, so $\mathsf{noopU}$ is computed true, and is classified $\texttt{trivial}$ in the priority order of Subsubsection 5.6.2 unless a row above it applies. If the audit step produces new admissible audit content, it is no longer this fixed-refresh case and must be classified under its own object-level audit-update profile.

### 11.6.3 Complete Same-Level Self-Audit

A directed cell $P_6\leftarrow P_6$ in which the actor update asserts a complete same-level self-soundness verdict on the surrounding instrument $I_0$ is the case covered by Theorem 24 of Subsection 11.5. By that theorem, the claim record $\mathrm{Sound}(I_0)$ that such an update asserts receives $\texttt{outside\_scope}$, $\texttt{undefined\_circular}$ or a claim status of higher priority, and never $\texttt{accepted}$. The status of the directed cell itself is assigned separately, by the cell classifier of Subsubsection 5.6.2 from the cell record.

The three cases together separate object-level audit, fixed audit refresh, and complete same-level self-certification within the same primitive pair $(P_6,P_6)$. They are an instance of the typed/profile-relative discipline of the calculus: when two of these cells on the same pair receive different statuses, Theorem 1 shows that cell status does not factor through the pair.

## 11.7 Rotating Audit

This subsection records the rotating-audit discipline that replaces forbidden complete same-level self-audit with a finite, level-shifted, bounded audit of one instrument by a strictly higher instrument. In a rotating-audit chain the auditing role passes upward: each instrument is audited by the next, strictly higher one, and the chain never returns to a lower level. It records the rotating-audit chain, the rotating-audit bridge, the admissibility predicate for that bridge, and the rotating-audit defect schema. Theorem 25 of Subsection 11.8 then states the finite rotating-audit theorem and its non-finality.

### 11.7.1 Rotating-Audit Chain

A rotating-audit chain is a finite ordered family of admissible instruments

$$
\mathbb I_{\le N}\;=\;(I_0,I_1,\ldots,I_N),
$$

with strictly increasing instrument levels $\mathsf{Level}(I_0)<\mathsf{Level}(I_1)<\cdots<\mathsf{Level}(I_N)$ in the order $\mathsf{Beh}<\mathsf{Ver}<\mathsf{Str}$ of Subsubsection 2.2.3, together with a finite ordered family of rotating-audit bridges

$$
B^{\mathrm{audit}}_{n\to n+1}\quad\text{for each } 0\le n<N,
$$

each pointing to a strictly higher level. Each $I_n$ is an instrument in the sense of Subsubsection 11.1.1, with finite logs, declared visibility policy, declared source policy, declared audit policy, declared nonclaim register, and declared scope. The chain is finite by construction: $N$ is a fixed natural number and there is no implicit limit instrument at the top. The chain has no final self-certifying instrument; Subsection 11.8 records this non-finality formally.

With the three levels of $\mathsf{Lev}$, such a chain has at most three instruments, and Theorem 25 applies exactly to chains whose highest level is $\mathsf{Beh}$ or $\mathsf{Ver}$; such chains have $N\le1$ (Subsubsection 11.8.1).

### 11.7.2 Rotating-Audit Bridge

For each adjacent pair $(I_n,I_{n+1})$ with $\mathsf{Level}(I_{n+1})>\mathsf{Level}(I_n)$, the rotating-audit bridge

$$
B^{\mathrm{audit}}_{n\to n+1}\;=\;(I_n,\;I_{n+1},\;\Phi_n,\;L,\;V,\;\Theta,\;A,\;\delta,\;\mathcal N)
$$

with expanded finite record

$$
\begin{aligned}
B^{\mathrm{audit}}_{n\to n+1}\;=\;(&\mathrm{id},\;I_n,\;I_{n+1},\;\Phi_n,\;\mathsf{TargetRecords}_n,\;L_{n\to n+1},\;V_{n\to n+1},\\
&\Theta_{n\to n+1},\;A_{n\to n+1},\;\delta_{n\to n+1},\;\mathcal N_{n\to n+1},\;\lambda_{\mathrm{rot}}).
\end{aligned}
$$

It is a directed bridge from $I_n$ into $I_{n+1}$ whose bridge type is the level bridge $\texttt{reflection}$, used for audit. Its components are:

- $\Phi_n$, the rotating-audit target scope: a finite, declared subset of $I_n$'s records (the instrument record $I_n$, the named programs of $\mathsf{CheckRules}_{I_n}$, the log $\mathsf{ClaimLog}(I_n)$ with the claim records, contexts, packages and verdict references of its entries, and the source, audit and nonclaim records these name) on which $I_{n+1}$ undertakes to compute a finite audit defect, in the sense of Subsubsection 11.7.4;
- $L_{n\to n+1}$, the language map that translates $I_n$-records into $I_{n+1}$'s claim language;
- $V_{n\to n+1}$, the visibility map that exposes the audited records to $I_{n+1}$ either directly or through visibility bridges of Subsubsection 3.5.3;
- $\Theta_{n\to n+1}$, the audit thresholds (witness, audit, visibility) that $I_{n+1}$ applies when classifying the bridge;
- $A_{n\to n+1}$, the audit record of the bridge itself, recording that the bridge is auditable in $I_{n+1}$;
- $\delta_{n\to n+1}$, the rotating-audit defect of Subsubsection 11.7.4;
- $\mathcal N_{n\to n+1}$, the bridge-level nonclaim register that records, at minimum, $\mathrm{NC}\text{-}16$, $\mathrm{NC}\text{-}17$, and $\mathrm{NC}\text{-}18$;
- $\lambda_{\mathrm{rot}}=(\mathsf{Level}(I_n),\mathsf{Level}(I_{n+1}),\texttt{fine},\texttt{audit},\texttt{reflection},\texttt{rotating-audit},\texttt{global})$, the bridge profile recording rotating-audit mode; the reflection level bridge its distinct tags require is the bridge itself.

*Stack form.* For a finite chain $I_0,\ldots,I_N$ and an instrument $I_{N+1}$ with $\mathsf{Level}(I_{N+1})>\max_{n\le N}\mathsf{Level}(I_n)$, a stack rotating-audit bridge $B^{\mathrm{audit}}_{\le N\to N+1}$ has the same components, with the chain as its source, a finite declared target scope $\Phi_{\le N}$ among the records of the chain and its bridges, and a language map on all of them. Its admissibility (Subsubsection 11.7.3) reads clause (1) as admissibility of every $I_n$, $n\le N$, and of $I_{N+1}$, and clause (2) as $\mathsf{Level}(I_{N+1})>\max_{n\le N}\mathsf{Level}(I_n)$; the other clauses are unchanged. The stack profile has source tag $\max_{n\le N}\mathsf{Level}(I_n)$ and target tag $\mathsf{Level}(I_{N+1})$; it retains the reflection, mode and compatibility requirements of clause (1).

The rotating-audit bridge is the instrument-level vehicle by which $I_{n+1}$ reflects $I_n$'s declared records into its own claim language under a declared, finite scope $\Phi_n$. It is a $P_6\leftarrow P_6$ object at the bridge layer, distinct from the directed-cell $P_6\leftarrow P_6$ judgments separated in Subsection 11.6: a rotating-audit bridge audits an instrument across a level shift; the cell-level judgments of Subsection 11.6 audit object-level records under a single instrument.

### 11.7.3 Rotating-Audit Admissibility

The admissibility predicate

$$
\mathsf{AdmRotAuditBridge}(B^{\mathrm{audit}}_{n\to n+1})
$$

holds iff every clause below holds:

1. $I_n$ and $I_{n+1}$ are admissible instruments in the sense of Subsubsection 11.1.1; $\mathsf{BridgePolicy}_{I_{n+1}}$ admits reflection, $\mathsf{ModePolicy}_{I_{n+1}}$ maps the rotating-audit-bridge family to rotating-audit, and $(\texttt{fine},\texttt{audit},\texttt{global},\mathsf H_{\mathrm{instr}})\in\mathsf{Compat}_{I_{n+1}}$;
2. $\mathsf{Level}(I_{n+1})>\mathsf{Level}(I_n)$;
3. $\Phi_n$ is finite and declared as part of $B^{\mathrm{audit}}_{n\to n+1}$;
4. every record in $\Phi_n$ lies in $\mathsf{Scope}_{I_{n+1}}$ and is visible to $I_{n+1}$ directly or through a visibility bridge of Subsubsection 3.5.3;
5. $L_{n\to n+1}$ is a finite table sending each record of $\Phi_n$ to a claim record, of a type in $\mathsf{ClaimTypes}_{I_{n+1}}$, that is well formed in the sense of Subsubsection 11.1.2;
6. $V_{n\to n+1}$ exposes the records required by the audit thresholds, and $\delta_{\mathrm{vis}}(I_{n+1},B,\mathcal L_B)=\varnothing$ (Subsection 5.5), with $\mathsf{AdmVisBridge}(L,I_{n+1},B)$ read as in Subsubsection 5.5.2 for $X=B$ and $\mathsf{RequiredStrength}(B)$ the value $\mathsf{BridgePolicy}_{I_{n+1}}$ assigns to $(\texttt{reflection},\texttt{audit})$, where $\mathsf{Use}(B)$ is $\Phi_n$ together with the content references (one step, Subsubsection 5.5.2) in $L_{n\to n+1},\Theta_{n\to n+1},A_{n\to n+1}$, and $\mathcal L_B$ is the set of bridges listed in $V_{n\to n+1}$;
7. every threshold of $\Theta_{n\to n+1}$ is a record of the schema of Subsubsection 5.2.2 and belongs to $\mathsf{ThresholdPolicy}_{I_{n+1}}$;
8. $A_{n\to n+1}$ is an audit record in the schema of Subsubsection 4.9.2 with $\mathsf{ClaimRef}$ the bridge and $\mathsf{CheckRules}$ drawn from $\mathsf{CheckRules}_{I_{n+1}}$;
9. $\delta_{n\to n+1}$ is typed by the rotating-audit defect schema of Subsubsection 11.7.4;
10. no verdict reference $\ulcorner\psi,I_{n+1}\urcorner$, for any $\psi$, is reachable from a record of $\Phi_n$ in the reference graph of Subsubsection 5.6.5, so no record of $\Phi_n$ depends on a verdict of $I_{n+1}$;
11. $\mathcal N_{n\to n+1}$ is present and contains the rotating-audit nonclaims of the calculus, in particular $\mathrm{NC}\text{-}16$, $\mathrm{NC}\text{-}17$, and $\mathrm{NC}\text{-}18$.

The clauses are finite checks on the records of $B^{\mathrm{audit}}_{n\to n+1}$, decidable under hypotheses (a)–(b) of Theorem 3; admissibility is a predicate on the bridge object, not an external soundness condition.

### 11.7.4 Rotating-Audit Defect

The rotating-audit defect schema for a rotating-audit bridge $B^{\mathrm{audit}}_{n\to n+1}$ is

$$
\mathsf{Def}^{\mathrm{rot}}_{n\to n+1}\;=\;(\delta_{\mathrm{rot}},\;\Omega_{\mathrm{rot}},\;\Theta_{\mathrm{rot}},\;\mathrm{polarity}_{\mathrm{rot}},\;W_{\mathrm{rot}},\;A_{\mathrm{rot}},\;V_{\mathrm{rot}},\;\sigma_{\mathrm{rot}}),
$$

following the defect-record schema of Subsection 5.2. The defect value $\delta_{\mathrm{rot}}$ ranges over the rotating-audit defect codes

$$
\begin{aligned}
\Omega_{\mathrm{rot}}\;=\;\{\,&\texttt{audit\_passes},\;\texttt{missing\_target\_scope},\;\texttt{missing\_instrument\_record},\\
&\texttt{visibility\_failure},\;\texttt{translation\_failure},\;\texttt{source\_failure},\\
&\texttt{threshold\_failure},\;\texttt{nonclaim\_failure},\;\texttt{same\_level\_cycle},\;\texttt{higher\_audit\_failure}\,\},
\end{aligned}
$$

with intended readings:

- $\texttt{audit\_passes}$: the bridge audit succeeded under its declared thresholds;
- $\texttt{missing\_target\_scope}$: $\Phi_n$ is not finite or not declared;
- $\texttt{missing\_instrument\_record}$: a record required by $\Phi_n$ is not present in $I_n$ or not visible in $I_{n+1}$;
- $\texttt{visibility\_failure}$: a visibility-policy clause of $V_{n\to n+1}$ fails;
- $\texttt{translation\_failure}$: $L_{n\to n+1}$ fails to type a record in $\Phi_n$;
- $\texttt{source\_failure}$: $I_{n+1}$ fails to check a source-of-truth clause on a record of $\Phi_n$ as its bridge policy requires (a clause the check finds failing is report data);
- $\texttt{threshold\_failure}$: an audit threshold in $\Theta_{n\to n+1}$ is violated;
- $\texttt{nonclaim\_failure}$: a clause in $\mathcal N_{n\to n+1}$ is violated;
- $\texttt{same\_level\_cycle}$: an unstratified same-level audit cycle is detected in the bridge dependency graph;
- $\texttt{higher\_audit\_failure}$: the bridge-level audit record $A_{n\to n+1}$ fails.

A defect found in a lower-stack record is report data. It is a bridge-level failure code only if the extension instrument fails to inspect, translate, source, or audit that record as required by the bridge policy. A correctly detected lower-stack threshold violation is likewise report data, not the bridge code $\texttt{threshold\_failure}$.

The acceptance threshold is

$$
\Theta_{\mathrm{rot}}:\;\delta_{\mathrm{rot}}=\texttt{audit\_passes}.
$$

The value $\texttt{audit\_passes}$ is the threshold value later consumed by the rotating-audit acceptance rule of Subsection 11.8.

## 11.8 Theorem 25: Finite Rotating-Audit Theorem

This subsection records the finite rotating-audit theorem. It states that, given a finite stack of admissible instruments and a level of $\mathsf{Lev}$ above the highest level of the stack, there is an extension instrument at that level and an audit bridge that can finitely audit the lower stack and accept its compliance iff the stack-audit defect is empty, while the higher instrument does not thereby certify itself. The statement and proof follow, and Subsubsection 11.8.1 records the non-finality of the construction. The theorem supports $\mathrm{NC}\text{-}17$ of Subsection 15.2.

In words: the lower stack is audited by recomputation. Each $I_n$ keeps a log of the claims it judged and the verdicts it recorded; the new instrument $I^{\mathrm{stack}}_{N+1}$, at a strictly higher declared level, reruns $I_n$'s classifier on each logged claim and compares. Clause 1 says the report of all defect values is accepted whatever they are; clause 2 says the stack is compliant exactly when no logged verdict differs from the recomputed one ($\delta_{\mathrm{status}}=\varnothing$); clause 4 says the same instrument by instrument; clause 3 says none of this lets $I^{\mathrm{stack}}_{N+1}$ accept its own soundness claim. Since $\mathsf{Lev}$ has three levels, the chain has one or two instruments. Clauses 1, 2 (first equivalence) and 4 follow from the choice of the check rules of $I^{\mathrm{stack}}_{N+1}$ once the other classifier rows are ruled out. The proof therefore consists of (i) admissibility of the extension instrument, the stack bridge and the extended instance; (ii) exclusion of the scope, visibility, absence, audit, circularity and threshold rows; (iii) the second equivalence of clause 2, which holds for every admissible chain; and (iv) clause 3, by Theorem 24.

*Setting.* Let

$$
\mathbb I_{\le N}\;=\;(I_0,\,I_1,\,\ldots,\,I_N)
$$

be a finite admissible rotating-audit chain in the sense of Subsubsection 11.7.1, with strictly increasing levels and a finite family of admissible rotating-audit bridges $\{B^{\mathrm{audit}}_{n\to n+1}\}_{0\le n<N}$. Let the lower-stack audit target be the finite union

$$
\begin{aligned}
\mathsf{Target}_{\le N}\;=\;&\bigcup_{n=0}^{N}\mathsf{InstrRecord}(I_n)\;\cup\;\bigcup_{n=0}^{N-1}\mathsf{BridgeRecord}\bigl(B^{\mathrm{audit}}_{n\to n+1}\bigr)\\
&\cup\;\bigcup_{n=0}^{N}\mathsf{ClaimLog}(I_n)\;\cup\;\bigcup_{n=0}^{N}\{\,\ulcorner\psi,I_n\urcorner:\exists\chi\,(\psi,\chi)\in\mathsf{ClaimLog}(I_n)\,\}.
\end{aligned}
$$

Here $\mathsf{InstrRecord}(I_n)$ is the set consisting of the instrument record $I_n$ and the records named by its reference fields (Subsubsection 5.6.5); its data fields are read as fields of $I_n$; $\mathsf{BridgeRecord}(B)$ is the set of field records of the expanded record of $B$ in Subsubsection 11.7.2; and each entry of $\mathsf{ClaimLog}(I_n)$ contributes its claim record, $\Gamma_\psi$, $\mathcal T_\psi$, and every source, audit and bridge record they reference. The target also contains each instrument record $I_n$ and each log record $\mathsf{ClaimLog}(I_n)$, together with all records reachable from them in the original instance. In the displayed definition, each record family includes all records reachable from its listed members in the original instance's graph of Subsubsection 5.6.5. Thus $\mathsf{Target}_{\le N}$ is finite and closed under resolved references, and its recorded induced graph suffices for every reachability test in the stack-defect computation. If $\mathfrak D$ contains no verdict reference $\ulcorner\psi,I_n\urcorner$ for some logged $(\psi,\chi)$, adjoin one with a fresh identifier. No record of $\mathfrak D$ names it, so no reachability test, classifier verdict or claim log of $\mathfrak D$ changes, and $\mathfrak D$ stays admissible.

Let the finite stack-audit defect be the finite typed union

$$
\delta_{\le N}^{\mathrm{stack}}\;=\;\delta_{\mathrm{instr}}\,\cup\,\delta_{\mathrm{bridge}}\,\cup\,\delta_{\mathrm{visibility}}\,\cup\,\delta_{\mathrm{source}}\,\cup\,\delta_{\mathrm{audit}}\,\cup\,\delta_{\mathrm{circular}}\,\cup\,\delta_{\mathrm{nonclaim}}\,\cup\,\delta_{\mathrm{status}},
$$

where, writing $(\psi,\chi)\in\mathsf{ClaimLog}(I_n)$ for a claim record with its recorded verdict and $\delta_6^{\mathrm{audit}}(\psi)$ for the audit defect of its audit record (Subsubsection 5.3.6),

$$
\begin{aligned}
\delta_{\mathrm{instr}}&=\{\,I_n:\neg\mathsf{AdmInstrument}(I_n)\,\},\\
\delta_{\mathrm{bridge}}&=\{\,B^{\mathrm{audit}}_{n\to n+1}:\neg\mathsf{AdmRotAuditBridge}(B^{\mathrm{audit}}_{n\to n+1})\,\},\\
\delta_{\mathrm{visibility}}&=\{\,(n,\psi):\delta_{\mathrm{vis}}(I_n,\psi,\mathcal L_\psi)\neq\varnothing\text{ and }\chi=\texttt{accepted}\,\},\\
\delta_{\mathrm{source}}&=\{\,(n,\psi):\texttt{source\_failure}\in\delta_6^{\mathrm{audit}}(\psi)\text{ and }\chi=\texttt{accepted}\,\},\\
\delta_{\mathrm{audit}}&=\{\,(n,\psi):\delta_6^{\mathrm{audit}}(\psi)\cap\{\texttt{missing\_audit},\texttt{failed\_audit},\texttt{visibility\_failure},\\
&\qquad\qquad\texttt{threshold\_failure},\texttt{circular\_audit}\}\neq\varnothing\text{ and }\chi=\texttt{accepted}\,\},\\
\delta_{\mathrm{nonclaim}}&=\{\,(n,\psi):\texttt{nonclaim\_failure}\in\delta_6^{\mathrm{audit}}(\psi)\text{ and }\chi=\texttt{accepted}\,\},\\
\delta_{\mathrm{circular}}&=\{\,(n,\psi):\ulcorner\psi,I_n\urcorner\text{ is reachable from }\mathsf{Use}(\psi)\text{ and }\chi=\texttt{accepted}\,\},\\
\delta_{\mathrm{status}}&=\{\,(n,\psi):\chi\text{ differs from the value the claim classifier of }I_n\\
&\qquad\qquad\text{assigns to }\psi\text{ under }\Gamma_\psi;\mathcal T_\psi;I_n\,\},
\end{aligned}
$$

with $n$ ranging over $0,\ldots,N$ and $(\psi,\chi)$ over $\mathsf{ClaimLog}(I_n)$. If $\psi$ is not well formed (Subsubsection 11.1.2), the classifier value is "no status", and $(n,\psi)\in\delta_{\mathrm{status}}$ for every recorded $\chi$. Each is a finite set computed from the finite target under the computability hypothesis of Theorem 25. The five summands that concern claims record an accepted claim that carries a defect, so a claim that an instrument correctly declined to accept makes the stack defect nonempty only through $\delta_{\mathrm{status}}$, if its recorded verdict is wrong. Since the chain and its bridges are admissible by hypothesis, $\delta_{\mathrm{instr}}=\delta_{\mathrm{bridge}}=\varnothing$. Under these hypotheses compliance is decided by $\delta_{\mathrm{status}}$ alone (clause 2 of Theorem 25). The five claim-level summands record sufficient record-level reasons why a logged acceptance is wrong; their conditions may coexist with rejection, audited absence or partial evidence. Every wrong non-acceptance appears only in $\delta_{\mathrm{status}}$. A wrong acceptance appears only there exactly when none of the five claim-level defect conditions holds.

If $\mathsf{Lev}$ contains a level above $\max_{n\le N}\mathsf{Level}(I_n)$, as Theorem 25 assumes, let $\ell^\star$ be such a level; the claims below are defined with it.

Fix a fresh identifier $\mathrm{id}^\star$ for the extension instrument; below, a verdict reference under $I^{\mathrm{stack}}_{N+1}$ means one carrying $\mathrm{id}^\star$, and the instrument itself is constructed in the proof.

*Reading guide.* The statement of Theorem 25 needs only the display defining $\delta^{\mathrm{stack}}_{\le N}$ and $\delta_{\mathrm{status}}$ and the bullets Report, Compliance, Stack audit, Audit package, Common fields of the three claims (which defines $\mathrm{src}_{\le N}$), Lifted soundness claims and Self-soundness; the other bullets fix the bookkeeping (use-set closure, sources, separate audits) used by the proof's row-by-row verification and may be skipped on a first reading.

Where the descriptions below identify a use-set with lower-stack records and the snapshot source, they specify its data portion. The full use-set additionally contains all statement, source, threshold and audit references required by Subsubsection 3.2.1; in particular, $\mathsf{Refs}(\mathrm{Audit})$ contains $A_{\mathrm{Audit}}$. Include these additional records in the reference-closed support family of Separate audits and in the extension instrument's scope and visible set. All classifier checks apply to the full use-set.

- **Report.** The claim $\mathrm{Report}_{\Phi_{\le N}}(\mathbb I_{\le N})$ is the claim record with claim-type tag $\texttt{stack\_report}$ whose statement lists the value of each component defect of $\delta_{\le N}^{\mathrm{stack}}$ on $\mathsf{Target}_{\le N}$, and whose use-set consists of $\mathsf{Target}_{\le N}\cup\{s_{\le N}\}$ and the records referenced by the claim's threshold and audit fields (Subsubsection 3.2.1), where $s_{\le N}$ denotes the source record $\mathrm{src}_{\le N}$ below; the eight summands are computed from the records of $\mathsf{Target}_{\le N}$ alone (they read the lower instruments $I_n$ only through their records there) and do not depend on the extension instrument.
- **Compliance.** The claim $\mathrm{Compliant}_{\Phi_{\le N}}(\mathbb I_{\le N})$ has claim-type tag $\texttt{stack\_compliance}$, the same use-set, and states $\delta_{\le N}^{\mathrm{stack}}=\varnothing$.
- **Stack audit.** The claim $\mathrm{Audit}(\mathbb I_{\le N})$ has claim-type tag $\texttt{stack\_audit}$ and the same use-set. Where $\mathrm{Report}$ asserts the values of the eight component defects, $\mathrm{Audit}$ asserts how they were obtained: its own audit record $A_{\mathrm{Audit}}$ records a value for each component defect of $\delta^{\mathrm{stack}}_{\le N}$ on $\mathsf{Target}_{\le N}$, each computed by a rule named in the $\mathsf{CheckRules}$ field of $A_{\mathrm{Audit}}$, whatever that value is.
- **Audit package.** Let $\mathcal T_{\le N}^{\mathrm{audit}}$ be an admissible finite identity-lens package on $Z=\mathsf{Target}_{\le N}$, hosted on $\mathsf H_{\mathrm{instr}}$, with its source, package-audit and nonclaim records as required by Subsubsection 3.3.3.
- **Common fields of the three claims.** Each targets $\mathcal T_{\le N}^{\mathrm{audit}}$, has host tag $\mathsf H_{\mathrm{instr}}$ and has level profile $(\ell^\star,\ell^\star)$, with the stack bridge recorded as a $\texttt{reflection}$ level bridge in its $\mathsf{LevelProfile}$, since its use-set consists of lower-level records and $s_{\le N}$. Its evidence references are the single source record $\mathrm{src}_{\le N}=(\mathrm{id},\texttt{committed\_state},\text{the finite snapshot of }\mathsf{Target}_{\le N},\text{valid})$, which is also the source record of $\mathcal T_{\le N}^{\mathrm{audit}}$. Its trace holds the snapshot as data together with one passing audit of $\mathrm{src}_{\le N}$ itself, so $\mathrm{src}_{\le N}$ is not dirty whatever the lower-stack audits contain (Subsubsection 5.3.6); lower-stack source records enter only the use-set, as audited data. Its thresholds are $\Theta_{\mathrm{rot}}$ and the $\Theta_{\mathrm{pass}}$ check of the threshold policy below (every component defect is computed by its named rule), and its visibility record marks its use-set visible.
- **Separate audits.** Give each claim $\psi$ its own audit record $A_\psi$ (here $\psi$ ranges over the new claims Report, Compliant, Audit and $\mathrm{Sound}^{\uparrow}_n$, never over the logged claims of $\mathsf{ClaimLog}(I_n)$, whose audits are unchanged), with $\mathsf{ClaimRef}=\psi$ and the bridge audit $A_{\le N\to N+1}$ among its evidence references. These audits check that the reported computation and the check-rule verdict (rejection or not, computed from $\delta^{\mathrm{stack}}_{\le N}$ alone) are correct; they do not evaluate the claim classifier on $\psi$; the audit of $\mathrm{Compliant}$ passes even when its correctly computed verdict is rejection. The bridge audit $A_{\le N\to N+1}$ takes its $\mathsf{EvidenceRefs}$ from $\mathsf{Target}_{\le N}\cup\{\mathrm{src}_{\le N}\}$ and has $\mathsf{SourceRefs}=\{\mathrm{src}_{\le N}\}$; lower-stack source records are evidence data, never source references of a new audit. The new records of $\mathfrak D^{+}$ (the snapshot $\mathrm{src}_{\le N}$ and its trace, the audit package $\mathcal T^{\mathrm{audit}}_{\le N}$ and its package audits, the stack bridge and its audit, the instrument $I^{\mathrm{stack}}_{N+1}$, its thresholds, the separate audits and the stack claims) are constructed so that, together with $\mathsf{Target}_{\le N}$, they form a reference-closed support family containing no verdict reference under $I^{\mathrm{stack}}_{N+1}$; the candidate $\mathrm{Sound}(I^{\mathrm{stack}}_{N+1})$ and its self-verdict reference lie outside this family and are named by none of its records. All references of the original records are unchanged. Consequently no verdict reference under $I^{\mathrm{stack}}_{N+1}$ is reachable from the evidence or source references of any audit $A_\psi$.
- **Lifted soundness claims.** For each $n\le N$, let $\mathrm{Sound}^{\uparrow}_n$ be a separate claim record under $\mathcal T_{\le N}^{\mathrm{audit}}$. It has claim type $\texttt{soundness}$, asserts that every verdict in $\mathsf{ClaimLog}(I_n)$ agrees with $I_n$'s claim classifier, and has $\mathsf{Refs}(\mathrm{Sound}^{\uparrow}_n)=\displaystyle\bigcup_{(\psi,\chi)\in\mathsf{ClaimLog}(I_n)}\{\ulcorner\psi,I_n\urcorner,\psi,\Gamma_\psi,\mathcal T_\psi\}\cup\{I_n,\mathsf{ClaimLog}(I_n),s_{\le N}\}\subseteq\mathsf{Target}_{\le N}\cup\{s_{\le N}\}$, so that its use-set (Subsubsection 3.2.1) is this set together with the source, threshold and audit records required in every claim use-set. Here $\Gamma_\psi$ is the single context record of the log entry (Subsubsection 11.5.1), whose reference fields name the context's members; these are reachable from, but not members of, $\mathsf{Use}(\mathrm{Sound}^{\uparrow}_n)$, so its only verdict references are the $\ulcorner\psi,I_n\urcorner$. Give it the host tag $\mathsf H_{\mathrm{instr}}$, the level profile $(\ell^\star,\ell^\star)$ with its upper-level reflection bridge, source, evidence, visibility, threshold, nonclaim and separate audit fields specified above for the three stack claims; its audit checks the computation even when the claim is rejected. Each separate audit $A_\psi$ has $\mathsf{SourceRefs}=\{\mathrm{src}_{\le N}\}$, and its evidence references include the bridge audit; the source trace records the snapshot and its package audit. The extension instrument asserted by Theorem 25 is required to have $s_{\le N}$ in its scope and visible set and to admit $\mathrm{src}_{\le N}$ under its source and evidence policies; the proof constructs one. No record reachable from this source or from the lower-stack part of a use-set is a verdict reference for a new stack claim, since the stack claims have fresh identifiers. Set $\mathsf{partialEvidence}=\mathrm{false}$ on Report, Compliant, Audit and every lifted soundness claim.
- **Self-soundness.** The claim $\mathrm{Sound}(I)$ is the complete self-soundness claim of Subsubsection 11.5.1.

\begin{claimtheorem}{Theorem 25 (FiniteRotatingAudit)}
Let $N\ge0$, and let $\mathsf{Target}_{\le N}$, $\delta^{\mathrm{stack}}_{\le N}$, $\delta_{\mathrm{status}}$, $\mathrm{src}_{\le N}$, $\mathcal T^{\mathrm{audit}}_{\le N}$ and the claims $\mathrm{Report}$, $\mathrm{Compliant}$, $\mathrm{Audit}$, $\mathrm{Sound}^{\uparrow}_n$ be as in the Setting above (in particular $\delta_{\mathrm{status}}$ is the set of $(n,\psi)$, $(\psi,\chi)\in\mathsf{ClaimLog}(I_n)$, whose recorded verdict $\chi$ differs from the status $I_n$'s claim classifier assigns $\psi$ under its recorded context, and $\mathrm{Sound}^{\uparrow}_n$ asserts that $\delta_{\mathrm{status}}$ has no entry with index $n$). Suppose that $\mathsf{Lev}$ contains a level above $\max_{0\le n\le N}\mathsf{Level}(I_n)$ in the order of Subsubsection 2.2.3, and let $\ell^{\star}$ be the level fixed above. Suppose also that every threshold evaluation reachable in the evaluation dependency graph of Subsubsection 5.3.6 from the computation of any of the eight summands of $\delta^{\mathrm{stack}}_{\le N}$, including logged-claim classification, audit-defect computation and bridge admissibility checks, is computed by a program of the rule language $\mathcal R$ of Subsubsection 3.4.1 (as for the exact tests on finite tables used in Theorem 5(e)). (The levels of the chain strictly increase, so the hypothesis that $\mathsf{Lev}$ contains a level above the chain requires $N\le|\mathsf{Lev}|-2$, that is $N\le1$ for the three levels of Subsubsection 2.2.3. The proof uses only that $\ell^\star$ lies above every level of the chain; it applies verbatim when $\mathsf{Lev}$ is replaced by any finite linear order of levels, where the stack may contain up to $|\mathsf{Lev}|-1$ instruments.) Then, in an admissible extension $\mathfrak D^{+}$ of the instance, there exists an extension instrument

$$
I_{N+1}^{\mathrm{stack}},
$$

whose scope and visible set contain $\mathsf{Target}_{\le N}\cup\{s_{\le N}\}$ and whose source and evidence policies admit $\mathrm{src}_{\le N}$, and an admissible audit bridge

$$
B^{\mathrm{audit}}_{\le N\to N+1}
$$

with $\mathsf{Level}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)=\ell^{\star}>\max_{0\le n\le N}\mathsf{Level}(I_n)$ and target scope $\Phi_{\le N}=\mathsf{Target}_{\le N}$ such that the following hold:

1. (Report acceptance.) The claim listing the computed values of the eight component defects is accepted:
$$
\Gamma\,;\;\mathcal T_{\le N}^{\mathrm{audit}}\,;\;I_{N+1}^{\mathrm{stack}}\;\vdash\;\mathrm{Report}_{\Phi_{\le N}}(\mathbb I_{\le N})\;:\;\texttt{accepted}.
$$
2. (Compliance characterization.)
$$
\Gamma\,;\;\mathcal T_{\le N}^{\mathrm{audit}}\,;\;I_{N+1}^{\mathrm{stack}}\;\vdash\;\mathrm{Compliant}_{\Phi_{\le N}}(\mathbb I_{\le N})\;:\;\texttt{accepted}\quad\Longleftrightarrow\quad\delta_{\le N}^{\mathrm{stack}}=\varnothing\quad\Longleftrightarrow\quad\delta_{\mathrm{status}}=\varnothing.
$$
3. (Non-finality.) In $\mathfrak D^+$,
$$
\Gamma\,;\;\mathcal T_{\le N}^{\mathrm{audit}}\,;\;I_{N+1}^{\mathrm{stack}}\;\vdash\;\mathrm{Audit}(\mathbb I_{\le N})\;:\;\texttt{accepted},
$$
while $\mathrm{Sound}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)$ does not receive $\texttt{accepted}$ under $I_{N+1}^{\mathrm{stack}}$; in particular the acceptance of $\mathrm{Audit}(\mathbb I_{\le N})$ does not imply that of $\mathrm{Sound}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)$.
4. (Soundness of lower instruments.) $\texttt{soundness}\in\mathsf{ClaimTypes}(I_{N+1}^{\mathrm{stack}})$, and for each $n\le N$, the lifted claim $\mathrm{Sound}^{\uparrow}_n$ (that every verdict recorded in $\mathsf{ClaimLog}(I_n)$ equals the status $I_n$'s claim classifier assigns under the recorded context) satisfies
$$
\Gamma\,;\;\mathcal T_{\le N}^{\mathrm{audit}}\,;\;I_{N+1}^{\mathrm{stack}}\;\vdash\;\mathrm{Sound}^{\uparrow}_n\;:\;\texttt{accepted}\quad\Longleftrightarrow\quad\delta_{\mathrm{status}}\ \text{has no entry with index}\ n.
$$

Consequently, by clause 2, $\mathrm{Compliant}_{\Phi_{\le N}}(\mathbb I_{\le N})$ is $\texttt{accepted}$ if and only if $\mathrm{Sound}^{\uparrow}_n$ is $\texttt{accepted}$ for every $n\le N$.

\end{claimtheorem}

\begin{proof}
The proof constructs the extension instrument, verifies the audit bridge is admissible, and reads off the four clauses from the rotating-audit acceptance condition and the rotating-audit non-finality statement.

*Construction of $I_{N+1}^{\mathrm{stack}}$.* Define $I_{N+1}^{\mathrm{stack}}$ as a finite instrument record in the form of Subsubsection 11.1.1, with components fixed as follows:

- $\mathsf{ProvisionalTypes}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)=\varnothing$;
- $\mathsf{Scope}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)\supseteq\mathsf{Target}_{\le N}$, including the verdict references $\ulcorner\psi,I_n\urcorner$ of the claim logs, the full record $\mathrm{src}_{\le N}$ and every record referenced by the stack claims' threshold and audit fields, with $\mathsf{Hosts}(I_{N+1}^{\mathrm{stack}})\ni\mathsf H_{\mathrm{instr}}$ and $\mathsf{Levels}(I_{N+1}^{\mathrm{stack}})\ni\ell^\star$;
- $\mathsf{ClaimTypes}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)\supseteq\{\,\texttt{stack\_report},\;\texttt{stack\_compliance},\;\texttt{stack\_audit},\;\texttt{soundness}\,\}$;
- $\mathsf{Visible}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)$ contains $\mathsf{Target}_{\le N}$, the full record $\mathrm{src}_{\le N}$ and every record referenced by the stack claims' threshold and audit fields, and $\mathsf{Suppressed}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)\cap\mathsf{Target}_{\le N}=\varnothing$, so every record of the audit target is visible to the extension instrument and none of the three claims requires a visibility bridge of Subsubsection 3.5.3;
- $\mathsf{EvidencePolicy}$ admits the finite lower-stack records as audit evidence; $\mathsf{SourcePolicy}$ contains $(\texttt{committed\_state},\texttt{full},\lambda)$ for every profile $\lambda$ of $\mathfrak D^{+}$, including $\lambda_{\mathrm{rot}}$, and for its default entry, so it admits $\mathrm{src}_{\le N}$, while the recorded provenance of the lower stack is data to be checked, without requiring the lower stack to be compliant; and $\mathsf{BridgePolicy}$ admits the declared upward rotating-audit bridge and its level shift, with $\mathsf{Strength}=\{\texttt{weak}\}$, every admitted (bridge type, regime) pair, among them $(\texttt{reflection},\texttt{audit})$, and every claim type sent to $\texttt{weak}$; $\mathsf{EvidencePolicy}$ also admits $\texttt{committed\_state}$ as direct evidence;
- Set the extension instrument's mode for the rotating-audit-bridge family to $\texttt{rotating-audit}$ and include $(\texttt{fine},\texttt{audit},\texttt{global},\mathsf H_{\mathrm{instr}})$ in its compatibility relation; its bridge policy admits $\texttt{reflection}$.
- $\mathsf{CheckRules}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)$ contains the finite rules that compute each of $\delta_{\mathrm{instr}}$, $\delta_{\mathrm{bridge}}$, $\delta_{\mathrm{visibility}}$, $\delta_{\mathrm{source}}$, $\delta_{\mathrm{audit}}$, $\delta_{\mathrm{circular}}$, $\delta_{\mathrm{nonclaim}}$, $\delta_{\mathrm{status}}$ on the finite records of $\mathsf{Target}_{\le N}$, and a rule for $\mathrm{Compliant}_{\Phi_{\le N}}(\mathbb I_{\le N})$ that returns the rejection verdict exactly when the computed $\delta_{\le N}^{\mathrm{stack}}$ is non-empty, and rules for $\mathrm{Report}_{\Phi_{\le N}}(\mathbb I_{\le N})$ and $\mathrm{Audit}(\mathbb I_{\le N})$ that return the rejection verdict exactly when a listed value differs from the computed one or a component defect is not computed; and a rule for $\mathrm{Sound}^{\uparrow}_n$ that returns the rejection verdict exactly when $\delta_{\mathrm{status}}$ has an entry with index $n$;
- $\mathsf{ThresholdPolicy}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)$ applies the source instruments' per-component thresholds when computing the reported lower-stack defects. For the $\mathrm{Report}$, $\mathrm{Compliant}$, and $\mathrm{Audit}$ claims themselves it requires $\Theta_{\mathrm{pass}}$ on the recorded Boolean that every component defect of $\delta^{\mathrm{stack}}_{\le N}$ is computed on $\mathsf{Target}_{\le N}$ by its named rule, and the bridge threshold $\Theta_{\mathrm{rot}}$, the instance of $\Theta_{\in S}$ with $S=\{\texttt{audit\_passes}\}$, on $\delta_{\mathrm{rot}}$. A correctly reported failure of a lower threshold does not fail any of these claims' own threshold check;
- $\mathsf{AuditPolicy}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)$ contains the audit rules for the bridge $B^{\mathrm{audit}}_{\le N\to N+1}$;
- $\mathsf{Level}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)=\ell^{\star}$, which exceeds $\max_{0\le n\le N}\mathsf{Level}(I_n)$ by hypothesis;
- $\mathcal N\bigl(I_{N+1}^{\mathrm{stack}}\bigr)$ contains $\mathrm{NC}\text{-}16$, $\mathrm{NC}\text{-}17$, and $\mathrm{NC}\text{-}18$.

Each component is finite and of the schema of Subsubsection 3.4.1: $\mathsf{Target}_{\le N}$ is a finite union of finite records, the check rules, thresholds, audit rules and nonclaim register are finite, $\ell^\star\in\mathsf{Lev}$ and $\mathsf H_{\mathrm{instr}}\in\mathsf{Host}$. Each listed rule is an $\mathcal R$-program, by the computability hypothesis: the rules for $\delta_{\mathrm{status}}$ and $\delta_{\mathrm{instr}}$ call the finitely many programs of $\mathsf{CheckRules}(I_n)$, $n\le N$, copied into $\mathsf{CheckRules}(I_{N+1}^{\mathrm{stack}})$, and otherwise use table lookups, comparisons and iteration over the finite target. Include every rule replayed by an audit judged under $I_{N+1}^{\mathrm{stack}}$ in its $\mathsf{CheckRules}$, give each such audit rules from that family, and put the audit records $A_\psi$ and $A_{\le N\to N+1}$ in its scope and visible set. Thus $\mathsf{AdmInstrument}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)$ holds.

*The extended instance.* Every new record of $\mathfrak D^{+}$ below carries host tag $\mathsf H_{\mathrm{instr}}$ and level tag $\ell^\star$, which lie in $\mathsf{Hosts}$ and $\mathsf{Levels}$ of $I^{\mathrm{stack}}_{N+1}$, so $\mathsf{Eval}$ finds the data of $\Theta_{\mathrm{rot}}$ and $\Theta_{\mathrm{pass}}$ in scope. Let $\mathfrak D^{+}$ extend $\mathfrak D$, with fresh identifiers, by $I_{N+1}^{\mathrm{stack}}$, $B^{\mathrm{audit}}_{\le N\to N+1}$, $\mathcal T^{\mathrm{audit}}_{\le N}$ and the claim records $\mathrm{Report}$, $\mathrm{Compliant}$, $\mathrm{Audit}$ and $\mathrm{Sound}^{\uparrow}_n$, a declared log $\mathsf{ClaimLog}(I_{N+1}^{\mathrm{stack}})$ (any finite set of claims of $\mathfrak D^{+}$ with recorded verdicts, for instance the stack claims with the verdicts of clauses 1–4), with the verdict references of its entries, none named by a record of the support family, and the candidate $\mathrm{Sound}(I_{N+1}^{\mathrm{stack}})$ with its self-verdict reference, with their typed audit and source records, which lie outside the scope of every instrument $I$ of $\mathfrak D$, so $\mathsf{vis}_I$ is $\texttt{outside}$ on them with $I$ unchanged, and choosing $\mathsf{vis}_{I_{N+1}^{\mathrm{stack}}}$ on the records of $\mathfrak D$ outside $\mathsf{Target}_{\le N}$. No record of $\mathsf{Target}_{\le N}$ changes class and no $\mathsf{ClaimLog}(I_n)$ changes, so $\delta^{\mathrm{stack}}_{\le N}$ is unchanged. No evaluation of $\mathfrak D$ queries a new record, and each new evaluation queries only evaluations of $\mathfrak D$ (through the classifiers of the $I_n$), of $\mathrm{src}_{\le N}$, or of the stack bridge and its audit; so the evaluation dependency graph of $\mathfrak D^{+}$ is acyclic and $\mathfrak D^{+}$ is admissible, and clauses 1–4 are judgments of $\mathfrak D^{+}$.

*Construction of the audit bridge.* Define $B^{\mathrm{audit}}_{\le N\to N+1}$ to be the stack rotating-audit bridge of Subsubsection 11.7.2 with target scope $\Phi_{\le N}=\mathsf{Target}_{\le N}$, language map $L$ that translates every record in $\Phi_{\le N}$, including instrument records, bridge records, and claim-log records, into well-typed claims of $I_{N+1}^{\mathrm{stack}}$, visibility map $V$ exposing each record in $\Phi_{\le N}$ either directly or through visibility bridges, audit thresholds $\Theta$ that use the lower component thresholds to compute reported defects, while testing the bridge itself for complete, correct reporting and $\delta_{\mathrm{rot}}=\texttt{audit\_passes}$, audit record $A$ that records the finite checks above are auditable in $I_{N+1}^{\mathrm{stack}}$, a bridge defect record with $\delta_{\mathrm{rot}}=\texttt{audit\_passes}$, and a nonclaim register containing $\mathrm{NC}\text{-}16$, $\mathrm{NC}\text{-}17$, and $\mathrm{NC}\text{-}18$. The bridge defect is $\texttt{audit\_passes}$ because the check rules of $I_{N+1}^{\mathrm{stack}}$ are the deterministic computations of the eight summands on the finite target, so the reported values are the computed ones; the computed $\delta_{\le N}^{\mathrm{stack}}$ is stored separately as the report's result. Record $L$ as a finite table mapping each $r\in\Phi_{\le N}$ to a well-formed $\texttt{stack\_report}$ claim reporting its recomputed audit data, with all statement identifiers in $\mathsf{Refs}$. Include these claims and their separate audits in the reference-closed support family, scope and visible set. Register every bridge threshold in $\mathsf{ThresholdPolicy}_{I_{N+1}^{\mathrm{stack}}}$. Set the bridge audit's $\mathsf{ClaimRef}$ to the bridge and draw its rules from $\mathsf{CheckRules}_{I_{N+1}^{\mathrm{stack}}}$.

*Admissibility of the bridge.* Each clause of $\mathsf{AdmRotAuditBridge}\bigl(B^{\mathrm{audit}}_{\le N\to N+1}\bigr)$ of Subsubsection 11.7.3 is verified on the finite records: clause (1) follows from instrument admissibility and the reflection, mode and compatibility entries just specified; clause (2) is the strict level inequality fixed by construction; clause (3) is the finite declaration of $\Phi_{\le N}$; clause (4) is satisfied because $I_{N+1}^{\mathrm{stack}}$'s scope contains $\mathsf{Target}_{\le N}$; clause (5) is the language map; clauses (6)–(9) are the visibility, threshold, audit, and defect-typing requirements built into the construction; clause (10) holds because $\Phi_{\le N}$ lies in the reference-closed support family of the separate audits, which contains no verdict reference under the fresh extension instrument; clause (11) is the nonclaim presence. Hence the bridge is admissible.

*Clause 1 (Report acceptance).* We go through the rows of the claim classifier of Subsubsection 5.6.6 for the report claim. The row $\texttt{outside\_scope}$ does not apply: its tag $\texttt{stack\_report}$ is in $\mathsf{ClaimTypes}(I_{N+1}^{\mathrm{stack}})$, its host tag $\mathsf H_{\mathrm{instr}}$ and level tag $\ell^\star$ are in $\mathsf{Hosts}$ and $\mathsf{Levels}$ of $I_{N+1}^{\mathrm{stack}}$, and its full use-set is contained in the scope. The row $\texttt{blocked}$ does not apply: every record of the use-set is visible, so $\delta_{\mathrm{overread}}=\delta_{\mathrm{unknown}}=\varnothing$ and no bridge is required, so $\delta_{\mathrm{weakbridge}}=\varnothing$; the check rules read the records of $\mathsf{Target}_{\le N}$ in the use-set, which have the types the rules read; and the source check passes because the evidence is the single source record $\mathrm{src}_{\le N}$, whose type $\texttt{committed\_state}$ is admitted by $\mathsf{SourcePolicy}(I_{N+1}^{\mathrm{stack}})$ and $\mathsf{EvidencePolicy}(I_{N+1}^{\mathrm{stack}})$, whatever the source records of the lower stack contain. The row $\texttt{absent\_with\_record}$ does not apply, since every record of the use-set is present in the reference-closed support family. The claim's audit record is $A_{\mathrm{Report}}$: its source references resolve to the admissible source records, its visibility check passes because every record named by its $\mathsf{EvidenceRefs}$ and $\mathsf{SourceRefs}$ (among them $A_{\le N\to N+1}$ and $\mathrm{src}_{\le N}$) lies in the reference-closed support family, which is in the visible set of $I^{\mathrm{stack}}_{N+1}$ (Subsubsection 4.9.2), its circularity check passes by the reference-closed support construction in *Separate audits*, since no verdict reference under $I^{\mathrm{stack}}_{N+1}$ is reachable from its evidence or source references, its threshold check passes because the data of $\Theta_{\mathrm{rot}}$ and $\Theta_{\mathrm{pass}}$ lie on in-scope new records and the reported values are the computed ones, its nonclaims are present, and its check results pass. By Subsubsection 5.3.6 its audit defect is empty, that is $\texttt{audit\_passes}$. So the row $\texttt{failed\_audit}$ does not apply; the row $\texttt{undefined\_circular}$ does not apply, since the audit defect is empty, the use-set lies in the reference-closed support family of *Separate audits*, which contains no verdict reference under $I_{N+1}^{\mathrm{stack}}$, so none is reachable from it, and the claim type is not $\texttt{soundness}$; and the row $\texttt{below\_threshold}$ does not apply, since the audit defect is empty. The row $\texttt{rejected}$ does not apply, since the statement lists exactly the computed values, so the check rule does not reject. The row $\texttt{provisional}$ does not apply, since the evidence is complete. Hence the $\texttt{accepted}$ row holds:

$$
\Gamma\,;\;\mathcal T_{\le N}^{\mathrm{audit}}\,;\;I_{N+1}^{\mathrm{stack}}\;\vdash\;\mathrm{Report}_{\Phi_{\le N}}(\mathbb I_{\le N})\;:\;\texttt{accepted}.
$$

The report claim records the value of $\delta_{\le N}^{\mathrm{stack}}$ together with the per-component defect values; it is accepted whether or not $\delta_{\le N}^{\mathrm{stack}}$ is empty. The same row-by-row argument applies verbatim to $\mathrm{Audit}(\mathbb I_{\le N})$, whose statement holds by construction of the check rules, so $\mathrm{Audit}(\mathbb I_{\le N})$ is $\texttt{accepted}$ under $I_{N+1}^{\mathrm{stack}}$ as well.

*Clause 2 (Compliance characterization).* The compliance claim $\mathrm{Compliant}_{\Phi_{\le N}}(\mathbb I_{\le N})$ is in the claim types and scope of $I_{N+1}^{\mathrm{stack}}$, its full use-set is visible through the bridge, its records are present, and its audit and threshold policies pass on the finite records, as for the report claim in clause 1. Its use-set lies in the reference-closed support family, which contains no verdict reference under $I_{N+1}^{\mathrm{stack}}$, so none is reachable from it; its type is not $\texttt{soundness}$ and its audit defect is empty, so the $\texttt{undefined\_circular}$ row of Subsubsection 5.6.5 does not apply. So the rows above $\texttt{rejected}$ do not apply, and the verdict is decided by the $\texttt{rejected}$ row, whose condition is the rejection verdict of the check rules. By construction that rule rejects exactly when $\delta_{\le N}^{\mathrm{stack}}\neq\varnothing$. If $\delta_{\le N}^{\mathrm{stack}}\neq\varnothing$, the claim is therefore $\texttt{rejected}$; if $\delta_{\le N}^{\mathrm{stack}}=\varnothing$, neither $\texttt{rejected}$ nor $\texttt{provisional}$ applies (the evidence is complete), and the $\texttt{accepted}$ row holds. Hence the equivalence

$$
\Gamma\,;\;\mathcal T_{\le N}^{\mathrm{audit}}\,;\;I_{N+1}^{\mathrm{stack}}\;\vdash\;\mathrm{Compliant}_{\Phi_{\le N}}(\mathbb I_{\le N})\;:\;\texttt{accepted}\quad\Longleftrightarrow\quad\delta_{\le N}^{\mathrm{stack}}=\varnothing.
$$

For the second equivalence, $\delta_{\mathrm{instr}}=\delta_{\mathrm{bridge}}=\varnothing$ by hypothesis, and $\delta_{\mathrm{status}}\subseteq\delta_{\le N}^{\mathrm{stack}}$. Each entry $(n,\psi,\ldots)$ of the five remaining claim-level summands ($\delta_{\mathrm{visibility}}$, $\delta_{\mathrm{source}}$, $\delta_{\mathrm{audit}}$, $\delta_{\mathrm{nonclaim}}$, $\delta_{\mathrm{circular}}$) has recorded verdict $\chi=\texttt{accepted}$ and a record condition under which the claim classifier of Subsubsection 5.6.5 does not return $\texttt{accepted}$: a nonempty visibility defect or a source or visibility failure gives the $\texttt{blocked}$ row, or, for $\delta_{\mathrm{outside}}$, the $\texttt{outside\_scope}$ row, a missing, failed or nonclaim audit gives $\texttt{failed\_audit}$, a circular audit or a self-reference gives $\texttt{undefined\_circular}$, and a threshold failure gives $\texttt{below\_threshold}$ unless an earlier row applies. So $(n,\psi)\in\delta_{\mathrm{status}}$, and $\delta_{\le N}^{\mathrm{stack}}=\varnothing$ exactly when $\delta_{\mathrm{status}}=\varnothing$.

*Clause 3 (Non-finality).* By Theorem 24 of Subsection 11.5, the same-level self-soundness claim $\mathrm{Sound}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)$ does not receive verdict $\texttt{accepted}$ under $I_{N+1}^{\mathrm{stack}}$ in the absence of an admissible level shift to a strictly higher instrument. The rotating-audit acceptance of $\mathrm{Audit}(\mathbb I_{\le N})$ concerns the lower stack; it is not an audit of $I_{N+1}^{\mathrm{stack}}$ by a still higher instrument, and so does not supply a level shift over $I_{N+1}^{\mathrm{stack}}$. By clause 1, $\mathrm{Audit}(\mathbb I_{\le N})$ is accepted, while by Theorem 24 $\mathrm{Sound}(I_{N+1}^{\mathrm{stack}})$ is not; this one instance refutes the implication. Hence

$$
\begin{aligned}
&\Gamma\,;\;\mathcal T_{\le N}^{\mathrm{audit}}\,;\;I_{N+1}^{\mathrm{stack}}\;\vdash\;\mathrm{Audit}(\mathbb I_{\le N})\;:\;\texttt{accepted}\\
&\quad\not\Longrightarrow\quad\Gamma\,;\;\mathcal T_{\le N}^{\mathrm{audit}}\,;\;I_{N+1}^{\mathrm{stack}}\;\vdash\;\mathrm{Sound}\bigl(I_{N+1}^{\mathrm{stack}}\bigr)\;:\;\texttt{accepted}.
\end{aligned}
$$

*Clause 4 (Soundness of lower instruments).* The lower-stack portion of the use-set of $\mathrm{Sound}^{\uparrow}_n$ consists of the recorded, visible lower-instrument verdict references and the claim records, contexts and packages of $\mathsf{ClaimLog}(I_n)$, all in $\mathsf{Target}_{\le N}$. The row-by-row argument of clause 1 applies: $\texttt{soundness}\in\mathsf{ClaimTypes}(I_{N+1}^{\mathrm{stack}})$, and the use-set, contained in the reference-closed support family, is in scope and visible; the separate audit of $\mathrm{Sound}^{\uparrow}_n$ has empty audit defect; and no threshold is violated, since correctly reported lower failures are report data. So the scope, visibility, absence, audit and threshold rows do not apply. Its use-set contains no verdict reference for $\mathrm{Sound}^{\uparrow}_n$ under $I_{N+1}^{\mathrm{stack}}$, and every verdict reference in it belongs to an $I_n$ with $\mathsf{Level}(I_n)<\mathsf{Level}(I_{N+1}^{\mathrm{stack}})$; hence none of the three conditions of the $\texttt{undefined\_circular}$ row applies (the audit defect is empty, as above). The check rule rejects exactly when $\delta_{\mathrm{status}}$ has an entry indexed by $n$; otherwise the complete claim reaches $\texttt{accepted}$.

This completes the proof.
\end{proof}

### 11.8.1 Nonfinality

Theorem 25 leaves the higher instrument $I_{N+1}^{\mathrm{stack}}$ uncertified by itself. To audit $I_{N+1}^{\mathrm{stack}}$, one treats

$$
\mathbb I_{\le N+1}\;=\;(I_0,\,I_1,\,\ldots,\,I_N,\,I_{N+1}^{\mathrm{stack}})
$$

as the next finite lower stack. This is possible only when $N=0$ and $\ell^\star=\mathsf{Ver}$: if $\mathsf{Level}(I_0)=\mathsf{Beh}$ and $\mathsf{Level}(I_1^{\mathrm{stack}})=\mathsf{Ver}$, then $(I_0,I_1^{\mathrm{stack}})$ with the stack bridge $B^{\mathrm{audit}}_{\le0\to1}$ of that proof as its bridge $B^{\mathrm{audit}}_{0\to1}$ (its scope $\mathsf{Target}_{\le0}$ contains $\mathsf{InstrRecord}(I_0)\cup\mathsf{ClaimLog}(I_0)$; clauses (1)–(11) were verified there) and the log of $I_1^{\mathrm{stack}}$ declared in $\mathfrak D^{+}$, is a chain with $N=1$, and Theorem 25 yields an instrument $I_2^{\mathrm{stack}}$ at level $\mathsf{Str}$. No further step exists, since $\mathsf{Lev}$ has no level above $\mathsf{Str}$, and that top instrument is not audited by any higher instrument. With the three levels of $\mathsf{Lev}$, a chain with strictly increasing levels has at most three instruments, and the hypothesis of Theorem 25 holds exactly for chains whose highest level is $\mathsf{Beh}$ or $\mathsf{Ver}$; such chains have $N\le1$. No tower has a final self-certifying top, because each instrument of the tower inherits Theorem 24's classifier routing for its own soundness claim. This is the rotating-audit non-finality clause $\mathrm{NC}\text{-}17$ of Subsection 15.2.

The instrument-family completeness claim, in the sense of an instrument that audits every higher level of itself, is therefore not within the scope of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$. Any positive soundness statement about an instrument $I_n$ requires an admissible level-shifted audit by a strictly higher instrument $I_{n+1}$ (Subsubsection 5.6.5); the rotating-audit bridge of Subsection 11.7 records such an audit; the framework records the chain, the bridge, the admissibility predicate, and the defect, and accepts $\mathrm{Compliant}_{\Phi_{\le N}}(\mathbb I_{\le N})$ iff $\delta_{\le N}^{\mathrm{stack}}=\varnothing$, but never accepts $\mathrm{Sound}(I_n)$ from the same instrument $I_n$ itself.

## 11.9 Instrument Transfer

This subsection records the instrument-transfer rule that governs whether a claim accepted under one instrument may be transported to another, and marks the corresponding full classifier as future work. The rule supports the exclusion of instrument-free acceptance in Subsubsection 2.4.3: $I\vdash\varphi$ does not imply $J\vdash\varphi$.

### 11.9.1 Transfer Rule

Let $I$ and $J$ be admissible instruments in the sense of Subsubsection 11.1.1. Suppose

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\varphi\;:\;\texttt{accepted}.
$$

Acceptance under $I$ does not, by itself, license any claim status under $J$: the default is

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\varphi\;:\;\texttt{accepted}\quad\not\Longrightarrow\quad\Gamma\,;\;\mathcal T\,;\;J\;\vdash\;\varphi\;:\;\texttt{accepted}.
$$

A non-default transfer requires an instrument-transfer bridge

$$
B_{I\to J}\;=\;(\,\mathrm{id}_B,\;I,\;J,\;\varphi,\;L_{I\to J},\;V_{I\to J},\;\Theta_{I\to J},\;A_{I\to J},\;\delta_{I\to J},\;\mathcal N_{I\to J},\;\lambda_{\mathrm{transfer}}\,),
$$

a directed bridge from $I$ to $J$ admitted by the surrounding bridge policies, with bridge type $\texttt{instrument-transfer}$ and components recording, respectively: the source claim, the language map that translates $\varphi$ into $J$'s claim language, the visibility map exposing the records that supported $\varphi$ under $I$ to $J$, the audit thresholds $J$ applies to the transfer, the audit record of the bridge, the transfer defect, the bridge nonclaim register, and the bridge profile. Admissibility of $B_{I\to J}$ for the source claim $\varphi$, written

$$
\mathsf{AdmInstrBridge}(B_{I\to J},\varphi),
$$

requires $I$ and $J$ admissible, $\varphi$ in the claim types of both instruments via $L_{I\to J}$, the supporting records visible to $J$ either directly or through visibility bridges of Subsubsection 3.5.3, audit thresholds declared, the bridge audited, no unstratified circular dependency between $\varphi$ in $I$ and the records that support its transfer to $J$, and the nonclaim register present.

The instrument-transfer rule is then

$$
\frac{\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\varphi\;:\;\texttt{accepted}\quad\quad\mathsf{AdmInstrBridge}(B_{I\to J},\varphi)}{\Gamma\,;\;\mathcal T\,;\;J\;\vdash\;B_{I\to J}(\varphi)\;:\;\chi},
$$

where $\chi\in\mathrm{ClaimStatus}$ is the value that $J$'s claim classifier (Subsubsection 5.6.5) assigns to the transferred claim record. Acceptance under $I$ thus enters the transfer as a premise; the verdict under $J$ is decided by $J$'s own classifier on the bridged claim, and $\texttt{accepted}$ requires $J$'s visibility, threshold, source and audit checks to pass on the bridged content. The rule preserves the exclusion of instrument-free acceptance in Subsubsection 2.4.3: the source acceptance and the bridge admissibility are the premises of the rule; they are not sufficient for $\texttt{accepted}$ under $J$, since $J$'s classifier decides the verdict on the bridged record.

### 11.9.2 Future-Work Boundary

A complete instrument-transfer classifier — one that fixes, for every admissible $B_{I\to J}$ and every claim type, the exact mapping from the source-side acceptance and the bridge defect record to the value $\chi\in\mathrm{ClaimStatus}$ on the target side — is not stated as a theorem of Foundations III. Subsubsection 11.9.1 fixes the rule schema and the admissibility predicate; the per-claim-type classifier and its associated soundness theorem (the analogue of Theorem 23 for transferred claims) are deferred. This is consistent with the scope nonclaims of Subsection 2.4 and with the deferred-claims register of Appendix H: the calculus accepts only what is supported by an admissible bridge and a passing classifier verdict, and does not commit to a closed-form transfer-completeness statement.

The framework's default position is therefore the negative one: $I\vdash\varphi$ does not imply $J\vdash\varphi$. Positive transfer is recorded only by an admissible instrument-transfer bridge whose verdict under $J$ is independently classified. Future-work strengthenings of Subsubsection 11.9.1 would supply the per-claim-type completeness theorem and the corresponding countermodel atlas; both are outside the scope of the present paper.
