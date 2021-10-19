.TH python pj "4 July 2005"
.SH NAME
Python Notes
.SH DESCRIPTION
Python loads modules using a PATH-like variable called PYTHONPATH. From within python, you can get this as sys.path.
.PP
If Python finds a module package in sys.path, it looks there for all submodules, and does not check the rest of sys.path. For instance, say you have this on your filesystem:
.PP
.RS
.nf
/a/pythonlib/MyPackage/MyModuleA
/b/pythonlib/MyPackage/MyModuleA
/b/pythonlib/MyPackage/MyModuleB
.fi
.RE
.PP
And say this is your sys.path: ['/a/pythonlib', '/b/pythonlib']. Then you will never find MyPackage.MyModuleB, because when Python sees MyPackage in /a/pythonlib, it will always look there for submodules.
.PP
If you're trying to figure out how to print stack traces, use the traceback module. Just call print_exc() if you're in an except handler, or print_stack() if you're not. There are other functions that operate on specific exception/traceback objects; see the documentation. And the exc_info() function isn't documented very well. It doesn't return a traceback object; it returns a tuple the third member of which is a traceback object.
.PP
If you want to format an exception for printing, you can do something along these lines:
.PP
.RS
.nf
try:
    a = b
except:
    import traceback, sys
    print traceback.format_tb(sys.exc_info()[2])[0]
.fi
.RE
.PP
Append adds one element; extend adds many:
.PP
.RS
.nf
>>> a = [1, 2, 3]
>>> a.append(4)
>>> a
[1, 2, 3, 4]
>>> a.extend((5, 6, 7))
>>> a
[1, 2, 3, 4, 5, 6, 7]
.fi
.RE
.PP
Logging
.PP
If you're seeing things printed twice:
.PP
This happens when one logger sends a message to a handler
and then propagates the message to the root logger which also sends the message to the same handler.
You can fix it like this:
.PP
.RS
.nf
[logger_root]
level=INFO
handlers=stream_handler

[logger_mypackage.foo]
level=DEBUG
handlers=stream_handler
qualname=mypackage.foo
propagate=0
.fi
.RE
.PP
or like this:
.PP
.RS
.nf
[logger_root]
level=INFO
handlers=stream_handler

[logger_mypackage.foo]
level=DEBUG
handlers=
qualname=mypackage.foo
.fi
.RE

Note you *must* have a `handlers` key, but it can be blank.

.PP
The first approach prevents propagating the message up to the root logger.
The second approach just avoids adding the same handler twice.
The second approach seems more elegant,
although I've seen the propagate=0 approach recommended online.
.PP
.fi
.RE
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2005 Paul Jungwirth
