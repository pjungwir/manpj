# Build a list of all the foo.pj files we want to create
# by looking for foo.md files:
MANPAGES=$(shell find . -maxdepth 1 -name '*.md' -exec basename \{\} .md \; | sed 's/$$/.pj/')

# - Builds the html version of these man pages.
# - Builds the html TOC.
default: html toc

# Converts md files to pj files (i.e. man format).
all: $(MANPAGES)

%.pj: %.pandoc
	pandoc -f markdown-tex_math_dollars --standalone --to man $< -o $@

# Create intermediate foo.pandoc files
# which are just copies of foo.md files
# but with a pandoc metadata header.
%.pandoc: %.md Makefile
	echo "% $*(pj)" > $@
	echo "% Paul A. Jungwirth" >> $@
	echo "% `git log --pretty=format:%as $*.md | head -1`" >> $@
	cat $< >> $@

install:
	mkdir -p "$$HOME/man/manpj"
	tar cf - *.pj | (cd "$$HOME/man/manpj" && tar xvf -)

html: all
	mkdir -p build
	for f in *.pj; do \
		m=`basename $$f .pj`; \
		./man2html.sh $$f > build/$$m.html; \
		RESULT=`grep "Invalid Man Page" build/$$m.html`; \
		if [ -n "$$RESULT" ]; then \
			rm build/$$m.html; \
			cp $$f build/$$m.txt; \
		fi; \
	done;
	# cp build/*.html build/*.txt ~/src/illuminatedcomputing/site/tools/manview/
	# cp *.pj ~/src/illuminatedcomputing/site/tools/man/

toc: html
	index=build/index.html; \
	echo '<ul>' > $$index; \
	globs='*.html'; \
	if find build -name "*.txt" | grep . >/dev/null; then \
	  globs="*.html *.txt"; \
	fi; \
	for f in `cd build && ls $$globs`; do \
	  if [ ! $$f = $$index ]; then \
			p=`echo $$f | sed 's/\.\(html\|txt\)//'`; \
			echo "<li><a href='$$f'>$$p</a></li>" >> $$index; \
		fi; \
	done; \
	echo '</ul>' >> $$index;

readme:
	markdown README.md > README.html

clean:
	rm -rf build README.html
