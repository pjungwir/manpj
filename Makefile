# - Builds the html version of these man pages.
# - Builds the html TOC.

default:
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

clean:
	rm -rf build
