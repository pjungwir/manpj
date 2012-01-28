# - Builds the html version of these man pages.
# - Builds the html TOC.

default: html toc

html:
	mkdir -p build
	for f in *.pj; do \
		m=`basename $$f .pj`; \
		man2html $$f | tail -n +3 > build/$$m.html; \
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
	for f in `cd build && ls *.html *.txt`; do \
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
