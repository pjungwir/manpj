# DESCRIPTION

The terminfo database is at `/usr/share/terminfo/`, although you can pick up 
files from elsewhere using `$TERMINFO` or `$TERMINFO_DIRS`. You can also create an 
alternate database at `$HOME/.terminfo/`. This database consists of a separate 
file for each terminal type. You can see your terminal type in the `$TERM`
variable. Each file is in binary format, but you can print the capabilities in 
text with infocmp(1M). Just say, "infocmp xterm" and you get all the 
capabilities for xterms. To compile a binary file from a text file, use 
tic(1M). The terminfo(5) man page explains what all the different capability 
codes mean. Here a few of the capabilities for xterms:

```
setaf=\\E[3%p1%dm   # set ascii foreground.
setab=\\E[4%p1%dm   # set ascii background.
clear=\\E[H\\E[25   # clear the screen.
```

Those %-codes are like printf codes. They work like a stack. `%p1` means push the 
first argument on the stack. `%p2` means push the second, etc. %d means a decimal 
argument. `%c` is char and `%s` is string. So to set the foreground to color 5, you 
actually send a command like this:

```
echo -ne '^[[35m'
```

Remember that you can get a literal escape by typing `CTRL-V <ESC>`.

# SEE ALSO

infocmp(1M),
tic(1M),
terminfo(5).
