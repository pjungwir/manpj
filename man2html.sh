#!/bin/bash
set -eu

# Wraps the man2html program.
# Take a filename argument in man format, prints html to stdout.
#
# On debian this is a binary that works great (almost).
# On macOS the brew package is a Perl script that struggles with some man directives,
# so we need to feed it groff output instead.
# But brew's man2html doesn't know how to do with terminal escape sequences for bold & underline,
# so it just passes them through as garbage to the HTML.
# So we want to prevent groff from outputing those escapes.
# To do that we use -P to pass arguments to the post-processor, grotty.
# So `-P -X` add `-X` to the grotty command line.
# We want -c -b -u which tells grotty not to ouput terminal escapes (-e),
# not to output `a backspace a` for bold text (-b),
# which is how it tries to make things bold for literal paper output,
# and not to output `a backspace _` (-u),
# which is how it tries to make things underlined for literal paper output.

source="$1"
os="$(uname)"

if [ "$os" = Darwin ]; then
  groff -Tutf8 -P -c -P -b -P -u -mandoc -c "$source" | man2html
else
  # Strip the content-type HTTP header,
  # since debian man2html acts like a cgi-bin script.
  man2html "$source" | tail -n +3
fi
