# Appendix D. Model-Realization Sheets

This appendix records the four scoped model-realization sheets in long form: PICA (D.1), Cantor strict-bridge (D.2), abstract interpretation (D.3), and graph/cohomology (D.4). Subsection D.5 records the combined coverage matrix across the four realizations. The sheets supplement the main-text records of Section 13 and Section 12 with per-realization reference data.

Each sheet declares the host, the realization object, the realization map, the realized fragment, the actor-update map and informant-witness map (where applicable), the per-judgment realizations, the source-of-truth and provenance discipline (where applicable), the realization theorem, and the realization-specific nonclaim register. Each sheet is host-bound and fragment-scoped: the main-text claim that the corresponding model realizes a declared fragment of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is recorded in Section 13 (or Section 12 for AI), and this appendix does not introduce a new realization claim.

## D.1 PICA Sheet

The PICA realization sheet $\mathsf{PICAReal}_{\mathrm{fin}}$ records the realization of the finite stochastic cell/pair/provenance fragment of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ on the finite stochastic implementation host $\mathsf H_{\mathrm{PICA}}$. The main-text record is in Subsection 13.2; this subsection records the long-form sheet.

### D.1.1 Host and Realization Object

The host $\mathsf H_{\mathrm{PICA}}$ has components

$$
\mathsf H_{\mathrm{PICA}}\;=\;(\,\Omega,\;K,\;\mathbb P,\;\mathsf{Bus},\;\mathsf{CellRules},\;\mathsf{WitnessStore},\;\mathsf{UpdateStore},\;\mathsf{PairStore},\;\mathsf{DepGraph},\;A,\;V\,),
$$

with $\Omega$ a finite stochastic state space, $K$ a finite Markov kernel on $\Omega$, $\mathbb P=\{P_{1},\ldots,P_{6}\}$, and the remaining fields finite stores. The realization object $\mathcal P$ extends the host with $\mathsf{StatusStore}$, $\mathsf{Abl}$, and $\mathcal N$:

$$
\begin{aligned}
\mathcal P\;=\;(\,&\Omega,\;K,\;\mathbb P,\;\mathsf{Bus},\;\mathsf{CellRules},\;\mathsf{WitnessStore},\;\mathsf{UpdateStore},\\
&\mathsf{StatusStore},\;\mathsf{PairStore},\;\mathsf{DepGraph},\;\mathsf{Abl},\;A,\;V,\;\mathcal N\,).
\end{aligned}
$$

The host instrument is $I_{\mathrm{PICA}}$.

### D.1.2 Realization Map and Induced Package

The realization map $\mathcal R_{\mathrm{PICA}}:\mathsf{PICAReal}_{\mathrm{fin}}\to\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin\text{-}stoch}}{}^{\mathrm{cell}/\mathrm{pair}/\mathrm{prov}}$ sends the realization object $\mathcal P$ to the induced package

$$
\mathcal T_{\mathrm{PICA}}\;=\;(\,\Omega,\;f_{\mathrm{PICA}},\;\Sigma_{f_{\mathrm{PICA}}},\;E_{\mathrm{PICA}},\;\mathcal A_{\mathrm{PICA}}\,),
$$

with PICA-field interpretation: $\Omega$ is the finite stochastic carrier, $K$ provides finite Markov dynamics, the bus/lens projection provides $f_{\mathrm{PICA}}$, $\Sigma_{f_{\mathrm{PICA}}}=\{f_{\mathrm{PICA}}^{-1}(B):B\subseteq f_{\mathrm{PICA}}(\Omega)\}$ and $E_{\mathrm{PICA}}=E_{f_{\mathrm{PICA}}}$ are the lens-induced content and completion, the visible PICA claims and the commit/update closure are attached records, and the finite audit/provenance ledger $A$ assembles the inherited package-level audit functional $\mathcal A_{\mathrm{PICA}}$. The audit record $A$ remains distinct from the audit functional $\mathcal A_{\mathrm{PICA}}$.

### D.1.3 Actor-Update and Informant-Witness Maps

The actor-update map sends each primitive to its PICA update sort, and the informant-witness map sends each primitive to its PICA witness sort:

| primitive | actor update sort                                 | informant witness sort                  |
| --------- | ------------------------------------------------- | --------------------------------------- |
| $P_{1}$   | descent repair / closure update                    | descent/closure defect                   |
| $P_{2}$   | support gate / admissibility update                | gate/support/admissibility witness        |
| $P_{3}$   | route-memory / mismatch update                     | route mismatch / route-memory witness     |
| $P_{4}$   | refinement / staging update                        | refinement/stage witness                  |
| $P_{5}$   | package / completion / closure-summary update      | package/closure/completion witness         |
| $P_{6}$   | audit / provenance / source update                 | audit/provenance/source witness            |

### D.1.4 Directed-Cell and Status Recovery

Each PICA cell is realized as $\Gamma;\mathcal T_{\mathrm{PICA}};I_{\mathrm{PICA}}\vdash\mathsf{Cell}_{ij}^{\lambda_{\mathrm{PICA}}}:\sigma_{ij}$ with cell record $(P_{i}\leftarrow P_{j},W_{j},U_{i},L,V,\Theta,A,\delta)$ and PICA cell profile $\lambda_{\mathrm{PICA}}$. If the realized records meet the conditions of Subsubsection 13.2.5, the recovered $6\times 6$ multiplicity count under the formal classifier is $25\;\texttt{action},\;8\;\texttt{implicit},\;2\;\texttt{trivial},\;1\;\texttt{undefined\_circular}$, recorded as a PICA-profile model fact rather than a universal $6\times 6$ law (PICA nonclaim 2 of Subsubsection 13.2.10).

The raw-to-formal status recovery map is

$$
\texttt{Action}\;\to\;\texttt{action},\quad\texttt{Implicit}\;\to\;\texttt{implicit},\quad\texttt{Trivial}\;\to\;\texttt{trivial},
$$

with $\texttt{Undefined}$ recovering to a reason-dependent formal status in $\texttt{blocked}$, $\texttt{undefined\_circular}$, $\texttt{outside\_scope}$, $\texttt{absent}$, $\texttt{below\_threshold}$, or $\texttt{collapsed}$, decided by the formal classifier of Subsection 5.6. Raw PICA status never overrides the formal verdict.

### D.1.5 Pair-Observable Realization and Provenance

PICA pair-status recovery: $\texttt{real}\to\texttt{real}$, $\texttt{provisional}\to\texttt{real\_provisional}$, $\texttt{duplicated}\to\texttt{real\_duplicated}$, $\texttt{blocked}\to\texttt{blocked}$.

A PICA pair observable record is

$$
\begin{aligned}\mathsf{PairObs}_{\{i,j\}}^{\mu}\;=\;(\,&\{P_i,P_j\},\;\mu,\;\mathsf{ObservableType},\;\mathsf{BranchData},\;\mathsf{SourceOfTruth},\;L,\;V,\;\Theta,\\&A,\;\delta,\;\mathcal N,\;\mathsf{forbidsSource},\;\mathsf{partialEvidence},\;\mathsf{Dup}\,),\end{aligned}
$$

with realness condition $\mathsf{SourceOfTruthOK}\land\mathsf{VisibilityPasses}\land\mathsf{AuditPasses}\land\mathsf{ThresholdPasses}$. The source-of-truth predicate is

$$
\begin{aligned}
\mathsf{SourceOfTruthOK}(R,Q)\;\Leftrightarrow\;&\mathsf{Committed}(R)\land\mathsf{CorrectProducer}(R,Q)\\
&\land\mathsf{CorrectProvenance}(R,Q)\land\mathsf{NotFallbackUnlessAllowed}(R,Q)\\
&\land\mathsf{Visible}(R)\land\mathsf{Audited}(R).
\end{aligned}
$$

Dirty exclusion: $R.\mathsf{dirty\_since\_step}\neq\varnothing\Rightarrow\neg\mathsf{SourceOfTruthOK}(R,Q)$. Fallback default: a fallback record supports at most $\texttt{real\_provisional}$ unless an explicit upgrade bridge is recorded.

### D.1.6 Realization Theorem and Nonclaims

The sheet records the model-grade realization statement corresponding to Model Theorem 33. If $\mathcal P\in\mathsf{PICAReal}_{\mathrm{fin}}$ is admissible, then

$$
\Gamma;\mathsf H_{\mathrm{PICA}};I_{\mathrm{PICA}}\vdash\mathsf{PICAReal}_{\mathrm{fin}}\models\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin\text{-}stoch}}{}^{\mathrm{cell}/\mathrm{pair}/\mathrm{prov}}:\texttt{model\_realization}.
$$

The PICA nonclaim register $\mathcal N_{\mathrm{PICA}}$ contains the ten nonclaims of Subsubsection 13.2.10: no PICA universality, no $6\times 6$ universal law, raw status not formal status, $\texttt{action}$ not pair-realness, fallback without an admitted upgrade not a real source, ablation evidence is model-grade, $P_{3}$ not $\mathrm{P6}_{\mathrm{drive}}$ without bridge, dirty records not real, finite stochastic fragment only, implementation correctness future work.

## D.2 Cantor Sheet

The Cantor strict-bridge realization sheet $\mathsf{CantorShell}_{\mathrm{aud}}$ records the realization of $\mathbf{StrictBridge}_{0\to 1}^{\mathrm{audited\ shell}}$ on the audited Cantor shell host $\mathsf H_{\mathrm{CantorShell}}$. The main-text record is in Subsection 13.3.

### D.2.1 Host and Realization Object

The host $\mathsf H_{\mathrm{CantorShell}}$ is a scoped audited application host built over a fixed audited shell-stable comparison domain $\mathcal S_{\mathrm{aud}}$. The realization object is

$$
\mathsf{CantorShell}_{\mathrm{aud}}\;=\;(\,\mathsf{cite}_{\mathcal S},\;W,\;T_{0},\;T_{1},\;\pi_{0},\;\pi_{1},\;\mathcal F,\;\Delta,\;A,\;\mathcal N\,),
$$

with $\mathsf{cite}_{\mathcal S}$ the finite citation record for the audited shell-stable comparison domain $\mathcal S_{\mathrm{aud}}$, $W\subseteq\mathcal S_{\mathrm{aud}}$ the finite audited subset of Subsubsection 13.3.2 containing a nonfactorization pair, $T_{0}$ the base cocycle-pressure theory, $T_{1}$ the completion-packaged theory, $\pi_{0}$ the old cocycle-level object map, $\pi_{1}$ the new packaged-object map, $\mathcal F$ the persistent packaged-strata family, $\Delta$ the pressure-gap consequence, $A$ the audit/theoremlet support record, and $\mathcal N$ the Cantor nonclaim register. The host instrument is $I_{\mathrm{Cantor}}$.

### D.2.2 Base Package $T_{0}$ and Target Package $T_{1}$

The base package is $\mathcal T_{0}^{\mathrm{Cantor}}=(W,\pi_{0}|_W,\Sigma_{\pi_{0}}^{\mathrm{cocycle}},E_{0}^{\mathrm{cocycle}},\mathcal A_{T_{0}})$, with $\pi_{0}|_W:W\to\mathcal O_{0}$, $E_{0}^{\mathrm{cocycle}}=E_{\pi_0}$ the lens completion on $\mathcal P(W)$, the closure $\operatorname{Cl}_{P_{T_{0}}}$ cited from the Cantor paper, not recorded, and base pressure object

$$
P_{T_{0}}(s)\;=\;\lim_{n\to\infty}\frac{1}{n}\,\log\!\left(\sup_{x\in\mathcal S_{\mathrm{aud}}}a_{n}(s;x)\right).
$$

The target package is $\mathcal T_{1}^{\mathrm{Cantor}}=(W,\pi_{1}|_W,\Sigma_{\pi_{1}}^{\mathrm{pkg}},E_{1}^{\mathrm{pkg}},\mathcal A_{T_{1}})$, with $\pi_{1}|_W:W\to\mathcal O_{1}$ completion endomap $E_{1}^{\mathrm{pkg}}=E_{\pi_1}$ on $\mathcal P(W)$, and attached packaging citation records $(E_{\tau,\ell},\mathrm{Fix}(E_{\tau,\ell}),\mathcal F,\mathrm{Sat},\mathrm{Force}_{4\leftarrow 5})$ with $E_{\tau,\ell}(\mu)=U_{\ell}(Q_{\ell}(\mu K^{\tau}))$.

For $k=0,1$, $\mathcal A_{T_k}$ is the finite audit functional on the attached audit record family $A_{T_k}$, with $\mathcal A_{T_k}(e)=\texttt{pass}$ for every entry $e\in A_{T_k}$.

### D.2.3 Cantor Strict Bridge

The Cantor strict bridge is

$$
B_{0\to 1}^{\mathrm{Cantor}}\;=\;(\,\mathcal T_{0}^{\mathrm{Cantor}},\;\mathcal T_{1}^{\mathrm{Cantor}},\;\pi_{0},\;\pi_{1},\;L_{\mathrm{Cantor}},\;V_{\mathrm{Cantor}},\;\Theta_{\mathrm{Cantor}},\;A_{\mathrm{Cantor}},\;\delta_{\mathrm{Cantor}},\;\mathcal N_{\mathrm{Cantor}}\,),
$$

where $L_{\mathrm{Cantor}}$ records the level pair $(\mathsf{Ver},\mathsf{Ver})$, the identity lens on $W$ and the interface $(\pi_0,\pi_1)$, and references the attached lift data $(E_{\tau,\ell},Q_\ell,U_\ell,\mathrm{Sat},\mathrm{Force}_{4\leftarrow5})$; the defect bundle $\delta_{\mathrm{Cantor}}$ contains the computed promotion-bridge defects and the typed pressure-gap consequence defect; citation records for the Cantor saturation, forcing and macro defects are attached to $T_1$ and referenced by $L_{\mathrm{Cantor}}$, and they feed no gate.

### D.2.4 Strictness Witness and Pressure-Gap Defect

The strictness witness is $\pi_1|_W\not\factor\pi_0|_W$, equivalently $\exists x,x'\in W:\pi_0(x)=\pi_0(x')\land\pi_1(x)\ne\pi_1(x')$. Define

$$
\Delta_{\mathrm{fact}}^{\mathrm{Cantor}}\;=\;\{\,(x,x')\in W\times W:\pi_0(x)=\pi_0(x')\land\pi_1(x)\ne\pi_1(x')\,\}.
$$

The strictness gate $G_{\mathrm{strict}}=\texttt{strict\_pass}\Leftrightarrow\Delta_{\mathrm{fact}}^{\mathrm{Cantor}}\neq\varnothing$.

The pressure-gap consequence defect is

$$
\Delta_{T_{0}\to T_{1}}(s;x)\;=\;P_{T_{0}}(s)\;-\;\sum_{\Sigma\in\mathcal F(x)}w_{\Sigma}(x)\,P_{\Sigma}(s).
$$

It is a *consequence* defect, not the strictness witness itself.

### D.2.5 Gate Results

| gate | result |
| --- | --- |
| $G_{\mathrm{suff}}$ | $\texttt{pass}$ |
| $G_{\mathrm{desc}}$ | $\texttt{not\_required}$ |
| $G_{\mathrm{stab}}$ | $\texttt{not\_required}$ |
| $G_{\mathrm{ctrl}}$ | $\texttt{pass}$ |
| $G_{\mathrm{nosmuggle}}$ | $\texttt{pass}$ |
| $G_{\mathrm{vis}}$ | $\texttt{pass}$ |
| $G_{\mathrm{audit}}$ | $\texttt{pass}$ |
| $G_{\mathrm{strict}}$ | $\texttt{strict\_pass}$ |
| $G_{\mathrm{locglob}}$ | $\texttt{not\_required}$ |

### D.2.6 Realization Theorem and Nonclaims

The sheet records the model-grade realization statement corresponding to Model Theorem 34. If $\mathsf{AdmCantorShell}(\mathsf{CantorShell}_{\mathrm{aud}})$ holds, the strictness witness records a nonempty $\Delta_{\mathrm{fact}}^{\mathrm{Cantor}}$ on $W$, and the remaining hypotheses of Model Theorem 34 hold (so that, by that theorem, the gate record of D.2.5 holds), then

$$
\Gamma;\mathsf H_{\mathrm{CantorShell}};I_{\mathrm{Cantor}}\vdash\mathsf{CantorShell}_{\mathrm{aud}}\models\mathbf{StrictBridge}_{0\to 1}^{\mathrm{audited\ shell}}:\texttt{model\_realization},
$$

and the associated promotion judgment is $\Gamma;\mathcal T_{0}^{\mathrm{Cantor}};I_{\mathrm{Cantor}}\vdash\mathrm{Promote}(B_{0\to 1}^{\mathrm{Cantor}}):\texttt{strict}$.

The Cantor nonclaim register $\mathcal N_{\mathrm{Cantor}}$ contains the ten nonclaims of Subsubsection 13.3.9: shell-bound only, no shell-general theorem, no broader external-class theorem, strictness not macro closure, strictness not drive, pressure gap not KL closure deficit without bridge, pressure gap not strictness witness, $\Delta_{T_{0}\to T_{1}}$ is conditional disintegration not stratumwise root separation, model realization not universal strict-extension theory, $T_{1}$ not single repeated idempotent.

## D.3 Abstract-Interpretation Sheet

The abstract-interpretation realization sheet $\mathsf{AIFam}_{\mathrm{fin}}$ records the realization of the role fragment $P_{1}/P_{2}/P_{5}/P_{6}$, and of $P_{1}/P_{2}/P_{4}/P_{5}/P_{6}$ when the refinement records contain a pair with $\rho_k\ne\rho_\ell$, on the finite abstract-interpretation host $\mathsf H_{\mathrm{AI}}$, supported by the theorem-grade theorems 26–28 of Section 12 and the model-grade Model Theorem 29.

### D.3.1 Host

A finite abstract-interpretation host is the eight-component finite typed record

$$
H\;=\;(\,C,\;A,\;\alpha,\;\gamma,\;\rho,\;F,\;F^{\sharp},\;A_{\mathrm{AI}}\,),
$$

with $(C,\le_{C})$ a finite concrete ordered domain, $(A,\le_{A})$ a finite abstract ordered domain, $\alpha\dashv\gamma$ a Galois connection between $C$ and $A$, $\rho=\gamma\alpha:C\to C$ the host closure operator, $F:C\to C$ and $F^{\sharp}:A\to A$ monotone transformers, and $A_{\mathrm{AI}}$ the host audit record. The host instrument is $I_{\mathrm{AI}}$.

### D.3.2 Single-Host Record and Field Glosses

| field         | meaning                              |
| ------------- | ------------------------------------ |
| $C$           | finite concrete ordered domain        |
| $A$           | finite abstract ordered domain        |
| $\alpha:C\to A$ | abstraction map                     |
| $\gamma:A\to C$ | concretization map                  |
| $\rho=\gamma\alpha$ | host closure operator on $C$    |
| $F:C\to C$    | monotone concrete transformer        |
| $F^{\sharp}:A\to A$ | monotone abstract transformer  |
| $A_{\mathrm{AI}}$ | host audit record                  |

For the model-family realization, the finite family is recorded as

$$
\mathsf{AIFam}_{\mathrm{fin}}\;=\;(\,\{H_k\}_{k\in\mathcal J},\;\mathsf{Refine},\;\mathsf{Audit},\;\mathcal N_{\mathrm{AI}}\,),
$$

with finite index set $\mathcal J$ and

$$
H_k=(\,C,\;A_k,\;\alpha_k,\;\gamma_k,\;\rho_k,\;F,\;F_k^{\sharp},\;A_{\mathrm{AI},k}\,).
$$

A refinement edge $A_k\leadsto A_\ell$ records $\rho_k\le_C\rho_\ell$ pointwise (the certificate $R_{k\to\ell}$ of Subsection 12.5); a forgetting map $r_{k\ell}:A_k\to A_\ell$ with $\alpha_\ell=r_{k\ell}\alpha_k$ supplies it, since $\alpha_k\gamma_k\alpha_k=\alpha_k$ (by the argument for $\gamma\alpha\gamma=\gamma$ in the proof of Theorem 28, with unit and counit exchanged), $\alpha_\ell\rho_k(c)=r_{k\ell}\alpha_k\gamma_k\alpha_k(c)=\alpha_\ell(c)$, so $\rho_k(c)\le_C\rho_\ell(c)$ by the adjunction. The canonical AI package for a host is $\mathcal T_{\mathrm{AI}}=(C,\alpha,\Sigma_\alpha,\rho,\mathcal A_{\mathrm{AI}})$, with $\Sigma_\alpha=\{\alpha^{-1}(B):B\subseteq A\}$ in full finite-lens mode; the audit functional $\mathcal A_{\mathrm{AI}}$ is assembled from the finite host audit record $A_{\mathrm{AI}}$.

### D.3.3 Realized Roles and Theorem Trio

The realization map sends each realized primitive to its AI-host witness:

| primitive | AI realization                                | core condition                              |
| --------- | --------------------------------------------- | ------------------------------------------- |
| $P_{1}$   | descent / sound transformer                   | $\alpha F\le_{A}F^{\sharp}\alpha$           |
| $P_{2}$   | representability                              | $p\;\text{representable}\iff\rho(p)=p$       |
| $P_{4}$   | refinement of abstract domain                 | $A_{k}\rightsquigarrow A_{\ell}$            |
| $P_{5}$   | closure / packaging                           | $\rho=\gamma\alpha,\;\rho^{2}=\rho$          |
| $P_{6}$   | audit / provenance                            | $A_{\mathrm{AI}}$ checks maps and defects   |

The supporting theorems are:

- **Theorem 26 (AIClosureAsPackaging).** $\rho=\gamma\alpha$ is extensive, monotone, and idempotent.
- **Theorem 27 (AIDescentAsSoundTransformer).** $\alpha F\le_{A}F^{\sharp}\alpha\iff F\gamma\le_{C}\gamma F^{\sharp}$.
- **Theorem 28 (AIRepresentabilityAsFixedness).** $p\,\text{representable}\iff\rho(p)=p$, with $\mathrm{Rep}_{\gamma}(C)=\mathrm{Fix}(\rho)=\mathrm{im}(\gamma)$.

### D.3.4 Optional $P_{3}$ Extension

A $P_{3}$ extension may be added by recording two AI host closures $\rho_{1}=\gamma_{1}\alpha_{1}$ and $\rho_{2}=\gamma_{2}\alpha_{2}$ and the noncommutation witness $\rho_{1}\rho_{2}\neq\rho_{2}\rho_{1}$, in which case Model Theorem 29 also realizes $P_3$, with witness the route-mismatch record $(\rho_1,\rho_2,c_{12})$, where $c_{12}\in\Delta_3^{\mathrm{comp}}(\rho_1,\rho_2)$; no directed cell is realized.

### D.3.5 Realization Theorem and Nonclaims

The sheet records the model-grade realization statement corresponding to Model Theorem 29. If $\mathsf{AIFam}_{\mathrm{fin}}$ is an admissible finite family of AI hosts whose refinement records contain a pair $(k,\ell)$ with $\rho_k\neq\rho_\ell$, then

$$
\Gamma;\mathsf H_{\mathrm{AI}};I_{\mathrm{AI}}\vdash\mathsf{AIFam}_{\mathrm{fin}}\models\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{\,P_{1}/P_{2}/P_{4}/P_{5}/P_{6}}:\texttt{model\_realization}.
$$

The AI nonclaim register $\mathcal N_{\mathrm{AI}}$ contains: AI is not the whole calculus, soundness is not completeness, closure does not imply descent, representability does not imply sound transformer, refinement does not automatically improve every defect, AI realization includes $P_{3}$ only when two host closures fail to commute, abstract claims cannot overread concrete distinctions invisible to $\alpha$, audit of soundness is not instrument-free truth, AI model-family claims are finite-host scoped, and $P_{5}$-closure does not imply drive, and the three coverage nonclaims of Subsubsection 13.6.2.

## D.4 Graph/Cohomology Sheet

The graph/cohomology realization sheet $\mathsf{CohGraph}_{\mathrm{fin}}$ records the realization of the drive-support fragment $P_{2}/\mathrm{P6}_{\mathrm{drive}}^{H^{1}}/P_{3}\text{-separation}$ on the finite graph/cohomology host $\mathsf H_{\mathrm{graph}}$. The main-text record is in Subsection 13.4.

### D.4.1 Host and Realization Object

The realization object is

$$
\mathsf{CohGraph}_{\mathrm{fin}}\;=\;(\,G,\;C^{0}(G;k),\;C^{1}(G;k),\;d,\;H^{1}(G;k),\;\mathsf{Cycles}(G),\;a,\;\mathsf{Gate},\;A,\;V,\;\mathcal N\,),
$$

with $G=(V,E)$ a finite support graph, $C^{0}(G;k)$ and $C^{1}(G;k)$ the finite-dimensional cochain spaces, $d:C^{0}\to C^{1}$ the coboundary, $H^{1}(G;k)$ the first cohomology, $\mathsf{Cycles}(G)$ the finite-dimensional cycle space, $a\in C^{1}(G;k)$ the affinity/drive cochain, $\mathsf{Gate}$ the gating record, $A$ and $V$ host audit and visibility records, and $\mathcal N$ the cohomology nonclaim register. The host instrument is $I_{\mathrm{graph}}$.

### D.4.2 Realized Fragment and Realization Map

The realization fragment is $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{\,P_{2}/\mathrm{P6}_{\mathrm{drive}}^{H^{1}}/P_{3}\text{-separation}}$, with realization map

| primitive                          | cohomology realization                                       |
| ---------------------------------- | ------------------------------------------------------------ |
| $P_{2}$                            | support gating / edge deletion / cycle-rank capacity         |
| $\mathrm{P6}_{\mathrm{drive}}^{H^{1}}$ | cohomological drive certificate $[a]\neq 0$                |
| $P_{6}^{\mathrm{audit}}$           | audit of cochains, cycles, source-of-truth, and visibility   |
| $P_{3}$                            | optional route/holonomy witness, kept separate from drive    |
| $P_{4}$                            | optional local/global cover or gluing of cochains             |
| $P_{5}$                            | optional quotient/support package of graph state               |

The core sheet focuses on $P_{2}$ and $\mathrm{P6}_{\mathrm{drive}}^{H^{1}}$.

### D.4.3 Drive and No-Drive Certificates

The drive certificate is $\kappa_{6}^{\mathrm{drive}}(a):[a]\neq 0\in H^{1}(G;k)$, equivalent to $\exists\,\gamma\in\mathsf{Cycles}(G):\oint_{\gamma}a\neq 0$. No-drive certificates: $[a]=0$, $a=d\phi$, $H^{1}(G;k)=0$, $\beta_{1}(G)=0$.

### D.4.4 Gating Realization

A $P_{2}$-gate $G\rightsquigarrow G'$ has cycle-rank loss defect $\delta_{2}^{\mathrm{cycle}}(G,G')=\beta_{1}(G)-\beta_{1}(G')$ and forest threshold $\Theta_{2}^{\mathrm{forest}}:\beta_{1}(G')=0$. When $G'$ is a forest, $H^{1}(G';k)=0$ and no certificate $\mathrm{P6}_{\mathrm{drive}}^{H^{1}}$ exists on $G'$.

### D.4.5 Core Theorems

The core graph/cohomology theorems of Section 8 (with long-form proofs in Appendix B.2) are: forest no-drive (Theorem 15: $\beta_{1}(G)=0\Rightarrow H^{1}(G;k)=0$), exact-form null-drive (Theorem 16: $a=d\phi\Rightarrow\oint_{\gamma}a=0$), nonzero-affinity equivalence (Theorem 17: $[a]\neq 0\iff\exists\gamma:\oint_{\gamma}a\neq 0$), and gating-affinity suppression (Theorem 18: gating to a forest kills cycle-supported drive).

### D.4.6 Realization Theorem and Nonclaims

**Cohomology Support Realization (model-grade).** Every admissible $\mathsf{CohGraph}_{\mathrm{fin}}$ realizes the fragment containing $P_{2}$-support gating and cycle-rank loss, $\mathrm{P6}_{\mathrm{drive}}^{H^{1}}$ certificates, no-drive certificates, and $P_{3}$/drive separation:

$$
\Gamma;\mathsf H_{\mathrm{graph}};I_{\mathrm{graph}}\vdash\mathsf{CohGraph}_{\mathrm{fin}}\models\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{\,P_{2}/\mathrm{P6}_{\mathrm{drive}}^{H^{1}}/P_{3}\text{-separation}}:\texttt{model\_realization}.
$$

The cohomology nonclaim register $\mathcal N_{\mathrm{coh}}$ contains the three coverage nonclaims of Subsubsection 13.6.2 and the entries of Subsubsection 13.4.4: $\mathrm{P6}_{\mathrm{drive}}^{H^{1}}$ is one drive certificate family not all drive, $P_{3}$ holonomy not $\mathrm{P6}_{\mathrm{drive}}$ without a bridge, gating to a forest kills cycle-supported drive only, exact $1$-cochains have zero cycle drive, $H^{1}(G;k)=0$ is a no-drive certificate for cohomological drive only, nonzero holonomy can coexist with zero drive cochain, host is finite and scoped, cohomology does not replace PICA/Cantor/AI, no edge-support claim accepted without visibility/audit, positive holonomy-to-drive claims require $B_{3\to 6}^{\mathrm{drive}}$.

## D.5 Combined Coverage Matrix

This subsection records the combined coverage matrix across the four model realizations. The matrix has one row per realization and one column per scoped attribute (host/instrument, realized fragment, claim strength); Subsubsection D.5.2 separately records per-primitive role coverage. The matrix collects the per-realization data of Subsections D.1–D.4 in one place; it is the long-form analogue of the matrix recorded in Subsection 13.5.

### D.5.1 Realization Matrix

\begingroup\footnotesize

| model                | host / instrument                                          | realized fragment                                                                                              | claim strength                                     |
| -------------------- | ---------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| $\mathsf{PICAReal}_{\mathrm{fin}}$  | $\mathsf H_{\mathrm{PICA}}$ / $I_{\mathrm{PICA}}$         | $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin\text{-}stoch}}{}^{\mathrm{cell}/\mathrm{pair}/\mathrm{prov}}$    | $\texttt{model\_realization}$                      |
| $\mathsf{CantorShell}_{\mathrm{aud}}$ | $\mathsf H_{\mathrm{CantorShell}}$ / $I_{\mathrm{Cantor}}$ | $\mathbf{StrictBridge}_{0\to 1}^{\mathrm{audited\ shell}}$                                                     | $\texttt{model\_realization}$ (application-scoped) |
| $\mathsf{AIFam}_{\mathrm{fin}}$     | $\mathsf H_{\mathrm{AI}}$ / $I_{\mathrm{AI}}$             | $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{\,P_{1}/P_{2}/P_{5}/P_{6}}$; with $P_4$ given a strict refinement; with $P_3$ given two noncommuting closures | $\texttt{model\_realization}$                      |
| $\mathsf{CohGraph}_{\mathrm{fin}}$  | $\mathsf H_{\mathrm{graph}}$ / $I_{\mathrm{graph}}$       | $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{\,P_{2}/\mathrm{P6}_{\mathrm{drive}}^{H^{1}}/P_{3}\text{-separation}}$ | $\texttt{model\_realization}$                      |

\endgroup

### D.5.2 Cross-Model Role Coverage

The cross-model role-coverage table records, per primitive, what each realization carries within its declared fragment:

| role        | $\mathsf{PICA}$                              | $\mathsf{Cantor}$                              | $\mathsf{AI}$                                              | $\mathsf{CohGraph}$                          |
| ----------- | -------------------------------------------- | ----------------------------------------------- | ----------------------------------------------------------- | --------------------------------------------- |
| $P_{1}$     | descent / closure update                      | macro obstruction; cited, not realized          | sound descent $\alpha F\le_{A}F^{\sharp}\alpha$              | not primary                                   |
| $P_{2}$     | gating / support / admissibility              | admissibility obstruction (cited, not realized)  | representability $\rho(p)=p$                                  | support gating                                |
| $P_{3}$     | route mismatch                                | not central                                      | noncommuting closures $\Delta_3^{\mathrm{comp}}(\rho_k,\rho_\ell)$, when two closures fail to commute           | separated from drive                          |
| $P_{4}$     | refinement / staging                          | $P_{4}\!\leftarrow\!P_{5}$ completion-packaging (cited, not realized) | refinement $A_{k}\rightsquigarrow A_{\ell}$                    | optional local/global cover                   |
| $P_{5}$     | package / completion                          | completion-packaged objects                      | closure / packaging $\rho=\gamma\alpha$                        | optional graph package                         |
| $P_{6}$     | audit / provenance                            | audit of shell bridge                            | audit of maps and soundness                                    | drive certificate $[a]\neq 0$ and audit         |

As in Subsubsection 13.6.1, the PICA and Cantor columns record update sorts and citations, not role-channel records classified $\texttt{active\_projection}$.

### D.5.3 Combined Nonclaims

The combined nonclaim register records ten cross-model nonclaims, each attached to the realization or realizations it names:

1. No model realization is the whole of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.
2. PICA is not the universal six-symbol algebra.
3. Cantor is audited-shell scoped.
4. The abstract-interpretation family realizes $P_1/P_2/P_5/P_6$, adds $P_4$ when its refinement records contain a strict refinement, and adds $P_3$ when two host closures fail to commute.
5. The graph/cohomology host realizes cohomological drive, not all drive notions.
6. Model-realization evidence is not theorem-grade unless an admissible bridge is supplied.
7. Ablations, simulations, and fallbacks require source-of-truth contracts.
8. Strictness does not imply macro closure or drive.
9. Audit is not final self-certification.
10. No model may overread suppressed content without an admissible bridge.

The combined matrix records four scoped realizations and the per-primitive role coverage they admit. The matrix is not read vertically as a coverage assertion: the framework does not assert that the union of the four realizations covers the whole calculus, in keeping with the model-coverage nonclaim of Subsubsection 13.6.2.
