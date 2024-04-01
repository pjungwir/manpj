# Controlling Terminals

Notes from Kerrisk chapter 34:

A process belongs to a Process Group, and a Process Group belongs to a Session.

Processes have a process id and a process group id, both `pid_t`.
A process inherits its process group id from its parent.
A progress group has a "process group leader", which is the first process to join the group, and the process group id is the same as its leader's process id.
A process can leave a group to join another group, even the leader.

A session has a session identifier (SID), also `pid_t`.
The session leader is the process that creates the session,
and its pid becomes the session id.
A new process inherits its parent's session id.

All the processes in a session share the same "controlling terminal".
When the session leader first opens a terminal device, that terminal becomes the controlling terminal for the session.
A terminal can only be the controlling terminal for one session.

Within a session, one process group is the foreground process group, and the others are background process groups. Only processes in the foreground group can read from the controlling terminal.
Signals caused by typing in the terminal (e.g. ^C, ^Z, ^\) are sent to all processes in the foreground group.

The session leader is the "controlling process" for the terminal.
If the terminal disconnects, the session leader gets a SIGHUP signal.

In /proc/[pid]/stat you can find the process group id, session id, controlling terminal device id (major+minor as a single integer), and the controlling terminal's foreground process group id (fields 5, 6, 7, 8 respectively). See proc(5). If I `cat /proc/$$/stat` then I see `2475319 2475319 34841 2477056` in those fields. So the first two numbers are my shell, and the last number is `cat`. You can compare the device numbers to this:

```
$ ls -l /dev/`who am i | awk '{ print $2 }'`
crw--w---- 1 paul tty 136, 25 Mar 31 14:10 /dev/pts/25
```

In proc(5) I read "The minor device number is contained in the combination of bits 31 to 20 and 7 to 0;  the  major device number is in bits 15 to 8." Now 34841 is 0x8819 or 1000 1000 0001 1001. So the major is 1000 1000 or 136, and the minor is 0001 1001 or 25. It matches!

OTOH if I `sudo cat /proc/1/stat` then I see `1 1 0 -1`. So that means no controlling terminal and thus n/a for its forground process group.

You could also get the same info from `ps -p $$ -o 'pid pgid sid tty command'

When a user logs in, the login shell gets a new process group and a new session. It is the session leader and the terminal's controlling process. So far it's the only process of its group + session.

Each time you run a command or pipeline, the shell puts those all into their own process group.
Normally it will become the foreground process group, unless you run it with &.

In a GUI, each terminal window has its own session, and the shell running in the window is the session leader and terminal's controlling process. In this case the controlling terminal is a pseudoterminal.

You can call setpgid to change a process's process group id.
Giving a zero creates a new process group, with the given process as leader.
(I guess technically you could also re-join an existing group you previously started as leader?)
A few restrictions:

- You can only change yourself or a child.
- You can't move a process into a different session.
- You can't move the session leader into a different group.
- You can't change a pid's process group after they have called exec.
  So you must do this between steps in a fork+exec combo.
  In fact *both* parent and child must call setpgid between fork & exec,
  otherwise you have a race condition: if only the parent did it,
  the child might exec first, and if only the child did it,
  the parent might send other job control signals first.
  If the parent's call happens after the exec, it gets an EACCES but the parent just ignores it.

A process can start a new session by calling setsid (as long as it's not a group leader).
This automatically puts the process into a new process group also.
If the process had a controlling terminal control before, it is set to blank.

If you really want a process group leader to start a new session, you can fork then have the child call setsid and the parent exit.

Note all this requires that when the kernel hands out new pids, it skips pids that are still used as process group ids or session ids.

The first time a session leader opens a terminal, that terminal becomes the controlling terminal for the session---unless it's already another session's controlling terminal, or it's opened with O_NOCTTY.
(In BSD you have to call `ioctl(fd, TIOCSCTTY)` to get a controlling terminal. It doesn't happen automatically when you open one.)

When the session leader gets a controller terminal, it becomes the terminal's controlling process.
That means if the terminal disconnects, the controlling process gets a SIGHUP.

Opening /dev/tty opens your own controlling terminal (or fails if you don't have one). So you don't have to muck around with device ids.

You can unset your controlling terminal with `ioctl(fd, TIOCNOTTY)`.
If you call that and you're the controlling process for the terminal,
all other processes in the session also lose their controlling terminal.
The terminal is free to become the controlling terminal of another session.
Every process in the foreground process group gets a SIGHUP.

You can call `ctermid` to get the pathname of your controlling terminal.
But on Linux and many other implementations, this just gives "/dev/tty".

The controlling terminal keeps track of which process group is the foreground process group.
Only the foreground group can read & write to the terminal.
You can change the foreground group by calling `tcsetpgrp`, but only to a group from your own session.
(Probably it has to be a group from the terminal's session too?)

If the terminal disconnects (or a ptty's window gets closed), the controlling process gets a SIGHUP.
If the controlling process was a shell (as is normal), then the shell will send a SIGHUP to each of the jobs it has created.
If the controller processes terminates, the kernel disassociates all other processes in the session from the controlling terminal. Then it sends a SIGHUP to the foreground process group members itself.

Bash and soma other shells also send a SIGHUP to all stopped background process groups when the user exits normally. Bash has a `disown` command to ask that it not. Or you can use nohup to start a command with it ignoring SIGHUP.
Bash only sends the SIGHUP to process groups it created itself, not to process groups created by its children.

To daemonize itself, a process calls fork, and the parent exits. This guarantees the child is not a process group leader. Then it calls setsid to get its own session (with no controlling terminal).
