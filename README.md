<!-- Author: Marcel Tiepelt -->
<!-- Source: https://github.com/mtiepelt/dissertation -->
<!-- Version 1.0 -->

# Repository content

This repository contains the template that I used for my dissertation, 
and which is based on https://github.com/pfasante/phd_thesis/ as well as partly on https://bitbucket.org/amiede/classicthesis/src/master/ClassicThesis.pdf. 

Additionally, it contains tools that I used to merge paper content, manage the bibliography and help me writing. 

## TeX-Template

This template was designed using 

`LuaHBTex, Version 1.18.0 (TeX Live 2024)`

but also works with `pdflatex`.

`pdfTeX, Version 3.141592653-2.6-1.40.26 (TeX Live 2024)`.  
  
At this point, unfortunately, it does NOT work with XeTeX.

If you ever run into compile error, I recommend to "debug" with both, `lualatex` and `pdflatex`. That's because I have had errors with the marginpars that would be ignored by `lualatex` but on which `pdflatex` would halt. 

### Changes 

The base file is the wonderful `dissertation.cls` of 

https://github.com/pfasante/phd_thesis/

I removed and reorganized a lot of content from the `dissertation.cls` that, to me, appeared to be tailored to their thesis, and which I did not need for mine. As part of these changes I added comments to the `dissertation.cls` that helped me find my way around when modifying the style. Part of the file have been moved to a `dissertationpackage.sty`. Main changes are:

#### Support for PDF/A Format

The default font-package, `[charter]{mathdesign}` such that the resulting pdf does not pass all PDF/A rules. 
If the PDF/A option is given we exchange the package for `[scale=0.96]{XCharter}`. Unfortunately, this results in some changes of the font-size and thus may slightly impact the positioning.

You can verify that your pdf is indeed PDF/A format using, for example, `veraPDF`. Note that the meta-data might say `PDF/A` even if the file does not actually follow the rules of this format. 


#### Support for one-sided/ two-sided

Both options should now result in correct positioning of figures and should also generate a PDF with the content on the same page numbers.


#### Fronbackmatter

Parts of the FrontBackmatter have been exchanged for the files provided by 

https://bitbucket.org/amiede/classicthesis/src/master/ClassicThesis.pdf

This was just a personal choice. I added a section `Open Access Publications`. 

#### Template and Documentation 

The example document holds a documentation on how the template can be used, caveats and some additional information on changes. 



## Structure of Template

### bibliography

This folder holds bibliography files. I use 

https://github.com/cryptobib 

as a bibliography database for cryptographic papers and 

https://github.com/thomwiggers/extract_from_bibliography/blob/main/extract_from_bibliography.py

to produce a reduced database file.

### 0_config 

This folder holds the main configuration file `config.tex`. Please adjust (at least) this to your needs.  
Further, the folder holds macros (holds macros for one- and two-sided document support) and acronyms. 


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