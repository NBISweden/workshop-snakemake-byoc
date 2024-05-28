.PHONY: clean

TARGET = running-snakemake/index.html \
	bestpractices-detail/index.html

all: $(TARGET)

running-snakemake/index.html: running-snakemake/index.qmd
	quarto render $< --execute-dir running-snakemake/examples --profile embed

bestpractices-detail/index.html: bestpractices-detail/index.qmd
	quarto render $< --execute-dir snakemake_best_practice --profile embed
