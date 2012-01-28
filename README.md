manpj
=====

I once read some advice that if you ever figure something out that you might have to do again, especially if you only do it once or twice a year, then you should write it down. I tend to put these notes into Unix man pages, which I store under the made-up pj section. I keep them all at `~/man/manpj/`, with these commands in my `.bash_profile`:

    export MANPATH="$MANPATH:$HOME/man"
    export MANSECT="1:n:l:8:3:2:3posix:3pm:3perl:5:4:9:6:7:pj"

Most of these files are in man format, but some are just txt. Usually something starts as txt, and if its appearance when I type `man pj foo` is intolerable, I give it some nice man macros.

You can [read these man pages online at my site](http://illuminatedcomputing.com/manpj).

