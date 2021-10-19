## INDEXES

To see a table's indexes, the two important tables are user_indexes and user_ind_columns.

## CONSTRAINTS

To see a table's constraints, use these two tables:

```
USER_CONSTRAINTS
USER_CONS_COLUMNS
```

These are the possible values for `user_cons_columns.constraint_type`:

```
P = Primary Key
C = Check (e.g. NOT NULL)
R = Reference (foreign key)
U = Unique
V = "with check option" (for views)
```

If you are looking at Reference-style constraints, `TABLE_NAME` and `COLUMN_NAME` in the constraint-related data dictionary tables refer to the dependent table---that is, the table with the foreign key, not the table with the primary key. For instance, suppose you have a product table whose primary key is `product_code`, and suppose `cart_item.product_code` is a reference to it. Then the constraint tables will show `CART_ITEM` as the `table_name` and `PRODUCT_CODE` as the `column_name`. To see where the reference points, you must use `user_constraints.r_constraint_name`. That holds the name of the primary key constraint on the referenced table.

Therefore, if you want to see which tables depend on `product.product_code`, use this query:

```
SELECT  ucc.constraint_name, ucc.table_name, ucc.column_name
FROM    user_constraints uc1,
        user_constraints uc2,
        user_cons_columns ucc
WHERE   uc1.table_name = 'PRODUCT'
AND     uc1.constraint_type = 'P'
AND     uc2.r_constraint_name = uc1.constraint_name
AND     ucc.constraint_name = uc2.constraint_name
ORDER BY ucc.position;
```

## PERFORMANCE

To see how a query gets implemented do `set autotrace on`.

Here's a great query to get performance information. It returns all the queries that have run since Oracle started, ordered by `buffer_gets`.

```
SELECT executions, ROUND(executions / extot * 100, 3) as expct,
   disk_reads, round(disk_reads / executions, 3) as drperexec,
   round(disk_reads / drtot * 100, 3) as drpct,
   buffer_gets, round(buffer_gets / executions, 3) as bgperexec,
   round(buffer_gets / bgtot * 100, 3) as bgpct,
   rows_processed, sorts, runtime_mem, parsing_user_id, sql_text
FROM v$sqlarea,
   (SELECT sum(executions) as extot, sum(disk_reads) as drtot,
   sum(buffer_gets) as bgtot, sum(rows_processed) as rptot,
   sum(sorts) as sorttot FROM v$sqlarea)
WHERE disk_reads > 10000 and buffer_gets > 10000
ORDER BY buffer_gets; 
```

To limit the query to a single user, add `WHERE parsing_user_id = ...`, where the id is a number from `dba_users`, not the username.

## PRIMARY KEYS

To create a multi-column primary key, do this:

```
CREATE TABLE t (
    a   NUMBER,
    b   NUMBER,
    c   VARCHAR2(100),
    PRIMARY KEY (a, b)
);
```

## SQLPLUS VARIABLES

These can get really annoying if you're trying to run a file of SQL statements that have ampersands. These settings may be useful to you:

- set scan *{on|off}*:
  Turns variable substitution on/off.

- set define *X*:
  Changes the variable indicator from & to X.

- set escape *X*:
  Changes the escape character to X. If you put this before a &, SQLPLUS doesn't treat it as a variable.

- define *varname* = *value*:
  Use the define command to set &-style variables. Don't type the "&." For example:

```
define foo = bar
```

## SQLPLUS WITHOUT TNSNAMES

To connect to a remote Oracle database using sqlplus without tnsnames.ora, do this:

sqlplus '*username*/*password*@(description=(address_list=(address=(protocol=tcp)(host=*hostname*)(port=1521)))(connect_data=(sid=*sid*)))'

## TRUNC

When used for dates, the syntax of TRUNC is TRUNC(*date* *[, format]*). No format is the same as 'dd'. These formats are available:

- cc,scc:
  century (truncates to 1 Jan.)

- syear,syyy,y,yy,yyy,yyyy:
  year

- q:
  quarter

- month,mon,mm:
  month

- ww:
  week (Truncates to Monday of the current week for any day up to 11:59:59 pm on Sunday.)

- w:
  week (Truncates to X of the current week, where X is the weekday of the first day of the month.)

- day,dy,d:
  week (Truncates to Sunday of the current week for any day up to 11:59:59 pm on Saturday.)

- ddd,dd,j:
  day (default)

- hh,hh12,hh24:
  hour

- mi:
  minute
