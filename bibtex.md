.\" Notes on bibtex
.TH bibtex pj "24 March 2006"
.SH NAME
BibTeX
.SH INTRO
This document is a bit of documentation meant to supplement "Tame the BeaST" by Nicholas Markey, an excellent source of documentation on all things BibTeX, and as far as I know the only public documentation on .bst files. I rely heavily on his work and occasionally point out errors. Probably you should read his paper before you read this. For clarity's sake, I generally steal his examples. My references are all to version 1.3 published 16 October 2005.

.SH Brace Depth

Brace depth refers to strings from the .bib file, especially the title and author fields. A character's brace depth is equal to the number of surrounding braces (but see "Special Characters" below). For example, you might have a book titled:
.PP
.RS
.nf
"The {Latex} {C}ompanion"
.fi
.RE
.PP
Here, most of the string has brace depth 0, but "Latex" and "C" have brace depth 1.

.SH Special Characters

A special character is an escape sequence immediately surrounded by braces, like {\\'E} or {\\LaTeX}. In spite of the braces, a special character is considered brace depth 0. However, special characters must themselves appear at brace depth 0; if they are surrounded by other braces, they are not considered special characters. For example, suppose we wanted to correct the example above by using the \\LaTeX macro. Then we write:
.PP
.RS
.nf
"The {\\LaTeX} {C}ompanion"
.fi
.RE
.PP
Here, "C" is at brace depth 1, and everything else, even the special character \\LaTeX, is at brace depth 0. Now suppose we wrote the title like this:
.PP
.RS
.nf
"The {{\\LaTeX}} {C}ompanion"
.fi
.RE
.PP
In this case, "{\\LaTeX}" is not a special character, because it starts at brace depth 1, not 0. The string "\\LaTeX" is considered to be at brace depth 2.
.PP
If an escape sequence lacks braces entirely, as in \fIThe \\LaTeX Companion\fR,
it is not a special character, just plain text.
.PP
Note that an apparent contradiction appears on page 21 of "Tame the BeaST." It correctly remarks that special characters must appear at brace depth 0, but then it states, "Anything in a special character is considered as being at brace depth 0, even if it is placed between another pair of braces." The "even if" is a null hypothesis, because special characters are only special characters at brace depth 0.

.SH purify$

The \fIpurify$\fR command reduces a string to only spaces and alphanumerics. Hyphens and tildes become spaces, and all other weird characters are removed. Inside of special characters, even spaces are removed. Thus \fIt\\^ete\fR, \fIt{\\^e}te\fR, \fIt{\\^{e }}te\fR, and \fIt{\\^e }te\fR all become \fItete\fR.

.SH text.prefix$

You can grab a string's first n characters with \fItext.prefix$\fR.
Braces are not included in the count of characters, but they are still output.
Their closing braces are also output, appended, if necessary, to the end of the result. Special characters count as one character, but of course they must be at brace depth 0 to count as special characters.
Thus, the first character of \fI{\\'E}cole\fR is \fI{\\'E}\fR, but the first character of \fI{{\\'E}}cole\fR is \fI{{\\}}\fR (the backslash is the character).

.SH text.length$

This command returns the number of characters in a given string.
Special characters count as one character, and braces don't count at all.
Thus, \fIa b c\fR is 5, \fI{a}\fR is 1, and \fI{\\'a}\fR is 1, but \fI{{\\'a}}\fR is 3. Since the last example isn't a special character, the \fI\\'a\fR are counted as three separate characters.

.SH substring$

Given a string, a start position, and a number of characters, this command returns a substring. The position of the first character is 1. Unlike the commands above, \fIsubstring$\fR knows no secret meaning for "character." Every character is alike. Thus, the substring of \fI{\\LaTeX}\fR from position 2 of length 3 is \fI\\La\fR. (Note that "Tame the BeaST" on page 32 erroneously says the result is \fI\\LaT\fR: 4 characters.)

.SH sort.key$

Reading "Tame the BeaST" page 32, I thought this variable was set automatically by some internal algorithm. It isn't. You must set it yourself, with something like this:
.PP
.RS
.nf
title 'sort.key$ :=
.fi
.RE
.PP

.SH change.case$

Depending on the option, \fIchange.case$\fR will set all letters to uppercase or lowercase, or (with the "t" option) set all letters to lowercase while leaving the first letter unchanged. It only affects letters at brace depth 0. Therefore special characters are changed, but characters inside regular braces are not. For example, with the "t" option, \fIt\\^Ete\fR becomes \fIt\\^ete\fR and \fIt{\\^E}te\fR becomes \fIt{\\^e}te\fR, but \fIt{{\\^E}T}e\fR remains \fIt{{\\^E}T}e\fR.
.PP
When you use the "t" option, if the first character is a special character, the whole special character retains its original capitalization. Thus, \fI{\\'E}GAD\fR becomes \fI{\\'E}gad\fR and \fI{\\LaTeX} Companion\fR becomes \fI{\\LaTeX} companion\fR.

.SH Surviving Sorting

When you compose your .bib file, you should expect that the bib style will munge your entries to set the \fIsort.key$\fR. Probably it will run \fIpurify$\fR on them. To ensure proper sorting, you should write your .bib entries so all the necessary data remains intact.

.SH Surviving Capitalization

Your bib style will probably also run another transformation, at least on the title. It will use \fIchange.case$\fR with the "t" option to set all letters after the first to lowercase. Since \fIchange.case$\fR only affects letters at brace depth 0, use can use braces to preserve desired capitals. If you embed commands like \\LaTeX, this is essential.

.SH Surviving Sorting and Capitalization Together

Since most people want to use one .bib file with multiple .bst files,
any style should basically honor the brace\-tricks used to survive sorting (aka \fIpurify$\fR) and capitalization (aka \fIchange.case$\fR).
You should write your bibliography entries with these two functions in mind. Suppose your bibliography includes this:
.PP
.RS
.nf
title = "The \\LaTeX Companion"
.fi
.RE
.PP
That will fail, because \fIchange.case$\fR will produce \fI\\latex\fR,
which is a command LaTeX doesn't know. It will also lowercase "Companion."
You could instead try:
.PP
.RS
.nf
title = "The {\\LaTeX} {C}ompanion"
.fi
.RE
.PP
This is even worse! It does not solve the \fIchange.case$\fR problem (except for the "C"), because \fIchange.case$\fR still alters special characters.
In addition, since \fIpurify$\fR removes special characters, it will sort as "The  Companion," which will probably deposit it in the wrong place. To solve both problems at once, do this:
.PP
.RS
.nf
title = "The {{\\LaTeX}} {C}ompanion"
.fi
.RE
.PP
Now \fIchange.case$\fR will leave \fI\\LaTeX\fR alone, since it is at brace depth 2, and \fIpurify$\fR will pass it through as \fILaTeX\fR (without the backslash), so it will sort properly.


.SH Surviving Author Parsing

The \fIauthor\fR field endures similar munging, at least for \fIsort.key$\fR,
but it is also parsed to find the first name, last name,
and any intermediate "von"-like bits.
This happens inside \fIformat.name$\fR.
If you enter the name as
\fIvon Last, First\fR, you needn't worry as much, but if you give
\fIFirst von Last\fR, you must be aware of how BibTeX parses the field.
.PP
There must be a Last, so it gets the last word in the field.
Then BibTeX examines each word, from left to right.
As long as the words are capitalized, they go to the First.
The first non-capitalized word begins the von.
To determine if a word is "capitalized,"
BibTeX finds its first 0-depth character, including special characters,
and checks whether it is uppercase or lowercase.
If it is uppercase, the word is capitalized; otherwise, it is not.
If there are no 0-depth characters (because the whole word is in braces),
the word counts as capitalized and goes to the First.
.PP
Once the von begins, words can fall into either the von or the Last.
These remaining words are examined in reverse order, from right to left.
As long as the words are capitalized or in braces, they go to the Last,
but as soon as a lowercase word is found, it and all remaining words
go to the von.
.PP
A simpler way of putting this is that all contiguous capitals at the beginning
are First and all contiguous capitals at the end are Last (where braced words
count as capitals), and everything left is von.
If all the words are capitals,
then everything but the last word goes into the First.
The last word always counts as a capital so that Last has at least one word,
but the First may be empty if the first word is lowercase.
A lowercase last word can still accumulate more words in the Last,
as long as they are capitalized.
.PP
One more wrinkle: you can group words by enclosing the intervening space in braces, like this: \fIJean de La{ }Fontaine\fR or this: \fIJean de {La Fontaine}\fR. BibTeX will treat these joined words as a single word. So in this first example, the algorithm will start by sending all of \fILa{ }Fontaine\fR to the Last.
.PP
For some names, you want to avoid all this parsing entirely,
so that the whole name goes into Last.
In that case, you can enter names entirely surrounded with braces, like this:
.PP
.RS
.nf
author = "{Gregory the Theologian}"
.fi
.RE
.PP
.SH AUTHOR
Paul Jungwirth


.\" See ~/src/test/bibtex/ for test runs of some of the above.
.\" See ~/doc/latex/bibtex.pdf for good documentation, with some errors.
.\"	  For example, on p. 32 he says that "{\LaTex} 2 3 substring$"
.\"	  returns "\LaT" when actually it returns "\La".

