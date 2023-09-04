file:///svn/

file:///usr/local/share/svn/repositories/

To get keyword replacement, you must set the property svn:keywords. It contains a space-delimited list
of all the keywords to manage. The simplest is `$Id$`.

Refresher:

- svn info: offline

- svn status: offline

- svn diff: offline

- svn update: pull down changes

# commit just some files

First create a changelist:

```
svn changelist fix-issue-237 foo.c
```

Use `svn status` to see what's in the changelist.

Now commit that changelist:

```
svn commit --changelist fix-issue-237
```

# ignore files

todo
