package tlib::tiny;

use 5.008001;

# ABSTRACT: Like blib but for t/lib
# VERSION

=head1 SYNOPSIS

From your .t file

 use Test::More;
 use tlib::tiny;
 ...

From the command line

 perl -Mtlib::tiny t/foo.t

=head1 DESCRIPTION

This pragma is just a short cut for C<use lib 't/lib'> with some handy
overrides.  Avoids using any modules so as to reduce the change of
introducing side effects.

=head1 USAGE

There are some useful overrides, that are used in this order:

=over 4

=item argument

 use tlib::tiny $dir;
 perl -Mtlib::tiny=$dir

If a directory is specified as an argument to the pragma, that will be used.

=item PERL_TLIB

If the environment variable C<PERL_TLIB> is specified that will be used.

=item C<t/lib>

If the relative directory C<t/lib> exists, that will be used.

=item diagnostic on dir not found.

If no directory is specified or found and described above, a L<Test2::API>
diagnostic will be generated to let you know that no test lib directory
was found.

=back

=head1 CAVEATS

This module avoids using any other modules (in-core or otherwise) so as
not to pollute %INC for tests or command lines, so it doesn't
even try to use native directory specifications with L<File::Spec> etc,
and may not work on platforms other than Windows and Unix.

=head1 SEE ALSO

=over 4

=item L<Test::Lib>

Similar in principal, but more full featured, and pulls on several
modules, polluting the namespace.

=item L<blib>

=item L<blib::tiny>

=back

=cut

sub import
{
  my $class = shift;
  my $dir;

  if(@_)
  {
    $dir = shift;
  }
  elsif($ENV{PERL_TLIB})
  {
    $dir = $ENV{PERL_TLIB};
  }
  elsif(-d 't/lib')
  {
    $dir = 't/lib';
  }
  else
  {
    # avoid pulling in Test2::API unless we need it.
    require Test2::API;
    my $context = Test2::API::context();
    $context->diag("tried to use tlib::tiny, but no t/lib exists!");
    $context->release;
    return;
  }

  unshift @INC, $dir;
}

1;
