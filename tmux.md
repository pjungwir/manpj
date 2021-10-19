detatch *other* attached clients: C-a D

To change tabs interactively: C-a '

To change tabs by moving left or right (from http://superuser.com/questions/755634/how-to-quickly-switch-to-n-10-windows-in-tmux): C-a C-h and C-a C-l (vi movement keys, hold Ctrl for both `a` and the letter).

Change the bottom bar color:

    set status-bg red
    set status-fg white

Or use `set -g` to change it for every tmux session on the box.

# Splitting the Pane

^A " - split vertically
^A % - split horizontally (allegedly)
^A arrow key - move to another pane
