# Lectures

## Requirements

Software packages required to render these lectures can be installed with:

```bash
conda env create -f environment.yml
conda activate lectures
```

Note that this conda environment still contains packages that were originally 
used for RMarkdown lectures.


## Rendering

### Quarto lectures

- Add the extension for NBIS lecture slides:

```
quarto add percyfal/nbis-quarto-revealjs
```

- Move the folder `lectures/_extensions` into the respective lecture's 
folder and add the following to the header:

```
format:
  nbis-quarto-revealjs:
    footer: "Snakemake BYOC workshop"
    theme:
      - default
      - ../custom.scss
    embed-resources: true
```

- Move into `lectures` and run:

```
quarto render <qmd-file>
```
