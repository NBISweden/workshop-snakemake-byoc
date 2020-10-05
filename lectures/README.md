# Lectures

## Requirements

Software packages required to render these lectures can be installed with:

```bash
conda env create -f environment.yml
conda activate lectures
```

## Rendering

Lectures in **Rmarkdown** format can be rendered using the following from
the command line:

```bash
Rscript -e 'rmarkdown::render(<Rmd-file>, "xaringan::moon_reader")'
```

### revealjs lectures

Lectures in subfolders `smkprofile` and `wc-schema` are created with [revealjs](https://revealjs.com) and can be rendered as follows:

```bash
Rscript -e 'rmarkdown::render(<Rmd-file>)'
```
