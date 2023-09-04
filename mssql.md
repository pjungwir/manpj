# Connect

sqlcmd -U username -P password -S hostname -d database

For some reason auth may only work with -S (Server) not -H (Hostname).


# Users

First create a "login", then within each database create a "user" connected to that login. Then grant permissions:

```
CREATE LOGIN somebody WITH PASSWORD = 'secret';
USE somedb;
GO
CREATE USER somebody FOR LOGIN somebody;
GO
GRANT CREATE SCHEMA TO somebody;
GRANT ALTER ON SCHEMA::dbo TO somebody;
GRANT CREATE TABLE TO somebody;
GRANT SELECT TO somebody;
GRANT INSERT TO somebody;
GRANT UPDATE TO somebody;
GRANT DELETE TO somebody;
GRANT REFERENCES TO somebody;
GO
```

# Queries

(Don't forget to type `go` over & over....)

## Show databases:

```
exec sp_databases
go
```

## Show schemas:

```
SELECT  s.name AS schema_name,
        s.schema_id,
FROM    sys.schemas s
ORDER BY s.name;
GO
```

## Show tables:

```
SELECT * FROM SYSOBJECTS WHERE xtype = 'U';
GO
```

## Show columns:

```
SELECT column_name FROM information_schema.columns WHERE table_name = 'foo';
GO
```

or better:

```
:setvar SQLCMDMAXVARTYPEWIDTH 10
:setvar SQLCMDMAXFIXEDTYPEWIDTH 30
select column_name, data_type, is_nullable, character_maximum_length from information_schema.columns where table_name = 'Sales' order by ordinal_position;
GO
```

# Install

https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash
sudo docker pull mcr.microsoft.com/mssql/server:2019-latest
sudo docker run -e "ACCEPT_EULA=Y" -e 'SA_PASSWORD=$up3rSecret' \
   -p 1433:1433 --name sql1 -h sql1 \
   -d mcr.microsoft.com/mssql/server:2019-latest
