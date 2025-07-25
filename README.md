ELF Linking
===========

This demonstration shows how to dynamically link an ELF shared object to
another ELF shared object. In the following directories:

1. `static` — trivial case: statically linked

    aa

2. `parallel` — typical case: all shared objects are dynamically
   linked to the executable in parallel

   aa ⇐ libbb.so\
   aa ⇐ libcc.so

3. `serial` — unusual case: a dynamic library is linked to the other
   dynamic library

    aa ⇐ libbb.so ⇐ libcc.so

ldd(1) shows how the dynamic libraries are linked. _Note:_ running ldd
on the executable shows a flattened structure. Compare _parallel_ and
_serial_:

```sh
$ (cd parallel && ldd aa libbb.so libcc.so)
aa:
        linux-vdso.so.1 (0x00007ffd14af5000)
        libbb.so => ./libbb.so (0x00007fe8668ef000)
        libcc.so => ./libcc.so (0x00007fe8668ea000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fe8666a2000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fe8668fb000)
libbb.so:
        statically linked
libcc.so:
        statically linked
```

```sh
$ (cd serial && ldd aa libbb.so libcc.so)
aa:
        linux-vdso.so.1 (0x00007ffc03719000)
        libbb.so => ./libbb.so (0x00007fa288710000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fa2884c8000)
        libcc.so => ./libcc.so (0x00007fa2884c3000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fa28871c000)
libbb.so:
        linux-vdso.so.1 (0x00007ffd356fc000)
        libcc.so => ./libcc.so (0x00007fe2ece97000)
libcc.so:
        statically linked

```

Build and Run Demo
------------------

```sh
make
```

Help
----

```sh
$ make help
Demonstrate different ways of ELF linking

Targets:
  ldd (default) : Describe dynamic linking of each executable.
  apps          : Compile and link each method.
  clean         : Remove compiled objects.
  help          : This message
  run           : Run each application and print its exit code.
```

Scope Test
----------

In the **serial dynamic linking case**, the _aa_ application does not have
access to the symbols in _libcc.so_.

In the **parallel dynamic linking case**, the _aa_ application has full
access to the symbols in _libcc.so_.

TO-DO
-----

Demonstrate runtime dynamic linking via dlopen(3).
