CONVERT=convert

all: summary.pdf summary.png summary-thumb.png

clean:
	rm -f summary.pdf summary.out

summary.pdf: summary.tex
	pdflatex summary.tex
	rm -f summary.aux summary.log summary.out

summary.png: summary.pdf
	$(CONVERT) -density 100x100 +adjoin summary.pdf summary-%d.png

summary-thumb.png: summary.pdf
	$(CONVERT) -density 32x32 +adjoin summary.pdf summary-thumb-%d.png
