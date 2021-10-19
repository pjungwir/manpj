# DESCRIPTION

To see the indexes on a table and their definitions:

SHOW INDEX FROM [*dbname*.]*tablename*

SHOW INDEX FROM *tablename* [FROM *dbname*]

Create a new database:

CREATE DATABASE *database-name*

GRANT ALL PRIVILEGES ON *database-name*.*

TO *user*@*localhost* IDENTIFIED BY '*password*';

FLUSH PRIVILEGES;

or to let a user create/use any databases starting with their username:

CREATE USER '*foo*'@'localhost' IDENTIFIED BY '*bar*';
GRANT ALL PRIVILEGES ON '*foo*_%'.* TO 'foo'@'%';
FLUSH PRIVILEGES;
