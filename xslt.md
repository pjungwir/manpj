# DESCRIPTION

Here is a template to get you started with your stylesheet:

```
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
</xsl:stylesheet>
```

The `<xsl:output>` tag has all kinds of general-purpose functions. You can specify whether you're outputting text, xml, or html. You can also specify an output DTD like this:

```
<xsl:output doctype-system="my/spec.dtd"/>
```

To do an XSLT noop, outputting the same document you receive, do this:

```
<xsl:template match="/">
	<xsl:copy-of select="."/>
</xsl:template>
```

To select a node using criteria in other nodes, use square brackets. For example, say you've got this (contrived) XML and you want just the First Name:

```
<employee>
	<attribute key="First Name"><value>Joe</value></attribute>
	<attribute key="Last Name"><value>Smith</value></attribute>
	<attribute key="Department"><value>Marketing</value></attribute>
</employee>
```
You can select it like this:

```
<xsl:value-of select="/employee/attribute[@key='First Name']/value" />
```
