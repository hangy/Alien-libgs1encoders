use strict;
use warnings;
BEGIN {
  unless(eval qq{ use Test::Alien 0.05; 1 })
  {
    require Test::More;
    Test::More::plan(skip_all => 'test requires Test::Alien');
  }
}
use Test2::Bundle::More;
use Alien::LibYAML;

plan 3;

alien_ok 'Alien::LibYAML';

ffi_ok { symbols => ['yaml_get_version'] }, with_subtest {
  my($ffi) = @_;
  plan 3;
  my $get_version = $ffi->function(yaml_get_version => ['int*','int*','int*'] => 'void');
  $get_version->call(\my $major, \my $minor, \my $patch);
  note "$major.$minor.$patch";
  like $major, qr{[0-9]+};
  like $minor, qr{[0-9]+};
  like $patch, qr{[0-9]+};
};
