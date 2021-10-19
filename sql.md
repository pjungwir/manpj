.TH sql pj "4 July 2005"
.SH NAME
SQL Notes
.SH "OUTER JOINS"
Here's something called an outer left (or right) join:
.PP
.RS
.nf
SELECT	a.id, a.data
FROM	a, b
WHERE	a.id = b.id (+)
.fi
.RE
.PP
In MySQL, it looks like this:
.PP
.RS
.nf
SELECT	a.id, a.data
FROM	a LEFT JOIN b
ON	a.id = b.id
.fi
.RE
.PP
This matches *all* values of a.id, "creating" all-null rows in b if there's no matching b.id. Think of the (+) as meaning "this plus the always-matching all-null row."
.SH "WHERE vs. HAVING"
If you've always wondered about the difference between WHERE and HAVING, here is the answer. You probably know that HAVING only gets mentioned with respect to GROUP BY clauses. That's because while WHERE eliminates rows before the GROUP BY, HAVING eliminates rows afterwards. The order of evaluation is as follows:
.PP
.RS
.nf
WHERE
GROUP BY
HAVING
.fi
.RE
.PP
That means you can use HAVING for criteria based on grouping functions, like "HAVING avg(cost) > 5.00."
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2005 Paul Jungwirth
