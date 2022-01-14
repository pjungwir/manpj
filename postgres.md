# psql tricks

To write out the last query as a CSV file:

```
\g (format=csv) foo.csv
```

To show the last query in extended mode (without changing the setting):

```
\gx
```

To run a query that generates SQL, then run that SQL:

```
-- Index every column in the table:
SELECT format('CREATE INDEX ON table (%I)', i)
FROM pg_attribute
WHERE attrelid = 'products'::regclass
AND attnum > 0
ORDER BY attnum
\gexec
```

# DATABASE ADMINISTRATION

Find the worst tables for full table scans:

```
SELECT  relname, 
        100 * idx_scan / (seq_scan + idx_scan) percent_of_times_index_used, 
        n_live_tup rows_in_table
FROM    pg_stat_user_tables
WHERE   seq_scan + idx_scan > 0 
ORDER BY n_live_tup DESC;
```

Find the worst tables for missed cache rate:


```
SELECT  relname, heap_blks_read, heap_blks_hit,
        round(heap_blks_hit::numeric/(heap_blks_hit + heap_blks_read), 3)
FROM    pg_statio_user_tables
WHERE   heap_blks_read > 0
ORDER BY 4
LIMIT   25;
```

Find the worst tables for missed cache rate on *indexes*:


```
SELECT  relname, idx_blks_read, idx_blks_hit,
        round(idx_blks_hit::numeric/(idx_blks_hit + idx_blks_read), 3)
FROM    pg_statio_user_tables
WHERE   idx_blks_read > 0
ORDER BY 4
LIMIT   25;
```

Find the overall cache hit rate (should be 99%+):


```
SELECT  sum(heap_blks_read) as heap_read,
        sum(heap_blks_hit)  as heap_hit,
        sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) as ratio
FROM    pg_statio_user_tables;
```

Find the biggest tables from the current database:


```
SELECT nspname || '.' || relname AS "relation",
       pg_size_pretty(pg_relation_size(C.oid)) AS "size"
FROM pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
WHERE nspname NOT IN ('pg_catalog', 'information_schema')
ORDER BY pg_relation_size(C.oid) DESC
```

# QUERIES

`regexp_matches(string, pattern)`

Unforunately this returns a setof text[] with *all* the matches found. If you just want one, you can do this:

```
SELECT (regexp_matches(col, 'foo(bar)'))[1] FROM baz
```

Show the current transaction isolation level:


```
SELECT current_setting('transaction_isolation');
```

To start a new Rails project:


```
sudo su - postgres -c psql <<-EOQ
CREATE USER foo WITH PASSWORD 'bar';
ALTER USER foo CREATEDB;
EOQ
rake db:create db:migrate
```

To write to a file:


```
\o filename
```

Like a <> b but accounting for nulls:


```
a IS DISTINCT FROM b
```

Find the current queries:


```
SELECT datname,procpid,current_query FROM pg_stat_activity;
```

or in 9.3:


```
SELECT datname, pid, state, waiting, query, query_start FROM pg_stat_activity ORDER BY query_start;
```

or in 9.6:


```
SELECT datname, pid, state, wait_event, query, query_start FROM pg_stat_activity ORDER BY query_start;
```

Show the current locks:


```
SELECT  locktype,
        database,
        relation::regclass,
        page,
        tuple,
        virtualxid,
        transactionid,
        classid,
        objid,
        objsubid,
        virtualtransaction,
        pid,
        mode,
        granted
FROM    pg_locks
ORDER BY pid
;
```

Show the blocked/blocking pids and queries:

```
SELECT blocked_locks.pid     AS blocked_pid,
       blocked_activity.usename  AS blocked_user,
       blocking_locks.pid     AS blocking_pid,
       blocking_activity.usename AS blocking_user,
       blocked_activity.query    AS blocked_statement,
       blocking_activity.query   AS current_statement_in_blocking_process
 FROM  pg_catalog.pg_locks         blocked_locks
  JOIN pg_catalog.pg_stat_activity blocked_activity  ON blocked_activity.pid = blocked_locks.pid
  JOIN pg_catalog.pg_locks         blocking_locks
    ON blocking_locks.locktype = blocked_locks.locktype
   AND blocking_locks.DATABASE IS NOT DISTINCT FROM blocked_locks.DATABASE
   AND blocking_locks.relation IS NOT DISTINCT FROM blocked_locks.relation
   AND blocking_locks.page IS NOT DISTINCT FROM blocked_locks.page
   AND blocking_locks.tuple IS NOT DISTINCT FROM blocked_locks.tuple
   AND blocking_locks.virtualxid IS NOT DISTINCT FROM blocked_locks.virtualxid
   AND blocking_locks.transactionid IS NOT DISTINCT FROM blocked_locks.transactionid
   AND blocking_locks.classid IS NOT DISTINCT FROM blocked_locks.classid
   AND blocking_locks.objid IS NOT DISTINCT FROM blocked_locks.objid
   AND blocking_locks.objsubid IS NOT DISTINCT FROM blocked_locks.objsubid
   AND blocking_locks.pid != blocked_locks.pid
  JOIN pg_catalog.pg_stat_activity blocking_activity ON blocking_activity.pid = blocking_locks.pid
 WHERE NOT blocked_locks.GRANTED
```

Kill a query:


```
SELECT pg_cancel_backend(12345);
```

To get the number of years between two dates:


```
SELECT  extract(year from age(now(), '2014-01-01'));
```

NOT:


```
SELECT  extract(year from now() - '2014-01-01');
```

Set or overwrite an hstore key/value:


```
UPDATE hstore_test SET data = data || '"key4"=>"some value"'::hstore

UPDATE hstore_test SET data = data || hstore(ARRAY['key4', 'some value'])
```


# REPLICATION

master (10.0.1.1)

In `postgresql.conf`:


```
wal_level = hot_standby
max_wal_senders = 3
checkpoint_segments = 8
wal_keep_segments = 8
archive_mode = on
archive_command = 'rsync -aq -e "ssh -o StrictHostKeyChecking=no" %p 10.0.1.2:/var/lib/postgresql/9.3/archive/%f'
archive_timeout = 3600
```

slave (10.0.1.2)

In `postgresql.conf`:


```
hot_standby = on
```

Has a `recovery.conf` file at e.g. `/var/lib/postgresql/9.3/main/recovery.conf`:


```
standby_mode = 'on'
primary_conninfo = 'host=10.0.1.1 port=5432 user=postgres'
trigger_file = '/var/lib/postgresql/9.3/main/trigger'

# Shell command to execute an archived segment of WAL file series.
# Required for archive recovery if streaming replication falls behind too far.
restore_command = 'cp /var/lib/postgresql/9.3/archive/%f %p'
archive_cleanup_command = '/usr/lib/postgresql/9.3/bin/pg_archivecleanup /var/lib/postgresql/9.3/archive/ %r'
```
  

failover

Just create a trigger file on the slave, e.g.:


```
touch /var/lib/postgresql/9.3/main/trigger
```


Get a CSV file:


```
COPY (
  ...
) TO '/tmp/foo.csv' WITH CSV HEADER
```

# PERMISSIONS

See default permissions for a user:


```
\\ddp
```

Grant default permissions to a user (so they get the same permissions on future-created tables and views):


```
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO the_user;
```

You can use `\l` to list privileges on each database.

You'll see lines like `db_user=CTc/postgres` and `=c/postgres`.
The name before the equals sign is the user with those privileges.
If there is no name, it means the special `PUBLIC` role, which is everyone.
The name after the slash is who granted the privileges.

- c: connect to the database

- C: create new schemas

- T: create temporary tables


To see the permissions on a given table: `\z table_name`. Or `\dp` for all tables/views/sequences.

The letters mean (https://www.postgresql.org/docs/9.5/static/sql-grant.html):

- a: insert (add)

- r: select (read)

- w: update (write)

- d: delete

- D: truncate (really delete)

- x: references

- t: trigger

- \*: and you can grant this privilege to others

Also for other objects (functions and schemas), you'll see:

- X: execute

- U: usage

Note that neither command shows default privileges, unlike


```
SELECT  grantee, privilege_type
FROM    information_schema.role_table_grants
WHERE   table_name = 'foo'
```

This is an interesting summary also: https://www.postgresql.org/message-id/20120703014228.11c82a45%40james.intern

# POSTGIS

On a Mac using Peter Eisentraut's Postgres formulae, use pex to install extensions. For example:


```
pex -g /usr/local/opt/postgresql@10 install postgis
```

And you can solve lots of compilation errors with the tricks from https://gist.github.com/skissane/0487c097872a7f6d0dcc9bcd120c2ccd
