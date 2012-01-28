.dvi    device independent file, latex's output
.log    latex's log file
.aux    helper file for e.g. sectioning


latex - convert a .tex file to a .dvi file
xdvi - view a .dvi file
pdflatex - convert a .tex file to a .pdf file
dvipdf - convert a .dvi file to a .pdf file

texdoc -l       list documentation on installed tex packages
texdoc <name>   view tex documentation for package <name>

Package search:

~/texmf

mktexpk
mktexfm
kpathsea

texhash - update the ls-R file to notice new files in the texmf tree.

web2c.dvi - manual about environment variables and search paths??
tds.dvi - describes a tex tree
texmf.cnf - set up tex variables?
TEXMF={A,B,C}    # where A, B, and C are tex trees
TEXMFCNF - the location of a texmf.cnf file

~/.bashrc:
export TEXMF='{~/texmf,!!$TEXMFLOCAL:!!$TEXMFMAIN}'

or

~/.bashrc:
export TEXMFCNF=$HOME/etc/texmf.cnf
~/etc/texmf.cnf:
TEXMF = {~/texmf,!!$TEXMFLOCAL!!$TEXMFMAIN}

texconfig dvips paper letter
texconfig xdvi us

Installing hyphenation patterns:

GRAhyph4.tex has hyphenation patterns for ancient Greek.
GRPhyph4.tex has hyphenation patterns for modern, polytonic Greek.

Copy these files to texmf/tex/generic/hyphen/.

Now add these lines to texmf/tex/generic/config/language.dat:

greek           GRAhyph4.tex
polutonikogreek GRPhyph4.tex

Rebuild the ls-R database. Cd to texmf and run mktexlsr.

Finally, go to texmf/web2c and run this command to rebuild the latex.fmt file:

initex latex.ltx


Word Count:

It is very hard to get a word count for a latex document. See here:
http://www.macosxhints.com/article.php?story=20040606044542980&query=pbpaste

The `detex x.tex | wc -w ` approach is known to produce invalid results.

Possibly correct (untested by me) is `ps2ascii x.ps | wc -w`.

The poster suggests opening the file in Acrobat, setting the preferences to display continuous (instead of one page),
copying the whole thing, then typing `pbpaste | wc -w`. This will count page numbers as words, but you can just subtract one for each page in the document.

It seems that whatever approach you use, you could write a quick script for it.


\usepackage{setspace}

% Use one of these in the preamble, and use them again throughout the document if you want to change:
\singlespacing
\onehalfspacing
\doublespacing
\setstretch{1.2}


Use \bgroup and \egroup when braces would otherwise become unmatched, e.g.:

  \newenvironment{boxthis}
  { \fbox\bgroup }
  { \egroup }

