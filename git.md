.TH git pj "10 July 2014"
.SH Comparing branches

To compare two branches:
    git diff master..develop

To show all commits in develop that aren't in master:
    git log develop ^master --no-merges

To diff by date:
    git log 'master@{3 days ago}' master
    git log 'master@{3 days ago}' master -- path/to/file

.SH Old history

To see an old version of something:
    git show HEAD~1:path/to/file

Here ~1 means "1 revision before HEAD"

To find the commit in which you removed an object:
    git log -n 1 -- <filename>

To get it back:
    git checkout <commit>^ <filename>

To use git blame but only show changes prior to an old commit:
    git blame <commit>^ -- <filename>


.SH Remotes

To see everything on a remote repository:
    git remote show origin

To enable access to new remote branches, you might have to do this:
    git fetch origin

To create a local branch based on a remote branch:
    git checkout -b <branch> origin/<branch>

http://stackoverflow.com/questions/1783405/git-checkout-remote-branch

To set a local branch to track a remote branch:
    git branch --set-upstream foo origin/foo

To make a bare repo you can push to via ssh:
    git init --bare .

.SH Erasing

To erase the last commit without altering your index or checkout:
    git reset --soft HEAD~1

To reset your checkout to origin:
    git fetch origin && git reset --hard origin/master


.SH Security

To run git with a different ssh key:
    ssh-agent bash -c 'git add <private-key>; git <cmd>'

or even better (especially if you have multiple Github/Bitbucket accounts):

    git config core.sshCommand "ssh -i ~/.ssh/foo -F /dev/null"

.SH Blame

To skip whitespace-only changes, use the -w option.

To ask about specific lines, use -L:

    git blame -L10,+5 -- path/to/file

That will show only information about line 10 and the next 5 lines.

To get the second-to-last change (or third-to-last, etc.),
ask git to run blame as of the commit right before the 
one you want to skip:

    git blame 123abc^ -- path/to/file

where 123abc is the commit that later changed those lines.

It is probably useful to combine this with -L:

    git blame -L 10,+5 123abc^ -- path/to/file

Credits: http://stackoverflow.com/questions/5098256/git-blame-prior-commits

