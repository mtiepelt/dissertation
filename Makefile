DOC := diss#

.PHONY: cleanall all

single:
	lualatex -file-line-error --synctex=1 $(DOC)

double:
	lualatex --interaction=batchmode --draftmode -file-line-error $(DOC)
	lualatex --synctex=1 -file-line-error $(DOC)

all:
	lualatex --interaction=batchmode --draftmode -file-line-error $(DOC) 
	makeglossaries $(DOC) 
	latexmk -file-line-error -lualatex -silent $(DOC)  

allpdf:
	pdflatex --interaction=batchmode --draftmode -file-line-error $(DOC) 
	makeglossaries $(DOC) 
	latexmk -file-line-error -pdf -silent $(DOC)  

#extract:
#	python3 extract_from_bibliography.py $(DOC).bcf cryptobiblink/crypto.bib cryptobiblink/dummy.bib  > cryptobiblink/reduced_crypto.bib

gloss: 
	lualatex --interaction=batchmode --draftmode -file-line-error $(DOC)
	makeglossaries $(DOC)
	lualatex --interaction=batchmode -file-line-error $(DOC)
	
bib: 
	lualatex --interaction=batchmode --draftmode -file-line-error $(DOC)
	biber --debug $(DOC) 
	lualatex --interaction=batchmode --draftmode -file-line-error $(DOC)
	lualatex --interaction=batchmode -file-line-error $(DOC)
	
clean: 
	@latexmk -c
	#@find . -name "*.aux" -type f -delete
	#@find . -name "*.log" -type f -delete

cleanaux: $(DOCONE)
	find . -name "*.aux" -type f -delete


cleanall:
	latexmk -C
	-rm -f $(DOC).pdf
	-rm -f $(DOC).thm
	-rm -f $(DOC).log

	-rm -f $(DOC).blg 
	-rm -f $(DOC).blg 
	-rm -f $(DOC).bbl 
	-rm -f $(DOC).synctex.gz
	-rm -f $(DOC)-blx.bib
	-rm -f $(DOC)-blx.aux 
	-rm -f $(DOC).lol 
	-rm -f $(DOC).tcp 
	-rm -f $(DOC).tps 
	-rm -f $(DOC)-blx.aux 
	-rm -f $(DOC).glg
	-rm -f $(DOC).dpth 

	-rm -f $(DOC).maf 
	-rm -f $(DOC).mtc 
	-rm -f $(DOC).mtc0 
	-rm -f $(DOC).auxlock
	
	# pdfa
	-rm -f pdfa.xmpi

	# makeindex
	-rm -f $(DOC).ist 

	# Biblatex 
	-rm -f $(DOC).run.xml
	-rm -f $(DOC).bcf 

	# Glossary & Acronym
	-rm -f $(DOC).glo
	-rm -f $(DOC).gls
	-rm -f $(DOC).acn
	-rm -f $(DOC).acr 
	-rm -f $(DOC).alg

	# Lists
	-rm -f $(DOC).loa

	# Other 
	-rm -f *.eps 
	-rm -f $(DOC).bbl-SAVE-ERROR
	-rm -f $(DOC).blg
	-rm -f $(DOC)1-*

	find . -name "*.aux" -type f -delete




