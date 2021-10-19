.TH xslt pj "4 July 2005"
.SH NAME
XSLT Notes
.SH DESCRIPTION
Here is a template to get you started with your stylesheet:
.PP
.RS
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
.br
</xsl:stylesheet>
.RE
.PP
The <xsl:output> tag has all kinds of general-purpose functions. You can specify whether you're outputting text, xml, or html. You can also specify an output DTD like this:
.PP
.RS
<xsl:output doctype-system="my/spec.dtd"/>
.RE
.PP
To do an XSLT noop, outputting the same document you receive, do this:
.PP
.RS
<xsl:template match="/">
.br
	<xsl:copy-of select="."/>
.br
</xsl:template>
.RE
.PP
To select a node using criteria in other nodes, use square brackets. For example, say you've got this (contrived) XML and you want just the First Name:
.PP
.RS
<employee>
.br
	<attribute key="First Name"><value>Joe</value></attribute>
.br
	<attribute key="Last Name"><value>Smith</value></attribute>
.br
	<attribute key="Department"><value>Marketing</value></attribute>
.br
</employee>
.RE
.PP
You can select it like this:
.PP
.RS
<xsl:value-of select="/employee/attribute[@key='First Name']/value" />
.RE
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2005 Paul Jungwirth


