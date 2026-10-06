# Appendix F. Mechanization Disclosure and Audit Table

This appendix is the canonical disclosure venue for the proof-assistant artifact attached to this paper. The body gives the mathematical statements and proofs; this appendix records the full paper-to-Lean alignment, the wording used to describe Lean coverage, and the validation boundary.

## F.1 Coverage Classes

The table of Subsection F.2 lists each numbered result and definition with the Lean declarations that support it and one of the following coverage classes.

- **Direct proof.** The Lean declaration proves the paper statement for the stated finite objects.
- **Direct proof under stated hypotheses.** The Lean declaration proves the paper statement from hypotheses that the table names in its scope column.
- **Partial proof.** The Lean declarations prove part of the paper statement, or prove it for a restricted class of objects; the scope column names the part or the restriction, and the paper's proof covers the rest.
- **Record projection.** The Lean declaration states the result for a finite record whose fields carry the paper's content. The declaration checks the shape of the result; the mathematics is in the paper's proof.
- **Schema mirror.** A definition-level typed mirror of a paper definition.

A model-realization statement is covered at most as a record projection: the Lean records do not verify a concrete implementation of the model host.

## F.2 Paper-to-Lean Disclosure Table

\input{includes/mechanization_disclosure_table.tex}

## F.3 Reproducibility and Trust Base

The Lean artifact is the repository's finite validation track for the manifest scope listed in the table above. It is checked under the pinned toolchain recorded in the repository, and the strict validation command checks the build, the required manifest entries, declaration existence, declaration kind, theorem axiom dependencies, placeholder scans, and semantic probes.

The allowed non-project axioms for theorem audits are:

\[
\texttt{Classical.choice},\quad
\texttt{propext},\quad
\texttt{Quot.sound},\quad
\texttt{choice},\quad
\texttt{funext}.
\]

The first three are Lean 4's standard axioms; the entries \texttt{choice} and \texttt{funext} name no further axiom (\texttt{funext} is a theorem derived from \texttt{Quot.sound}). All theorem-backed manifest entries are audited against this trust base. The trust-base statement is a proof-assistant audit statement; it is not an additional mathematical theorem about the calculus.

## F.4 Compressed Module Map

The root import collects the finite support for primitive labels, levels, hosts, status families, record schemas, finite-map and completion theorems, graph/cohomology theorems, promotion and instrument theorems, abstract-interpretation theorems, high-structure recovery theorems, model-realization records, top-down channel records, semantic probes, and the validation-harness record.

This module map is an audit map. It records where the finite support for each manifest entry lives; it does not certify statements outside the manifest.

## F.5 Proposition 35: Mechanization Target Feasibility

\begin{claimproposition}{Proposition 35 (MechanizationTargetFeasibility)}
On 2026-09-27, at revision \texttt{c0ad1eb} of the repository \url{https://github.com/ioannist/six-birds-foundations-iii}, with the Lean toolchain \texttt{leanprover/lean4:v4.28.0}, the strict validation command \texttt{scripts/validate\_lean.sh --tier full --require-full} reported the following for the manifest of Subsection F.2: the project builds; all 24 definitions and all 38 required claims of the manifest (the 35 numbered results and the three unnumbered propositions of Subsection 4.7) have a Lean declaration; all 96 primary and supporting declarations exist and have the declaration kind the manifest expects; all 72 axiom audits of theorem declarations stay within the trust base of Subsection F.3; no placeholder markers and no semantic-audit findings are present; and the validator's overall verdict is \texttt{full}: every manifest row has a checked declaration of the expected kind. Of the 38 claims, 9 are direct proofs, 4 direct proofs under stated hypotheses, 13 partial proofs and 12 record projections (Subsection F.2). The verdict certifies that each manifest entry is represented by a checked Lean declaration. What each declaration proves is given by its coverage class and scope in the table of Subsection F.2.
\end{claimproposition}

\begin{proof}
The validation artifact consists of the finite manifest, the Lean declarations it names, the pinned toolchain, the trust-base list, and the validator. The validator checks that the project builds under the pinned toolchain, that each required manifest row is present, that each named declaration exists and has the expected declaration kind, that the non-project axiom dependencies of each theorem declaration lie in the trust base, that the sources contain no placeholder markers, and that the semantic probe module exposes the required finite checks. The run of the statement passed each of these finite checks, with the counts stated. The Lean declaration \texttt{SixBirdsIII.mechanization\_target\_feasibility} records the categories of these checks as a finite record (a record projection in the table of Subsection F.2); the run itself is the evidence for the statement.
\end{proof}

## F.6 Mechanization Nonclaims

The validation artifact is manifest-scoped. It does not assert proof-assistant certification for unlisted statements, empirical correctness of any concrete implementation, a universal exact-six theorem, a universal six-symbol algebra, a unique decomposition theorem, complete model coverage, complete same-level self-certification, or host extensions outside the finite audited manifest scope. For a result whose coverage class is record projection, the Lean declaration does not certify the mathematics of the result; the paper's proof does.
