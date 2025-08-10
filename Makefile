.PHONY: all clean

all: output/libretto.pdf

output/libretto.pdf: src/main.tex src/sections/*.tex
	@mkdir -p output
	@cp -r src/assets output/ 2>/dev/null || true
	xelatex -output-directory=output -halt-on-error src/main.tex || (rm -f output/main.pdf; exit 1)
	xelatex -output-directory=output -halt-on-error src/main.tex

clean:
	rm -rf output/*