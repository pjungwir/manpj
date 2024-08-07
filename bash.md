
# Brace Expansion Tricks

- `${variable:-default}`:
  Returns `${variable}` if set, otherwise `default`.
- `${variable#pattern}`:
  Returns `${variable}` with the shortest possible match of *pattern* cut off the front.
- `${variable##pattern}`:
  Returns `${variable}` with the longest possible match of *pattern* cut off the front.
- `${variable%pattern}`:
  Returns `${variable}` with the shortest possible match of *pattern* cut off the back.
- `${variable%%pattern}`:
  Returns `${variable}` with the longest possible match of *pattern* cut off the back.

If nothing matches, cut off nothing.

Here are some examples:

```
$ f=a/b/c/d
$ echo ${f##*/}
d
$ echo ${f%/*}
a/b/c
$ echo ${f%%/*}
a
```

# Command Editing

- Ctrl+w:
  Delete backwards to the beginning of the word.

- Ctrl+k:
  Delete to the end of the line.

- Ctrl+u:
  Delete to the start of the line.

# Login
`~/.bash_profile` is executed whenever a user logs in, but not when you open a terminal. (But the Mac Terminal app *does* run it then, and probably on Ubuntu too if you clicked that Preferences setting.). `~/.bashrc` is executed every time you start a non-login shell, as long as it is interactive. For non-interactive shells, neither file is executed. But if `$BASH_ENV` is set, a non-interactive shell will assume it specifies a file to run.

Therefore you should set variables in `~/.bashrc`, if you expect to have them in, e.g., cron. But if you set `PATH` recursively, e.g. `PATH="$PATH:$HOME/bin"`, then it will get longer and longer. I'm not sure what to do about this conflict.

On Ubuntu, `~/.bash_profile` includes a line to also source `~/.profile`. And `~/.profile` includes a line to source `~/.bashrc`! So they are all going to get run every time.

Tmux by default starts a new login shell. So it will also source `~/.bash_profile`.

# Variables

If unquoted, `$*` and `$@` do the same thing. But if you put quotes around them, `"$*"` gives you one big argument, formatted like `"$1 $2 $3 ..."` If you set the IFS variable, the parameters will be separated by that value. If you set IFS to null, the parameters won't have any separation.

On the other hand, `"$@"` produces a separate argument for each positional parameter, with each one quoted. This is probably what you want, if you want to pass the user's arguments to an underlying program, since it preserves whatever quoting the user asked for. In other words, `"$@"` expands to `"$1" "$2" "$3" ...`.

# Functions

The return value of a function is not like in Perl or other languages.
It is more like the return value of an executable: it sets $? and represents the function's status.
If you want to return strings or arrays from a function,
you should echo them instead and call the function in backticks.

# Files

If you want to get file handles beyond 0, 1, and 2, you can use `exec`. Do something like this:

```
exec 3<&0	# now fd 3 points to stdin
exec 0<"$filename" # now fd 0 reads from $filename
\&. . .
exec 0<&3	# restore old stdin
exec 3<&-	# close fd 3
```

or just do this:

```
exec 3<> $filename
```

That opens `$filename` and assigns fd 3 to it. That way, you can aim any command at it, or read from it.

You should be careful not to use fd 5, which is inherited by child processes and left open.

# Loops

Suppose you want to iterate over the input from stdin. Then do something like this:

```
range 1 10 | sed -e 's/ /\\n/g' | while read i; do echo $i; done;
```

Of course just echoing the numbers is not that interesting.

# Key Bindings

These are loaded from `/etc/inputrc` and `~/.inputrc`. Use this get to Ctrl-Arrow working:

```
"\\e[1;3C": forward-word
"\\e[1;3D": backward-word
"\\e[1;5C": shell-forward-word
"\\e[1;5D": shell-backward-word
```

The funny codes might be different depending on your terminal. You can you Ctrl-V then Ctrl-Arrow the see the actual code. ("\\e" and "^[" are equivalent; both indicate the escape key.)
.PP
You can also you `bind -p` to see the list of possible key bindings.

# Process Substitution

Takes stdin or stdout of another command and treat it like a file. For example:

```
diff -u <(git blame HEAD foo/bar) <(git blame foo/bar)
```
