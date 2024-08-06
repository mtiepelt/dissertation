DOC := diss

single: 
	lualatex -file-line-error $(DOC)

double:
	lualatex --draftmode -file-line-error $(DOC)
	lualatex --synctex=1 -file-line-error $(DOC)

all: 
	lualatex --draftmode -file-line-error $(DOC)
	makeglossaries $(DOC)
	latexmk -pdflatex=lualatex -pdf $(DOC) # no local configuration file anymore

#extract:
#	python3 extract_from_bibliography.py $(DOC).bcf cryptobiblink/crypto.bib cryptobiblink/dummy.bib  > cryptobiblink/reduced_crypto.bib

debuglua: cleanall 
	lualatex --draftmode -file-line-error $(DOC).tex
	biber --debug $(DOC) 
	lualatex -file-line-error $(DOC).tex

debugpdf: cleanall 
	pdflatex --draftmode -file-line-error $(DOC).tex
	biber --debug $(DOC) 
	pdflatex -file-line-error $(DOC).tex

gloss:
	lualatex --draftmode -file-line-error $(DOC)
	makeglossaries $(DOC)
	lualatex -file-line-error $(DOC)
	
bib:
	lualatex --draftmode -file-line-error $(DOC)
	biber --debug $(DOC) 
	lualatex -file-line-error $(DOC)
	
clean:
	@latexmk -c

cleanall: clean 
	@find . -name "*.aux" -type f -delete
	@find . -name "*.log" -type f -delete
	@find . -name "*.fls" -type f -delete

	-rm -f $(DOC).pdf
	-rm -f $(DOC).thm
	-rm -f pdfa.xmpi 

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
	-rm -f diss.bbl-SAVE-ERROR
	-rm -f diss.blg
	-rm -f diss1-*




