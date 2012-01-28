.\" Notes on css
.TH css pj "14 September 2006"
.SH NAME
css
.SH "LAYOUT"
The position attribute controls how a box fixes into the flow. It can be be static, relative, absolute, or fixed.
Static and relative both insert the box into the flow, but relative allows you to offset it with the top/right/bottom/left attributes. These attributes have no effect on static positioning. Static is equivalent to a relative postion whose top/right/bottom/left are all zero. Relative positioning's offsets are applied after all the elements have been flowed, so they don't affect following elements.
.PP
Absolute and fixed position the box outside the flow. Here, top/right/bottom/left are interpreted as offsets from the containing box. Whereas absolute moves as its containing box moves, fixed does not move as the page is scrolled. You could use fixed to place an unscrolling background image.
.PP
The display property affects flowed boxes. It can be inline, block, inline-block, none, or run-in. (Actually there are more, related to lists and tables, that I won't cover here.) An inline box is like a character style; a block box is like a paragraph. An inline-block box is a combination of box: it appears inline with the surrounding text, but it can be a container like a regular block box.
.PP
The none value causes the element to have no box at all. I'm not sure what that means. And the run-in value causes either inline or block behavior, depending on context. (What context? The spec doesn't say!)
.PP
If a box is floated, the display property has no effect. Floated boxed are outside the normal flow, although flowed text can wrap around their sides. Floated boxes float either left or right, depending on the attribute's value, until they touch another floating box or the edge of the containing block. If it cannot fit in the available width, it is shifted downwards.

.SH "BOX MODEL"
The CSS box model says that at the center you have content, then padding, then border, then margin.
The actual width of the box is the width of the content + padding + border + margin.
In CSS, the "width" property sets the width of the content only.
But IE 5 for Windows is broken, and the "width" property sets the width of the content + padding.
That means you must trick ie5win into using a different width from other browsers.
Fortunately, ie5win also has a parsing bug, so you can do things like this:
.PP
.RS
.nf
\&.selector {
  width: 200px; /* ie5win width */
  padding: 0px 5px 0px 5px;

  /* begin hack */
  voice-family: "\"}\"";
  voice-family: inherit;
  width: 190px; /* css2 width */
}
.fi
.RE
.PP
Or even trickier, you can use the same parsing bug to prevent ie5win from even reading the CSS file at all,
as described on this page:
.PP
.RS
.nf
http://tantek.com/CSS/Examples/ie50winbandpass.html
.fi
.RE
.PP
Both bugs are fixed in IE 6 and 7, but the box model bug recurs if the browser enters "quirks mode."
Since the browsers parse the CSS correctly even in quirks mode, you can't feed them peculiar widths
as you can for ie5win. Therefore you must stay out of quirks mode.
By default, IE will use "compatibility mode," but several things can trigger quirks mode.
Quirks mode happens when a page has a bad or missing DOCTYPE declaration or if there are parse errors in the HTML.
IE 6 also enters quirks mode if the page begins with an XML prologue, even if a valid DOCTYPE follows.
.PP
You can see which mode you're in with a bit of Javascript:
.PP
.RS
.nf
<script language="javascript">
alert(document.compatMode);
</script>
.fi
.RE
.PP
In Mozilla, you can also see the current mode in the Info dialog box.
.SH "CONDITIONAL COMMENTS"
IE understands conditional comments, which look like this:
.PP
.RS
.nf
<!--[if lt IE 7]>
You are using IE < 7.
<![endif]-->
.fi
.RE
.PP
.SH "VERY OLD BROWSERS"
Netscape 4 has trouble with CSS, but you can prevent it from reading CSS documents by adding a "media" attribute:
.PP
.RS
.nf
<link rel="stylesheet" href="site.css" type="text/css" media="screen">
.fi
.RE
.PP
More on CSS hacks:
.PP
.RS
.nf
http://tantek.com/log/2005/11.html
.fi
.RE
.PP
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2006 Paul Jungwirth


