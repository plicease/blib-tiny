package blib::tiny;

use strict;
use warnings;
use 5.008001;

# ABSTRACT: Like blib but lighter
# VERSION

=head1 SYNOPSIS

 perl -Mblib::tiny script [args...]

=head1 DESCRIPTION

Works similar to L<blib> except it doesn't use any modules other than the
pragma's L<strict> and L<warnings> to avoid polluting the namespace.

Different in that, it doesn't die if there is no blib found and doesn't
accept arguments (only the blib relative to the current directory works).

=head1 CAVEATS

This module avoids using any other modules (in-core or otherwise) so as
not to pollute the namespace for tests or command lines, so it doesn't
even try to use native directory specifications with L<File::Spec> etc,
and may not work on platforms other than Windows and Unix.

=head1 SEE ALSO

=over 4

=item L<blib>

=item L<tlib>

=back

=cut

sub import
{
  my $class = shift;
  unshift @INC, 'blib/arch', 'blib/lib';
}

1;
