# Tex Tools

currently only work with files that follow the structure:

* Macros are defined with `\newcommand{\NAME}{CMD}`
* Only one `newcommand` per line
* Nothing else in the line, for example, no `% COMMENT`

In case you use `\def\CMD` to define new macros, you could use the following regex to find and replace those:

* match: `(\\def)(\\[a-Z]+)`
* replace: `\\newcommand{\2}`


## findDoubleUsedMacro.py

Finds macros that map to the same command, for example `\newcommand{\ASD}{X}` and `\newcommand{\ABC}{X}`

## findUnusedMacro.py

Finds macros not used in tex files of all subdirectories.

## sortMacros.py

Outputs a a file with macros sorted alphabetically.

## TeX_Support.py

Contains a function that reads macro files. 