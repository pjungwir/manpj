# BASIC NAVIGATION

Do this if you're looking for something:

```
yum list available '*docbook*'
yum provides '*filename'
yum search whatever
```

See details about a package:

```
yum info somepackage
```

See all the files in a package:

```
repoquery --list somepackage
```

See your repositories:

```
yum repolist
```
