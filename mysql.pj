.TH mysql pj "4 July 2003"
.SH NAME
MySQL Notes
.SH DESCRIPTION
To see the indexes on a table and their definitions:
.PP
.RS
SHOW INDEX FROM [\fIdbname\fR.]\fItablename\fR
.PP
SHOW INDEX FROM \fItablename\fR [FROM \fIdbname\fR]
.RE
.PP
Create a new database:
.PP
.RS
.nf
CREATE DATABASE \fIdatabase-name\fR
GRANT ALL PRIVILEGES ON \fIdatabase-name\fR.*
TO \fIuser\fR@\fIlocalhost\fR IDENTIFIED BY '\fIpassword\fR';
FLUSH PRIVILEGES;
.fi
.RE
.PP
or to let a user create/use any databases starting with their username:
.PP
.RS
.nf
CREATE USER '\fIfoo\fR'@'localhost' IDENTIFIED BY '\fIbar\fR';
GRANT ALL PRIVILEGES ON `foo\\_%`.* TO 'foo'@'%';
FLUSH PRIVILEGES;
.fi
.RE
.SH AUTHOR
Paul Jungwirth


