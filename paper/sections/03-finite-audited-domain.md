# 3. The Finite Audited Domain

This section declares the ambient domain of the calculus, before the central judgment object is defined in Section 4. The domain is a finite tuple of finite typed components: a primitive set, a level set, a host inventory, a content universe, instruments, packages, profiles, witness and update families, defect records, judgment families, status families, gates, dependencies, audits, visibility data, source records, nonclaim records, and model-realization modules. Each component is introduced as a finite schema; the theorems and classifiers that depend on these components are stated in later sections and never quoted as already established here. The definitions needed for Theorems 1–4 are listed in the reader's map (Subsection 1.4); the rest of this section is reference material.

## 3.1 Domain Declaration

### 3.1.1 Full Tuple

\begin{claimdefinition}{Finite audited interaction domain}
The finite audited interaction calculus is the nineteen-component signature

$$
\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}
\;=\;
\begin{aligned}
(\,&\mathbb P,\;\mathsf{Lev},\;\mathsf{Host},\;\mathsf{Cont},\;\mathsf{Instr},\;\mathsf{Pkg},\;\mathsf{Prof},\\
&\mathsf{Wit},\;\mathsf{Upd},\;\mathsf{Def},\;\mathsf{Judg},\;\mathsf{Status},\;\mathsf{Gate},\;\mathsf{Dep},\\
&\mathsf{Audit},\;\mathsf{Vis},\;\mathsf{Source},\;\mathsf{Nonclaim},\;\mathsf{Real}\,).
\end{aligned}
$$

An instance $\mathfrak D$ assigns to each component a finite value, either a finite set, a finite family of finite records, or a finite typed map between such families, with $\mathbb P$, $\mathsf{Lev}$, $\mathsf{Judg}$ and $\mathsf{Status}$ fixed as in Subsubsection 4.10.1 and $\mathsf{Host}$ a subfamily of the inventory of Subsubsection 2.1.2; $\mathfrak D\in\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ means that $\mathfrak D$ is such an assignment. The components are introduced in Subsections 3.2 through 3.7 and Section 4; full definitions of the status, defect, gate, audit, and model-realization components appear in Sections 4, 5, 10, 11, and 13, respectively. The signature is the schema-grade declaration of what counts as the ambient domain of the calculus.

The notation $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ refers to this declared domain throughout the paper. It is distinct from the inherited Foundations II domain $\mathsf{FATCD}$ of finite audited typed closure descriptions: $\mathsf{FATCD}$ is the description domain for the scoped exact-six program of that paper, and $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is the interaction calculus of this paper. Where Foundations II structures are reused inside the calculus, the paper records the embedding rather than renaming $\mathsf{FATCD}$.
\end{claimdefinition}

The notation $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ names this schema. A particular description $\mathfrak D\in\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ is an instance of it; the instance is admissible when $\mathsf{AdmDomain}(\mathfrak D)$ holds (Subsection 4.10), and the theorems of the paper quantify over admissible instances. *Conventions.* The words domain, calculus and central object used for $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ all refer to this schema; the definition in Subsubsection 4.1.1 restates it together with its judgment families. An instance $\mathfrak D$ is a particular choice of the nineteen components. A universally stated theorem is read as a statement about an arbitrary admissible instance $\mathfrak D$, and $\mathfrak D$ is left out of the notation: a record, judgment or status written without an instance belongs to $\mathfrak D$. Existential conclusions have the hypotheses and quantifier scopes stated in their individual results; their proofs construct the required admissible instances or extensions.

*Records and typed families.* A record signature is a finite set of field names, each with a finite value type or a declared numerical type, with effective equality and every operation or order comparison used by an applicable decision procedure. A finite typed record of signature $\sigma$ assigns to each field of $\sigma$ a value of its type, and $\sigma$ is its type. A finite typed family, such as $\mathsf{Wit}(P_i)$ or $\mathsf{Upd}(P_i)$ of Subsection 3.7, is a finite set of named signatures, and $W\in\mathsf{Wit}(P_i)$ means that the signature of $W$ is one of them; membership is therefore decided by comparing finite signatures, and whether the values of $W$ meet a threshold or pass an audit is decided separately by the threshold and audit records of the judgment that uses $W$. 

*Signatures of the running example.* The following three signatures are used in the running example of Subsection 3.8 and in later constructions; their descriptions can be skipped until then: $\mathsf{RouteMismatchWit}$ has the fields first completion, second completion and point, with values maps on the finite carrier and an element of it; $\mathsf{AddAuditRecord}$ has the fields log, entry, target and effect: the entry records the two recomputed images, the target is the log $\Lambda$ and the effect is $e_U(\Lambda)=\Lambda\cup\{\text{entry}\}$; and $\mathsf{CertifyDrive}$ has the fields log, entry, drive check, target and effect, with the same target and effect, the drive-check field naming the candidate drive bridge checked for the drive face $\mathrm{P6}_{\mathrm{drive}}$; it certifies that face only when the bridge passes the required strength and audit checks.

*Record identifiers.* Distinct records of $\mathsf{Cont}$ carry distinct identifiers; a reference field names the unique record of $\mathsf{Cont}$ carrying that identifier, and a candidate record outside $\mathsf{Cont}$ is named by no reference field. Every record of $\mathsf{Cont}$ carries a record identifier: the displayed field $\mathrm{id}$ where its schema has one ($\mathrm{id}_I$, $\mathrm{id}_\varphi$, $\mathrm{id}_{\mathrm{src}}$, $\mathrm{id}_L$, the bridge identifier), and otherwise (among them theory packages, directed cells, pair records, decorated squares, audit and threshold records, absence markers, verdict references, claim logs and context records) an undisplayed identifier field that is not a reference field. Reference fields, $\mathsf{ClaimRef}$ and verdict references name records by identifier, so a cell can hold its audit record $A$ while $A$ names the cell, and records with equal displayed fields but distinct identifiers, such as $Q$ and $Q'$ of Subsubsection 4.4.1, are distinct.

### 3.1.2 Interpretation of Components

The components of the tuple have the following roles. Each description is schema-grade: it fixes what kind of object the component is, not what theorems it satisfies.

- $\mathbb P$ is the fixed finite set of primitive labels $\{P_1,\ldots,P_6\}$ defined in Subsubsection 2.2.1. It is the underlying label alphabet of every role-channel, directed-cell, pair-observable, promotion, and dependency judgment.
- $\mathsf{Lev}=\{\mathsf{Beh},\mathsf{Ver},\mathsf{Str}\}$ is the finite level set defined in Subsubsection 2.2.3, used to tag the kind of content a judgment refers to and to gate cross-level claims through translation, lift, forgetting, or reflection bridges.
- $\mathsf{Host}$ is a finite subfamily of the inventory of permitted hosts declared in Subsubsection 2.1.2: $\mathsf H_{\mathrm{fin}}$, $\mathsf H_{\mathrm{prob}}$, $\mathsf H_{\mathrm{graph}}$, $\mathsf H_{\mathrm{AI}}$, $\mathsf H_{\mathrm{PICA}}$, $\mathsf H_{\mathrm{CantorShell}}$, $\mathsf H_{\mathrm{DC}}$, $\mathsf H_{\mathrm{instr}}$. Every theorem statement names its host.
- $\mathsf{Cont}$ is the finite content universe of the domain, defined in Subsection 3.2. It collects the records that claims may use: theory packages, instruments, witnesses, updates, profiles, defect records, threshold records, audit records, visibility records, level/lens/interface records, package and promotion interfaces, quotients, lenses, completion endomaps, kernels, graphs, finite families, refinements, and other finite typed records introduced as the calculus is built.
- $\mathsf{Instr}$ is the finite family of instrument records, defined in Subsection 3.4. An instrument fixes the visible/suppressed map, scope, claim types, threshold and audit policies, level assignment, bridge policy, source policy, and nonclaim list under which a claim is to be evaluated.
- $\mathsf{Pkg}$ is the finite family of theory packages, defined in Subsection 3.3, each carrying the inherited Foundations I package data $(Z,f,\Sigma_f,E,\mathcal A)$ together with the additional Foundations III typed records (visibility, source, defect, promotion, model-realization) attached around it.
- $\mathsf{Prof}$ is the finite family of profile records, defined in Subsection 3.6. A profile fixes per-judgment data such as actor and informant level tags, scale, regime, bridge type, instrument mode, and locality, and is required by precisely the record families listed in Subsection 3.6.
- $\mathsf{Wit}$ assigns to each primitive $P_i\in\mathbb P$ its typed witness family $\mathsf{Wit}(P_i)$, defined in Subsection 3.7. The informant-side data of a directed cell is required to belong to one of these families.
- $\mathsf{Upd}$ assigns to each primitive $P_i\in\mathbb P$ its typed update family $\mathsf{Upd}(P_i)$, defined in Subsection 3.7. The actor-side data of a directed cell is required to belong to one of these families.
- $\mathsf{Def}$ is the finite family of defect records, defined in Section 5. A defect record carries a defect type, a domain, a witness, a threshold, a measured value, a status consequence, and an audit/source record, and feeds the defect-to-status rules of Subsection 5.6.
- $\mathsf{Judg}$ is the finite family of judgment forms used by the calculus: role-channel, directed-cell, pair-observable, promotion, dependency, and instrument-indexed claim judgments, all defined in Section 4, and the model-realization judgment of Subsubsection 13.1.1.
- $\mathsf{Status}$ is the finite family of status sets, one per judgment family: role-channel, directed-cell, pair-observable, promotion, claim, gate, and square statuses. The sets are listed in Subsubsection 2.3.2 and defined fully in Section 5.
- $\mathsf{Gate}$ is the finite family of gate specifications used during promotion and claim acceptance, defined in Section 10. A gate is a finite check whose $\texttt{pass}$, $\texttt{fail}$, $\texttt{not\_required}$, $\texttt{not\_checked}$, or $\texttt{outside\_scope}$ result feeds promotion-status and claim-status decisions.
- $\mathsf{Dep}$ is the finite family of dependency relations between primitives, including positive dependencies, blocked dependencies, bridge-required dependencies, and countermodel-supported no-go dependencies, defined in Subsection 4.6.
- $\mathsf{Audit}$ is the finite family of audit records, defined in Subsection 4.9. An audit record carries a target, an instrument, replay or check data, and admissibility data; it is distinct from the inherited audit functional $\mathcal A$ that lives inside a theory package $\mathcal T$.
- $\mathsf{Vis}$ is the finite family of visibility maps and visibility bridges, defined in Subsection 3.5. A visibility map sends content to one of $\texttt{visible}$, $\texttt{suppressed}$, $\texttt{outside}$, $\texttt{unknown}$ under an instrument, and a visibility bridge is the admissible record by which a claim may use suppressed content.
- $\mathsf{Source}$ is the finite family of source records, defined in Subsection 4.9. A source record fixes source identity, source type, trace, and source validity, and is consulted by pair-observable and claim acceptance rules.
- $\mathsf{Nonclaim}$ is the finite family of nonclaim records carried by an instrument or attached to a judgment. A nonclaim records what the surrounding statement does not assert, in the same finite typed format as the rest of the calculus.
- $\mathsf{Real}$ is the finite family of model-realization modules, defined in Section 13: the PICA, audited Cantor shell, abstract-interpretation, and graph/cohomology realizations of named fragments of the calculus.

The tuple is finite at every component: each of $\mathbb P$, $\mathsf{Lev}$, $\mathsf{Host}$, the per-instrument and per-package records, the witness and update families per primitive, and the per-judgment status sets is finite. No component is defined by an unbounded reflection scheme or a closure under arbitrary semantic operations. A claim that requires an extension of any component is not interpreted in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ as defined here and lies outside the formal scope of this paper. The body statements also include quantification over the possibly infinite kernel, cochain and cycle spaces of Theorems 8 and 15–18, and the arbitrary-set and arbitrary-poset forms of Theorems 6, 7, 10–14 and 26–28. These mathematical assertions do not enlarge the finite record schema; their instrument-indexed forms concern finite recorded instances.

## 3.2 Content Universe

### 3.2.1 Finite Content Objects

The content universe of the calculus is the finite family

$$
\mathsf{Cont}
$$

of records that claims, judgments, and audits may refer to. Every member of $\mathsf{Cont}$ is a finite typed record built from the base host $\mathsf H_{\mathrm{fin}}$, possibly with components drawn from a declared extension host. The schema is extended only by the finite record types introduced in this paper's declared components; each such record type is required to be a finite typed object on a named host, and no record type is defined by closure under an unbounded operation.

The standard members of $\mathsf{Cont}$ used by this paper are the following.

| Record kind | Reference |
| --- | --- |
| theory package $\mathcal T=(Z,f,\Sigma_f,E,\mathcal A)$ together with attached Foundations III records | Subsection 3.3 |
| instrument record $I$ | Subsection 3.4 |
| primitive label $P_i\in\mathbb P$ | Subsubsection 2.2.1 |
| witness $W_i\in\mathsf{Wit}(P_i)$ | Subsection 3.7 |
| update $U_i\in\mathsf{Upd}(P_i)$ | Subsection 3.7 |
| profile $\lambda$ | Subsection 3.6 |
| level/lens/interface record $L$ | Subsection 4.3 |
| visibility record $V$, suppressed-content record, visibility bridge | Subsection 3.5 |
| threshold record $\Theta$ | Subsection 5.2 |
| audit record $A$, source record, replay trace | Subsection 4.9 |
| defect record $\delta$ with type, domain, witness, threshold, measured value, status consequence | Section 5 |
| object map or interface $\pi_j$, $\pi_{j+1}$ in a promotion bridge | Subsection 4.5 |
| quotient $q$, finite map $F$, descended map $F^\sharp$, completion endomap $E$ | Sections 6 and 7 |
| finite stochastic kernel $K$ on a finite state space, finite information quantities | Subsection 7.3 (host $\mathsf H_{\mathrm{prob}}$) |
| finite graph $G$, cycle basis, cochain family $\mathcal F$ | Section 8 (host $\mathsf H_{\mathrm{graph}}$) |
| refinement, staging, gluing record $\Delta$ | Subsection 5.3 and Section 7 |
| nonclaim record $\mathcal N$ | Subsection 15.2 |
| verdict reference $\ulcorner\varphi,I\urcorner$, naming the verdict of a claim $\varphi$ (or of another audit target) under an instrument $I$ | Subsubsection 5.6.5 |

Every claim $\varphi$ in the calculus has a finite use-set

$$
\mathsf{Use}(\varphi)\;\subseteq\;\mathsf{Cont}
$$

defined as follows. The Content field of a claim record (Subsubsection 11.1.2) carries a finite declared set $\mathsf{Refs}(\varphi)$ of record identifiers, and the record is well formed only if every record identifier occurring in the statement of $\varphi$ lies in $\mathsf{Refs}(\varphi)$. Then $\mathsf{Use}(\varphi)$ consists of $\{\varphi\}\cup\mathsf{Refs}(\varphi)$ together with, for a claim record, the one-step content references (Subsubsection 5.5.2) of its $\mathsf{EvidenceRefs}$, threshold and audit fields: each named source record with the records named in its trace, and each threshold or audit record with the records named by its reference fields, except the instrument named in $\mathsf{CheckRules}$. The claim record $\varphi$ itself lies in $\mathsf{Use}(\varphi)$ even when its audit slot holds an audited absence marker, so scope and visibility conditions apply to the claim record too. Visibility, suppression, source-of-truth, and overreading checks in later sections operate on $\mathsf{Use}(\varphi)$, not on the entire content universe. A claim whose use-set contains a record that is not finite, not typed, or not on a permitted host is not admissible in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$.

### 3.2.2 Typed Content

Every record in $\mathsf{Cont}$ is typed in four respects.

- **Host.** Each record carries a host tag drawn from $\mathsf{Host}$. The host tag fixes which finite mathematical universe the record lives in: $\mathsf H_{\mathrm{fin}}$ for the base host, $\mathsf H_{\mathrm{prob}}$ for finite stochastic content, $\mathsf H_{\mathrm{graph}}$ for finite graph and cohomology content, $\mathsf H_{\mathrm{AI}}$ for finite abstract-interpretation content, $\mathsf H_{\mathrm{PICA}}$ and $\mathsf H_{\mathrm{CantorShell}}$ for the model-realization hosts, $\mathsf H_{\mathrm{DC}}$ for the high-structure fragment, and $\mathsf H_{\mathrm{instr}}$ for instrument-side content.
- **Level.** Each record carries a level tag drawn from $\mathsf{Lev}=\{\mathsf{Beh},\mathsf{Ver},\mathsf{Str}\}$. The level tag is a declared field; the glosses of Subsubsection 2.2.3 describe typical content, and the calculus uses level tags only through equality (which decides when a level bridge is needed) and the order $\mathsf{Beh}<\mathsf{Ver}<\mathsf{Str}$. For an instrument, $\mathsf{Level}_I$ ranks which instruments may audit which (Subsection 11.7); it does not assert that the instrument's records are behavioral, verification or structural content. A judgment that has differing compared level tags (Subsubsection 2.2.3) is admissible only with an explicit level bridge (translation, lift, forgetting, or reflection).
- **Instrument.** Each record is interpreted under the instrument $I$ that the surrounding judgment names. The instrument fixes whether the record is visible, suppressed, outside-scope, or unknown for the purpose of the claim, and what bridges may connect it to visible content. A record may be in $\mathsf{Cont}$ globally and yet be suppressed under a particular instrument; suppression is a relation between a record and an instrument, not a property of the record alone, and it does not assert that the suppressed record is false.
- **Profile.** Each directed-cell, pair-observable, promotion-bridge, rotating-audit-bridge, instrument-transfer and top-down channel record is tagged by a profile $\lambda\in\mathsf{Prof}$, and each claim record by a level profile (Subsection 3.6); a profile fixes per-judgment data including actor and informant level tags, scale, regime, bridge type, instrument mode, and locality. The profile of a judgment together with its host, level, and instrument tags determines the admissibility of every record in its use-set.

Records carry host, level and instrument context, and profiles only where their record family requires one; without the required context, a statement is a schema rather than a judgment and cannot support a claim.

## 3.3 Theory Packages (Reference)

*Used by:* Theorems 3 and 23 use theory packages in their statements, through the judgment context $\Gamma;\mathcal T;I$.

### 3.3.1 Package Record

A theory package is the inherited Foundations I object

$$
\mathcal T \;=\; (\,Z,\;f,\;\Sigma_f,\;E,\;\mathcal A\,)
$$

together with the additional Foundations III typed records that the calculus attaches to it. The inherited components have the inherited meaning: $Z$ is a finite carrier or scoped comparison domain, $f$ is a finite lens or coarse-description map of $Z$, $\Sigma_f$ is the expressive content (finite definability) induced by $f$, $E$ is a completion or packaging endomap, and $\mathcal A$ is the audit functional inherited from Foundations I. The inherited form is preserved verbatim throughout the paper; no Foundations III usage redefines $\mathcal T$, $f$, $\Sigma_f$, $E$, or $\mathcal A$ as different objects.

In Foundations III, a package record carries the inherited five-tuple together with finite typed records for the additional content the interaction calculus depends on:

- a host tag $h_{\mathcal T}\in\mathsf{Host}$ fixing the host on which the package lives;
- a level tag $\ell_{\mathcal T}\in\mathsf{Lev}$ fixing whether the package describes behavioral, verification, or structural content;
- a finite visibility profile $V_{\mathcal T}$ recording which fields of the package are designated visible, suppressed, outside-scope, or unknown by the instruments that consult it;
- a finite source record $\mathrm{src}_{\mathcal T}$ recording source identity, source type, trace, and source validity;
- a finite audit record family $A_{\mathcal T}$ supplying provenance, replay, and threshold-check entries used by the package's audit functional $\mathcal A$;
- a finite defect record family $\delta_{\mathcal T}$ tracking package-level closure deficits, gluing obstructions, idempotence residuals, and other defects;
- finite promotion data when the package participates in a promotion bridge: an old interface, a target package, a target interface, and the bridge gate record;
- finite model-realization data when the package realizes a fragment of $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$ inside a named model host;
- a finite family $W_{\mathcal T}$ of witness records attached to the package, each with signature in some $\mathsf{Wit}(P_i)$, visible, sourced and audited like the other attached records;
- a finite nonclaim record $\mathcal N_{\mathcal T}$ recording what claims about the package are explicitly not asserted.

The visibility, suppression, source, audit, defect, promotion, model-realization, and nonclaim records are extra structure attached around the inherited five-tuple. They never silently replace any inherited component, and a Foundations III theorem about a package always restates which inherited fields it uses.

The canonical lens-induced expressive content is the inherited family

$$
\Sigma_f \;=\; \{\,f^{-1}(B)\;:\;B\subseteq f(Z)\,\},
$$

and the canonical lens completion is the inherited endomap

$$
E_f(S)\;=\;f^{-1}(f(S)).
$$

Where Foundations III uses a different completion, the choice is named explicitly and the relationship to $E_f$ is recorded.

The word "closure" is used only with its declared sense. The completion endomap $E$ is a packaging/completion operation on a declared content space; an order-closure operator is used only on a poset host satisfying the relevant closure axioms; and macro closure refers to closed induced dynamics such as a descended update law. None of these follows from the others without an explicit theorem or bridge.

### 3.3.2 Package Morphisms

The calculus uses four kinds of finite morphism between theory packages, all of which are records on the base host (or on an extension host when a package lives there).

- **Package map.** A package map $\Phi:\mathcal T\to\mathcal T'$ is a finite typed record consisting of a finite carrier map $\phi_Z:Z\to Z'$ and the induced data on lenses, expressive content, completion endomaps, audit functionals, and Foundations III attached records. Its recorded lens data must satisfy a finite compatibility equality in the direction of the map: either $f'\circ\phi_Z=\psi\circ f$ for a recorded $\psi:f(Z)\to X'$, or $f=r\circ f'\circ\phi_Z$ for a recorded $r:f'(Z')\to X$. Admissibility also requires a visible image for each visible source field and extension of the source and audit records, including $A_{\mathcal T}\subseteq A_{\mathcal T'}$. A refinement requires the second equality, as specified below.
- **Refinement.** A package refinement is a package map $\Phi:\mathcal T\to\mathcal T'$, with lenses $f:Z\to X$ and $f':Z'\to X'$, for which there is a map $r:f'(Z')\to X$ with $f=r\circ f'\circ\phi_Z$; then $\Sigma_f\subseteq\{\phi_Z^{-1}(S'):S'\in\Sigma_{f'}\}$, so the codomain expressive content extends the domain expressive content, and the refinement is recorded in the level/lens/interface field of any judgment that uses it. A refinement is not assumed to improve any closure deficit; refinement-implies-improvement is excluded by the negative scope of Subsubsection 2.4.3.
- **Quotient.** A package quotient is a package map $\Phi$ whose carrier component $\phi_Z$ is a finite surjection $q:Z\to Z/\!\sim$ for a finite equivalence relation $\sim$ on $Z$, together with the matching quotient data on lens, expressive content, and completion. Quotients are the finite maps used by the descent theorems of Section 7.
- **Completion-induced map.** A completion-induced map is a finite package map or package record induced by applying a named completion endomap $E:\mathcal V\to\mathcal V$ on its declared content space. When the host supplies inclusions or fixed-point records, those maps are recorded explicitly; they are not inferred from the symbol $E$ alone. Repeated application of an idempotent completion is not treated as strict package growth unless a new interface, bridge, refinement, or nonfactorization witness is recorded.

Package maps compose as records, but composition is not assumed to preserve every Foundations III attached record without an explicit compatibility condition: in particular, audit and source records compose only when the audit functionals of the codomain extend those of the domain, and a composition that violates an inherited audit condition is a defect, not a new package map.

### 3.3.3 Package Admissibility

A theory package $\mathcal T$ is admissible in $\mathbf{BirdInt}^{\mathrm{aud}}_{\mathrm{fin}}$, written

$$
\mathsf{AdmPkg}(\mathcal T),
$$

when all of the following hold.

- The inherited five-tuple $(Z,f,\Sigma_f,E,\mathcal A)$ is present and finite. The carrier $Z$ is a finite set, the lens $f$ is a finite map from $Z$ to a finite codomain, the expressive content $\Sigma_f$ is a finite family of subsets of $Z$, the completion endomap $E$ is a finite endomap on the relevant content space, and the audit functional $\mathcal A$ is a finite map from the entries of the audit record family $A_{\mathcal T}$ to $\{\texttt{pass},\texttt{fail}\}$.
- The host tag $h_{\mathcal T}$ lies in $\mathsf{Host}$, and every component of the package lives in or under that host.
- The level tag $\ell_{\mathcal T}$ lies in $\mathsf{Lev}$. Cross-level use of the package requires a level bridge.
- The visibility profile $V_{\mathcal T}$ partitions the package's fields into visible, suppressed, outside-scope, and unknown classes for each instrument that may consult $\mathcal T$, and the partition is finite; for each instrument $I$ for which $V_{\mathcal T}$ records a partition, that partition is the restriction of $\mathsf{vis}_I$ to the package's fields.
- The source record $\mathrm{src}_{\mathcal T}$ is present, finite, well-formed, and has resolved references; whether it satisfies a consulting instrument's source policy is determined by the applicable judgment classifier.
- The audit record family $A_{\mathcal T}$ is finite and consistent with $\mathcal A$, that is, $\mathcal A(e)=\texttt{pass}$ for every entry $e$ of $A_{\mathcal T}$. The audit record family is distinct from the audit functional: $A_{\mathcal T}$ supplies the finite checked entries that $\mathcal A$ certifies.
- The defect record family $\delta_{\mathcal T}$ is finite, with each entry conforming to the defect record schema of Section 5.
- Any attached promotion data, model-realization data, or level/lens/interface data is finite, hosted, assigned an explicit visibility status under the relevant instrument, and accompanied by its own source, audit, and nonclaim records.
- The attached witness family $W_{\mathcal T}$ is finite, and each of its records has signature in some $\mathsf{Wit}(P_i)$ and its own visibility, source and audit records.
- The nonclaim record $\mathcal N_{\mathcal T}$ is present and finite.

A package that fails any of these conditions is not admissible. Subsequent sections only consider admissible packages, and a theorem statement that uses a package implicitly carries $\mathsf{AdmPkg}(\mathcal T)$ as a hypothesis. The finite shape of these checks is part of the input to the later well-formedness results; this subsection only records the package schema and admissibility conditions.

## 3.4 Instruments (Reference)

*Used by:* Theorems 1--5 (the running-example instrument of Subsection 3.8 and its variants) and Theorems 22--25 use instruments in their statements; Theorem 3 decides well-formedness relative to one.

### 3.4.1 Instrument Record

An instrument is a finite typed record

$$
\begin{aligned}
I\;=\;(\,&\mathrm{id}_I,\;\mathsf{Scope}_I,\;\mathsf{ClaimTypes}_I,\;\mathsf{Visible}_I,\;\mathsf{Suppressed}_I,\\
&\mathsf{CheckRules}_I,\;\mathsf{EvidencePolicy}_I,\;\mathsf{ThresholdPolicy}_I,\;\mathsf{AuditPolicy}_I,\\
&\mathsf{Level}_I,\;\mathsf{BridgePolicy}_I,\;\mathsf{SourcePolicy}_I,\;\mathcal N_I\,).
\end{aligned}
$$

The components have the following roles, all finite:

- $\mathrm{id}_I$: a finite identifier under which the instrument is registered. Two distinct instruments have distinct identifiers, and an instrument identifier is part of the data of every claim accepted under that instrument.
- $\mathsf{Scope}_I$: the finite scope record of the instrument. It consists of finite sets $\mathsf{Hosts}_I\subseteq\mathsf{Host}$ and $\mathsf{Levels}_I\subseteq\mathsf{Lev}$ and the in-scope content, also written $\mathsf{Scope}_I\subseteq\mathsf{Cont}$, with $\mathsf{Outside}_I=\mathsf{Cont}\setminus\mathsf{Scope}_I$. A host tag $h$ (a level tag $\ell$) lies outside $\mathsf{Scope}_I$ when $h\notin\mathsf{Hosts}_I$ ($\ell\notin\mathsf{Levels}_I$). A claim whose use-set is not contained in $\mathsf{Scope}_I$ has status $\texttt{outside\_scope}$ under $I$.
- $\mathsf{ClaimTypes}_I$: the finite family of claim types that $I$ is configured to evaluate, including role-channel, directed-cell, pair-observable, promotion, dependency, and instrument-indexed claim types as appropriate.
- $\mathsf{Visible}_I,\;\mathsf{Suppressed}_I$: two disjoint subsets of $\mathsf{Scope}_I$: the content $I$ may use directly, and the in-scope content $I$ may not use directly. The complement of $\mathsf{Visible}_I\cup\mathsf{Suppressed}_I$ within $\mathsf{Scope}_I$ is the unknown class; content outside $\mathsf{Scope}_I$ is in the outside-scope class. The full four-way partition is given in Subsection 3.5.
- $\mathsf{CheckRules}_I$: the finite family of check rules used to classify a claim under $I$. Check rules are typed finite records: each rule states which fields of a claim it consults, what comparison or test it performs, and what classifier verdict it contributes. This component also carries a finite mode map $\mathsf{ModePolicy}_I$ on judgment families and the finite host/profile compatibility relation $\mathsf{Compat}_I$; both are declarations of $I$.
- $\mathsf{EvidencePolicy}_I$: the finite policy for what counts as admissible evidence under $I$, distinguishing direct evidence, bridge-relayed evidence, and inadmissible evidence; it admits a source-type tag $t$ of Subsubsection 4.9.1 when it classifies source records of tag $t$ as direct or bridge-relayed evidence.
- $\mathsf{ThresholdPolicy}_I$: the finite family of thresholds used by $I$, including exact, approximate, tolerance, rank/dimension, visibility, and source thresholds, together with a finite set $\mathsf{ProvisionalTypes}_I$ of claim and square types that may receive $\texttt{provisional}$. The threshold record schema is fixed in Subsection 5.2.
- $\mathsf{AuditPolicy}_I$: the finite policy for which audit records $I$ requires, in what order, and against which sources. The policy is checked by the gate semantics of Section 10 and the rotating-audit semantics of Section 11. Passing an audit policy contributes to an instrument-indexed status; it is not instrument-free truth.
- $\mathsf{Level}_I\in\mathsf{Lev}$: the level annotation of $I$. An instrument operates at a single level; cross-level operation requires an explicit level bridge inside the instrument's claim record.
- $\mathsf{BridgePolicy}_I$ (including a finite map to $\mathsf{Strength}_I$ that is total on every admitted (bridge type, regime) pair, and a finite map $\mathsf{ReqStrength}_I:\mathsf{ClaimTypes}_I\to\mathsf{Strength}_I$): the finite policy for which bridges $I$ admits, including visibility bridges, level bridges (among them the $\texttt{reflection}$ level bridge of rotating audits), instrument-transfer bridges, drive bridges, source-upgrade bridges, gluing bridges, and model-realization bridges. The policy fixes which suppressed content can be brought into the use-set of an accepted claim. A generic audit bridge is not a drive certificate unless the bridge records the required $\mathrm{P6}_{\mathrm{drive}}$ data. An instrument classifying decorated squares also declares a separate total map from the seven square types of Subsubsection 14.1.2 to $\mathsf{Strength}_I$, likewise written $\mathsf{ReqStrength}_I$.
- $\mathsf{SourcePolicy}_I$: a finite relation between source-type tags, admission modes ($\texttt{full}$, $\texttt{fallback}$, $\texttt{provisional}$) and profiles, with a default entry; with the source slot it determines $\delta_6^{\mathrm{source}}$ by the rules of Subsubsection 5.3.6, where the absence, explicit unknown/contradictory tags, dirtiness and proxy-bridge tests precede the source-policy admission tests; an unknown value can also result from failed full-mode admission.
- $\mathcal N_I$: the finite nonclaim record of $I$. The nonclaims of $I$ are part of the instrument and propagate to every claim accepted under $I$; an accepted claim under $I$ is interpreted with the nonclaims of $I$ attached.

A field $\mathsf F_I$ of $I$ is also written $\mathsf F(I)$ when $I$ carries an index; thus $\mathsf{Level}(I_0)=\mathsf{Level}_{I_0}$. Equality of instruments is a finite record comparison across all fields. An instrument is admissible when every component is finite and well typed: its level lies in $\mathsf{Lev}$ and the hosts named in $\mathsf{Scope}_I$ lie in $\mathsf{Host}$, and its visibility, threshold, gate and audit components are records of the schemas of Subsection 3.5, Subsection 5.2 and Sections 10 and 11. These are finite typing checks. Instrument admissibility also requires every rule of $\mathsf{CheckRules}_I$ to be a program of a declared rule language $\mathcal R$ whose programs are total by construction (finite table lookups, the declared operations of the field types, equality and order comparisons on declared field types, and iteration bounded by the size of finite fields), so that each rule is a terminating decision procedure on its declared field types, and $\mathcal R$ is closed under sequential composition and finite, acyclic calls to named $\mathcal R$-programs; membership of a rule in $\mathcal R$ is a syntactic check. It also requires every audit record judged under $I$, including the audit records $A_L$ of visibility bridges, to draw its $\mathsf{CheckRules}$ field from $\mathsf{CheckRules}_I$. If $\texttt{top\_down\_channel}\in\mathsf{ClaimTypes}_I$, admissibility also requires $\mathsf{CheckRules}_I$ to contain the rule that assigns the rejection verdict to $\mathsf{TopDownChannel}(R)$ whenever some gate of $\mathsf{TDGate}(R)$ (Subsection 4.7) has a status other than $\texttt{pass}$.

### 3.4.2 Instrument-Relative Judgments

Every nontrivial claim in the calculus is interpreted under an instrument. The general form of an instrument-indexed claim is

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\varphi:\chi,
$$

where $\Gamma$ is a finite typed context of attached records (witnesses, updates, profiles, level/lens/interface records, visibility records, threshold records, audit records, defect records, and nonclaim records), $\mathcal T$ is an admissible theory package, $I$ is an admissible instrument, $\varphi$ is a claim with a finite use-set $\mathsf{Use}(\varphi)\subseteq\mathsf{Cont}$, and $\chi$ is the claim status assigned to $\varphi$ under $\Gamma,\mathcal T,I$.

The middle slot may also hold a host $\mathsf H\in\mathsf{Host}$ (Subsubsection 2.1.2) in place of a package, when the claim concerns the host as a whole rather than one theory package. Appendix I records every numbered result in this form, and Theorem 25 states its rotating-audit report in it.

The shorthand

$$
I\;\vdash\;\varphi(\mathcal T)
$$

abbreviates

$$
\Gamma\,;\;\mathcal T\,;\;I\;\vdash\;\varphi:\texttt{accepted}.
$$

A claim that holds in this sense is accepted by $I$ under the package $\mathcal T$ and the surrounding context $\Gamma$. The shorthand never abbreviates instrument-free truth, and a statement of the form $I\vdash\varphi(\mathcal T)$ does not transfer to a different instrument $I'$ except through an explicit instrument-transfer bridge admitted by both $I$ and $I'$.

The full classifier under which $\chi$ is determined consults the visibility partition $\mathsf{Visible}_I/\mathsf{Suppressed}_I$, the bridge policy $\mathsf{BridgePolicy}_I$, the threshold policy $\mathsf{ThresholdPolicy}_I$, the source policy $\mathsf{SourcePolicy}_I$, the audit policy $\mathsf{AuditPolicy}_I$, and the nonclaim record $\mathcal N_I$. The classifier is defined by the claim-classifier table of Subsubsection 5.6.6; the no-overreading and same-level self-audit theorems that depend on it are stated and proved at theorem-grade in Subsections 11.4 and 11.5. This subsection only fixes the form of the judgment and the meaning of the shorthand. No theorem about acceptance or overreading is asserted here.

A claim that names a context and package but does not name an instrument is not a judgment in the calculus. A claim that names an instrument but whose context, package, or use-set is incomplete fails the claim well-formedness conditions of Subsubsection 11.1.2 and so receives no status from the claim classifier of Subsubsection 5.6.5.

## 3.5 Visibility and Suppression (Reference)

*Used by:* Theorems 1, 2 and 4 (the suppressed record $x$ and the bridge $L_{\mathrm{drive}}$) and Theorems 22 and 23 use visibility records.

Each instrument $I$ partitions the content universe according to what $I$ adjudicates and how it adjudicates it. The partition has four classes; this subsection fixes the partition map, the two named classes (visible and suppressed), and the schema of admissible visibility bridges. No theorem about acceptance or overreading is asserted here; the formal no-overreading theorem and the bridge-aware acceptance rule are stated in Section 11.

Each instrument $I$ carries a finite visibility map

$$
\mathsf{vis}_I:\;\mathsf{Cont}\;\to\;\{\,\texttt{visible},\;\texttt{suppressed},\;\texttt{outside},\;\texttt{unknown}\,\},
$$

inducing a finite four-way partition of the content universe of Subsection 3.2:

$$
\mathsf{Cont}\;=\;\mathsf{Visible}_I\;\sqcup\;\mathsf{Suppressed}_I\;\sqcup\;\mathsf{Outside}_I\;\sqcup\;\mathsf{Unknown}_I.
$$

The four classes correspond, respectively, to content $I$ may use directly, content within $I$'s scope that $I$ may not use directly, content outside $I$'s declared scope, and content within $I$'s scope whose visibility verdict has not yet been resolved. The classes are part of $I$'s record (Subsubsection 3.4.1); changing the partition is changing the instrument.

### 3.5.1 Visible Content

The visible class under $I$ is

$$
\mathsf{Visible}_I\;=\;\{\,x\in\mathsf{Cont}\;:\;\mathsf{vis}_I(x)=\texttt{visible}\,\}.
$$

A claim whose use-set $\mathsf{Use}(\varphi)$ lies entirely in $\mathsf{Visible}_I$ is a visible claim under $I$; its threshold, audit and evidence-source records are then visible, since they lie in $\mathsf{Use}(\varphi)$ (Subsubsection 3.2.1). The classifier of Section 11 may consult visible content directly. Visibility under $I$ is not a property of $x$ alone: the same record can be visible under one instrument and suppressed, outside, or unknown under another.

### 3.5.2 Suppressed Content

The suppressed class under $I$ is

$$
\mathsf{Suppressed}_I\;=\;\{\,x\in\mathsf{Cont}\;:\;\mathsf{vis}_I(x)=\texttt{suppressed}\,\}.
$$

Suppression is a record-level relation between $x$ and $I$, not a truth verdict on $x$:

$$
x\in\mathsf{Suppressed}_I\;\;\not\Rightarrow\;\;x\;\text{is false}.
$$

Suppressed content may be exactly correct under another instrument or in an external description. The relation $x\in\mathsf{Suppressed}_I$ asserts only that $I$ does not have admissible visibility into $x$; under $I$, a claim that depends on $x$ without an admissible bridge over-reads $I$ (in the informal sense fixed in Subsubsection 2.3.3).

The map $\mathsf{vis}_I$ is determined by the fields of $I$: $\mathsf{vis}_I(x)$ is visible iff $x\in\mathsf{Visible}_I$, suppressed iff $x\in\mathsf{Suppressed}_I$, outside iff $x\notin\mathsf{Scope}_I$, and unknown otherwise. The remaining two classes are recorded for completeness:

$$
\mathsf{Outside}_I\;=\;\{\,x\in\mathsf{Cont}\;:\;\mathsf{vis}_I(x)=\texttt{outside}\,\},\qquad \mathsf{Unknown}_I\;=\;\{\,x\in\mathsf{Cont}\;:\;\mathsf{vis}_I(x)=\texttt{unknown}\,\}.
$$

A claim whose use-set meets $\mathsf{Outside}_I$ has status $\texttt{outside\_scope}$ under $I$; a claim whose use-set meets $\mathsf{Unknown}_I$ requires the later classifier to consult the corresponding unknown-content rule. No acceptance status for unknown content is asserted in this subsection.

### 3.5.3 Visibility Bridges

Suppressed content can become admissibly usable by a claim only via a recorded visibility bridge. A visibility bridge under $I$ is a finite typed record

$$
L\;=\;(\,\mathrm{id}_L,\;c,\;c',\;\mathsf{BridgeType}_L,\;\mathsf{Guarantee}_L,\;\mathsf{Strength}_L,\;A_L,\;V_L,\;\mathcal N_L\,),
$$

with $c\in\mathsf{Suppressed}_I$, $c'\in\mathsf{Visible}_I$, $\mathsf{BridgeType}_L$ drawn from the bridge inventory of $\mathsf{BridgePolicy}_I$ (Subsubsection 3.4.1), and $\mathsf{Guarantee}_L$, $\mathsf{Strength}_L$, $A_L$, $V_L$, $\mathcal N_L$ the finite guarantee, strength, audit, visibility, and nonclaim records that the bridge carries; the audit record $A_L$ has $\mathsf{ClaimRef}=L$, so $L\in\mathsf{Use}(L)$. Admissibility of a bridge for a claim or cell, $\mathsf{AdmVisBridge}(L,I,X)$, is defined in Subsubsection 5.5.2.

$\mathcal L$ is a finite set of registered, audited visibility-bridge candidates under $I$. Registration checks the bridge's type, endpoints and audit record but does not assert that its strength suffices for every claim. A member $L\in\mathcal L$ is admissible *for $\varphi$* only when $\mathsf{AdmVisBridge}(L,I,\varphi)$ holds, including the strength comparison. The schema-level use of $\mathcal L$ is to record which suppressed content has been brought into admissible reach for which claims; the formal acceptance rule, including the constraint that every suppressed dependency of an accepted claim is bridged by some $L\in\mathcal L$, is stated and proved in Section 11. This subsection only fixes the schema; no acceptance or no-overreading theorem is asserted here.

The witness and update records introduced in Subsection 3.7 are content records in this sense: when a later directed-cell or pair-observable judgment uses a witness $W_i$ or update $U_i$, that record has a visibility status under the named instrument and may require a visibility bridge if it is suppressed.

## 3.6 Profiles (Reference)

*Used by:* The directed-cell records in the statements of Theorems 1--5 carry a profile $\lambda$.

A profile is the finite typed record attached to a directed-cell, pair-observable, promotion-bridge, rotating-audit-bridge, instrument-transfer or top-down channel record that fixes the per-judgment scale, regime, bridge type, instrument mode, and level data. Claim records carry only a level profile (Subsubsection 11.1.2), and role-channel and dependency records carry none. Profiles are attached to the six record families listed above; their finite admissibility schema and their dependence on judgment status are recorded here. Theorem 1 of Section 6 uses the profile schema.

### 3.6.1 Profile Grammar

A profile is a finite typed record

$$
\lambda\;=\;(\,\ell_i,\;\ell_j,\;\mathsf{Scale}_\lambda,\;\mathsf{Regime}_\lambda,\;\mathsf{BridgeType}_\lambda,\;\mathsf{InstrumentMode}_\lambda,\;\mathsf{Locality}_\lambda\,)
$$

with the following finite components.

- $\ell_i,\ell_j\in\mathsf{Lev}$ are the actor-side and informant-side level tags. For a directed cell $P_i\leftarrow P_j$, $\ell_i$ is the level on which the actor update $U_i$ lives and $\ell_j$ is the level on which the informant witness $W_j$ lives. For a judgment that is not directed (e.g., a pair observable or a promotion bridge), the two tags coincide or are determined by the judgment family's convention.
- $\mathsf{Scale}_\lambda$ is a finite scale label, distinguishing the scale of the carriers, partitions, kernels, or graphs the judgment depends on (for example, microscale or macroscale on a stochastic host, or fine or coarse on a finite carrier).
- $\mathsf{Regime}_\lambda$ is a finite regime label, distinguishing dynamical, structural, and audit regimes; specific regimes used by the paper are named where the relevant judgment is introduced.
- $\mathsf{BridgeType}_\lambda$ is drawn from the finite bridge inventory of $\mathsf{BridgePolicy}_I$ (Subsubsection 3.4.1): visibility, level (including the $\texttt{reflection}$ level bridge of rotating audits), instrument-transfer, drive, source-upgrade, gluing, or model-realization. The profile records which bridge type the surrounding judgment uses.
- $\mathsf{InstrumentMode}_\lambda$ is a finite instrument-mode label, distinguishing the surrounding instrument's default, audit-only, transfer, and rotating-audit modes.
- $\mathsf{Locality}_\lambda$ is a finite locality label, distinguishing local, semi-global, and global use of the judgment data on a cover or staging.

Specific named profiles used elsewhere in the paper include $\lambda_{\mathrm{audit}}$ and $\lambda_{\mathrm{drive}}$ (Subsection 3.8, Subsubsection 6.1.1), $\mu_{\mathrm{drive}}$ (Subsection 9.5), $\lambda_{\mathrm{prom}}$ (Subsubsection 10.6.1), $\lambda_{\mathrm{rot}}$ (Subsubsection 11.7.2), $\lambda_{\mathrm{PICA}}$ and $\mu_{\mathrm{PICA}}$ (Subsubsection 13.2.5), $\lambda_{\mathrm{Cantor}}$ (Model Theorem 34), $\lambda_{\mathrm{obj}}$ and $\lambda_{\mathrm{refresh}}$ (Subsection 11.6) and $\lambda_{\mathrm{transfer}}$ (Subsubsection 11.9.1). Each is a finite record with the components above. The values of $\lambda_{\mathrm{audit}}$, $\lambda_{\mathrm{drive}}$, $\mu_{\mathrm{drive}}$, $\lambda_{\mathrm{prom}}$, $\lambda_{\mathrm{PICA}}$ and $\mu_{\mathrm{PICA}}$ are fixed where the corresponding judgment is introduced and are reused thereafter without redefinition; $\lambda_{\mathrm{rot}}$ is fixed up to its two level tags, the levels of the bridge's instruments (Subsubsection 11.7.2); Model Theorem 34 constrains $\lambda_{\mathrm{Cantor}}$ only through $\mathsf{AdmProfile}$ and its level tags, its Moreover clause giving one admissible value; of $\lambda_{\mathrm{obj}}$ and $\lambda_{\mathrm{refresh}}$ only the audit-only instrument mode is fixed (Subsection 11.6), and of $\lambda_{\mathrm{transfer}}$ only the instrument-transfer bridge type (Subsubsection 11.9.1), the other components being any values for which $\mathsf{AdmProfile}$ holds.

### 3.6.2 Profile Admissibility

A profile $\lambda$ is admissible under instrument $I$ and theory package $\mathcal T$, written

$$
\mathsf{AdmProfile}(\lambda,\,I,\,\mathcal T),
$$

when its components are finite and the following checks hold:

- $\ell_i,\ell_j\in\mathsf{Lev}$ (a profile carries no level-bridge record; when $\ell_i\neq\ell_j$, the level bridge of one of the four types from Subsubsection 2.2.3 (translation, lift, forgetting, reflection) is required of the judgment's level/lens/interface record and checked with it, step 5 of Subsubsection 6.3.1, not by $\mathsf{AdmProfile}$);
- $\mathsf{BridgeType}_\lambda$ admitted by $\mathsf{BridgePolicy}_I$;
- $\mathsf{InstrumentMode}_\lambda=\mathsf{ModePolicy}_I(\text{surrounding judgment family})$;
- $(\mathsf{Scale}_\lambda,\mathsf{Regime}_\lambda,\mathsf{Locality}_\lambda,h_{\mathcal T})\in\mathsf{Compat}_I$, where $\mathsf{Compat}_I$ is a finite relation declared by the instrument, listing the scale, regime and locality values it accepts on each host.

Each check is a finite typing, equality, bridge-reference, or membership check on records carried by the instance, so $\mathsf{AdmProfile}$ is decidable.

A profile failing a typing or declared-mode check is inadmissible, so the candidate judgment is malformed. A structurally admissible profile may accompany content outside $\mathsf{Scope}_I$; the classifier then records $\texttt{outside\_scope}$ for a directed cell, promotion bridge or claim, and $\texttt{blocked}$ for a pair record, whose status family has no such value (Subsubsection 5.5.3). Profile admissibility is a finite check on finite records; like package admissibility (Subsubsection 3.3.3) and instrument admissibility (Subsubsection 3.4.1), it feeds the well-formedness classifier of Section 6 rather than producing its own theorem here.

Profile mutation is not allowed silently. A judgment whose statement carries one profile and whose proof or downstream use depends on a different profile requires an explicit profile-update record, itself a typed entry in $\mathsf{Cont}$ subject to the visibility, source, and audit discipline of Subsections 3.5 and 4.9 and Section 10.

### 3.6.3 Profile Dependence

The status assigned to a directed-cell, pair-observable or promotion record depends on the profile attached to the judgment. The same primitive labels and the same witness, update, visibility, threshold and audit data, attached to a different profile, can produce a different status. The regime variant below keeps the primitive labels, witness, update, visibility, threshold and audit data fixed and recomputes the required-bridge defect; in general, a profile change requires recomputing every affected record field, defect and audit check to satisfy well-formedness. Concretely:

- the running-example cell of Subsection 3.8 is $\texttt{action}$ under $\lambda_{\mathrm{audit}}$; the cell $C_{\mathrm{reg}}$ of Theorem 1 differs from it only in its regime, set to $\texttt{drive-certification}$ (admitted by $\mathsf{Compat}_I$), in the target of its audit and in the defect record recomputed from these. Its profile gives $\mathsf{ReqBridge}(C)=\{\texttt{drive}\}$; since $\mathsf{AddAuditRecord}$ names no drive bridge, $\delta_{\mathrm{reqbridge}}=\{\texttt{drive}\}$ and the first $\texttt{blocked}$ row of the directed-cell table of Subsubsection 5.6.6 applies. A cell whose profile has a level tag outside $\mathsf{Levels}_I$ receives $\texttt{outside\_scope}$, since step 5 of the well-formedness procedure requires $L$ to carry the level tags of the profile. A cell whose profile fails $\mathsf{AdmProfile}$ is malformed. The rows $\texttt{below\_threshold}$ and $\texttt{collapsed}$ read $\Theta$, $L$ and $W$, not $\lambda$;
- a pair-observable judgment on the same primitive pair, with the same source data, may be classified $\texttt{real}$ under one profile and $\texttt{blocked}$ under another;
- a promotion bridge with fixed packages and object maps may be $\texttt{strict}$ under one admissible profile and not accepted under another. Take a suppressed record $x\in\mathsf{Use}(B)$ whose only registered bridge is $L$ of strength $\texttt{weak}$. Assume every other use is visible, every bridge-admissibility condition except strength passes, and both profiles meet $\mathsf{AdmProfile}$. Recompute the audits, defects and gate records under each profile. If $\mathsf{BridgePolicy}_I$ assigns $\texttt{weak}$ to the (bridge type, regime) pair of the first profile, so that $\mathsf{RequiredStrength}(B)=\texttt{weak}$ (Subsubsection 5.5.2), the visibility defect is empty; with the other required gates passing, strict object maps and a required strictness verdict, the classifier returns $\texttt{strict}$. If it assigns $\texttt{strong}$ to that pair of the second profile, then $(x,L)\in\delta_{\mathrm{weakbridge}}(B)$ and $G_{\mathrm{vis}}$ fails; for the resulting well-formed, in-scope bridge, the classifier returns $\texttt{failed\_audit}$ if its audit gate fails, and $\texttt{failed\_no\_smuggling}$ otherwise. The choice between $\texttt{strict}$ and $\texttt{non\_strict}$ is fixed by $\Delta_{\mathrm{fact}}(\pi_j,\pi_{j+1})$ (Theorems 20 and 21).

This is a schema-grade observation about which fields the later classifiers must inspect: status is not a function of primitive labels alone, because the classifier's input includes the profile (along with witness, update, threshold, audit, visibility, defect, and source records). Theorem 1 of Section 6 is the theorem-grade statement that status does not factor through the primitive pair; its two cells also differ in update, visibility and audit records, and the regime variant above isolates the profile.

## 3.7 Witness and Update Families

### 3.7.1 Witness Map

The witness map of the calculus is the finite typed family

$$
\mathsf{Wit}\colon\mathbb P\;\to\;\mathrm{Type},\qquad P_i\;\mapsto\;\mathsf{Wit}(P_i),
$$

assigning to each primitive label a finite collection of admissible witness types. $\mathsf{Wit}$ and $\mathsf{Upd}$ are components of the instance: for each $P_i$ the instance fixes a finite set of named record signatures, and for any host tag drawn from $\mathsf{Host}$ the witness types specialize to finite records on that host. The tables of Subsubsections 3.7.4–3.7.5 list the kinds of signature this paper's instances use; the proofs use $\mathsf{RouteMismatchWit}\in\mathsf{Wit}(P_3)$, the source-record signature of Subsubsection 4.9.1 in $\mathsf{Wit}(P_6)$ (the role evidence of Theorem 5(a), audited by a record $A_{R_6}$ with $\mathsf{ClaimRef}=R_6$ and empty audit defect), and $\mathsf{AddAuditRecord},\mathsf{CertifyDrive}\in\mathsf{Upd}(P_6)$ (Subsubsection 3.1.1), and the signatures named in Subsection 12.5 and Subsubsection 13.2.5. A witness $W_i\in\mathsf{Wit}(P_i)$ is the informant-side data of a directed cell, or one side of a pair-observable record, in which $P_i$ supplies the witness family; its host, level, instrument, and profile tags are determined by the surrounding judgment.

### 3.7.2 Update Map

The update map of the calculus is the finite typed family

$$
\mathsf{Upd}\colon\mathbb P\;\to\;\mathrm{Type},\qquad P_i\;\mapsto\;\mathsf{Upd}(P_i),
$$

assigning to each primitive label a finite collection of admissible update types. Each $\mathsf{Upd}(P_i)$ is a finite family of finite typed records describing the effect that the primitive $P_i$ produces when it occupies the actor role in a directed cell or promotion bridge. As with witnesses, every update record carries host, level, instrument, and profile tags consistent with the surrounding judgment. Every update signature of $\mathsf{Upd}(P_i)$ includes a target field, naming the record $r$ of $\mathsf{Cont}$ it modifies, and an effect field recording its action on $r$ as a finite map $e_U$ on the type of $r$, each of which may hold the value none (for a completion, $e_U=E$ and $r$ is the recorded input); $\mathsf{noopU}$ reads only these two fields and is false when either holds none.

### 3.7.3 Witness/Update Constraint

A directed-cell witness slot is either a present $W_j\in\mathsf{Wit}(P_j)$ or a typed, audited absence marker for $P_j$; its update slot is either a present $U_i\in\mathsf{Upd}(P_i)$ or a typed, audited absence marker for $P_i$. Each marker is a finite record in $\mathsf{Cont}$ naming its primitive, slot, and passing absence audit. A wrong-typed present record or an unaudited absence marker is malformed. A typed, audited absence passes its slot check; if the remaining well-formedness checks pass, the cell classifier tests the marker. The rule is checked at the well-formedness step of Section 6 together with the package, instrument, profile, level, visibility, threshold, audit, and defect conditions of the surrounding judgment.

The notation $P_i\leftarrow P_j$ for a directed cell is a typed bridge judgment that records this rule. It is not an expression of a binary product on $\mathbb P$, and a statement that uses the notation but violates the witness/update rule is a malformed cell, not a primitive product.

### 3.7.4 Primitive Witness Table

The primitive witness families used in this paper are listed below. Each entry is the finite witness family of the corresponding primitive: the entry names the kinds of records that count as witnesses, and each named record type is itself a finite typed record on the relevant host.

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\begin{center}
\begin{tabularx}{0.96\linewidth}{@{}>{\raggedright\arraybackslash}p{0.11\linewidth}>{\raggedright\arraybackslash}X@{}}
\toprule
Primitive & $\mathsf{Wit}(P_i)$ \\
\midrule
$P_1$ & descent success/failure records, rewrite obstruction records, closure-deficit records \\
$P_2$ & representability and nonrepresentability records, gate decisions, support and capacity records \\
$P_3$ & route-mismatch records, holonomy records, commutator records, critical-pair records, pasting-mismatch records \\
$P_4$ & stage records, refinement records, filtration records, cover records, local/global obstruction records \\
$P_5$ & package map records, quotient records, completion records, idempotence records, fixed-point records \\
$P_6$ & audit records, provenance records, source-of-truth records, threshold-check records, nonclaim records, drive certificates \\
\bottomrule
\end{tabularx}
\end{center}
\endgroup

The drive-certificate entry under $\mathsf{Wit}(P_6)$ is reserved for $\mathrm{P6}_{\mathrm{drive}}$ data, which is the drive face of $P_6$ rather than the generic audit face. A drive certificate is admissible only when the surrounding host supports it, and Section 8 lists the finite cycle-supported and gating-suppression cases in which the certificate may or may not be supported. The presence of generic audit records under $\mathsf{Wit}(P_6)$ does not by itself supply a drive certificate.

### 3.7.5 Primitive Update Table

The primitive update families used in this paper are listed below.

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.08}
\begin{center}
\begin{tabularx}{0.96\linewidth}{@{}>{\raggedright\arraybackslash}p{0.11\linewidth}>{\raggedright\arraybackslash}X@{}}
\toprule
Primitive & $\mathsf{Upd}(P_i)$ \\
\midrule
$P_1$ & mark descent failure, install descended update, rewrite, repair \\
$P_2$ & mark representable or nonrepresentable, gate support, update admissibility record \\
$P_3$ & record route mismatch, holonomy, commutator, critical pair \\
$P_4$ & refine lens, advance stage, record local/global obstruction \\
$P_5$ & install package map, apply completion endomap, register fixed-point record, saturate \\
$P_6$ & add audit, check provenance, commit source, record nonclaim, certify drive or no-drive \\
\bottomrule
\end{tabularx}
\end{center}
\endgroup

Each entry above is a finite typed update record on the host of the surrounding judgment. The certify-drive-or-no-drive entry under $\mathsf{Upd}(P_6)$ is the update counterpart to the drive certificate witness type; it is admissible only when the surrounding host and instrument support drive judgments, and the drive or no-drive records of Section 8 are recorded through this update family.

The witness and update tables together fix the typed actor/informant data for directed cells and the related witness/update records used by pair observables, promotion bridges, and instrument-indexed claims. Section 4 introduces the judgment families that consume this data; Section 5 introduces the defect records that the data may produce; and Sections 6 through 11 use these records in the theorem-grade results.

## 3.8 A Running Example

The following directed cell serves as a running example; later sections return to it briefly. It is the active cell of the countermodels $\mathsf{CM}_4$ and $\mathsf{CM}_7$, with every field written out.

Take the finite carrier $\mathcal P(U)$ with $U=\{a,b,c\}$ and the two completion maps of Subsubsection 7.4.1: $E_1$ adds $b$ to every set that contains $a$, and $E_2$ adds $c$ to every set that contains $b$. Each map is idempotent, and, writing $E_1E_2$ for $E_1\circ E_2$ (apply $E_2$ first), the two do not commute at $\{a\}$:

$$
E_1E_2(\{a\})\;=\;\{a,b\},\qquad E_2E_1(\{a\})\;=\;\{a,b,c\}.
$$

In plain words, the informant is the route mismatch, shown by the set $\{a\}$ on which the two orders of completion differ, and the actor is an audit, whose update adds a record of both recomputations to its log. The fields listed below say which witness and update the cell carries, at which level, what is visible, which threshold applies, which audit record checks it, and which defects it has.

Its status is computed by the directed-cell table of Subsubsection 5.6.6, whose rows are tested from the top and whose last column evaluates this cell; $\delta_6^{\mathrm{audit}}$, $\mathsf{implicitW}$ and $\mathsf{noopU}$ are defined in Subsubsections 5.3.6 and 4.3.4. In summary: $W_3$ is the mismatch at $\{a\}$; $U_6$ logs both recomputed images; every field is visible, both levels are $\mathsf{Ver}$, the threshold $\Theta_{\ge1}$ (the images differ) is met, the audit passes and $\delta=\varnothing$. Every row above $\texttt{action}$ fails, so the status is $\texttt{action}$. The instrument fields below, and the records $U_6'$, $x$ and $L_{\mathrm{drive}}$, do not affect the status of this cell; Theorems 1, 2 and 5 use them, and the item *Bridge strengths* fixes the comparison that blocks the cell $C_{\mathrm{blk}}$ of Theorem 1.

The running example is the directed cell $P_6\leftarrow P_3$ in which an audit ($P_6$) records this route mismatch ($P_3$):

$$
\mathsf{Cell}_{63}^{\lambda_{\mathrm{audit}}}\;=\;(\,P_6\leftarrow P_3,\;W_3,\;U_6,\;L,\;V,\;\Theta,\;A,\;\delta\,),
$$

with the following fields, defined in Subsubsection 4.3.3: $W_3$ is the informant's witness, $U_6$ the actor's update, $L$ the level, lens and interface record, $V$ the visibility record (which also lists any visibility bridges), $\Theta$ the thresholds, $A$ the audit record (Subsubsection 4.9.2), $\delta$ the defect records (Section 5), and $\lambda$ the profile (Subsection 3.6). $\mathsf{AuditPolicy}_I$ and $\mathsf{BridgePolicy}_I$ are policies of the instrument $I$ (Subsection 3.4), and NC-12 is a nonclaim of the register in Subsection 15.2.

- $W_3=\mathsf{RouteMismatchWit}\in\mathsf{Wit}(P_3)$, the route-mismatch record $(E_1,E_2,\{a\})$: the set $\{a\}$ lies in the route-mismatch defect $\Delta_3^{\mathrm{comp}}(E_1,E_2)$ of Theorem 10.
- $U_6=\mathsf{AddAuditRecord}\in\mathsf{Upd}(P_6)$, the update that adds to the audit log $\Lambda$ a fresh entry $\varepsilon\notin\Lambda$ recording the recomputation of $E_1E_2(\{a\})$ and $E_2E_1(\{a\})$, so $e_U(\Lambda)=\Lambda\cup\{\varepsilon\}\neq\Lambda$.
- $L$: both level tags are $\mathsf{Ver}$, the lens is the identity of $\mathcal P(U)$, and the interface is the pair $(E_1,E_2)$. The two tags coincide, so no level bridge is needed.
- $V$: every field of the cell and every record of $\mathsf{Use}(C)$ is visible under the surrounding instrument $I$, so no visibility bridge is used.
- $\Theta$: the threshold $\Theta_{\ge\varepsilon}$ of Subsubsection 5.2.2 with lower bound $1$, written $\Theta_{\ge1}$, on the datum $|E_1E_2(\{a\})\,\triangle\,E_2E_1(\{a\})|$, a direct check on the witness values; the datum equals $1$, so the threshold is met.
- $A$: an audit record whose target ($\mathsf{ClaimRef}$) is the cell, whose evidence references ($\mathsf{EvidenceRefs}$) are the tables of $E_1$ and $E_2$, whose check rules recompute the two composites at $\{a\}$ under $\mathsf{AuditPolicy}_I$, whose source references point to the committed record of $E_1$ and $E_2$, which satisfies the source policy of $I$, and whose nonclaim field records that the cell asserts no drive (NC-12 of Subsection 15.2). Its check results and its visibility, threshold and circularity checks all pass.
- $\delta=\varnothing$: its visibility and required-bridge defect sets are empty, it has no package-collapse or $\Theta$-named primitive defect entry, $\mathsf{noopU}$ and $\mathsf{implicitW}$ are false, and its audit defect has the passing value $\delta_6^{\mathrm{audit}}=\texttt{audit\_passes}$ (the convention of Subsubsection 5.3.6). The route-mismatch defect $\Delta_3^{\mathrm{comp}}(E_1,E_2)$ is the content of the witness $W_3$, not a defect of the cell.
- $\lambda_{\mathrm{audit}}$: both level tags $\mathsf{Ver}$, the fine scale of the finite carrier, the audit regime, the bridge type $\texttt{visibility}$ (admitted by $\mathsf{BridgePolicy}_I$; no visibility bridge is needed, since every field is visible), the audit-only instrument mode, and local use of the data. For this instance, $\mathcal T$ has host $\mathsf H_{\mathrm{fin}}$, $\mathsf{ModePolicy}_I(\texttt{directed-cell})=\texttt{audit-only}$, and $\mathsf{Compat}_I$ contains $(\texttt{fine},\texttt{audit},\texttt{local},\mathsf H_{\mathrm{fin}})$ and $(\texttt{fine},\texttt{drive-certification},\texttt{local},\mathsf H_{\mathrm{fin}})$. The bridge policy admits both the visibility and the drive bridge types.
- *Records for the later variations (used only by the blocked cell of Theorem 1, its reuse in Theorem 2, and kept in $\mathsf{Cont}$ by the instances of Theorem 5(a) and (c); skip on first reading).* The instance also contains the update $U_6'=\mathsf{CertifyDrive}\in\mathsf{Upd}(P_6)$, whose entry field names the candidate drive-certificate record $x$, and a registered drive-type visibility bridge $L_{\mathrm{drive}}$ from $x$ to a visible record, of strength $\texttt{weak}$; the cell above does not use them.
- *Package and instrument.* $\mathcal T=(\mathcal P(U),\mathrm{id}_{\mathcal P(U)},\mathcal P(\mathcal P(U)),\mathrm{id},\mathcal A)$ on $\mathsf H_{\mathrm{fin}}$ at level $\mathsf{Ver}$, with every field visible; source record $(\texttt{e12},\texttt{committed\_state},\text{the tables of }E_1,E_2,\texttt{valid})$; an empty defect family; an empty attached witness family $W_{\mathcal T}=\varnothing$; one audit entry recomputing both tables; and the nonclaim NC-12. Every record of the instance, in particular $W_3$, $U_6$, $U_6'$, $x$, $L_{\mathrm{drive}}$, $\Theta$, $A$, $V$ and $\texttt{e12}$, carries host tag $\mathsf H_{\mathrm{fin}}$ and level tag $\mathsf{Ver}$. The instrument $I$ has these fields:

    - *Scope*: $\mathsf{Scope}_I=\mathsf{Cont}$, the records of the instance; only this is needed for the status of this cell. $\mathsf{Cont}$ contains the records of $\mathcal T$, $W_3$, $U_6$, $U_6'$ with its entry field $x$, $L_{\mathrm{drive}}$, every directed-cell record with its fields, and each cell's verdict reference $\ulcorner\mathsf{Cell},I\urcorner$, so the circular variant of Theorem 2 stays in scope. Each variant of Subsections 6.1–6.5 takes its own $\mathsf{Cont}$ as $\mathsf{Scope}_I$. Its instrument keeps the identifier and all other fields of $I$, lists the records of the variant in $\mathsf{Scope}_I$ and $\mathsf{Visible}_I$, and replaces $I$ in that variant's instance. There are two exceptions: the $\texttt{outside\_scope}$ variant of Theorem 2 uses the instrument $I'$ described there, and in Theorem 5(c)–(d) $\mathsf{Scope}_I$ stays the $\mathsf{Cont}$ of Theorem 5(a), so the added records lie outside the scope of $I$;
    - *Hosts and levels*: $\mathsf{Hosts}_I=\{\mathsf H_{\mathrm{fin}}\}$ and $\mathsf{Levels}_I=\{\mathsf{Ver}\}$;
    - *Claim types, modes and check rules*: claim types $\texttt{directed-cell}$, $\texttt{role-channel}$, $\texttt{drive-check}$ and $\texttt{pair-observable}$ with $\mathsf{ModePolicy}_I(\texttt{pair-observable})=\texttt{audit-only}$, with terminating check rules for the role channel, the candidate drive/no-drive entry, the cell recomputation and threshold, the pair source and required-bridge checks, the audit of $L_{\mathrm{drive}}$, and the replay of every audit that a variant of Subsections 6.1–6.5 or $\mathsf{CM}_4$ adds (absence audits of typed absence markers, and audits of added cells, attached witnesses and branch-compatibility records); each audit under $I$ draws its rules from this family, $\mathsf H_{\mathrm{fin}}$ admitting that candidate check without asserting a positive drive certificate;
    - *Visibility*: $\mathsf{Suppressed}_I=\{x\}$, the record named by the entry field of $U_6'$ above, and $\mathsf{Visible}_I=\mathsf{Scope}_I\setminus\{x\}$;
    - *Thresholds and level*: the threshold $\Theta_{\ge1}$ on an exact datum; level $\mathsf{Ver}$;
    - *Bridge strengths*: bridge strengths $\mathsf{Strength}_I=\{\texttt{weak}<\texttt{strong}\}$, with $\mathsf{Strength}(L_{\mathrm{drive}})=\texttt{weak}$ and required strength $\texttt{strong}$ under drive certification; the strength map of $\mathsf{BridgePolicy}_I$ sends $(\texttt{drive},\texttt{drive-certification})$ to $\texttt{strong}$ and the other admitted (bridge type, regime) pairs to $\texttt{weak}$, so a cell with profile $\lambda_{\mathrm{drive}}$, which agrees with $\lambda_{\mathrm{audit}}$ except that its regime is drive-certification and its bridge type is drive (Subsubsection 6.1.1), has $\mathsf{RequiredStrength}=\texttt{strong}$; and $\mathsf{ReqStrength}_I(\texttt{drive-check})=\texttt{strong}$, $\mathsf{ReqStrength}_I(\chi)=\texttt{weak}$ for every other admitted claim type $\chi$;
    - *Source policy*: a source policy admitting $\texttt{committed\_state}$ in the sense of Subsubsection 5.3.6;
    - *Evidence, audit and nonclaim fields*: $\mathsf{EvidencePolicy}_I$ admits $\texttt{committed\_state}$ as direct evidence; $\mathsf{AuditPolicy}_I$ requires replay of every recorded check result under the rules above and lists NC-12 as the only required nonclaim for directed cells; $\mathsf{ProvisionalTypes}_I=\varnothing$; $\mathcal N_I=\{\text{NC-12}\}$. The tables of $E_1$ and $E_2$ are records of $\mathsf{Cont}$, named in the trace of $\texttt{e12}$.

    Each condition of Subsubsections 3.3.3 and 3.4.1 and of the profile admissibility of Subsection 3.6 holds by inspection of these finite records. The remaining components of the instance (hosts, audit records, source records, visibility records and bridges, defect records and nonclaims) consist of the records listed above, each written in its schema, and the dependency, gate and realization components are empty, so $\mathsf{AdmDomain}$ of Subsubsection 4.10.1 holds; each variant of Subsections 6.1–6.5 adds only records of these schemas.

This cell passes the checks of the well-formedness procedure of Subsubsection 6.3.1, and the classifier of Subsubsection 5.6.2 assigns it the status $\texttt{action}$. Two variations of it appear later. The same pair $P_6\leftarrow P_3$ with a drive-certification update and a registered drive bridge too weak for the drive-certification profile is blocked (Theorem 1). The pair observable on $\{P_3,P_6\}$ with a drive profile is blocked while this cell is active (Theorem 5 and $\mathsf{CM}_4$): its source slot is an audited absence, so $\delta_6^{\mathrm{source}}=\texttt{missing}$, and it has no drive bridge, so $\delta_{\mathrm{reqbridge}}=\{\texttt{drive}\}$; either defect alone triggers the first $\texttt{blocked}$ row.

The blocked cell of Theorem 1 keeps the same primitive pair and route-mismatch witness, but uses a drive-certification update under a profile requiring a drive bridge. The update's entry field $x$, the candidate drive certificate, is suppressed and bridged only by the registered drive bridge $L_{\mathrm{drive}}$, which is too weak for that profile; the audit record notes the failed strength comparison. The witness and the update are both present, so the row $\texttt{absent}$ of the classifier table in Subsubsection 5.6.6 does not apply. Both $\delta_{\mathrm{weakbridge}}=\{(x,L_{\mathrm{drive}})\}$ and $\delta_{\mathrm{reqbridge}}=\{\texttt{drive}\}$ are nonempty, so the row $\texttt{blocked}$ applies, and the cell receives the status $\texttt{blocked}$.
