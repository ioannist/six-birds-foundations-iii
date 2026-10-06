#!/usr/bin/env python3
"""Isolate theorem-like environment delimiters in a Markdown section.

Pandoc passes a whole \\begin{env}...\\end{env} block through as raw LaTeX,
so Markdown inside proofs and claim environments (lists, emphasis) would be
left unconverted. Wrapping each delimiter line in its own raw-LaTeX fence lets
pandoc convert the Markdown between them. Only complete delimiter lines are
matched: the environment command, at most one balanced brace argument, and
nothing after it. The original line is emitted unchanged inside the fence.
Usage: md_isolate_envs.py IN.md OUT.md
"""
import re
import sys

ENVS = ("proof", "claimtheorem", "claimdefinition", "claimproposition")
PAT = re.compile(r"^\\(begin|end)\{(" + "|".join(ENVS) + r")\}(\{.*\})?$")


def balanced(arg):
    depth = 0
    for i, ch in enumerate(arg):
        depth += ch == "{"
        depth -= ch == "}"
        if depth == 0 and i != len(arg) - 1:
            return False
        if depth < 0:
            return False
    return depth == 0


def is_delimiter(line):
    m = PAT.match(line)
    if not m:
        return False
    arg = m.group(3)
    return arg is None or balanced(arg)


src, dst = sys.argv[1], sys.argv[2]
out = []
for line in open(src, encoding="utf-8").read().split("\n"):
    if is_delimiter(line):
        out += ["", "```{=latex}", line, "```", ""]
    else:
        out.append(line)
open(dst, "w", encoding="utf-8").write("\n".join(out))
