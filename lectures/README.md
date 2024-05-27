# Lectures

## Requirements

Software packages required to render these lectures can be installed with:

```bash
conda env create -f environment.yml
conda activate lectures
```

## Rendering

### Rmarkdown

Lectures in **Rmarkdown** format can be rendered using the following from
the command line:

```bash
Rscript -e 'rmarkdown::render(<Rmd-file>, "xaringan::moon_reader")'
```

### revealjs lectures

Lectures in subfolders `smkprofile` and `wc-schema` are created with 
[revealjs](https://revealjs.com) and can be rendered as follows:

```bash
Rscript -e 'rmarkdown::render(<Rmd-file>)'
```

### Quarto lectures

```
quarto render <qmd-file>
```

## HTML to PDF conversion

For both Rmarkdown- and quarto-based lectures in HTML format, the tool 
`https://github.com/astefanutti/decktape` was tested. 

Note that for Rmarkdown-based lecture slides, the `template.css` has to 
be placed in the same directory as the Rmd- and HTML-file.
