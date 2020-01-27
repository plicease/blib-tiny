use Test2::V0 -no_srand => 1;

subtest 'compiles okay' => sub {

  local $@ = '';
  eval { require blib::tiny };
  is "$@", '';

};


done_testing;


