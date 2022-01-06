# OUTER JOINS
Here's something called an outer left (or right) join:

```
SELECT	a.id, a.data
FROM	a, b
WHERE	a.id = b.id (+)
```

In MySQL, it looks like this:

```
SELECT	a.id, a.data
FROM	a LEFT JOIN b
ON	a.id = b.id
```

This matches *all* values of a.id, "creating" all-null rows in b if there's no matching b.id. Think of the (+) as meaning "this plus the always-matching all-null row."

# WHERE vs. HAVING

If you've always wondered about the difference between WHERE and HAVING, here is the answer. You probably know that HAVING only gets mentioned with respect to GROUP BY clauses. That's because while WHERE eliminates rows before the GROUP BY, HAVING eliminates rows afterwards. The order of evaluation is as follows:

```
WHERE
GROUP BY
HAVING
```

That means you can use HAVING for criteria based on grouping functions, like `HAVING avg(cost) > 5.00`.
