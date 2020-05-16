package blib::tiny;

use 5.008001;

# ABSTRACT: Like blib but lighter
# VERSION

=head1 SYNOPSIS

 perl -Mblib::tiny script [args...]

=head1 DESCRIPTION

This works similar to L<blib>, except it doesn't pull in any other
modules.  This avoids introducing side effects of loading modules
earlier or loading them at all compared to when they would be called
without L<blib>.

It is different in that it does not die if there is no blib found,
and doesn't accept any arguments (only the blib relative to the current
directory is supported).

=head1 CAVEATS

This module avoids using any other modules (in-core or otherwise) so as
not to pollute the namespace for tests or command lines, so it doesn't
even try to use native directory specifications with L<File::Spec> etc,
and may not work on platforms other than Windows and Unix.

=head1 SEE ALSO

=over 4

=item L<blib>

=item L<tlib::tiny>

=back

=cut

sub import
{
  my $class = shift;
  unshift @INC, 'blib/arch', 'blib/lib';
}

1;
