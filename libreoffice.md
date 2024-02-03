How to convert text values like `$1,234.56` into numbers?

This happens because there is a leading apostrophe in the cell which means "treat this as a literal value and don't interpret it."
If you remove the apostrophe, Libreoffice will treat it as a number/currency.

- Highlight the cells.
- Open Find & Replace.
- Enable regular expressions.
- Enter `(.+)` for Find.
- Enter `$1` for Replace.
- Hit Replace All.

Based on https://ask.libreoffice.org/t/how-do-i-get-rid-of-the-apostrophe-before-a-number-in-calc/52632/2
