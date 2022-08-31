all: reproducibility-tools.html

%.html: %.Rmd
	Rscript -e 'rmarkdown::render("$<")'

# OPENSSL_CONF due to https://github.com/nodejs/node/issues/43132#issuecomment-1130503287
%.pdf: %.html
	OPENSSL_CONF=/dev/null Rscript -e 'library(webshot); webshot("$<", "$@")'
