IMAGE  := ghcr.io/mbait/texlive-stem-docker:master
DOCKER := docker run --rm -v $(CURDIR):/work -e BIBINPUTS=/work $(IMAGE)
FLAGS  := -output-directory=build -interaction=nonstopmode -halt-on-error -bibtex

.PHONY: all preview clean

all: build
	$(DOCKER) $(FLAGS) main.tex

# Build a single section for quick preview.
# Usage: make preview SECTION=sections/ch1/1_1_sim_tasks
preview: build
	@printf '\\documentclass[14pt,a4paper]{extreport}\n\\input{preamble}\n\\begin{document}\n\\pagestyle{plain}\n\\input{$(SECTION)}\n\\end{document}\n' > preview.tex
	$(DOCKER) $(FLAGS) preview.tex
	@rm -f preview.tex

build:
	@mkdir -p build

clean:
	docker run --rm -v $(CURDIR):/work --entrypoint="" $(IMAGE) sh -c "rm -rf /work/build"
	@rm -f preview.tex
