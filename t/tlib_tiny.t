use Test2::V0 -no_srand => 1;
use tlib::tiny;

subtest 'default works' => sub {

  local $@ = '';
  eval { require Foo };
  is "$@", "";
  is \%INC, hash { field 'Foo.pm' => D(); etc };

};


done_testing;


