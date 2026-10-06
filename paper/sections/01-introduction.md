# 1. Introduction

Six Birds theory (SBT) studies how a layer of description closes over what it tracks: which distinctions a coarse description can keep, which updates it can follow, and what it must record to justify its claims. Foundations I and II \citep{Tsiokos2026Foundations,Tsiokos2026FoundationsII} identified six roles that such closure uses. This paper asks how those roles act on one another, and builds a finite calculus, $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$, in which that question has exact answers. Subsection 1.1 explains the question and the object, Subsection 1.2 lists the results in words, Subsection 1.3 states what the paper does not prove, Subsection 1.4 gives a reading guide, and Subsection 1.5 maps every numbered result to its place.

## 1.1 The Question and the Object

### 1.1.1 Starting Point

The six roles, written $P_1,\ldots,P_6$, are:

- $P_1$, *descent*: whether an update respects a grouping of states;
- $P_2$, *representability*: whether a specification can be realized, and which support it may use;
- $P_3$, *route mismatch*: whether two ways of reaching the same result agree;
- $P_4$, *refinement*: stages, refinements, and gluing local data into global data;
- $P_5$, *packaging*: forming objects by quotients and completions;
- $P_6$, *audit*: records, provenance and checks.

Foundations I derived these roles; Foundations II gave them exact meanings and showed that, on a domain $\mathsf{FATCD}$ of finite audited typed closure descriptions, every description has a record with exactly six role channels \citep{Tsiokos2026FoundationsII}. Two earlier models show the roles at work: PICA (the Primitive Interaction Closure Algebra), built on a finite Markov chain whose dynamics come from six primitive mechanisms \citep{Tsiokos2026PICA}, and a Cantor system on which a packaged theory strictly extends a base theory \citep{Tsiokos2026Cantor}.

### 1.1.2 The Question

A role rarely acts alone. An audit ($P_6$) may record a route mismatch ($P_3$); a gate ($P_2$) may cut the cycles of a graph that carry a drive. The paper writes $P_i\leftarrow P_j$ for such a *directed cell*: the *actor* $P_i$ performs an update, using a witness supplied by the *informant* $P_j$. Whether such an interaction happened, failed, or was never attempted is a matter of record, and the paper asks what exact structure these records must have. One might hope for an algebra, a rule that combines two roles into a third or into a verdict. Two cells on the same pair of roles can have different statuses (countermodel $\mathsf{CM}_7$), and Theorem 1 shows that then no such rule recovers cell status. Interactions must therefore be judged cell by cell, from their records.

### 1.1.3 The Object

The calculus $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$, defined in Sections 3 and 4, is a finite typed object with the following parts:

1. the six role labels, with no operation on them;
2. directed cells, each a finite record of its actor and informant, witness, update, threshold, audit, visibility and defect data, together with a profile $\lambda$ recording the levels, scale, regime and other conditions under which the cell is read;
3. seven finite families of statuses, for roles, cells, pairs of roles, promotions, claims, gates and squares, with priority orders for the role, cell, pair, promotion, claim and square classifiers; a few of the conditions that the classifiers test, including whether a role configuration collapses, whether a pair contract forbids a source class, whether partial evidence is present, and whether a pair's branches are compatible, are declared by the instance rather than computed from the record;
4. theory packages, instruments (the declared means by which content is seen or suppressed), source and audit records, and bridges between packages and between visibility regimes;
5. an admissibility check for each component;
6. defect records, which route a claim away from acceptance through the classifier of Section 5;
7. a register of nonclaims, which records what each admissible claim does not assert.

*The directed cell in brief.* An instrument $I$ splits the finite record set $\mathsf{Cont}$ into visible, suppressed, out-of-scope and unknown records. A directed cell $P_i\leftarrow P_j$ with profile $\lambda$ is a record $(W_j,U_i,L,V,\Theta,A,\delta)$: a witness with signature in $\mathsf{Wit}(P_j)$ and an update with signature in $\mathsf{Upd}(P_i)$ (either may be an audited absence marker), a level and lens record $L$, a visibility record $V$ listing any bridges for suppressed fields, thresholds $\Theta$, an audit record $A$, and a defect record $\delta$. It is well formed when the typing and recomputation conditions of Subsubsection 4.3.3 hold, among them that $\delta$ equals its value recomputed from the other fields; this check is decidable under the numerical decidability and computability hypotheses of Theorem 3. Its status is that of the first row of the table of Subsubsection 5.6.6 that holds, in the order $\texttt{outside\_scope}$, $\texttt{absent}$, $\texttt{blocked}$, $\texttt{undefined\_circular}$, $\texttt{collapsed}$, $\texttt{below\_threshold}$, $\texttt{trivial}$, $\texttt{implicit}$, $\texttt{action}$, followed by a final default row $\texttt{blocked}$ that makes the table total; Theorem 4 shows that no well-formed cell reaches it.

The calculus works with finite records. When numerical fields have decidable equality and order and every threshold-evaluated defect is computable in its declared type, its admissibility and classification judgments are finite checks: Theorem 3 decides cell well-formedness, Theorem 4 makes the cell classifier total, and the admissibility predicates of Subsubsections 3.4.1, 3.6.2, 10.2.1 and 11.7.3 are finite checks on declared fields. Some classifier inputs are declared Booleans rather than computed values, including role collapse, source prohibition, partial evidence and branch compatibility. The running example of Subsection 3.8 shows the parts at work. On the subsets of $\{a,b,c\}$, let $E_1$ add $b$ to every set containing $a$, and $E_2$ add $c$ to every set containing $b$. Writing $E_1E_2$ for $E_1\circ E_2$ (apply $E_2$ first), $E_1E_2(\{a\})=E_1(\{a\})=\{a,b\}$ while $E_2E_1(\{a\})=E_2(\{a,b\})=\{a,b,c\}$: the two completions do not commute, which is a route mismatch ($P_3$). An audit that recomputes both sides and records the difference is the directed cell $P_6\leftarrow P_3$, and the classifier gives it the status $\texttt{action}$.

Figure \ref{fig:pipeline} shows how a cell is judged.

\begin{figure}[htbp]
\centering
\begin{tikzpicture}[>={Stealth[length=2mm]},node distance=6mm,
  box/.style={rectangle,rounded corners,draw,align=center,font=\footnotesize,minimum height=9mm,text width=2.3cm}]
\node[box] (rec) {cell record\\ $P_i\leftarrow P_j$};
\node[box,right=of rec] (wf) {well-formedness\\ (Theorem 3)};
\node[box,right=of wf] (def) {defect records\\ (Section 5)};
\node[box,right=of def] (cls) {priority classifier\\ (Subsection 5.6)};
\node[box,below=of cls,text width=3.4cm] (st) {one status for each\\ well-formed cell (Theorem 4)};
\node[box,above=of wf,text width=7.4cm] (ins) {instrument $I$: what is visible, which sources and bridges are admitted, which audits apply};
\draw[->] (rec) -- (wf); \draw[->] (wf) -- (def); \draw[->] (def) -- (cls); \draw[->] (cls) -- (st);
\draw[->,dashed] (ins.south) -- (wf.north);
\draw[->,dashed] (ins.east) -| (cls.north);
\end{tikzpicture}
\caption{How a directed cell is judged. Well-formedness (Theorem 3) includes recomputing the cell's defect records (step 8 of Subsubsection 6.3.1); the classifier reads those defects and assigns each well-formed cell exactly one status; the instrument fixes visibility, admitted sources and bridges, and audit rules throughout.}\label{fig:pipeline}
\end{figure}

## 1.2 What the Paper Proves

The results fall into five groups. Table \ref{tab:map} gives the exact statement and location of each.

### 1.2.1 The Core Calculus (Section 6 and Subsection 4.7)

- *No total algebra* (Theorem 1): cell status does not factor through the pair of roles, so no binary operation on the six labels recovers it. This rules out reading a cell as a product of its two labels; the proof exhibits two records on the pair $P_6\leftarrow P_3$, one classified $\texttt{action}$ and one $\texttt{blocked}$.
- *Typed non-collapse* (Theorem 2): an active cell can have distinct actor and informant, and a cell judgment never forces them to be equal. This rules out identifying the acting role with the informing role; the proof uses the typing rule that takes the informant's data from $\mathsf{Wit}(P_j)$ and the actor's data from $\mathsf{Upd}(P_i)$.
- *Decidability* (Theorem 3): a finite procedure decides whether a candidate cell is well formed, for numerical fields with decidable equality and order and computable threshold data.
- *Unique status* (Theorem 4): the nine substantive rows of the classifier cover every well-formed cell, so the first matching row gives each well-formed cell exactly one status and the default $\texttt{blocked}$ row is never used. The proof shows that a well-formed cell meeting none of the rows $\texttt{outside\_scope}$ through $\texttt{implicit}$ meets the $\texttt{action}$ row; uniqueness is then the first-match rule.
- *Top-down channels* (Subsection 4.7): structural downward influence, such as a completion or a context index, is distinguished from a top-down causal channel, which must pass intervention gates; three propositions make the distinction precise.
- *Separation of status families* (Theorem 5): an active role does not imply an active cell, an active cell does not imply a real pair observable, and a strict promotion implies neither an active cell, nor acceptance of a same-level soundness claim, nor acceptance of a lifted soundness claim under a higher instrument (the same-level case holds because, by Theorem 24, a same-level soundness claim is never accepted).

### 1.2.2 Descent, Packaging, Completion and Strictness (Section 7)

- *Descent* (Theorems 6 and 7): an update descends through a finite map exactly when it respects the map's fibers, and the split pairs record every failure.
- *Closure deficit* (Theorem 8): on a finite Markov host, when the admissible class of coarse-grained kernels contains a kernel that agrees with the conditional macro kernel on the support of the coarse state, its least Kullback--Leibler predictive loss equals a conditional mutual information.
- *Noncommuting completions* (Theorems 9 and 10): two idempotent completions of a finite set need not commute, and their mismatch is a finite defect.
- *Saturation* (Theorem 11): an idempotent map equals each of its positive powers.
- *Strict extension* (Theorems 12 and 13): a new object map fails to factor through an old one exactly when some pair of points is identified by the old map and separated by the new one.
- *Definability* (Theorem 14): a finite map whose image has $k$ elements defines exactly $2^k$ preimage sets.

### 1.2.3 No-Go Results and Countermodels (Sections 8 and 9)

- *No drive on graphs without cycles* (Theorems 15--18): a drive here is a finite-graph $1$-cochain with a nonzero integral around some cycle; for a Markov chain with positive transitions in both directions on each edge, the forward/backward log-ratio cochain is a motivating example when a cycle affinity is nonzero. Such a drive needs a nonzero cohomology class; a forest has none, an exact cochain integrates to zero on every cycle, and gating a graph down to a forest removes the drive.
- *Twelve countermodels* $\mathsf{CM}_1$--$\mathsf{CM}_{12}$ (Section 9 and Appendix C): finite examples, each blocking one tempting overclaim, for instance that packaging implies closure or that holonomy implies drive.

### 1.2.4 Promotion and Instruments (Sections 10 and 11)

- *Promotion* (Theorems 19--22): an accepted, strict or non-strict promotion verdict requires every required core gate to pass; a strict promotion verdict implies that the new object map does not factor through the old one, and a non-strict verdict implies that it does, and a two-point example realizes the strict case.
- *No overreading* (Theorem 23): an accepted claim uses suppressed content only through an admissible visibility bridge. The proof uses the claim classifier's priority order: a nonempty overreading defect prevents $\texttt{accepted}$, because $\texttt{blocked}$ or a higher-priority status is returned first.
- *No same-level self-certification* (Theorem 24): the classifier does not accept an instrument's claim of its own complete soundness without a change of level. The proof uses the same priority order: by the definition of its use-set, the soundness claim refers to its own verdict, so in scope the classifier's rule for such claims gives $\texttt{undefined\_circular}$ or a status ranked higher.
- *Finite rotating audit* (Theorem 25): given a level above a finite stack of instruments, an instrument at that level can audit the stack without certifying its own soundness. With the three levels of the calculus, a stack has at most two instruments below the auditing one.

### 1.2.5 Models (Sections 12--14)

- *Abstract interpretation* (Theorems 26--28 and Model Theorem 29): the closure of an abstract-interpretation host is a packaging, sound transformers are lax descent squares, and exact ones are descents, and representable elements are fixed points; every nonempty finite family of sound hosts over a common concrete domain and transformer realizes $P_1/P_2/P_5/P_6$, and also $P_4$ when its refinement records contain a strict refinement.
- *PICA and Cantor* (Model Theorems 33 and 34): an admissible PICA realization object realizes the cell, pair and provenance fragment of the calculus, and the Cantor shell realizes a strict promotion. The PICA admissibility predicate is shown satisfiable over every nonempty finite Markov chain by stores that reproduce the raw cell statuses; these stores read the chain only through traces of positive transition probability, and the predicate is not checked on the stores of the PICA simulator. The theorem therefore shows that PICA's record format is consistent with the calculus; it does not compute any cell status from the chain.
- *Squares* (Theorems 30--32): in a finite fragment of decorated squares (double-category shape; the axioms are not assumed, Subsubsection 14.1.1), descent and completion appear as decorated squares, and strict extension appears as the absence of a filler.
- *Lean* (Proposition 35): a dated validation run of the Lean artifact passed for every entry of its manifest.

## 1.3 What the Paper Does Not Prove

The negative scope of the paper is stated in Subsubsection 2.4.3, and its numbered nonclaims are recorded in Subsection 15.2. In brief, the paper does not construct a total algebra on the six primitive labels (Theorem 1 shows that none recovers cell status), does not assert an unrestricted exact-six decomposition, does not equate a role channel with an active projection or an active directed cell, does not claim that its four model families realize the whole calculus, and does not claim an instrument that certifies its own complete soundness (Theorems 24 and 25).

## 1.4 Reader's Map

The paper can be entered by two independent routes. The finite mathematics of Theorems 6–18 (Sections 7–8), 26–28 (Section 12) and 30–32 (Section 14) uses Subsections 2.1–2.2, the local definitions of those sections and the definitions they cite, and can be read first. The calculus proper (Theorems 1–5 and 19–25) uses the definitions of Sections 3–5 listed below. For a first reading of Theorems 1–4, start with the running example of Subsection 3.8, the directed-cell table of Subsubsection 5.6.6, whose last column evaluates that example, and the first-match rule at the head of Section 6, then read Section 6 directly. The list below supplies the definitions used to verify well-formedness and the classifier computations in the proofs. The proofs use four objects only: the running-example records (Subsection 3.8), the eight well-formedness conditions (Subsubsection 4.3.3), the defect sets and audit codes glossed in the key of Subsubsection 5.6.6, and the directed-cell table that follows that key; the list says where each ingredient of these four objects is defined. These four passages suffice to follow the directed-cell row computations of Theorems 1–4; the list below says where each field they name is defined and is meant for lookup, not for reading in advance:

- labels and levels: Subsection 2.2;
- records and the running example: Subsubsections 3.1.1, 3.3.1, 3.3.3, 3.4.1, 3.5.2, 3.5.3 and 3.6.2, and Subsections 3.7 and 3.8;
- the cell record and its well-formedness: Subsubsections 4.3.1–4.3.4 and 4.9.2, and Subsection 4.10;
- the cell's defects: Subsubsections 5.1.2, 5.2.1, 5.2.2, 5.3.5, 5.3.6 and 5.5.1–5.5.3;
- the classifier: the reference-graph paragraph of Subsubsection 5.6.5 and the first table of Subsubsection 5.6.6, whose last column evaluates the running example.

Later results cite the judgment families and host definitions they need. Subsections 3.3--3.6 and 4.9--4.10 are reference material; the parts that Theorems 1–4 need are listed above.

The paper is organized into sixteen sections, the last of which is the conclusion (Section 16), and ten appendices (A–J). The reader's map is:

- *Section 2* records preliminaries and scope: finite host mathematics, primitive labels and levels, claim strengths, status discipline, and the global nonclaim conventions.
- *Sections 3 and 4* define the finite audited calculus: the finite typed domain, the central object $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ as a finite typed tuple, theory packages, instruments, source-of-truth records, audit records, visibility bridges, directed-cell records, pair-observable records, promotion bridges, and the per-cell profile schema, and the distinction between structural downward influence and top-down causal channels (Subsection 4.7).
- *Section 5* records the status and defect semantics: the seven status families, the per-component defect schemas, the visibility-defect family, and the classifier priority orders.
- *Sections 6–8* prove the finite theorem spine: the no-total-algebra theorem and the four core finite-interaction theorems (Section 6); the nine descent/packaging/completion/strictness theorems (Section 7); and the four cohomological no-drive theorems on graph-supported drive (Section 8).
- *Section 9* records the countermodel atlas in main-text form, with full sheets for $\mathsf{CM}_{1}$–$\mathsf{CM}_{6}$ and named pointers to $\mathsf{CM}_{7}$–$\mathsf{CM}_{12}$. The full twelve-countermodel atlas is recorded in Appendix C.
- *Section 10* records promotion and stacking: the promotion-bridge schema, the eight-gate machinery, the promotion-status consequences of the classifier, Theorems 19–21, a two-point strict-bridge example (Theorem 22), and the stacking claims not proved.
- *Section 11* records instruments, visibility, and rotating audit: the instrument-indexed claim semantics, the classifier priority, the visibility/suppression discipline, the no-overreading theorem (Theorem 23), the same-level self-audit failure theorem (Theorem 24), the $P_{6}\leftarrow P_{6}$ status separation, the rotating-audit chain and bridge, the finite rotating-audit theorem (Theorem 25), and the instrument-transfer rule.
- *Section 12* records the abstract-interpretation model family: the host data, the realized fragment $P_{1}/P_{2}/P_{5}/P_{6}$, with $P_{4}$ added when the refinement records contain a strict refinement, Theorems 26–28 (closure as packaging, descent as sound transformer, representability as fixedness), and Model Theorem 29.
- *Section 13* records the four scoped model realizations (PICA, Cantor strict-bridge, abstract interpretation, graph/cohomology), Model Theorems 33 and 34, the combined model-realization matrix, and the cross-model role-coverage observation.
- *Section 14* records the secondary high-structure semantics: the finite decorated double-category fragment and the recovery theorems 30–32 (descent-square recovery, completion-pasting recovery, strict extension as no-filler).
- *Section 15* records limitations, nonclaims, and future work, with the register of numbered nonclaims (Subsection 15.2).
- *Section 16* records the conclusion.
- *Appendices A–J* record the long-form supplementary material: full definitions and tables (A), long proofs (B), the full countermodel atlas (C), the four model-realization sheets (D), the high-structure semantics extension (E), the Lean mechanization appendix (F), the dependency graph (G), the deferred and excluded claims register (H), the claim strengths and instrument-indexed forms of the numbered results (I), and the version history (J).

The result numbers do not follow the section order at one point: Model Theorem 29 is in Section 12, Model Theorems 33 and 34 are in Section 13, and Theorems 30–32 are in Section 14. Subsection 1.5 lists every result with its location.

Sections 2–5 supply the formal-development prerequisites for the later calculus results. For a first reading of the mathematical statements of Theorems 6–18 (Sections 7 and 8), Subsections 2.1–2.2 and the local definitions in Sections 7 and 8 suffice: the statements use finite sets and maps, finite probability and information quantities, and finite graph/cohomology data. Likewise, the statements of Theorems 26–28 use Subsubsection 12.1.1 together with their local definitions and the definitions they cite, and those of Theorems 30–32 use Subsection 14.1 and the definitions they cite. Sections 3–5 supply the role, instrument, and status readings around them. Sections 6–11 are the theorem spine: they build on Sections 2–5 and, where stated, on earlier theorem sections. Section 12 depends on Sections 2–5 and 7 and on Subsection 13.1; Section 13 depends on Sections 2–8 and 10–12, and Subsections 13.5–13.6 use the family of Section 12; its model-realization claims are recorded under instruments. Section 14 depends on Sections 2–5 and 7; its visibility and audit square types use Subsubsections 5.5.2 and 11.7.3, and Theorem 32 cites Subsection 13.3 only as an example. Section 15 collects scope discipline from every preceding section. Appendix F records the proof-assistant disclosure table, validation boundary, and audit-grade Proposition 35. The reader interested in model realizations can add Sections 12 and 13 and Appendix D; the reader interested in mechanization can read Appendix F.

## 1.5 Map of Results

Table \ref{tab:map} lists the numbered results, together with the three unnumbered propositions of Subsection 4.7, and where each is stated and proved. Appendix I records the claim strength and verdict of each numbered result, which is its logical status (theorem, model realization, or audit report), not a measure of importance; the three propositions of Subsection 4.7 are proposition-grade with verdict accepted (Subsubsection 2.3.1). Appendix F records the Lean coverage of every row.

\begingroup\small
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.2\linewidth}>{\raggedright\arraybackslash}p{0.58\linewidth}>{\raggedright\arraybackslash}p{0.16\linewidth}@{}}
\caption{Map of results.}\label{tab:map}\\
\toprule
Result & What it establishes & Where \\
\midrule
\endfirsthead
\toprule
Result & What it establishes & Where \\
\midrule
\endhead
\bottomrule
\endfoot
Proposition (Subsection 4.7), top-down gate soundness & An accepted top-down channel claim requires every listed gate to pass, including at least two admissible macro interventions and a passing effect comparison. & §4.7 \\
Proposition (Subsection 4.7), top-down implies structural & An accepted top-down channel claim carries a structural downward dependency. & §4.7 \\
Proposition (Subsection 4.7), structural is insufficient & Structural downward influence alone does not yield an accepted top-down channel claim. & §4.7 \\
Theorem 1 & Two covered directed cells on the pair $(P_6,P_3)$ receive the statuses $\texttt{action}$ and $\texttt{blocked}$, so cell status does not factor through the pair; no binary operation on the six labels, followed by a decoder, recovers cell status. & §6.1 \\
Theorem 2 & Some well-formed active directed cell has distinct actor and informant primitives; a directed-cell judgment never forces the two to be equal. & §6.2 \\
Theorem 3 & Well-formedness of a candidate directed cell is decided by a finite eight-step procedure (for numerical fields with decidable equality and order and computable threshold data). & §6.3 \\
Theorem 4 & The priority classifier assigns exactly one status to each well-formed directed cell. & §6.4 \\
Theorem 5 & Five non-implications between the judgment-attached status families: an active role channel does not imply an active cell, an active cell does not imply a real pair observable, and a strict promotion implies neither an active cell, nor acceptance of a same-level soundness claim (never accepted, by Theorem 24), nor accepted lifted soundness under a higher instrument. & §6.5 \\
Theorem 6 & A finite update descends through a finite map exactly when it respects the fibers of the map. & §7.1 \\
Theorem 7 & The descent defect, the set of split pairs, is empty exactly when the update descends. & §7.2 \\
Theorem 8 & On a finite Markov host, for any class $\mathcal K$ of macro kernels, $\inf_{\mathcal K}\mathcal L_\tau\ge I(X_t;\Pi(X_{t+\tau})\mid\Pi(X_t))$; the minimum over $\mathcal K$ exists and equals $I(X_t;\Pi(X_{t+\tau})\mid\Pi(X_t))$ exactly when $\mathcal K$ contains a kernel that agrees with the conditional macro kernel $K^\ast$ on the support of $\Pi(X_t)$. & §7.3; App.~B.1 \\
Theorem 9 & Two idempotent completion operators on a finite carrier need not commute; an explicit pair is given. & §7.4 \\
Theorem 10 & The route-mismatch defect of two completions is nonempty exactly when they do not commute. & §7.5 \\
Theorem 11 & An idempotent self-map of a finite set equals each of its positive powers. & §7.6 \\
Theorem 12 & A finite object map $\pi_1$ fails to factor through $\pi_0$ exactly when some pair of points is identified by $\pi_0$ and separated by $\pi_1$. & §7.7 \\
Theorem 13 & The factorization defect is nonempty exactly when the factorization fails. & §7.8 \\
Theorem 14 & A finite map whose image has $k$ elements defines exactly $2^k$ preimage sets. & §7.9; App.~B.4 \\
Theorem 15 & A finite graph with first Betti number zero has trivial first cohomology and admits no cycle-supported drive certificate. & §8.2; App.~B.2.1 \\
Theorem 16 & An exact $1$-cochain integrates to zero on every cycle. & §8.3; App.~B.2.2 \\
Theorem 17 & A $1$-cochain has a nonzero cohomology class exactly when some cycle integral is nonzero. & §8.4; App.~B.2.3 \\
Theorem 18 & A gate that turns a graph into a forest leaves trivial first cohomology, and no cycle-supported drive certificate exists on the forest. & §8.5; App.~B.2.4 \\
Theorem 19 & A promotion verdict of accepted, strict or non-strict requires every required core gate to exist and pass. & §10.3 \\
Theorem 20 & A strict promotion verdict implies that the new object map does not factor through the old one. & §10.4 \\
Theorem 21 & A non-strict promotion verdict implies that the new object map factors through the old one. & §10.5 \\
Theorem 22 & A promotion bridge from a one-point layer to a two-point layer over a two-element carrier is admissible and is classified strict. & §10.6 \\
Theorem 23 & Every suppressed record in the use-set of an accepted claim is bridged by an admissible visibility bridge. & §11.4 \\
Theorem 24 & Without a level shift, the claim classifier does not accept an instrument's claim of its own complete soundness. & §11.5 \\
Theorem 25 & Given a level above a finite instrument stack, an extension instrument at that level audits the stack, accepts its compliance exactly when the stack-audit defect is empty, and does not thereby certify its own soundness. & §11.8 \\
Theorem 26 & The closure $\rho=\gamma\alpha$ of a finite abstract-interpretation host is extensive, monotone and idempotent. & §12.2 \\
Theorem 27 & The two soundness inequalities for an abstract transformer, $\alpha F\le F^{\sharp}\alpha$ and $F\gamma\le\gamma F^{\sharp}$, are equivalent. & §12.3 \\
Theorem 28 & The representable concrete elements, the fixed points of $\rho$ and the image of $\gamma$ coincide. & §12.4 \\
Model Theorem 29 & A nonempty finite family of admissible (sound) abstract-interpretation hosts sharing one concrete domain and one concrete transformer realizes the role fragment $P_1/P_2/P_5/P_6$, and $P_1/P_2/P_4/P_5/P_6$ when its refinement records contain a strict refinement; it also realizes $P_3$ when two host closures fail to commute (for instance, the hosts built from the completions of Theorem 9). & §12.5 \\
Theorem 30 & The descent square is exact exactly when its given descended map commutes with the quotient, and a commuting (set-map) filler exists exactly when the update descends through the quotient. & §14.2 \\
Theorem 31 & The completion square is exact exactly when the two completions commute; otherwise their noncommutation is recorded as the square defect $\Delta_3^{\mathrm{comp}}(E_1,E_2)$. & §14.3 \\
Theorem 32 & A factorization filler exists exactly when the new object map factors through the old one. & §14.4 \\
Model Theorem 33 & Stores meeting $\mathsf{AdmPICAReal}$ realize the finite stochastic cell, pair and provenance fragment; the predicate is met over every nonempty finite Markov chain for every raw status table; the satisfying stores read the chain only through positive-probability traces, and the status table is an input, not a consequence. & §13.2 \\
Model Theorem 34 & An admissible audited Cantor shell with a nonempty factorization defect and passing gates realizes a strict bridge; the two-point construction in its Moreover clause has the object-map pattern of Theorem 22 on a cited witness pair. & §13.3 \\
Proposition 35 & A dated strict validation run of the Lean artifact passed: each manifest entry has a checked Lean declaration. & App.~F.5 \\
\end{longtable}
\endgroup

## 1.6 Relation to Existing Work

Theorems 6 and 7 give a finite fiberwise descent criterion, related to descent along a quotient \citep{Grothendieck1959Descent}. Theorem 8 relates predictive closure loss to the question of Markov lumpability \citep{KemenySnell1976,Buchholz1994Lumpability}. Theorems 9--11 use finite completion operators; Theorems 26--28 use closure operators arising from Galois connections \citep{DaveyPriestley2002,Ore1944Galois,CousotCousot1977}. The $P_3$ witness family includes critical pairs familiar from term rewriting \citep{BaaderNipkow1998}. Theorems 24 and 25 concern this paper's claim classifier: $\mathrm{Sound}(I_0)$ is defined to reference its own verdict, and the classifier's circularity rule acts on that reference; no diagonal or arithmetization argument is involved, and the comparison with work on incompleteness and reflection \citep{Goedel1931Incompleteness,Feferman1962Progressions} is one of theme only. The stratification rule behind Theorems 24 and 25, under which a soundness claim judged at level $\ell$ may cite only verdicts of strictly lower levels, follows Tarski's hierarchy of object language and metalanguage \citep{Tarski1936Truth}; Theorem 25 is a finite three-level instance of that ascent. Theorems 15–18 are the finite-graph form of the cycle decomposition of Markov affinities in the network theory of \citet{Schnakenberg1976}; for an irreducible chain with $P_{xy}>0\iff P_{yx}>0$, vanishing of every cycle integral of the log-ratio cochain is Kolmogorov's criterion for detailed balance \citep{Kelly1979}. Section 14 organizes selected constructions as decorated squares in a finite double-category fragment \citep{Ehresmann1963Doubles,GrandisPare1999}.
