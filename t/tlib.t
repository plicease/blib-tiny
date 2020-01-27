use Test2::V0 -no_srand => 1;
use tlib;

subtest 'default works' => sub {

  eval { require Foo };
  is "$@", "";
  is \%INC, hash { field 'Foo.pm' => D(); etc };

};


done_testing;


