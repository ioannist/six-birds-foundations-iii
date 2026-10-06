# Appendix E. High-Structure Semantics

This appendix records the long-form definitions of the finite decorated-square fragment of Section 14. Subsection E.1 records the fragment in full, and Subsection E.2 points to the recovery theorems and nonclaims in Section 14.

The appendix is host-bound to the finite decorated double-category fragment $\mathsf H_{\mathrm{DC}}$ and supplements Section 14; it does not introduce new theorems beyond Theorems 30, 31, and 32.

## E.1 Finite Decorated-Square Fragment

This subsection expands the schema of Subsection 14.1. The decorated-square fragment is a secondary organizational layer over the core calculus: it does not replace the directed-cell, pair-observable, promotion, claim, gate, or square status families, and it does not assert a completeness theorem for the calculus.

### E.1.1 Objects, Horizontal Arrows, Vertical Arrows

The finite decorated double-category fragment $\mathsf H_{\mathrm{DC}}$ is the finite typed record

$$
\mathsf H_{\mathrm{DC}}\;=\;(\,\mathrm{Ob},\;\mathrm{Hor},\;\mathrm{Ver},\;\mathrm{Sq},\;A_{\mathrm{DC}},\;V_{\mathrm{DC}},\;\mathcal N_{\mathrm{DC}}\,),
$$

with components fixed in Subsubsection 14.1.1: $\mathrm{Ob}$ the finite class of package objects $\mathcal T$ of Subsection 3.3; $\mathrm{Hor}$ and $\mathrm{Ver}$ the classes of Subsubsection 14.1.1, which maps sit on which side being fixed by the square type; $\mathrm{Sq}$ the finite class of decorated squares; $A_{\mathrm{DC}}$ the host audit record; $V_{\mathrm{DC}}$ the host visibility record; and $\mathcal N_{\mathrm{DC}}$ the host nonclaim register.

Compositions of horizontal and vertical arrows are admitted only when the resulting boundary records are finite and audited under $I_{\mathrm{DC}}$.

\clearpage

### E.1.2 Decorated Square Schema

A decorated square $\Xi\in\mathrm{Sq}$ is a finite typed record

$$
\Xi\;=\;(\,X,\;F,\;q,\;F^{\sharp},\;\mathrm{src}_{\Xi},\;\mathrm{tgt}_{\Xi},\;\mathrm{type}_{\Xi},\;\mathsf{Decor}_{\Xi},\;A_{\Xi},\;V_{\Xi},\;\delta_{\Xi},\;\mathcal N_{\Xi},\;\mathsf{partialEvidence}_{\Xi}\,),
$$

with $\mathrm{type}_{\Xi}\in\{\,\texttt{descent},\;\texttt{quotient},\;\texttt{completion},\;\texttt{promotion},\;\texttt{visibility},\;\texttt{audit},\;\texttt{factorization}\,\}$ and $\mathsf{Decor}_{\Xi}$ recording the type-specific decoration data.

\begingroup
\setlength{\tabcolsep}{4pt}
\renewcommand{\arraystretch}{1.06}
\begin{center}
\begin{tabularx}{0.96\linewidth}{@{}>{\raggedright\arraybackslash}p{0.19\linewidth}>{\raggedright\arraybackslash}X@{}}
\toprule
field & meaning \\
\midrule
$X$ & source object of the square, an element of $\mathrm{Ob}$ \\
$F$ & horizontal arrow component of the boundary \\
$q$ & vertical arrow component of the boundary \\
$F^{\sharp}$ & bottom horizontal arrow or candidate descended/completed arrow \\
$\mathrm{src}_{\Xi},\mathrm{tgt}_{\Xi}$ & source and target boundary tuples \\
$\mathrm{type}_{\Xi}$ & one of the seven square types listed above \\
$\mathsf{Decor}_{\Xi}$ & type-specific decoration: descent, quotient, completion, promotion, visibility, audit, or factorization data \\
$A_{\Xi},V_{\Xi}$ & per-square audit and visibility records \\
$\delta_{\Xi}$ & per-square defect record, classified in the square-status family \\
$\mathcal N_{\Xi}$ & per-square nonclaim register \\
$\mathsf{partialEvidence}_{\Xi}$ & declared Boolean: the evidence for the square is incomplete \\
\bottomrule
\end{tabularx}
\end{center}
\endgroup

The exactness condition for each square type is recorded in Subsubsection 14.1.2: descent commutation equality for $\texttt{descent}$, completion-commutation equality for $\texttt{completion}$, factorization-filler condition for $\texttt{factorization}$, and bridge-admissibility conditions for $\texttt{visibility}$ and $\texttt{audit}$.

### E.1.3 Strict Pasting

The strict-pasting law of Subsubsection 14.1.3 bounds the defect of an admissible horizontal paste of two decorated squares $\Xi_{1}$ and $\Xi_{2}$ with top edges $F_1,F_2$:

$$
\delta_{\Xi_{1}\cdot\Xi_{2}}\;\subseteq\;\delta_{\Xi_{1}}\;\cup\;F_1^{-1}(\delta_{\Xi_{2}}),
$$

and the inclusion can be strict (Theorem 31). The paste defect $\delta_{\mathrm{paste}}(\Xi_{1},\Xi_{2})$ is the finite record of shared edges recorded differently in the two squares; it is empty whenever pasting is admissible. Pasting is admissible when the shared edge data agree on $\mathrm{Hor}$ or $\mathrm{Ver}$ and the per-square admissibility conditions hold for both factors. Pseudo-pasting and weak pasting are out of scope.

## E.2 Recovery Theorems and Nonclaims

The descent-square, completion-pasting and strict-extension recoveries (Theorems 30, 31 and 32) are stated and proved in Subsections 14.2, 14.3 and 14.4, and the high-structure nonclaims are recorded in Subsection 14.5; this appendix does not repeat them.
