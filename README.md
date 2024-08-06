<!-- Author: Marcel Tiepelt -->
<!-- Source: https://github.com/mtiepelt/dissertation -->
<!-- Version 0.9 -->

# Repository content

This repository contains the template that I used for my dissertation, 
and which is based on https://github.com/pfasante/phd_thesis/ as well as partly on https://bitbucket.org/amiede/classicthesis/src/master/ClassicThesis.pdf. 

Additionally, it contains tools that I used to merge paper content, manage the bibliography and help me writing. 

## TeX-Template

This template was written using 

`LuaHBTex, Version 1.18.0 (TeX Live 2024)`

Running it with another TeX-engine (probably) requires to remove to the `directlua` command in diss.tex.

If you ever have issues compiling, I would recommend to try to compile `pdflatex`. That's because I have had errors with the marginpars that would be ignored by `lualatex` but on which `pdflatex` would halt. 

### Changes 

The base file is the wonderful `dissertation.cls` of 

https://github.com/pfasante/phd_thesis/

I removed a lot of content from the `dissertation.cls` that, to me, appeared to be tailored to their thesis, and which I did not need for mine. As part of these changes I added comments to the `dissertation.cls` that helped me find my way around when modifying the style. 

#### FrontBackmatter

Parts of the FrontBackmatter have been exchanged for the files provided by 

https://bitbucket.org/amiede/classicthesis/src/master/ClassicThesis.pdf

This was just a personal choice. I added a section `Open Access Publications`. 

## Structure of Template

### bibliography

This folder holds bibliography files. I use 

https://github.com/cryptobib 

as a bibliography database for cryptographic papers and 

https://github.com/thomwiggers/extract_from_bibliography/blob/main/extract_from_bibliography.py

to produce a reduced database file.

### 0_dissconfig 

This folder holds class files and the config.tex Please adjust the latter to your needs. 

### 0_customconfig
 
This folder holds custom acronyms and custom macros.

## Makefile 

The Makefile allows to build different aspects of the thesis, for example with/ without glossary or bibliography, which made it easier for me to debug, or just to have a "quick" compilation.  

## TeX-Tools 

The python scripts are in support of merging macros from different papers. 

* TeX_support.py: Provides a function to read single-line macros
* findDoubleUseMacros.py: Finds macros read by Tex_support that have the exact same output
* findUnusedMacros.py: Given a file with macros and a directory it finds all macros not used in the .tex files
* sortMacros.py: Outputs a file with sorted macros 

## ipe-Tools

I used ipe to draw some figures:

https://ipe.otfried.org/

* ipeexportview.py: Exports views from ipe via iperenderer