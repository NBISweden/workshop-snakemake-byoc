#!/bin/bash
echo $QUARTO_PROJECT_OUTPUT_DIR

SMK_BEST_PRACTICE=snakemake_best_practice
SMK_BEST_PRACTICE_GIT=git@github.com:NBISweden/${SMK_BEST_PRACTICE}.git

if [ ! -e ${SMK_BEST_PRACTICE} ]; then
	git clone ${SMK_BEST_PRACTICE_GIT}
fi
