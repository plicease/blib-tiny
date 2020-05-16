# blib::tiny [![Build Status](https://travis-ci.org/plicease/blib-tiny.svg)](http://travis-ci.org/plicease/blib-tiny)

Like blib but lighter

# SYNOPSIS

```
perl -Mblib::tiny script [args...]
```

# DESCRIPTION

Works similar to [blib](https://metacpan.org/pod/blib) except it doesn't use any modules other than the
pragma's [strict](https://metacpan.org/pod/strict) and [warnings](https://metacpan.org/pod/warnings) to avoid polluting the namespace.

Different in that, it doesn't die if there is no blib found and doesn't
accept arguments (only the blib relative to the current directory works).

# CAVEATS

This module avoids using any other modules (in-core or otherwise) so as
not to pollute the namespace for tests or command lines, so it doesn't
even try to use native directory specifications with [File::Spec](https://metacpan.org/pod/File::Spec) etc,
and may not work on platforms other than Windows and Unix.

# SEE ALSO

- [blib](https://metacpan.org/pod/blib)
- [tlib](https://metacpan.org/pod/tlib)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
