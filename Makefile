DOC := diss

# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: $(DOC).pdf all double clean cleanall 

single: 
	lualatex -file-line-error $(DOC)

double:
	lualatex --draftmode -file-line-error $(DOC)
	lualatex --synctex=1 -file-line-error $(DOC)

all: 
	lualatex --draftmode -file-line-error $(DOC)
	#biber $(DOC) 
	makeglossaries $(DOC)
	latexmk -file-line-error -pdflua $(DOC) # no local configuration file anymore

#extract:
#	python3 extract_from_bibliography.py $(DOC).bcf cryptobiblink/crypto.bib cryptobiblink/dummy.bib  > cryptobiblink/reduced_crypto.bib

debuglua: cleanall 
	lualatex --draftmode -file-line-error $(DOC).tex
	biber --debug $(DOC) 
	lualatex -file-line-error -e '$max_repeat=2' $(DOC).tex  
	# -e '$max_repeat=5' # (default: 5) limit number of repetitions
	# -interaction=nonstopmode
	#
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
	#@find . -name "*.aux" -type f -delete
	#@find . -name "*.log" -type f -delete


cleanall: clean 
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
	-rm -f diss.bbl-SAVE-ERROR
	-rm -f diss.blg
	-rm -f diss1-*




