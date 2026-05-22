# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Master's thesis (spec. 15.04.02) on a physics solver with GPU acceleration for the «Модейлер» robotics simulation platform. Written in Russian, formatted per ГОСТ Р 7.0.11-2011.

## Build

```bash
make all                                      # full document → build/main.pdf
make preview SECTION=sections/ch1/1_1_sim_tasks  # single section → build/preview.pdf
make clean
```

Requires Docker. Image: `ghcr.io/mbait/texlive-stem-docker:master` (must be pulled locally).
Engine: LuaLaTeX via `latexmk`. Output goes to `build/`.

## Structure

```
main.tex          — root document; uses \include{} for each chapter
preamble.tex      — all packages and ГОСТ formatting
sections/
  intro.tex       — Введение
  ch1/ch1.tex     — Глава 1 (inputs 1_1_*, 1_2_*, 1_3_*)
  ch2–ch5/        — Chapters 2–5 (stubs, expand in order)
  conclusion.tex  — Заключение
bibliography/refs.bib
```

Each chapter file (`ch1.tex` etc.) opens with `\chapter{}` and then `\input{}`s its subsection files. Add content to subsection files.

## Formatting conventions

- Font: PT Astra Serif 14pt (main), PT Astra Sans (sans), CMU Typewriter Text (mono)
- Margins: left 30mm / right 15mm / top 20mm / bottom 20mm
- Line spacing: 1.5× (`\onehalfspacing`), paragraph indent 1.25cm
- Chapter headings: centered bold uppercase — defined in `preamble.tex`, no `titlesec`
- Citations: `\cite{}` with `natbib`; bibliography in `bibliography/refs.bib`
- Placeholder figures: `\fbox{\parbox{0.8\textwidth}{\centering [Рисунок: описание]}}` inside a `figure` environment
- Generated diagrams: TikZ in `figures/generated/`; include via `\input{}`

## Missing packages (add to Dockerfile when needed)

`subfiles`, `titlesec`, `pgfplots`, `enumitem`, `tocloft`, `multirow`
