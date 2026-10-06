# 10. Promotion and Stacking

This section gives the finite promotion-bridge theory in scoped form. Subsection 10.1 recalls the promotion-bridge object of Subsection 4.5 and adds the gate record. Subsection 10.2 specifies the gate semantics. Subsections 10.3, 10.4, and 10.5 prove the three promotion theorems: gate soundness, strict-implies-nonfactorization, and non-strict-implies-factorization. Subsection 10.6 proves Theorem 22, the admissibility of a small bridge that is then classified as strict. Subsection 10.7 lists what this paper does not prove about stacking.

## 10.1 Promotion Bridge Object

### 10.1.1 Bridge Data

A promotion bridge $B_{j\to j+1}$ from a source theory package $\mathcal T_j$ to a target theory package $\mathcal T_{j+1}$ is the finite typed record of Subsubsection 4.5.2, in its expanded form with identifier, carrier $S$, codomains $O_j,O_{j+1}$, object maps $\pi_j:S\to O_j$ and $\pi_{j+1}:S\to O_{j+1}$, level/lens/interface record $L$, visibility record $V$, threshold record $\Theta$, audit record $A$, defect record $\delta$, gate-results record $\mathsf{GateResults}(B)$, nonclaim record $\mathcal N$, host tag $h_B\in\mathsf{Host}$ and bridge profile $\lambda_{\mathrm{prom}}$. Every component is finite; the defect record $\delta$ collects the strictness, no-smuggling, stability, and descent defects of Subsection 5.4.

### 10.1.2 Strict Versus Non-Strict Promotion

A promotion bridge has **strict object maps** when

$$
\pi_{j+1}\;\not\factor\;\pi_j,
$$

equivalently when there exist $s,s'\in S$ with $\pi_j(s)=\pi_j(s')$ and $\pi_{j+1}(s)\neq\pi_{j+1}(s')$. A promotion bridge has **non-strict object maps** when $\pi_{j+1}$ factors through $\pi_j$, that is, when there exists a finite map $\phi:\mathrm{im}(\pi_j)\to O_{j+1}$ with $\pi_{j+1}=\phi\,\pi_j$. For any object maps $\pi_j,\pi_{j+1}$ on $S$, the factorization dichotomy is exhaustive: by Theorem 13 of Section 7, the factorization defect $\Delta_{\mathrm{fact}}(\pi_j,\pi_{j+1})$ is empty exactly when $\pi_{j+1}$ factors through $\pi_j$, and non-empty exactly when it does not. Strictness in this sense does not require $\pi_j$ to factor through $\pi_{j+1}$. When $\pi_j=r\circ\pi_{j+1}$ for some map $r$, strictness is equivalent to $\{(s,s'):\pi_{j+1}(s)=\pi_{j+1}(s')\}\subsetneq\{(s,s'):\pi_j(s)=\pi_j(s')\}$: the new object map strictly refines the old one. Theorem 22, $\mathsf{CM}_9$, and the two-point witness realization $W=\{x,x'\}$ in Model Theorem 34 have this property, since $\pi_0$ is constant on those carriers.

Strictness is a property of the typed object-map data $\pi_j,\pi_{j+1}$ alone; it is not by itself a closure or drive claim. The nonclaim register of Subsection 15.2 records NC-10 (no strictness-implies-closure) and NC-11 (no strictness-implies-drive); the no-go countermodels $\mathsf{CM}_9$ and $\mathsf{CM}_{10}$ of Appendix C (named in Section 9) supply finite explicit instances in which strictness coexists with absent closure or absent drive.

## 10.2 Promotion Gates

### 10.2.1 Gate List

The required gate family of a promotion bridge is

$$
\mathsf{PromGate}(B)\;=\;(\,G_{\mathrm{suff}},\;G_{\mathrm{desc}},\;G_{\mathrm{stab}},\;G_{\mathrm{ctrl}},\;G_{\mathrm{nosmuggle}},\;G_{\mathrm{vis}},\;G_{\mathrm{audit}},\;G_{\mathrm{strict}}\,),
$$

with the optional local-to-global gate

$$
G_{\mathrm{locglob}}.
$$

Each gate has a fixed role:

- $G_{\mathrm{suff}}$: well-formedness gate, checking that $B$ as a record satisfies the typed schema of Subsubsection 10.1.1, that each gate-feeding entry of $\delta$ (the strictness, descent, stability and no-smuggling defects of Subsection 5.4) equals its value recomputed from the bridge data as in Subsection 5.4, the strictness defect being $\Delta_{\mathrm{fact}}(\pi_j,\pi_{j+1})$ computed from $\pi_j,\pi_{j+1}$ on $S$, and that every recorded value of a defect-fed gate ($G_{\mathrm{strict}}$, $G_{\mathrm{desc}}$, $G_{\mathrm{stab}}$, $G_{\mathrm{nosmuggle}}$, $G_{\mathrm{ctrl}}$) other than $\texttt{not\_checked}$, $\texttt{not\_required}$ or an unauditable value equals the value recomputed from its defect; and that a recorded $G_{\mathrm{vis}}=\texttt{pass}$ holds exactly when the visibility defect $\delta_{\mathrm{vis}}$ of the bridge's use-set, computed from $V$ and its bridge family as in Subsection 5.5, is empty, and a recorded $G_{\mathrm{audit}}=\texttt{pass}$ exactly when the audit defect of $A$ computed as in Subsubsection 5.3.6 is $\texttt{audit\_passes}$. $G_{\mathrm{suff}}$ also checks that $G_{\mathrm{locglob}}=\texttt{not\_required}$ exactly when no global-package claim is made, and checks each recorded $\texttt{glue\_pass}$, $\texttt{local\_only}$ or $\texttt{glue\_fail}$ against the cover, local-package admissibility and gluing defect.
- $G_{\mathrm{desc}}$: descent gate, required when the bridge claims macro closure or descended dynamics on the target package; it is fed by the descent defect of Subsubsection 5.3.1 ($\delta_1^{\mathrm{split}}$) and Theorem 7.
- $G_{\mathrm{stab}}$: stability gate, required when the bridge claims target objects are fixed points of a completion endomap; it is fed by the stability defect $\delta_{\mathrm{stab}}$ of Subsubsection 5.4.3.
- $G_{\mathrm{ctrl}}$: control-of-content gate, checking that no target-layer data has been used to certify target novelty: $G_{\mathrm{ctrl}}=\texttt{pass}$ iff $\delta_{\mathrm{nosmuggle}}(B)$ has no entry with $k=1$ (Subsubsection 5.4.2); $G_{\mathrm{ctrl}}$ is implied by $G_{\mathrm{nosmuggle}}$ and is listed separately so that $\texttt{failed\_no\_smuggling}$ records its cause.
- $G_{\mathrm{nosmuggle}}$: no-smuggling gate, fed by the no-smuggling defect of Subsubsection 5.4.2.
- $G_{\mathrm{vis}}$: visibility gate, checking that the bridge's content is admissible under $\mathsf{Visible}_I$ and the bridge policy of $I$.
- $G_{\mathrm{audit}}$: audit gate, checking that the audit record $A$ passes $\mathsf{AuditPolicy}_I$.
- $G_{\mathrm{strict}}$: strictness gate, with refined status set $\mathrm{StrictGateStatus}$ from Subsubsection 5.1.6, fed by the factorization defect $\Delta_{\mathrm{fact}}$ of Subsubsection 5.4.1.
- $G_{\mathrm{locglob}}$: optional local-to-global gate, present when the bridge claims a global package built from local packages on a cover.

The required core gates of a bridge are the subset of

$$
\mathsf{CoreGates}\;=\;\{\,G_{\mathrm{suff}},\,G_{\mathrm{desc}},\,G_{\mathrm{stab}},\,G_{\mathrm{ctrl}},\,G_{\mathrm{nosmuggle}},\,G_{\mathrm{vis}},\,G_{\mathrm{audit}}\,\}
$$

given by

$$
\begin{aligned}
\mathsf{ReqCoreGates}(B)\;=\;&\{\,G_{\mathrm{suff}},\,G_{\mathrm{ctrl}},\,G_{\mathrm{nosmuggle}},\,G_{\mathrm{vis}},\,G_{\mathrm{audit}}\,\}\\
&\cup\;\{\,G_{\mathrm{desc}}:B\text{ claims macro closure or descended dynamics}\,\}\\
&\cup\;\{\,G_{\mathrm{stab}}:B\text{ claims fixed-point targets}\,\}.
\end{aligned}
$$

The content and target fields declare whether $B$ claims macro closure or descended dynamics or fixed-point targets. Such a declaration requires, respectively, a threshold on $\delta_1^{\mathrm{split}}$ (Subsubsection 5.3.1) or on $\delta_{\mathrm{stab}}$ (Subsubsection 5.4.3) in $\Theta$; a missing threshold fails $G_{\mathrm{suff}}$. The presence of $\Theta_{\mathrm{strict}}$ or $\Theta_{\mathrm{nonstrict}}$ in $\Theta$ (Subsubsection 5.4.1) determines whether a strictness verdict is required. Since the bridge audit's $\mathsf{ThresholdCheck}$ tests $\Theta$, a bridge whose $\Theta$ contains $\Theta_{\mathrm{strict}}$ (resp. $\Theta_{\mathrm{nonstrict}}$) while $\Delta_{\mathrm{fact}}=\varnothing$ (resp. $\neq\varnothing$) has $\texttt{threshold\_failure}$ in its audit defect, so $G_{\mathrm{audit}}$ fails and the classifier returns $\texttt{failed\_audit}$ or a status of higher priority; the threshold declares which refinement the bridge claims. $\mathsf{GateResults}(B)$ must mark the corresponding gate as required, and $G_{\mathrm{suff}}$ checks that agreement. The five gates of the first set are required of every bridge. The strictness gate $G_{\mathrm{strict}}$ is part of the promotion-gate record but sits outside $\mathsf{CoreGates}$; when strictness is required and classified, it records the strict/non-strict refinement, while a bridge that does not require a strictness verdict may remain at the unrefined status $\texttt{accepted}$.

*Decidability of the well-formedness gate.* $G_{\mathrm{suff}}$ performs finitely many checks: the typing of the seventeen fields of the expanded bridge record, $\mathsf{AdmPkg}$ of both packages, $\mathsf{AdmProfile}(\lambda,I,\mathcal T_j)$ for the bridge profile, finiteness of $S$, $O_j$ and $O_{j+1}$, the agreement of each defect-fed gate value, including $G_{\mathrm{ctrl}}$, and of the recorded values of $G_{\mathrm{vis}}$ and $G_{\mathrm{audit}}$, with its recomputed visibility or audit defect, and the agreement of the required marks of $G_{\mathrm{desc}}$, $G_{\mathrm{stab}}$ and $G_{\mathrm{strict}}$ with the claims determined by the bridge's content, target and threshold fields. Each is a membership or comparison test on finite records, so, under hypotheses (a)–(b) of Theorem 3 for the thresholds these checks evaluate, whether a promotion bridge is well formed is decidable by the argument of Theorem 3.

### 10.2.2 Gate Statuses

Each ordinary gate carries a status from the gate status set $\mathrm{GateStatus}$ of Subsubsection 5.1.6.

The strictness gate carries a refined status from the set $\mathrm{StrictGateStatus}$ of Subsubsection 5.1.6.

The gate-results record $\mathsf{GateResults}(B)$ is the finite assignment of these statuses to the gates in the bridge record. A gate may be marked $\texttt{not\_required}$ when the bridge does not claim the corresponding content; the descent gate, for example, is $\texttt{not\_required}$ for a bridge that records only an interface change with no closure claim. A required core gate marked $\texttt{not\_checked}$ does not yield an accepted promotion; the promotion classifier of Subsubsection 5.6.4 routes such a bridge to $\texttt{candidate}$.

## 10.3 Theorem 19: Promotion Gate Soundness

\begin{claimtheorem}{Theorem 19 (PromotionGateSoundness)}
Let $B_{j\to j+1}$ be a promotion bridge. If the promotion classifier of Subsubsection 5.6.4 assigns

$$
\mathrm{Promote}(B):\sigma\quad\text{with}\quad\sigma\in\{\,\texttt{accepted},\,\texttt{strict},\,\texttt{non\_strict}\,\},
$$

then every required core gate exists in the gate-results record and passes:

$$
\forall\,G\in\mathsf{ReqCoreGates}(B),\quad\mathsf{GateExists}(B,G)\;\wedge\;\mathsf{GatePass}(B,G),
$$

that is, $G$ has an entry in $\mathsf{GateResults}(B)$ with value $\texttt{pass}$; moreover $G_{\mathrm{locglob}}\in\{\texttt{glue\_pass},\texttt{not\_required}\}$, so a verdict in this family never rests on an unchecked local-to-global claim.

In particular $G_{\mathrm{suff}}$, $G_{\mathrm{ctrl}}$, $G_{\mathrm{nosmuggle}}$, $G_{\mathrm{vis}}$ and $G_{\mathrm{audit}}$ pass, and, since $G_{\mathrm{suff}}$ checks the recorded values, $\delta_{\mathrm{vis}}(B)=\varnothing$ and the audit defect of $A$ is $\texttt{audit\_passes}$.
\end{claimtheorem}

\begin{proof}
By the definition of the promotion classifier in Subsubsection 5.6.4, each accepted-family row requires a well-formed bridge, every required core gate to exist and pass, and $G_{\mathrm{locglob}}\in\{\texttt{glue\_pass},\texttt{not\_required}\}$. The verdicts $\texttt{strict}$ and $\texttt{non\_strict}$ are refinements of the accepted core by the strictness gate: $\texttt{strict}$ adds $G_{\mathrm{strict}}=\texttt{strict\_pass}$, and $\texttt{non\_strict}$ adds $G_{\mathrm{strict}}=\texttt{non\_strict\_pass}$. The remaining promotion-status values record specific failure or unresolved conditions and are routed by the classifier to non-accepted statuses such as $\texttt{failed\_audit}$, $\texttt{failed\_no\_smuggling}$, $\texttt{failed\_descent}$, $\texttt{failed\_stability}$, $\texttt{globally\_obstructed}$, $\texttt{local\_only}$, $\texttt{candidate}$, or $\texttt{outside\_scope}$. Rows 9–11 of the classifier also require $G_{\mathrm{locglob}}\in\{\texttt{glue\_pass},\texttt{not\_required}\}$. Hence whenever the verdict lies in the accepted family, every required core gate exists and passes and the local-to-global gate is passed or not required; the five gates listed last belong to $\mathsf{ReqCoreGates}(B)$ for every bridge, and the passing $G_{\mathrm{suff}}$ makes the recorded values of $G_{\mathrm{vis}}$ and $G_{\mathrm{audit}}$ agree with the computed visibility and audit defects.

The result records the basic discipline of promotion: an accepted, strict or non-strict promotion verdict requires every required core gate to pass its finite admissibility check and the local-to-global gate to pass or not be required.
\end{proof}

## 10.4 Theorem 20: Strict Promotion Implies Nonfactorization

\begin{claimtheorem}{Theorem 20 (StrictPromotionImpliesNonfactorization)}
Let $B_{j\to j+1}$ be a promotion bridge. If the promotion classifier assigns

$$
\mathrm{Promote}(B_{j\to j+1})\;:\;\texttt{strict},
$$

then $\pi_{j+1}\not\factor\pi_j$. Equivalently, there exist $s,s'\in S$ with $\pi_j(s)=\pi_j(s')$ and $\pi_{j+1}(s)\neq\pi_{j+1}(s')$.
\end{claimtheorem}

\begin{proof}
The verdict $\texttt{strict}$ requires the accepted core, in which $G_{\mathrm{suff}}$ passes, that is, $\mathrm{WF}(B)$ holds, so the recorded value of $G_{\mathrm{strict}}$ agrees with its recomputed value; by the strictness-gate semantics of Subsubsection 5.4.1, the strict-pass refinement $G_{\mathrm{strict}}=\texttt{strict\_pass}$ is then recorded exactly when $\Delta_{\mathrm{fact}}(\pi_j,\pi_{j+1})\neq\varnothing$. The promotion classifier of Subsubsection 5.6.4 produces the verdict $\texttt{strict}$ only when $G_{\mathrm{strict}}=\texttt{strict\_pass}$, so $\Delta_{\mathrm{fact}}\neq\varnothing$. By Theorem 13 of Section 7, $\Delta_{\mathrm{fact}}\neq\varnothing$ is equivalent to $\pi_{j+1}\not\factor\pi_j$, and a witness pair $(s,s')$ exists by definition of $\Delta_{\mathrm{fact}}$.

\end{proof}

## 10.5 Theorem 21: Non-Strict Promotion Implies Factorization

\begin{claimtheorem}{Theorem 21 (NonStrictPromotionImpliesFactorization)}
Let $B_{j\to j+1}$ be a promotion bridge. If the promotion classifier assigns

$$
\mathrm{Promote}(B_{j\to j+1})\;:\;\texttt{non\_strict},
$$

then $\pi_{j+1}\factor\pi_j$. There exists a finite map $\phi:\mathrm{im}(\pi_j)\to O_{j+1}$ with $\pi_{j+1}=\phi\,\pi_j$.
\end{claimtheorem}

\begin{proof}
As in the proof of Theorem 20, $G_{\mathrm{suff}}$ passes in the accepted core, that is, $\mathrm{WF}(B)$ holds, so by the strictness-gate semantics of Subsubsection 5.4.1, the non-strict-pass refinement $G_{\mathrm{strict}}=\texttt{non\_strict\_pass}$ is recorded exactly when $\Delta_{\mathrm{fact}}(\pi_j,\pi_{j+1})=\varnothing$. The promotion classifier of Subsubsection 5.6.4 produces the verdict $\texttt{non\_strict}$ only when $G_{\mathrm{strict}}=\texttt{non\_strict\_pass}$, so $\Delta_{\mathrm{fact}}=\varnothing$. By Theorem 13 of Section 7, $\Delta_{\mathrm{fact}}=\varnothing$ is equivalent to $\pi_{j+1}\factor\pi_j$, and Theorem 12 supplies the explicit factorization $\phi$ on $\mathrm{im}(\pi_j)$.

\end{proof}

## 10.6 Theorem 22: A Two-Point Strict Bridge

### 10.6.1 Data

*Setting.* The host is $\mathsf H_{\mathrm{fin}}$ and the instrument is $I_{\mathrm{prom}}$; the bridge schema is that of Subsection 10.1 and the gates are those of Subsection 10.2. The gate results of the bridge, and its classification as $\texttt{strict}$ by the promotion classifier, are recorded in Subsubsection 10.6.2.

\begin{claimtheorem}{Theorem 22 (Toy22StrictBridge)}
There exists a finite two-layer promotion bridge $B_{0\to 1}^{\mathrm{Toy22}}$ on the host $\mathsf H_{\mathrm{fin}}$ with carrier $S=\{a,b\}$ and object maps

$$
\pi_0\colon S\to O_0=\{*\},\qquad \pi_1\colon S\to O_1=\{u,v\}
$$

defined by $\pi_0(a)=\pi_0(b)=*$ and $\pi_1(a)=u$, $\pi_1(b)=v$. The bridge is admissible under a finite instrument $I_{\mathrm{prom}}$ whose claim types include promotion claims and exclude the claim-type tag $\texttt{soundness}$, with audit and visibility records that pass the required core gates and with no closure or drive claim attached to the bridge, and the promotion classifier assigns $\Gamma;\mathcal T_0;I_{\mathrm{prom}}\vdash\mathrm{Promote}(B_{0\to 1}^{\mathrm{Toy22}}):\texttt{strict}$.
\end{claimtheorem}

*Records of the instance.* All records live on the host $\mathsf H_{\mathrm{fin}}$ at the level $\mathsf{Ver}$.

- *Packages.* For $k=0,1$, $\mathcal T_k=(S,\pi_k,\Sigma_{\pi_k},\mathrm{id}_{\mathcal P(S)},\mathcal A_k)$, whose completion is the identity of $\mathcal P(S)$ rather than $E_{\pi_k}$; both fix every member of $\Sigma_{\pi_k}$, since $E_{\pi_k}(\pi_k^{-1}(Y))=\pi_k^{-1}(Y)$, and the bridge claims no fixed-point targets; here $\Sigma_{\pi_k}=\{\pi_k^{-1}(Y):Y\subseteq O_k\}$ and $\mathcal A_k$ certifies the single audit entry of $A_{\mathcal T_k}$, which recomputes $\pi_k(a)$ and $\pi_k(b)$ from the table of $\pi_k$. The visibility profile makes every field visible to $I_{\mathrm{prom}}$; the source record is $\mathrm{src}_{\mathcal T_k}=(\texttt{toy22-}k,\texttt{committed\_state},\text{the table of }\pi_k,\texttt{valid})$; the defect family is empty; the nonclaim record states that no closure or drive claim is made. $\mathcal T_0$ carries the promotion data $(\pi_0,\mathcal T_1,\pi_1,\texttt{toy22})$, naming the bridge by its identifier, accompanied by $\mathrm{src}_{\mathcal T_0}$, the bridge audit $A$ and $\mathcal N$. Each condition of Subsubsection 3.3.3 holds by inspection of these finite records, and the remaining components of the instance consist of the records listed in this construction, each written in its schema, so $\mathsf{AdmDomain}$ of Subsubsection 4.10.1 holds.
- *Instrument.* $I_{\mathrm{prom}}$ has scope and visible set the records of $\mathcal T_0$, $\mathcal T_1$ and the bridge, $\mathsf{Hosts}_{I_{\mathrm{prom}}}=\{\mathsf H_{\mathrm{fin}}\}$, $\mathsf{Levels}_{I_{\mathrm{prom}}}=\{\mathsf{Ver}\}$, strengths $\{\texttt{weak}<\texttt{strong}\}$ with every admitted pair and claim type mapped to $\texttt{weak}$, and $\mathsf{Suppressed}_{I_{\mathrm{prom}}}=\varnothing$; claim types $\{\texttt{promotion}\}$; check rules that recompute $\pi_0$, $\pi_1$ on $S$ and the factorization defect $\Delta_{\mathrm{fact}}(\pi_0,\pi_1)$; exact thresholds and $\mathsf{ProvisionalTypes}_{I_{\mathrm{prom}}}=\varnothing$; an audit policy requiring every recomputed table entry to agree with the recorded one; level $\mathsf{Ver}$; a bridge policy admitting the visibility bridge type and requiring no visibility bridge; $\mathsf{ModePolicy}_{I_{\mathrm{prom}}}(\texttt{promotion})=\texttt{default}$ and $(\texttt{fine},\texttt{structural},\texttt{local},\mathsf H_{\mathrm{fin}})\in\mathsf{Compat}_{I_{\mathrm{prom}}}$, so that $\mathsf{AdmProfile}(\lambda_{\mathrm{prom}},I_{\mathrm{prom}},\mathcal T_0)$ holds; a source policy admitting $\texttt{committed\_state}$; an evidence policy admitting $\texttt{committed\_state}$ as direct evidence; and a nonclaim record excluding soundness claims.
- *Bridge.* $B_{0\to1}^{\mathrm{Toy22}}=(\texttt{toy22},\mathcal T_0,\mathcal T_1,S,O_0,O_1,\pi_0,\pi_1,L,V,\Theta,A,\delta,\mathsf{GateResults},\mathcal N,\mathsf H_{\mathrm{fin}},\lambda_{\mathrm{prom}})$ with $L$ the level pair $(\mathsf{Ver},\mathsf{Ver})$, identity lens on $S$ and interface $(\pi_0,\pi_1)$; $V$ marking every field visible; $\Theta$ the exact strictness threshold $\Delta_{\mathrm{fact}}(\pi_0,\pi_1)\neq\varnothing$; $A$ the audit record whose target is the bridge, whose evidence is the two tables, whose check rules recompute them and $\Delta_{\mathrm{fact}}$, whose source references are $\mathrm{src}_{\mathcal T_0}$ and $\mathrm{src}_{\mathcal T_1}$, and whose visibility, threshold and circularity checks pass; $\delta$ with strictness defect $\{(a,b),(b,a)\}$ and empty no-smuggling, stability and descent defects; $\mathcal N$ stating that no closure or drive claim is made; and $\lambda_{\mathrm{prom}}=(\mathsf{Ver},\mathsf{Ver},\texttt{fine},\texttt{structural},\texttt{visibility},\texttt{default},\texttt{local})$, the promotion profile at the fine scale with local use. The bridge audit tags every record of $\mathsf{Use}(B)$ $\texttt{other}/\texttt{other}$, except the table of $\pi_1$, tagged $\texttt{target}/\texttt{novelty}$, which kind 1 of Subsubsection 5.4.2 exempts; its strictness comparison uses the defining object maps on the common carrier and uses no independent target-layer novelty assertion.

### 10.6.2 Gate Results

The gate-results record $\mathsf{GateResults}(B_{0\to 1}^{\mathrm{Toy22}})$ assigns:

- $G_{\mathrm{suff}}=\texttt{pass}$, since the bridge data conforms to the schema of Subsubsection 10.1.1;
- $G_{\mathrm{vis}}=\texttt{pass}$, since the bridge content lies in $\mathsf{Visible}_{I_{\mathrm{prom}}}$;
- $G_{\mathrm{audit}}=\texttt{pass}$, since the audit record passes $\mathsf{AuditPolicy}_{I_{\mathrm{prom}}}$;
- $G_{\mathrm{ctrl}}=\texttt{pass}$, since no target-layer data has been used to certify target novelty;
- $G_{\mathrm{nosmuggle}}=\texttt{pass}$, since the no-smuggling defect of Subsubsection 5.4.2 is empty;
- $G_{\mathrm{desc}}=\texttt{not\_required}$, since no closure or descended-dynamics claim is made on the bridge;
- $G_{\mathrm{stab}}=\texttt{not\_required}$, since no fixed-point structure is claimed;
- $G_{\mathrm{locglob}}=\texttt{not\_required}$, since no local-to-global packaging claim is made.

The strictness gate is fed by the factorization defect $\Delta_{\mathrm{fact}}(\pi_0,\pi_1)$. We have $\pi_0(a)=\pi_0(b)=*$ but $\pi_1(a)=u\neq v=\pi_1(b)$, so $(a,b)\in\Delta_{\mathrm{fact}}(\pi_0,\pi_1)\neq\varnothing$. By Theorems 12 and 13 of Section 7 and the strictness-gate semantics, $G_{\mathrm{strict}}=\texttt{strict\_pass}$.

The promotion classifier of Subsubsection 5.6.4 then assigns

$$
\mathrm{Promote}(B_{0\to 1}^{\mathrm{Toy22}})\;:\;\texttt{strict}.
$$

\begin{proof}
Let $S=\{a,b\}$, $O_0=\{*\}$, and $O_1=\{u,v\}$, and define $\pi_0,\pi_1$ as in the statement. The bridge data are finite because all three carriers are finite, and its records are those listed under *Records of the instance*. The sufficiency gate passes: $B$ satisfies the typed schema of Subsubsection 10.1.1 and both packages are admissible; the recorded strictness, descent, stability and no-smuggling defects equal their values recomputed from the bridge data; the recorded values of the defect-fed gates agree with them; and $\Theta$ contains $\Theta_{\mathrm{strict}}$ and no threshold on $\delta_1^{\mathrm{split}}$ or $\delta_{\mathrm{stab}}$, so a strictness verdict is required, $G_{\mathrm{desc}}$ and $G_{\mathrm{stab}}$ are not, and $\mathsf{GateResults}(B)$ marks the gates accordingly. The visibility gate passes because $\mathsf{Suppressed}_{I_{\mathrm{prom}}}=\varnothing$ and every field is visible. The audit gate passes because the audit record recomputes the four table entries, each agreeing with the recorded value, and its source references point to committed-state sources admitted by the source policy. The control gate passes because novelty is certified by the recomputed pair $(a,b)$ of the common carrier $S$, not by a target-layer record asserting novelty. The no-smuggling defect is empty item by item in the list of Subsubsection 5.4.2: novelty is not taken from a target-layer assertion; no content is suppressed; no simulation, local-to-global, $P_3$-witness or lossy-summary record is used; and the tables are exact. The descent, stability, and local-to-global gates are not required because the bridge makes no descended-dynamics, fixed-point, or local-to-global packaging claim.

It remains to verify strictness. Since $\pi_0(a)=\pi_0(b)=*$ while $\pi_1(a)=u\neq v=\pi_1(b)$, the pair $(a,b)$ lies in the factorization defect $\Delta_{\mathrm{fact}}(\pi_0,\pi_1)$. Hence this defect is nonempty, so Theorems 12 and 13 identify the bridge as nonfactorizing. The strictness gate therefore returns $\texttt{strict\_pass}$. The row $\texttt{outside\_scope}$ does not apply: $\mathsf H_{\mathrm{fin}}\in\mathsf{Hosts}_{I_{\mathrm{prom}}}$, the level tags of $\lambda_{\mathrm{prom}}$ and $L$ are $\mathsf{Ver}\in\mathsf{Levels}_{I_{\mathrm{prom}}}$, and $\mathsf{Use}(B)$ lies in its scope. Applying the promotion classifier to the finite gate record gives $\mathrm{Promote}(B_{0\to 1}^{\mathrm{Toy22}}):\texttt{strict}$.
\end{proof}

### 10.6.3 Interpretation

Theorem 22 is a finite instance of strict promotion, not a universal stacking theorem. It records that strictness is the working content of object-map nonfactorization on a finite carrier; it does not by itself imply closure, drive, or any deeper structure on the target package. Section 13's Cantor model-realization sheet records a scoped strict-bridge realization on the audited Cantor shell, and Subsection 10.7 records that no general stacking composition theorem follows from the toy example.

## 10.7 Stacking Claims Not Proved

This subsection records two claims that this paper does not prove. The first fails in general; Subsubsection 10.7.1 gives a counterexample and proves its object-map form when the middle interface refines the source; the gate and nonclaim semantics of composed bridges, and the second claim, are deferred to future work, and Subsubsection 15.3.2 lists them in the formal future-work register.

### 10.7.1 No General Stacking Composition Theorem

The paper does not prove a general stacking composition theorem of the form

$$
\mathrm{Promote}(B_{j\to j+1}):\texttt{strict}\;\wedge\;\mathrm{Promote}(B_{j+1\to j+2}):\texttt{strict}\;\Longrightarrow\;\mathrm{Promote}(B_{j\to j+2}):\texttt{strict},
$$

with $B_{j\to j+2}$ a composed bridge derived from $B_{j\to j+1}$ and $B_{j+1\to j+2}$. The implication fails in general: for $S=\{a,b,c\}$, $\pi_0$ with fibres $\{a,b\},\{c\}$, $\pi_1$ with fibres $\{a\},\{b,c\}$ and $\pi_2=\pi_0$, we have $(a,b)\in\Delta_{\mathrm{fact}}(\pi_0,\pi_1)$ and $(b,c)\in\Delta_{\mathrm{fact}}(\pi_1,\pi_2)$, while $\Delta_{\mathrm{fact}}(\pi_0,\pi_2)=\varnothing$, so a composed bridge with passing gates recording $\phi=\mathrm{id}$ is $\texttt{non\_strict}$. Strictness composes when the middle interface refines the source: if $\pi_j=r\circ\pi_{j+1}$ for a map $r$, then $\Delta_{\mathrm{fact}}(\pi_{j+1},\pi_{j+2})\subseteq\Delta_{\mathrm{fact}}(\pi_j,\pi_{j+2})$, since $\pi_{j+1}(s)=\pi_{j+1}(s')$ implies $\pi_j(s)=\pi_j(s')$; so every witness pair of the second step witnesses strictness of the composite, and $\pi_{j+2}\not\factor\pi_{j+1}$ implies $\pi_{j+2}\not\factor\pi_j$. What remains open is the joint gate and nonclaim semantics of composed bridges; Subsubsection 15.3.2 records the corresponding future-work item.

### 10.7.2 No Local-to-Global Promotion Theorem

The paper does not prove a local-to-global promotion theorem of the form

$$
\bigl(\,\forall\,U_\alpha\in\text{cover},\;\mathrm{Promote}(B_\alpha\text{ on }U_\alpha):\texttt{strict}\,\bigr)\;\Longrightarrow\;\mathrm{Promote}(B_{\mathrm{global}}):\texttt{strict}.
$$

If a global bridge has object maps restricting to those of a strict local bridge, the local witness belongs to its global $\Delta_{\mathrm{fact}}$. Its computed strictness test therefore passes; a recorded $\texttt{strict\_pass}$ and a strict promotion verdict also require the global gate checks. Open are the existence of global maps (gluing, compare $\mathsf{CM}_3$) and the other gates. The local-to-global gate $G_{\mathrm{locglob}}$ of Subsection 10.2 is optional precisely because the conditions under which local strict promotions glue into a global strict promotion are not classified at theorem-grade in this paper. The countermodel $\mathsf{CM}_3$ of Section 9 records the failure case for ordinary packages without a gluing bridge on a finite cover; a positive gluing theorem for compatible local promotion bridges is recorded as future work in Subsubsection 15.3.2.
