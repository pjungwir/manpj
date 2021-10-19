.TH rpmbuild pj "4 July 2005"
.SH NAME
rpmbuild Notes
.SH DESCRIPTION
So an RPM spec file starts with a source tarball, uncompresses it, builds from the source, installs the binaries, and then collects the resulting files into an -rpm file. There are two important directory structures:
.PP
1. The RPM directory structure, by default /usr/src/redhat. rpmbuild looks for the tarball under SOURCES and expends it under BUILD. "make" will happen in this directory. To change this, add the following line (or something like it) to ~/.rpmmacros:
.PP
.RS
%_topdir	/home/pjungwir/src/rpmbuild
.RE
.PP
2. The (poorly named) build root, usually %{_tmpdir}/%{name}-root, which is /var/tmp/integratis-root or /var/tmp/whatever-root. Once everything is compiled and installed, rpmbuild will look here to find the files you've listed under %files. That means your build process should install files like /var/tmp/whatever-root/bin/whatever and /var/tmp/whatever-root/man/man1/whatever.1. In other words, run configure like this:
.PP
.RS
\&./configure --prefix=%{_tmpdir}/%{name}-root
.RE
.PP
You can set the build root with the BuildRoot parameter of your spec file. You should use a place where you can easily identify all the installed files. That way, you can run "rpmbuild -bi whatever.spec," then check the install location to see everything you must include in the %files target.
.PP
Incidentally, %{_tmpdir} is also where rpmbuild creates various temporary scripts, with names like rpm-tmp.64172. Each "target" in the spec file corresponds to one of these scripts, although since they're all named the same for a given invocation of rpmbuild, only the last target's file remains.
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co Paul Jungwirth 2005
