# Book source

`main.tex` is the only full-book entry point. Build from this directory with:

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build main.tex
```

The template intentionally uses `listings` instead of `minted`, so the build does not require `--shell-escape`. New figures should use ASCII filenames and must have a source/license record before publication.

