# 2. Preliminaries and Scope

This section fixes the host mathematics, the primitive labels, the level set, the claim-strength discipline, and the scope statement that the rest of the paper will assume. Every later definition, theorem, and model realization is interpreted inside the domain declared here, or inside an explicitly named finite extension host. No object, judgment, or proof in this paper depends on hosts that fall outside the inventory below. On a first reading, Subsection 2.2 (the six roles and their levels) is enough; Subsections 2.1, 2.3 and 2.4 can be consulted when later sections cite them.

## 2.1 Finite Host Mathematics

The calculus represents its judgments and the data they use by finite typed records on declared hosts; each judgment is relative to a declared instrument. Later sections take these conventions for granted and do not repeat them.

### 2.1.1 Base Host

The base host of the calculus is

$$
\begin{aligned}
\mathsf H_{\mathrm{fin}} \;=\; \text{finite sets, finite maps, finite relations, finite records,}\\
\text{finite diagrams, finite graphs, finite audit records}.
\end{aligned}
$$

All carriers, lenses, packages, instruments, profiles, witnesses, updates, defects, gates, audits, statuses, and judgment instances introduced in Sections 3 and 4 are objects of $\mathsf H_{\mathrm{fin}}$ unless an extension host is declared. In particular, every carrier, index set and record is finite, every diagram has finitely many vertices and edges, and every audit record is a finite tuple of finite fields. Fields used by a finite decision procedure have declared types with effective equality and the operations and order comparisons that procedure uses. The macro-kernel class used in Theorem 8 and the cochain and cycle spaces used in Theorems 15–18 may be infinite. The mathematical identities and equivalences of Theorems 6, 7 and 10–13 hold for arbitrary sets and maps; the cardinality identity of Theorem 14 holds for an arbitrary map $f$, with $2^{|\mathrm{im}(f)|}$ read as a cardinal; and the closure, soundness, descent and representability conclusions of Theorems 26–28 hold between arbitrary posets under their stated Galois and monotonicity hypotheses. Finite-test, finite-record and audited-realization conclusions retain their finite-host hypotheses.

The base host carries the following structures, each used by a specific judgment family later in the paper:

| Structure | Use in the calculus |
| --- | --- |
| finite sets | carriers $Z$, primitive labels $\mathbb P$, witness/update domains, status sets |
| finite maps | lenses $f:Z\to X$, quotients $q$, completion endomaps $E$, object maps $\pi_j$, update maps $U_i$ |
| finite relations | equivalence on a carrier, dependency between primitives, gluing compatibility on a cover |
| finite records | theory packages $\mathcal T$, instruments $I$, directed cells, promotion bridges, claim records, defect records, gate records |
| finite diagrams | finite decorated squares, descent squares, refinement and gluing diagrams |
| finite graphs | support graphs, finite-dimensional cycle/cochain complexes for the drive module |
| finite audit records | provenance, replay traces, source identifiers, threshold checks, nonclaims |

### 2.1.2 Permitted Extension Hosts

The following finite or scoped extension hosts are permitted in the paper. Each is named and scoped under its own rules, and used only for the specific theorem groups indicated. No theorem in the paper uses an extension host implicitly; every appearance is gated by an explicit declaration on the surrounding judgment.

$$
\mathsf{Host}\;=\;\bigl\{\mathsf H_{\mathrm{fin}},\,\mathsf H_{\mathrm{prob}},\,\mathsf H_{\mathrm{graph}},\,\mathsf H_{\mathrm{AI}},\,\mathsf H_{\mathrm{PICA}},\,\mathsf H_{\mathrm{CantorShell}},\,\mathsf H_{\mathrm{DC}},\,\mathsf H_{\mathrm{instr}}\bigr\}.
$$

\begingroup
\setlength{\LTleft}{0pt}
\setlength{\LTright}{0pt}
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.21\linewidth}>{\raggedright\arraybackslash}p{0.35\linewidth}>{\raggedright\arraybackslash}p{0.34\linewidth}@{}}
\toprule
Host & Content & Scope \\
\midrule
\endfirsthead
\toprule
Host & Content & Scope \\
\midrule
\endhead
\bottomrule
\endfoot
\bottomrule
\endlastfoot
$\mathsf H_{\mathrm{fin}}$ & finite sets, maps, relations, records, diagrams, graphs, audit records & base host for typed-calculus theorems \\
$\mathsf H_{\mathrm{prob}}$ & finite stochastic kernels on finite state spaces, finite information quantities & Markov closure-deficit theorem, under explicit kernel/partition assumptions \\
$\mathsf H_{\mathrm{graph}}$ & finite graphs, finite cycle bases, finite-dimensional (finitely generated free) cochain/coboundary complexes & graph/cohomology drive module of Section 8 \\
$\mathsf H_{\mathrm{AI}}$ & finite concrete domains, finite abstract domains, finite abstraction/concretization pairs, finite sound transformers & abstract-interpretation model family of Section 12 \\
$\mathsf H_{\mathrm{PICA}}$ & finite PICA realization records (rows, columns, statuses, source records, audit restrictions) & PICA model-realization theorem of Section 13 \\
$\mathsf H_{\mathrm{CantorShell}}$ & audited Cantor shell records (base/target packages, interfaces, audit) & Cantor strict-bridge realization of Section 13 \\
$\mathsf H_{\mathrm{DC}}$ & finite decorated double-category fragment (objects, horizontal and vertical arrows, decorated squares, finite strict pasting) & secondary high-structure semantics of Section 14 \\
$\mathsf H_{\mathrm{instr}}$ & instrument records, visibility maps, rotating-audit chains & instrument and self-reference theorems of Section 11 \\
\end{longtable}
\endgroup

The core and finite extension hosts use finite carriers and records: $\mathsf H_{\mathrm{prob}}$ uses finite state spaces and finite kernels, $\mathsf H_{\mathrm{graph}}$ uses finite vertex and edge sets, $\mathsf H_{\mathrm{AI}}$ uses finite abstract domains and finite sound transformers, and so on. An extension host never licenses an infinitary construction, except the quantification over macro-kernel, cochain and cycle spaces and the arbitrary-set and arbitrary-poset forms of Theorems 6, 7, 10–14 and 26–28 noted in Subsubsection 2.1.1. The Cantor host is the one host whose underlying system is not finite: it packages finite records over the audited shell of a continuous Cantor system, its strictness input comes from the cited Cantor theorem, and the calculus does not assert that the shell itself is finite.

### 2.1.3 Excluded Hosts

The following hosts are excluded. A claim that depends on any of them, however informally stated, falls outside the formal scope of this paper.

- **Unrestricted infinite reflection towers.** No theorem in the paper requires an infinite tower of theories, languages, or instruments closed under reflection. Every audit chain used in Section 11 is finite, and the rotating-audit theorem is stated for chains with strictly increasing levels in the three-element $\mathsf{Lev}$, so its hypothesis forces $N\le1$.
- **Unrestricted semantic universes.** No theorem assumes a model class closed under arbitrary semantic operations. The model families of Section 13 are scoped finite hosts and are accepted only as model realizations of named fragments of the calculus.
- **Empirical systems without bridge records.** No theorem appeals to a physical, biological, or computational system unless its content has been packaged into a finite record with explicit bridge data, source records, audit, and nonclaims. An empirical-bridge assertion in this paper is admissible only as a finite record on a named host, never as a bare claim about an external system.
- **Untyped total six-symbol products.** No definition or theorem assumes a total binary operation $*:\mathbb P^2\to\mathbb P$ on the primitive labels, and no later object is interpreted as a primitive product. The later no-total-algebra theorem is stated against the typed witness, update, profile, and status requirements of the calculus, so subsequent uses of pair notation $(P_i,P_j)$ or directed-cell notation $P_i\leftarrow P_j$ are typed bridge judgments rather than algebraic products.

The host inventory above, together with these exclusions, fixes what counts as an admissible mathematical environment for the paper. Section 3 builds the calculus over this inventory; Section 4 defines its central judgment families; later sections invoke individual extension hosts only where named.

## 2.2 Primitive Labels and Levels

### 2.2.1 Primitive Set

The primitive set of the calculus is the fixed finite set

$$
\mathbb P \;=\; \{P_1,P_2,P_3,P_4,P_5,P_6\}.
$$

The labels $P_1,\ldots,P_6$ are role names. They are not elements of an interaction algebra: there is no total binary operation on $\mathbb P$ in this paper, and the later no-total-algebra theorem makes that exclusion formal. Pair notation $(P_i,P_j)$ names a primitive pair only; it does not determine status, effect, claim strength, visibility, or audit. Directed-cell notation $P_i\leftarrow P_j$ refers to a typed judgment whose admissibility depends on the witness, update, profile, level, visibility, threshold, audit, and defect data attached to the judgment, not on the primitive labels alone.

The set $\mathbb P$ is reserved for primitive labels for the duration of the paper. Where a probability kernel and a primitive label appear in the same local context, the kernel is written with an explicit subscript or as a named transition operator so that no expression $P\cdot P'$ or $Px$ is ambiguous between a primitive label and a kernel application.

### 2.2.2 Informal Role Gloss

Each primitive carries a stable role description, fixed for the entire paper. The descriptions are role labels, not propositions: they identify the kind of typed witness, update, defect, and audit data that a primitive participates in, and they are not theorems about what a primitive does in any particular host.

- $P_1$: descent, closure of updates, rewrite compatibility, transport of content. Witness data record descent successes, descent obstructions, and rewrite/closure deficits; updates install descended maps or rewrites.
- $P_2$: representability, gating, admissibility, support control. Witness data record representability or its failure, support, capacity, and gate decisions; updates mark representable or non-representable status and adjust support.
- $P_3$: route mismatch, holonomy, critical pairs, pasting. Witness data record commutator failures, holonomy values, critical-pair mismatches, and pasting defects; updates record these as typed defect entries.
- $P_4$: refinement, staging, gluing, local-to-global structure. Witness data record stages, refinements, covers, and local/global obstructions; updates refine the lens, advance the stage, or record a gluing defect.
- $P_5$: packaging, completion, objecthood, idempotence. Witness data record package maps, quotients, completion outcomes, and fixed points; updates install a package, apply a completion, or record a fixed-point residual.
- $P_6$: audit, provenance, replay, source-of-truth, drive certification. Witness data record audit checks, provenance, source identity, threshold checks, and (where present) drive certificates; updates add an audit record, commit a source, or certify drive or no-drive.

The audit face $P_6$ and the drive face $\mathrm{P6}_{\mathrm{drive}}$ are distinguished: a generic $P_6$ audit witness is not a drive certificate. Section 8 isolates the drive face inside the graph/cohomology module, and the no-drive theorems there are stated for $\mathrm{P6}_{\mathrm{drive}}$ specifically. The judgment discipline of the calculus preserves this separation throughout.

### 2.2.3 Levels

The finite level set used by the paper is

$$
\mathsf{Lev} \;=\; \{\mathsf{Beh},\,\mathsf{Ver},\,\mathsf{Str}\},
$$

with the following roles.

| Level | Role |
| --- | --- |
| $\mathsf{Beh}$ | behavioral level: model traces, runs, observed dynamics, raw data |
| $\mathsf{Ver}$ | verification level: instruments, audits, checks, replay, certification |
| $\mathsf{Str}$ | structural level: theorems, objects, packages, interfaces, definitional content |

The levels are ordered $\mathsf{Beh}<\mathsf{Ver}<\mathsf{Str}$; the rotating-audit chains of Section 11 compare instrument levels in this order, and "above" and "highest level" refer to it. Every directed-cell, pair-observable, promotion, and claim judgment in Sections 4 and beyond carries an explicit level annotation drawn from $\mathsf{Lev}$. A judgment whose compared level tags differ is admissible only when an explicit level bridge is recorded; for a directed cell these are the tags of $\lambda$, $L$, $W_j$, $U_i$ (step 5 of Subsubsection 6.3.1), for a claim those of its level profile and use-set (Subsubsection 11.1.2), and for other families those their schemas name. The admissible level bridges are

$$
\texttt{translation},\quad\texttt{lift},\quad\texttt{forgetting},\quad\texttt{reflection},
$$

each interpreted as a finite typed map between level-tagged records. A directed cell whose level tags differ and whose level record $L$ carries no level bridge is malformed (Subsubsection 6.3.1, step 5) and receives no status. For other judgment families, the applicable profile or judgment schema checks any required level bridge; a missing bridge makes the judgment inadmissible. The claim classifier returns $\texttt{outside\_scope}$ exactly when the claim's host tag is not in $\mathsf{Hosts}_I$, a level tag of its $\mathsf{LevelProfile}$ is not in $\mathsf{Levels}_I$, $\mathsf{Use}(\varphi)\not\subseteq\mathsf{Scope}_I$, or the claim type is not in $\mathsf{ClaimTypes}_I$; the cell classifier returns it when the host tag of $C$, a level tag of $L$, or part of its content lies outside $\mathsf{Scope}_I$.

Levels are not a substitute for the channel/activation distinction: a primitive may be associated with a level annotation without producing an active witness at that level, and no theorem in this paper infers an active witness from a level tag alone. Levels are not a substitute for instruments either: a level fixes which kind of content a judgment refers to, while an instrument fixes which content is visible, suppressed, or outside scope and what claim strengths are admissible. Both are required.

## 2.3 Claim Strengths and Status Discipline

### 2.3.1 Claim Strengths

Every numbered statement in this paper carries a claim strength, drawn from a finite taxonomy: theorem-grade (proved in the calculus under its stated assumptions), proposition-grade (following directly from definitions and earlier theorems), schema-grade (a definition, judgment form or rule, not a theorem), model-only (valid in a named model host), countermodel-grade (a finite construction together with the no-go it supports), future-work (plausible but not proved here), and excluded (not asserted). Claim strengths apply to theorems, propositions, definitions, classifier rules, model-realization statements, countermodels, and the contents of the limitations section. Countermodel-grade applies to the unnumbered sheets $\mathsf{CM}_1$--$\mathsf{CM}_{12}$; numbered results proved by a finite countermodel are recorded as theorem-grade. Model-only statements are also called model-grade; the two terms name the same strength. Appendix I also uses three refinements of these strengths: theorem-grade with assumptions (a theorem-grade statement whose assumptions include finite probabilistic data, Theorem 8), theorem-grade example (a theorem-grade explicit instance, Theorem 22) and audit-grade (the validation record of Proposition 35). A result's recorded verdict is $\texttt{accepted}$ for theorem-grade and proposition-grade results, $\texttt{model\_realization}$ for model-grade results and $\texttt{audit\_report}$ for the audit-grade record; only $\texttt{accepted}$ is a value of the claim-status family. The meaning of each strength, and the strength and verdict of each numbered result, are recorded in Appendix I.

A theorem-grade statement does not become more general by being labelled theorem-grade; it remains scoped by the host, instrument, package, profile, visibility, threshold, audit, and nonclaim assumptions on its judgment line (Appendix I). A model-only statement does not gain universal force by being placed beside a theorem-grade statement; the surrounding model-realization discipline of Section 13 keeps the two distinct.

Throughout, a statement "$X\not\Rightarrow Y$" means that some admissible instance satisfies $X$ and fails $Y$; the indices, profiles and records of the instance are named where the statement is proved. The countermodel-grade label is reserved for statements of this form supported by a finite explicit construction that exhibits an instance of $X$ together with a failure of $Y$. The countermodels of Section 9 and Appendix C have this strength (in $\mathsf{CM}_6$ (`blocks`) and $\mathsf{CM}_{12}$ (`destroys`) the universal clause of Subsubsection 4.6.1 is supplied by Theorems 24 and 18, and the construction exhibits the antecedent; in $\mathsf{CM}_2$ the second conjunct of `requires_bridge` comes from the bridge record of Subsubsection 9.3.5); the numbered no-go and separation results of Sections 6, 7, 8 and 10 are theorem-grade, several of them proved by a finite countermodel.

### 2.3.2 Status Families

The calculus uses several distinct status families, one per judgment family. They are introduced informally here and defined fully in Sections 4 and 5. The families are:

- role-channel statuses, classifying the standing of a primitive role channel under an instrument, with values such as $\texttt{active\_projection}$, $\texttt{below\_threshold}$, $\texttt{collapsed\_boundary\_case}$, $\texttt{absent\_with\_record}$, and $\texttt{inapplicable\_outside\_scope}$ inherited from the channel discipline of Foundations II;
- directed-cell statuses, classifying typed directed-cell judgments $P_i\leftarrow P_j$ with values such as $\texttt{action}$, $\texttt{implicit}$, $\texttt{trivial}$, $\texttt{blocked}$, $\texttt{undefined\_circular}$, $\texttt{below\_threshold}$, $\texttt{collapsed}$, $\texttt{absent}$, and $\texttt{outside\_scope}$;
- pair-observable statuses, classifying unordered pair observables, with values $\texttt{real}$, $\texttt{real\_provisional}$, $\texttt{real\_duplicated}$, and $\texttt{blocked}$;
- promotion statuses, classifying promotion-bridge judgments, with values $\texttt{candidate}$, $\texttt{accepted}$, $\texttt{strict}$, $\texttt{non\_strict}$, $\texttt{failed\_descent}$, $\texttt{failed\_stability}$, $\texttt{failed\_audit}$, $\texttt{failed\_no\_smuggling}$, $\texttt{local\_only}$, $\texttt{globally\_obstructed}$, and $\texttt{outside\_scope}$;
- claim statuses, classifying instrument-indexed claim records, with values $\texttt{accepted}$, $\texttt{rejected}$, $\texttt{provisional}$, $\texttt{blocked}$, $\texttt{outside\_scope}$, $\texttt{absent\_with\_record}$, $\texttt{below\_threshold}$, $\texttt{failed\_audit}$, and $\texttt{undefined\_circular}$;
- gate statuses, classifying individual gate checks during promotion or claim acceptance, with values $\texttt{pass}$, $\texttt{fail}$, $\texttt{not\_required}$, $\texttt{not\_checked}$, and $\texttt{outside\_scope}$, together with the strictness-gate refinements defined later;
- square statuses, classifying decorated-square fillers in the secondary high-structure module of Section 14, with values $\texttt{exact}$, $\texttt{lax}$, $\texttt{obstructed}$, $\texttt{blocked}$, $\texttt{outside\_scope}$, $\texttt{failed\_audit}$, $\texttt{undefined\_circular}$, and $\texttt{provisional}$.

The discipline of the paper is that these families are kept apart. No theorem in the paper infers a value in one family from a value in another without an explicit bridge rule. In particular, role-channel activity does not by itself imply directed-cell action, directed-cell action does not imply pair-observable realness, claim acceptance under one instrument does not imply instrument-free truth or acceptance under another instrument, and gate passage does not imply theorem-grade strength of a surrounding statement. Section 6 includes the formal status-family separation theorem that closes off the most common collapses.

### 2.3.3 No-Overreading Rule

The visibility discipline of the paper is summarized informally as the no-overreading rule:

> An accepted claim under instrument $I$ may use only the content that $I$ marks visible, together with content that an admissible bridge under $I$ has connected to visible content. Suppressed content not connected by an admissible bridge cannot support an accepted claim, even when the suppressed content is in fact correct. The test runs on $\mathsf{Use}(\varphi)$: $\mathsf{Refs}(\varphi)$ is included directly, while the evidence, threshold and audit fields contribute the one-step content references of Subsubsection 5.5.2. A suppressed dependency outside this use-set is not tested by the visibility rule; listing it in $\mathsf{Refs}(\varphi)$ brings it within that test.

The rule is not a metaphysical statement about truth. Suppressed content is not asserted to be false, and content outside the scope of $I$ is not asserted to be unknowable. The rule is a record-level constraint: an instrument's acceptance verdict is admissible only when the use-set of the claim has been audited against the instrument's visibility map and bridge data, and any suppressed dependency without a bridge invalidates acceptance under $I$. The formal statement, with the definition of the overreading defect and the precise acceptance rule, appears in Section 11; the rule is invoked in earlier sections only at this informal level.

### 2.3.4 Three Vocabularies

The paper uses three vocabularies that are easy to conflate. The table places them side by side.

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\begin{center}
\begin{tabularx}{0.96\linewidth}{@{}>{\raggedright\arraybackslash}p{0.17\linewidth}>{\raggedright\arraybackslash}X>{\raggedright\arraybackslash}p{0.2\linewidth}@{}}
\toprule
Vocabulary & What it records, and its values & Where \\
\midrule
Claim strength & The logical status of a numbered statement of the paper, not its importance: theorem-grade, proposition-grade, schema-grade, model-only, countermodel-grade, future-work, or excluded. Appendix I lists the model theorems as model-grade and Proposition 35 as audit-grade. & Subsubsection 2.3.1; Appendix I \\
Claim status & How an instrument's classifier adjudicates a finite claim record: $\texttt{accepted}$, $\texttt{rejected}$, $\texttt{provisional}$, $\texttt{blocked}$, $\texttt{outside\_scope}$, $\texttt{absent\_with\_record}$, $\texttt{below\_threshold}$, $\texttt{failed\_audit}$, or $\texttt{undefined\_circular}$. & Subsubsections 4.8.2, 5.1.5 and 5.6.5 \\
Verdict of a result & The verdict in the instrument-indexed form of a numbered result: $\texttt{accepted}$ for a theorem, $\texttt{model\_realization}$ for a model theorem, and $\texttt{audit\_report}$ for Proposition 35, which is not a judgment verdict but names the recorded outcome of the validator run of that proposition. & Subsection 13.1; Appendix I.2 \\
\bottomrule
\end{tabularx}
\end{center}
\endgroup

## 2.4 Paper Scope Statement

### 2.4.1 Formal Scope

All judgments, theorems, propositions, schemas, model realizations, and countermodels in this paper are interpreted inside

$$
\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}
$$

or inside one of the explicitly named extension hosts of Subsubsection 2.1.2. The body states each theorem in plain mathematical form, and that statement is the theorem: it holds under its mathematical hypotheses alone. Readers interested only in the mathematics can skip the rest of this subsection and Appendix I: no proof in Sections 6–14 uses the instrument-indexed forms. The instrument-indexed form of each theorem, listed in Appendix I.2, records the result under any admissible instrument $I$ satisfying the following conditions:

1. the associated claim record is well formed under admissible $\Gamma,\mathcal T$;
2. every record referred to by its content is present in $\Gamma$ or $\mathcal T$ rather than represented by an audited absence;
3. the claim's host and level tags lie in $\mathsf{Hosts}_I$ and $\mathsf{Levels}_I$ and its type in $\mathsf{ClaimTypes}_I$;
4. its use-set lies in $\mathsf{Visible}_I$, its own verdict reference $\ulcorner\varphi,I\urcorner$ (a record of $\mathsf{Cont}$ whose two reference fields name $\varphi$ and $I$; Subsubsection 5.6.5) is not reachable from $\mathsf{Use}(\varphi)$ by resolved references (reachability in the reference graph of Subsubsection 5.6.5, whose edges go from each record to every record named by one of its resolved reference fields), and, if its type is $\texttt{soundness}$, it contains no verdict reference $\ulcorner\psi,I'\urcorner$ with $\mathsf{Level}(I')\ge\mathsf{Level}(I)$;
5. its evidence references are source records admitted by $\mathsf{EvidencePolicy}_I$ and $\mathsf{SourcePolicy}_I$, and each passes $\Theta_{\mathrm{source}}$ under the default entry of $\mathsf{SourcePolicy}_I$ (Subsubsection 5.3.6);
6. the check rules of $I$ for its type reject exactly when the recomputed finite witnesses falsify the conclusion;
7. its thresholds are exact tests on the recomputed witnesses and each evaluates to $\texttt{pass}$ for this claim instance;
8. no partial evidence is declared;
9. its audit defect is $\texttt{audit\_passes}$.

The names $I_{\mathrm{fin}}$, $I_{\mathrm{prob}}$, $I_{\mathrm{graph}}$, $I_{\mathrm{instr}}$, $I_{\mathrm{AI}}$ and $I_{\mathrm{DC}}$ denote any such instrument for the corresponding host; $I_{\mathrm{meta}}$ names the instrument under which the validator run of Proposition 35 is recorded, whose outcome $\texttt{audit\_report}$ is not a claim status. Sections 9, 12 and 13 also use $I_{\mathrm{fin}}$, $I_{\mathrm{graph}}$, $I_{\mathrm{instr}}$ and $I_{\mathrm{AI}}$ for particular instruments, the judging instrument of a countermodel dependency (Subsubsection 9.1.1) or the instrument auditing a model host (Subsubsections 12.1.1 and 13.4.1); those instruments are fixed by their sections and need not meet conditions 1–9.

For a result quantified over records, the instrument-indexed form is read per instance. Fix an admissible $\mathfrak D$ and a tuple of its records meeting the hypotheses, and extend $\mathfrak D$ by a claim record $\varphi$, its audit record and its evidence sources (as for Theorem 22 in Appendix I.2), where the content of $\varphi$ is the conclusion for that tuple and $\mathsf{Refs}(\varphi)$ is that tuple together with its recomputed witnesses (so that, by Subsubsection 3.2.1, $\mathsf{Use}(\varphi)$ also contains $\varphi$, its audit record and its evidence sources). The form asserts that every such instrument for this extension accepts $\varphi$.

Such instruments require finite witnesses with decidable equality: for Theorem 8 the form is asserted for instances whose kernel and the law $\mu$ of $X_t$ are rational and whose class $\mathcal K_{\mathrm{adm}}$ is a finite record, and for Theorems 15–18 for coefficients with decidable equality and cycles given on a declared finite basis; for other instances only the body statement is asserted.

For a result whose conclusion is not a decidable property of finitely many records of $\mathfrak D$, the form records its per-instance content: for Theorem 3, that $\mathsf{WFCell}(C)=\texttt{wf}$ if and only if $C$ meets conditions 1–8 of Subsubsection 4.3.3, for each candidate cell $C$ over $\mathfrak D$; for Theorem 4, that $\mathsf{CellClassify}(C)$ is the first row holding at $C$ and is not the final row; for the existential results, Theorems 1, 2, 5, 9, 22 and 25, whose witnesses are built in an admissible instance or extension $\mathfrak D^{+}$ (for Theorem 1, the instances named in its statement, one for each pair $(P_i,P_j)$ of its last clause; for Theorem 2, one for each of its nine status variants; for Theorem 5, one for each of items (a)–(e)), the form is asserted in each such instance with those witnesses in the use-set. Decidability and computability are statements of the body only.

The displays of Appendix I.2 abbreviate this family, and a displayed $\forall$ ranges over records of the instance. The host, package, profile, visibility, threshold, audit and nonclaim assumptions of that form are explicit and are part of the recorded form rather than an ambient context that may be relaxed without comment. Where a proof closes by saying that the instrument-indexed verdict is $\texttt{accepted}$, it restates the result in that form; the host, instrument and record conditions it names are the assumptions of the form, not further steps of the proof.

The shorthand $I\vdash\varphi(\mathcal T)$ for $\Gamma;\mathcal T;I\vdash\varphi:\texttt{accepted}$ is fixed in Subsubsection 3.4.2.

### 2.4.2 Main Positive Scope

Within the formal scope above, the paper proves and presents the results listed in Subsection 1.2 and Table \ref{tab:map}.

### 2.4.3 Main Negative Scope

The paper does not prove, and does not assume as background, any of the following:

- a universal exact-six theorem stating that every phenomenon, every theory, or all of mathematics reduces to the six primitive labels;
- a total binary algebra $*:\mathbb P^2\to\mathbb P$ on the primitive labels, or any equivalent reduction of typed interaction to primitive-label arithmetic;
- a rule by which the primitive pair $(P_i,P_j)$ alone determines directed-cell status;
- collapse of role-channel, directed-cell, pair-observable, promotion, claim, gate, or square status families;
- an implication from role-channel activity to directed-cell action, or from directed-cell action to pair-observable realness;
- a unique decomposition theorem stating that every theory, package, or interaction admits a canonical decomposition into the six primitives;
- package-implies-closure, idempotence-implies-commutation, repeated fixed completion as strict theory growth, local-implies-global packaging, or refinement-implies-improvement;
- strictness-implies-closure, strictness-implies-drive, or route-mismatch-implies-drive;
- audit-is-truth, instrument-free acceptance, accepted claims over unbridged suppressed content, or rotating-audit finality;
- a same-level complete self-certification of any instrument or theory, including the interpreting instrument of this paper;
- empirical realization of the calculus by any external physical, biological, or computational system; empirical-bridge assertions about such systems require a finite admissible record on a named host and do not become realization theorems;
- model-realization-as-universal-theorem, PICA universality, or a PICA $6\times6$ table as a universal interaction algebra;
- complete model coverage by the model families of Section 13, that is, a theorem stating that every fragment of the calculus is realized by PICA, Cantor, abstract interpretation, or graph/cohomology data;
- proof-assistant certification beyond the finite audited declarations explicitly disclosed in Appendix F. That appendix records the validation track for the listed declarations, not a claim about unlisted statements, empirical implementations, or unrestricted host extensions.

This negative scope constrains every later section: no theorem of the paper asserts any of these excluded claims or relaxes its host, instrument or audit assumptions. Section 15 collects the excluded and deferred statements.

## 2.5 Where Symbols Are Defined

The following table lists the main symbols of the calculus and the place where each is defined. Several of them appear before their full definition, in the overview of Section 3. The turnstile $\vdash$ appears only in judgments $\Gamma;\mathcal T;I\vdash\varphi:\chi$ and in the shorthand $I\vdash\varphi(\mathcal T)$ of Subsubsection 3.4.2 for such a judgment with verdict $\texttt{accepted}$; factorization of one object map through another is written $\pi_1\factor\pi_0$. About thirty symbols carry further local meanings; each is announced again where it arises:

- $A$ is an audit record, but the abstract domain in Section 12 (where the host audit record is $A_{\mathrm{AI}}$).
- $I$ is an instrument, but a conditional mutual information in Subsubsection 5.3.1, Subsection 7.3 and the remark after Theorem 3.
- $P$ is a role label, but a probability in Subsection 7.3 and a pressure in Subsection 13.3.
- $C$ is a directed-cell record, the carrier $\mathcal P(\{a,b,c\})$ in Subsection 7.4, and the concrete domain in Section 12.
- $\mathrm{Ver}$ names the vertical arrows in Section 14, distinct from the level $\mathsf{Ver}$.
- "channel" means a role channel, except for the top-down channels of Subsection 4.7.
- $L$ is also a visibility bridge in Subsubsections 3.5.3 and 5.5.2 and the language map $L_{n\to n+1}$ in Subsection 11.7.
- $V$ is also the vertex set $V(G)$ and a patch in $\mathsf{CM}_3$.
- $K$ is a macro kernel in Subsection 7.3, the Markov kernel of PICA and of the Cantor system in Section 13.
- $T$ denotes a spanning forest in the proof of Theorem 17, and $T_0,T_1$ name the base and extended Cantor theories of Subsection 13.3, whose packages are $\mathcal T^{\mathrm{Cantor}}_0,\mathcal T^{\mathrm{Cantor}}_1$.
- $E$ is also the edge set $E(G)$.
- $W$ is also the Cantor carrier in Subsection 13.3.
- $\gamma$ is a cycle in Section 8 and the concretization map in Section 12.
- $\mu$ is the law of $X_t$ in Subsection 7.3 and a pair-observable profile in Subsection 4.4.
- $\rho$ is the closure $\gamma\alpha$ in Section 12, the forgetting map in Subsubsection 5.3.4 and the role tag in Subsubsection 5.4.2, and, as $\rho_i$, the role-channel status in Subsubsection 4.2.1.
- $\tau$ is the lag in Subsection 7.3, the origin tag in Subsubsection 5.4.2 and a timescale in Subsection 13.3.
- $U$ is the set $\{a,b,c\}$ in Subsections 3.8 and 7.4 and a patch in $\mathsf{CM}_3$, besides the updates $U_i$.
- $\Phi$ is a package map in Subsubsection 3.3.2, a fiber in Subsubsection 5.3.3, a target scope in Subsection 11.7 and the bijection in the proof of Theorem 14.
- $\mathcal L$ is also the KL predictive loss $\mathcal L_\tau$ of Subsection 7.3.
- $\sigma$ is a cell status, and the holonomy swap of $\{u,v\}$ in $\mathsf{CM}_2$.
- $\Delta$ is also the simplex $\Delta(Y)$ of Subsection 7.3 and the pressure-gap consequence record of Subsection 13.3.
- $R$ is role evidence $R_i$ in Subsubsection 5.6.1, a pair's source record in Subsubsections 5.6.3 and 13.2.8, a top-down channel record in Subsection 4.7, and a refinement certificate $R_{k\to\ell}$ in Subsection 12.5; $\mathcal R$ is the rule language of Subsubsection 3.4.1.
- $Q$ is a pair record in Subsubsection 5.5.2, a query in Subsubsection 13.2.8 and the forgetting map $Q_\ell$ in Subsection 13.3.
- $D$ is the effect comparator of Subsection 4.7 and a descended update in the proof of Theorem 27.
- $a$ is an element of $U$, a $1$-cochain in Section 8, an abstract element in Section 12 and a vertex in $\mathsf{CM}_{10}$.
- $\mathsf{Use}(\cdot)$ is defined for claims in Subsubsection 3.2.1 and for cells, pair records, promotion bridges, visibility bridges and decorated squares in Subsubsection 5.5.2.
- $M$ is the stochastic matrix of Subsection 7.3 and a macro record in Subsection 4.7.
- $S$ is the carrier of object maps (Subsubsection 4.5.2, Theorem 12), a subset of $U$ in Subsection 7.4, the set of $\Theta_{\in S}$ in Subsubsection 5.2.2, and the source class of a dependency $S\mathrel{\mathsf{dep}_r}X$ in Subsection 4.6.
- $X$ is the carrier of Theorems 6–7, the state space of Theorem 8, a substrate record in Subsection 4.7 and the target class of a dependency in Subsection 4.6.
- $G$ is a graph in Section 8 and, with a subscript, a gate $G_{\mathrm{suff}},G_{\mathrm{strict}},\ldots$ (Subsection 10.2).
- *Bridge* names distinct records: visibility bridge $L$ (Subsubsection 3.5.3), level bridge (Subsubsection 2.2.3), promotion bridge $B_{j\to j+1}$ (Subsection 4.5), drive bridge $B^{\mathrm{drive}}_{3\to6}$ (Subsubsection 9.3.5), source-upgrade and proxy source bridges (Subsubsection 5.3.6), gluing bridge $B_{\mathrm{glue}}$ (Subsubsection 9.4.5), rotating-audit bridge $B^{\mathrm{audit}}_{n\to n+1}$ (Subsubsection 11.7.2) and instrument-transfer bridge $B_{I\to J}$ (Subsubsection 11.9.1); admissibility is defined separately for each.

*Admissibility and well-formedness.* $\mathsf{AdmPkg}$ (Subsubsection 3.3.3), $\mathsf{AdmProfile}$ (Subsubsection 3.6.2), instrument admissibility (Subsubsections 3.4.1 and 11.1.1), $\mathsf{AdmDomain}$ (Subsubsection 4.10.1), acyclicity of the evaluation dependency graph (Subsubsection 5.3.6, Well-foundedness; required by $\mathsf{AdmDomain}$), cell well-formedness and $\mathsf{WFCell}$ (Subsubsection 4.3.3, Subsection 6.3), pair records (Subsubsection 4.4.1), $\mathsf{AdmVisBridge}$ and squares (Subsubsection 5.5.2), $\mathrm{WF}(B)$ (Subsubsections 5.6.4 and 10.2.1), claim records (Subsubsection 11.1.2), $\mathsf{AdmRotAuditBridge}$ (Subsubsection 11.7.3), $\mathsf{AdmInstrBridge}$ (Subsubsection 11.9.1), $\mathsf{AdmAIHost}$ (Subsubsection 12.1.1), $\mathsf{AdmPICAReal}$ (Subsubsection 13.2.2), $\mathsf{AdmCantorShell}$ (Subsubsection 13.3.8), $\mathsf{AdmCohGraph}$ (Subsubsection 13.4.1).

\begingroup\small
\begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.26\linewidth}>{\raggedright\arraybackslash}p{0.5\linewidth}>{\raggedright\arraybackslash}p{0.18\linewidth}@{}}
\toprule
Symbol & Meaning & Defined in \\
\midrule
\endfirsthead
\toprule
Symbol & Meaning & Defined in \\
\midrule
\endhead
\bottomrule
\endfoot
$\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ & the finite audited interaction calculus, a nineteen-component tuple & §3.1 \\
$\mathsf H_{\mathrm{fin}}$, $\mathsf H_{\mathrm{prob}}$, $\mathsf H_{\mathrm{graph}}$, \dots & the base host and the permitted extension hosts & §2.1 \\
$\mathbb P=\{P_1,\ldots,P_6\}$, $\mathsf{Lev}$ & the primitive labels and the ordered level set $\mathsf{Beh}<\mathsf{Ver}<\mathsf{Str}$ & §2.2 \\
$\mathsf{Cont}$ & the finite content universe & §3.2 \\
$\mathcal T$, $\mathsf{Pkg}$ & a theory package $(Z,f,\Sigma_f,E,\mathcal A)$ and the class of packages & §3.3 \\
$I$, $\mathsf{Instr}$ & an instrument and the class of instruments & §3.4, §11.1 \\
$\Gamma;\mathcal T;I\vdash\varphi:\chi$ & an instrument-relative judgment with verdict $\chi$ & §3.4.2, §4.8 \\
$\mathsf{Vis}$, $\mathsf{Suppressed}_I$, $\mathcal L$ & visibility maps, suppressed content, and a set of visibility bridges & §3.5 \\
$\lambda$, $\mathsf{Prof}$ & a profile and the profile family & §3.6 \\
$\mathsf{Wit}(P_j)$, $\mathsf{Upd}(P_i)$ & the witness family of an informant and the update family of an actor & §3.7 \\
$\mathsf{Cell}_{ij}^{\lambda}$ & a directed cell $P_i\leftarrow P_j$ with profile $\lambda$ & §4.3 \\
$L$; $L\in\mathcal L$ (instances $L_{\mathrm{drive}}$, $L_t$); $L_{n\to n+1}$ & the level/lens/interface record of a cell or bridge; a visibility bridge (also written $L$ in its defining schema of Subsubsection 3.5.3); a rotating-audit language map & §4.3.3, §3.5.3, §11.7.2 \\
$\mathsf{PairObs}_{\{i,j\}}^{\mu}$ & a pair observable on $\{P_i,P_j\}$ with profile $\mu$ & §4.4 \\
$B_{j\to j+1}$, $\mathrm{Promote}(B)$ & a promotion bridge and its promotion judgment & §4.5, §10.1 \\
$S\mathrel{\mathsf{dep}_r}X$ & a dependency judgment of type $r$ & §4.6 \\
$\mathsf{Source}$, $\mathsf{Audit}$ & source records and audit records & §4.9 \\
$\mathrm{RoleStatus}$, $\mathrm{CellStatus}$, \dots & the status families & §§4.2--4.8, §5.1 \\
$\delta$, $\mathsf{Def}$ & a defect record and the defect families & §5.2--5.5 \\
$\mathrm{Definable}(f)$ & the preimages under $f$ of subsets of its image & §7.9 \\
$\mathrm{CD}_{\tau}^{\mu}(\Pi)$ & the Markov closure deficit, a conditional mutual information & §5.3.1, §7.3 \\
$(C,A,\alpha,\gamma)$ & concrete domain, abstract domain and Galois connection of an abstract-interpretation host & §12.1 \\
$\delta_1^{\mathrm{split}}(q,F)$ & the descent defect: pairs identified by $q$ and separated by $qF$ & §7.2 \\
$\Delta_3^{\mathrm{comp}}(E_1,E_2)$ & the route-mismatch (completion commutator) defect of two completions & §7.5, §5.3.3 \\
$\pi_1\factor\pi_0$, $\pi_1\not\factor\pi_0$ & $\pi_1$ factors, or does not factor, through $\pi_0$ on its image & §7.7 \\
$\Delta_{\mathrm{fact}}(\pi_0,\pi_1)$ & the factorization defect & §7.8, §5.4.1 \\
$\delta_{\mathrm{overread}}(I,\varphi,\mathcal L)$ & the suppressed content that a claim uses without a bridge & §5.5.1 \\
$\mathsf{Use}(\varphi)$, $\mathsf{Refs}(\varphi)$, $\mathsf{Use}(C)$ & use-set and declared references of a claim; use-set of a cell & §3.2.1, §4.3.3, §5.5.2 \\
$\ulcorner\varphi,I\urcorner$ & verdict reference; reachability in the reference graph & §5.6.5 \\
$\delta_6^{\mathrm{audit}}$, $\texttt{audit\_passes}$, $\delta_6^{\mathrm{source}}$ & audit defect and its passing value; source defect & §5.3.6 \\
$\delta_{\mathrm{vis}}$, $\delta_{\mathrm{weakbridge}}$, $\delta_{\mathrm{reqbridge}}$, $\mathsf{AdmVisBridge}$ & visibility and required-bridge defects; bridge admissibility & §5.5 \\
$\mathsf{noopU}$, $\mathsf{implicitW}$ & computed no-op and attached-witness fields of a cell & §4.3.4, §5.6.6 \\
$\mathsf{ClaimLog}(I)$, $\mathrm{Sound}(I)$ & declared verdict log of $I$; its complete self-soundness claim & §11.5.1 \\
$H^1(G)$, $\oint_\gamma a$ & first cohomology of a finite graph and the integral of a cochain along a cycle & §8.1 \\
$\mathsf{Gate}$ & the promotion gates and bridge-admissibility gates & §10.2 \\
$\mathcal M\models\mathcal S$ & a model realization of a fragment $\mathcal S$ & §13.1 \\
$\mathcal N$, NC-$n$ & a nonclaim register and the numbered nonclaims & §15.2 \\
\end{longtable}
\endgroup
