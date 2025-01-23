detatch *other* attached clients: C-a D

# Changing the window (the "tab")

Ctrl-a 1 through Ctrl-a 9 of course.
Ctrl-a n means "next".
Ctrl-a p means "prev.
Ctrl-a ' lets you type a longer number.

See:

- https://joshtronic.com/2024/02/11/tmux-switching-windows-10-and-above/
- http://superuser.com/questions/755634/how-to-quickly-switch-to-n-10-windows-in-tmux

To change tabs interactively: C-a '

To change tabs by moving left or right (from http://superuser.com/questions/755634/how-to-quickly-switch-to-n-10-windows-in-tmux): C-a C-n and C-a C-p (vi movement keys, hold Ctrl for both `a` and the letter).

Change the bottom bar color:

    set status-bg red
    set status-fg white

Or use `set -g` to change it for every tmux session on the box.

# Splitting the Pane

^A " - split vertically
^A % - split horizontally (allegedly)
^A arrow key - move to another pane
