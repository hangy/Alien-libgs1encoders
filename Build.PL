#!/usr/bin/env perl

use strict;
use 5.008001;
use utf8;

use Alien::Base::ModuleBuild;
use File::Spec::Functions qw(catfile);

my $patch = $^O eq 'MSWin32' ? 'patch --binary' : 'patch';

my $builder = Alien::Base::ModuleBuild->new(
    dist_name => 'Alien-LibYAML',
    license => 'MIT',
    dist_abstract => 'Build and install libyaml, a C-based YAML parser and emitter',
    dist_author => 'Richard Simões <rsimoes AT cpan DOT org>',
    dist_version_from => 'lib/Alien/LibYAML.pm',
    alien_name => 'yaml-0.1',
    alien_repository => {
        protocol            => 'http',
        host                => 'pyyaml.org',
        location            => '/download/libyaml/',
        pattern             => qr{^yaml-.*\.tar\.gz$},
        # does require a c compiler, but the test for this in
        # Alien::Base is not all that reliable
        c_compiler_required => 0,
    },
    alien_build_commands => [
      "$patch -p1 < ../../yaml-0_1_6.patch",
      '%c --prefix=%s',
      'make',
    ],
    alien_install_commands => [
      'make install',
    ],
    alien_bin_requires => {
      'Alien::patch' => 0,
    },
    alien_stage_install => 1,
    alien_isolate_dynamic => 1,
    # Prerequisites inserted by DistZilla:
    ##{ $plugin->get_prereqs ##}
);

### Add generated file:
my $config_data_pm = catfile(qw(lib Alien LibYAML ConfigData.pm));
open my $MANIFEST, '>>', 'MANIFEST';
$MANIFEST->print($config_data_pm, "\n");
$MANIFEST->close;

$builder->create_build_script;
