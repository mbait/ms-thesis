#!/bin/sh
# Called by latex-g7-32 container's boot.sh when this repo is mounted at /doc.
# Builds thesis-gost.tex with XeLaTeX + GOST bibliography style.

set -e
set -x
set -u

RESDIR="/doc/results"
mkdir -p "$RESDIR"
chmod a=rwx "$RESDIR"

cd /doc

# Make ugost2008n.bst discoverable by bibtex.
export BSTINPUTS="/doc/GOST/bibtex/bst/gost:${BSTINPUTS:-}"

xelatex -interaction=nonstopmode -halt-on-error thesis-gost.tex
bibtex thesis-gost || true
xelatex -interaction=nonstopmode -halt-on-error thesis-gost.tex
xelatex -interaction=nonstopmode -halt-on-error thesis-gost.tex

cp thesis-gost.pdf "$RESDIR/thesis-gost.pdf"
chmod a=rw "$RESDIR/thesis-gost.pdf"
