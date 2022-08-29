all: reproducibility-tools.html

%.html: %.Rmd
	Rscript -e 'rmarkdown::render("$<")'
