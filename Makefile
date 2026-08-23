.PHONY: pdf clean watch

BOOK_DIR := book
BUILD_DIR := build

pdf:
	cd $(BOOK_DIR) && latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=$(BUILD_DIR) main.tex

watch:
	cd $(BOOK_DIR) && latexmk -pvc -xelatex -interaction=nonstopmode -file-line-error -outdir=$(BUILD_DIR) main.tex

clean:
	cd $(BOOK_DIR) && latexmk -C -outdir=$(BUILD_DIR) main.tex

