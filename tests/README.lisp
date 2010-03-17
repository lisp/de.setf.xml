
20030328

this directory contains files which can be used to test the operation of the
xml parser. the sysdcl.lisp system description file contains an entry, :xtests,
which designates those files which have been tested for this release.

the files are arranged in several subdirectories:

- one for each of the various parser modules. xquerydatamodel and xparser, in
particular, contain active tests. the othe directories are included for
reference.

- one for each of the tested vendor environments. each one includes the
respective lisp init file and a transcript of the output for a verbose
compile/load/test cycle.

...
