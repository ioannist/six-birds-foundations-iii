# Appendix I. Claim Strengths and Instrument-Indexed Forms

The body states and proves each numbered result in the mathematical vocabulary of its section. The calculus also records each result as an instrument-indexed judgment $\Gamma\,;\;\mathsf H\,;\;I\;\vdash\;X\;:\;v$ under the host $\mathsf H$ and instrument $I$ of its section, in the instrument-relative judgment form of Subsubsection 3.4.2. This appendix lists the claim strength of each numbered result (Subsection I.1) and its instrument-indexed form (Subsection I.2).

## I.1 Claim Strengths

The claim strengths of Subsubsection 2.3.1 have the following meanings.

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\begin{center}
\begin{tabularx}{0.96\linewidth}{@{}>{\raggedright\arraybackslash}p{0.24\linewidth}>{\raggedright\arraybackslash}X@{}}
\toprule
Strength & Meaning \\
\midrule
theorem-grade & A statement with a proof in the calculus, stated under explicit host, instrument, package, profile, visibility, threshold, audit, and nonclaim assumptions. \\
proposition-grade & A statement that follows directly from definitions and prior theorems and is proved here. \\
schema-grade & A definition, judgment form, classifier specification, gate list, or discipline rule. Not a standalone theorem; later theorems may quote it. \\
model-only & A statement valid only as a scoped realization or application in a named model host. Not a universal theorem of the calculus. \\
countermodel-grade & A finite construction together with the no-go statement it supports. The construction and the no-go are both required. \\
future-work & A statement that is plausible from the calculus but not proved in this paper. Stated only in the limitations and future-work section. \\
excluded & A statement that this paper does not assert as a theorem, model realization, schema, or future-work claim. Recorded in Appendix H.2 and in the limitations discussion, with the theorem, countermodel, or nonclaim that supports the exclusion. \\
\bottomrule
\end{tabularx}
\end{center}
\endgroup

A claim strength scopes a statement; it does not rank it. Subsection I.2 uses model-grade, the synonym of model-only for a model theorem, and three refined tags: audit-grade for the validation record of Proposition 35, theorem-grade with assumptions for Theorem 8, whose statement carries finite probabilistic assumptions, and theorem-grade example for Theorem 22, which is an explicit instance.

## I.2 Instrument-Indexed Forms of the Numbered Results

For a theorem the verdict is $\texttt{accepted}$. For a model theorem the verdict is $\texttt{model\_realization}$: it records that the host supplies an admissible model-realization map for the declared fragment, in the sense of the model-realization convention of Subsection 13.1, and it is not the $\texttt{accepted}$ verdict of a theorem-grade claim. For Proposition 35 the verdict is $\texttt{audit\_report}$. Each entry gives the result, its claim strength, and its judgment.

**Theorem 1 (NoTotalAlgebra)**, theorem-grade:

$$
\Gamma\,;\;\mathcal T\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{NoTotalAlgebra}\;:\;\texttt{accepted},
$$

where $\mathcal T$ is the finite admissible package carried by the instance and all cell records are interpreted in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.

**Theorem 2 (TypedNonCollapse)**, theorem-grade:

$$
\Gamma\,;\;\mathcal T\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{TypedNonCollapse}\;:\;\texttt{accepted}.
$$

**Theorem 3 (CellWellFormednessDecidability)**, theorem-grade:

$$
\Gamma\,;\;\mathcal T\,;\;I_{\mathrm{fin}}\;\vdash\;\forall\,C,\;(\mathsf{WFCell}(C)=\texttt{wf}\iff C\text{ well formed})\;:\;\texttt{accepted}.
$$

**Theorem 4 (CoveredCellUniqueStatus)**, theorem-grade:

$$
\Gamma\,;\;\mathcal T\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{CoveredCellUniqueStatus}\;:\;\texttt{accepted}.
$$

**Theorem 5 (StatusFamilySeparation)**, theorem-grade:

$$
\Gamma\,;\;\mathcal T\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{StatusFamilySeparation}\;:\;\texttt{accepted}.
$$

**Theorem 6 (DescentThroughQuotient)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{DescentThroughQuotient}\;:\;\texttt{accepted}.
$$

**Theorem 7 (DescentDefectEquivalence)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{DescentDefectEquivalence}\;:\;\texttt{accepted}.
$$

**Theorem 8 (FiniteMarkovClosureDeficit)**, theorem-grade with assumptions:

$$
\Gamma\,;\;\mathsf H_{\mathrm{prob}}\,;\;I_{\mathrm{prob}}\;\vdash\;\textsc{FiniteMarkovClosureDeficit}\;:\;\texttt{accepted}.
$$

**Theorem 9 (NoncommutingCompletions)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{NoncommutingCompletions}\;:\;\texttt{accepted}.
$$

**Theorem 10 (CompletionPastingDefect)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{CompletionPastingDefect}\;:\;\texttt{accepted}.
$$

**Theorem 11 (IdempotentSaturation)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{IdempotentSaturation}\;:\;\texttt{accepted}.
$$

**Theorem 12 (StrictExtensionNonfactorization)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{StrictExtensionNonfactorization}\;:\;\texttt{accepted}.
$$

**Theorem 13 (FactorizationDefectEquivalence)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{FactorizationDefectEquivalence}\;:\;\texttt{accepted}.
$$

**Theorem 14 (FixedInterfaceDefinabilityBound)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{FixedInterfaceDefinabilityBound}\;:\;\texttt{accepted}.
$$

**Theorem 15 (ForestNoDrive)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;\textsc{ForestNoDrive}\;:\;\texttt{accepted}.
$$

**Theorem 16 (ExactFormNullDrive)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;\textsc{ExactFormNullDrive}\;:\;\texttt{accepted}.
$$

**Theorem 17 (NonzeroAffinityEquivalence)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;\textsc{NonzeroAffinityEquivalence}\;:\;\texttt{accepted}.
$$

**Theorem 18 (GatingAffinitySuppression)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{graph}}\,;\;I_{\mathrm{graph}}\;\vdash\;\textsc{GatingAffinitySuppression}\;:\;\texttt{accepted}.
$$

**Theorem 19 (PromotionGateSoundness)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{PromotionGateSoundness}\;:\;\texttt{accepted}.
$$

**Theorem 20 (StrictPromotionImpliesNonfactorization)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{StrictPromotionImpliesNonfactorization}\;:\;\texttt{accepted}.
$$

**Theorem 21 (NonStrictPromotionImpliesFactorization)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{NonStrictPromotionImpliesFactorization}\;:\;\texttt{accepted}.
$$

**Theorem 22 (Toy22StrictBridge)**, theorem-grade example:

$$
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{fin}}\;\vdash\;\textsc{Toy22StrictBridge}\;:\;\texttt{accepted},
$$

where $I_{\mathrm{fin}}$ meets conditions 1–9 of Subsubsection 2.4.1 in the instance of Theorem 22 extended by this claim record, its audit and its evidence source. The promotion instrument $I_{\mathrm{prom}}$ of Subsubsection 10.6.1 classifies the bridge, but would assign this claim $\texttt{outside\_scope}$: its scope contains only the records of $\mathcal T_0$, $\mathcal T_1$ and the bridge.

**Theorem 23 (NoOverreadingSuppression)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{instr}}\,;\;I_{\mathrm{instr}}\;\vdash\;\textsc{NoOverreadingSuppression}\;:\;\texttt{accepted}.
$$

**Theorem 24 (SameLevelSelfAuditFailure)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{instr}}\,;\;I_{\mathrm{instr}}\;\vdash\;\textsc{SameLevelSelfAuditFailure}\;:\;\texttt{accepted}.
$$

**Theorem 25 (FiniteRotatingAudit)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{instr}}\,;\;I_{\mathrm{instr}}\;\vdash\;\textsc{FiniteRotatingAudit}\;:\;\texttt{accepted}.
$$

**Theorem 26 (AIClosureAsPackaging)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{AI}}\,;\;I_{\mathrm{AI}}\;\vdash\;\textsc{AIClosureAsPackaging}\;:\;\texttt{accepted}.
$$

**Theorem 27 (AIDescentAsSoundTransformer)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{AI}}\,;\;I_{\mathrm{AI}}\;\vdash\;\textsc{AIDescentAsSoundTransformer}\;:\;\texttt{accepted}.
$$

**Theorem 28 (AIRepresentabilityAsFixedness)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{AI}}\,;\;I_{\mathrm{AI}}\;\vdash\;\textsc{AIRepresentabilityAsFixedness}\;:\;\texttt{accepted}.
$$

**Model Theorem 29 (AIModelFamily)**, model-grade, for a family whose refinement records contain a pair with $\rho_k\neq\rho_\ell$:

$$
\Gamma\,;\;\mathsf H_{\mathrm{AI}}\,;\;I_{\mathrm{AI}}\;\vdash\;\mathsf{AIFam}_{\mathrm{fin}}\;\models\;\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}{}^{P_1/P_2/P_4/P_5/P_6}\;:\;\texttt{model\_realization}.
$$

Otherwise the same form holds with the fragment $P_1/P_2/P_5/P_6$. The family additionally realizes $P_3$ when two host closures fail to commute.

**Theorem 30 (DescentSquareRecovery)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{DC}}\,;\;I_{\mathrm{DC}}\;\vdash\;\textsc{DescentSquareRecovery}\;:\;\texttt{accepted}.
$$

**Theorem 31 (CompletionPastingRecovery)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{DC}}\,;\;I_{\mathrm{DC}}\;\vdash\;\textsc{CompletionPastingRecovery}\;:\;\texttt{accepted}.
$$

**Theorem 32 (StrictExtensionAsNoFiller)**, theorem-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{DC}}\,;\;I_{\mathrm{DC}}\;\vdash\;\textsc{StrictExtensionAsNoFiller}\;:\;\texttt{accepted}.
$$

**Model Theorem 33 (PICA Model-Realization)**, model-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{PICA}}\,;\;I_{\mathrm{PICA}}\;\vdash\;\mathsf{PICAReal}_{\mathrm{fin}}\;\models\;\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin\text{-}stoch}}{}^{\,\mathrm{cell}/\mathrm{pair}/\mathrm{prov}}\;:\;\texttt{model\_realization}.
$$

**Model Theorem 34 (Cantor Strict-Bridge Realization)**, model-grade:

$$
\Gamma\,;\;\mathsf H_{\mathrm{CantorShell}}\,;\;I_{\mathrm{Cantor}}\;\vdash\;\mathsf{CantorShell}_{\mathrm{aud}}\;\models\;\mathbf{StrictBridge}_{0\to 1}^{\mathrm{audited\ shell}}\;:\;\texttt{model\_realization}.
$$

**Proposition 35 (MechanizationTargetFeasibility)**, audit-grade:

$$
\begin{aligned}
\Gamma\,;\;\mathsf H_{\mathrm{fin}}\,;\;I_{\mathrm{meta}}\;\vdash\;&\text{the manifest-scoped validation artifact checks}\\
&\text{the finite audited paper declarations}\;:\;\texttt{audit\_report}.
\end{aligned}
$$

The verdict $\texttt{audit\_report}$ is not a judgment verdict: it names the recorded outcome of the validator run of Proposition 35, a repository-level validation audit. It does not change theorem-grade results into model-realization results, and it does not promote model-grade statements to universal theorem-grade claims.
