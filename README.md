# tlib [![Build Status](https://secure.travis-ci.org/plicease/tlib.png)](http://travis-ci.org/plicease/tlib)

Like blib but for t/lib

# SYNOPSIS

From your .t file

```perl
use Test::More;
use tlib;
...
```

From the command line

```
perl -Mtlib t/foo.t
```

# DESCRIPTION

This pragma is just a short cut for `use lib 't/lib'` with some handy
overrides.  Avoids using any modules other than the [strict](https://metacpan.org/pod/strict) and [warnings](https://metacpan.org/pod/warnings)
pragmas.

# USAGE

There are some useful overrides, that are used in this order:

- argument

    ```perl
    use tlib $dir;
    perl -Mtlib=$dir
    ```

    If a directory is specified as an argument to the pragma, that will be used.

- PERL\_TLIB

    If the environment variable `PERL_TLIB` is specified that will be used.

- `t/lib`

    If the relative directory `t/lib` exists, that will be used.

- diagnostic on dir not found.

    If no directory is specified or found and described above, a [Test2::API](https://metacpan.org/pod/Test2::API)
    diagnostic will be generated to let you know that no test lib directory
    was found.

# CAVEATS

This module avoids using any other modules (in-core or otherwise) so as
not to pollute the namespace for tests or command lines, so it doesn't
even try to use native directory specifications with [File::Spec](https://metacpan.org/pod/File::Spec) etc,
and may not work on platforms other than Windows and Unix.

# SEE ALSO

- [blib](https://metacpan.org/pod/blib)
- [blib::tiny](https://metacpan.org/pod/blib::tiny)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
