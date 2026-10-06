#!/usr/bin/env python3
"""Make the printed cross-references of the generated section files clickable.

The Markdown sources refer to sections and numbered claims by their printed
numbers ("Subsubsection 5.6.6", "Theorems 2--5", "Appendix G").  This pass
runs on the pandoc output, in the \\input order of main.tex:

1. it labels every numbered heading with \\label{sn:<number>}, computing the
   number the way LaTeX will (sections, subsections, subsubsections; letters
   after \\appendix), and checks it against the number prefix of the
   corresponding Markdown heading;
2. it anchors every claim environment whose title starts with
   "Theorem N", "Model Theorem N", "Proposition N" or "Definition N";
3. it wraps each number token that follows a reference keyword in
   \\hyperref[...]{...}, leaving the printed text unchanged.

The pass is idempotent: it removes its own labels and links before applying
them again.  Code blocks, headings and claim-title lines are left alone.
"""
import re
import sys
from pathlib import Path

paper = Path(sys.argv[1]).resolve().parent if len(sys.argv) > 1 else Path("paper").resolve()
main = (paper / "main.tex").read_text()

inputs = []
appendix_at = None
for line in main.splitlines():
    s = line.strip()
    if s.startswith("%"):
        continue
    if s == "\\appendix":
        appendix_at = len(inputs)
    m = re.match(r"\\input\{(sections/[^}]+)\}", s)
    if m:
        inputs.append(m.group(1))

OWN_LABEL = re.compile(r"\\label\{sn:[^}]*\}|\\phantomsection\\label\{cl:[^}]*\}")
OWN_LINK = re.compile(r"\\hyperref\[(?:sn|cl):[^\]]*\]\{([^{}]*)\}")
HEAD = re.compile(r"^\\(section|subsection|subsubsection)\{")
CLAIM = re.compile(
    r"\\begin\{claim(?:theorem|proposition|definition)\}\{"
    r"(Model Theorem|Theorem|Proposition|Definition) ([0-9]+)\b"
)
SKIP_ENV = re.compile(r"\\begin\{(Shaded|Highlighting|verbatim|lstlisting)\}")
END_ENV = re.compile(r"\\end\{(Shaded|Highlighting|verbatim|lstlisting)\}")

KIND = {
    "Section": "sn", "Sections": "sn",
    "Subsection": "sn", "Subsections": "sn",
    "Subsubsection": "sn", "Subsubsections": "sn",
    "Appendix": "sn", "Appendices": "sn",
    "Theorem": "thm", "Theorems": "thm",
    "Model Theorem": "thm", "Model Theorems": "thm",
    "Proposition": "prop", "Propositions": "prop",
    "Definition": "def", "Definitions": "def",
}
NUM = r"(?:[0-9]+|[A-J])(?:\.[0-9]+)*"
SEP = r"(?:,\s+and\s+|\s+and\s+|,\s+|--|\s+through\s+|\s+to\s+)"
REF = re.compile(
    r"(?<![A-Za-z])(Model Theorems?|Theorems?|Propositions?|Definitions?|"
    r"Subsubsections?|Subsections?|Sections?|Appendix|Appendices)"
    r"((?:~|\s+))(" + NUM + r"(?:" + SEP + NUM + r")*)(?![0-9A-Za-z])"
)


def md_heading_numbers(tex_name):
    md = paper / (tex_name + ".md")
    if not md.exists():
        return None
    nums = []
    fence = False
    for line in md.read_text().splitlines():
        if line.startswith("```"):
            fence = not fence
            continue
        if fence:
            continue
        m = re.match(r"^(#{1,3}) (?:Appendix )?((?:[0-9]+|[A-Z])(?:\.[0-9]+)*)\.? ", line)
        if m:
            nums.append(m.group(2))
    return nums


def main_pass():
    sec = sub = subsub = 0
    labels = set()
    texts = {}
    problems = []
    for idx, name in enumerate(inputs):
        path = paper / (name + ".tex")
        text = path.read_text()
        text = OWN_LABEL.sub("", text)
        while OWN_LINK.search(text):
            text = OWN_LINK.sub(r"\1", text)
        in_appendix = appendix_at is not None and idx >= appendix_at
        if in_appendix and idx == appendix_at:
            sec = 0
        out = []
        computed = []
        for line in text.split("\n"):
            m = HEAD.match(line)
            if m:
                level = m.group(1)
                if level == "section":
                    sec += 1
                    sub = subsub = 0
                    num = chr(ord("A") + sec - 1) if in_appendix else str(sec)
                elif level == "subsection":
                    sub += 1
                    subsub = 0
                    num = f"{chr(ord('A') + sec - 1) if in_appendix else sec}.{sub}"
                else:
                    subsub += 1
                    num = f"{chr(ord('A') + sec - 1) if in_appendix else sec}.{sub}.{subsub}"
                computed.append(num)
                labels.add(f"sn:{num}")
                line = line + f"\\label{{sn:{num}}}"
            c = CLAIM.search(line)
            if c:
                kind = {"Model Theorem": "thm", "Theorem": "thm",
                        "Proposition": "prop", "Definition": "def"}[c.group(1)]
                lab = f"cl:{kind}:{c.group(2)}"
                if lab not in labels:
                    labels.add(lab)
                    line = line + f"\\phantomsection\\label{{{lab}}}"
            out.append(line)
        md_nums = md_heading_numbers(name)
        if md_nums is not None and md_nums != computed:
            problems.append(f"{name}: Markdown heading numbers {md_nums[:6]}... "
                            f"differ from LaTeX numbering {computed[:6]}...")
        texts[path] = "\n".join(out)

    def link_numbers(m):
        kind = KIND[m.group(1)]
        body = m.group(3)

        def one(tok):
            t = tok.group(0)
            if kind == "sn":
                lab = f"sn:{t}"
            else:
                lab = f"cl:{kind}:{t}"
            return f"\\hyperref[{lab}]{{{t}}}" if lab in labels else t

        return m.group(1) + m.group(2) + re.sub(NUM, one, body)

    for path, text in texts.items():
        out = []
        skipping = False
        for line in text.split("\n"):
            if SKIP_ENV.search(line):
                skipping = True
            if skipping or HEAD.match(line) or CLAIM.search(line) or "\\texorpdfstring" in line:
                out.append(line)
            else:
                out.append(REF.sub(link_numbers, line))
            if END_ENV.search(line):
                skipping = False
        path.write_text("\n".join(out))

    for p in problems:
        print("tex_crossrefs: WARNING " + p, file=sys.stderr)
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main_pass())
