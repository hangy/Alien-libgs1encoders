#!/usr/bin/env perl

use v5.10;
use strict;
use warnings FATAL => 'all';
use utf8;

use Alien::Base::ModuleBuild;
use File::Spec::Functions qw(catfile);

my $builder = Alien::Base::ModuleBuild->new(
    dist_name => 'Alien-LibYAML',
    license => 'MIT',
    dist_abstract => 'Build and install libyaml, a C-based YAML parser and emitter',
    dist_author => 'Richard Simões <rsimoes AT cpan DOT org>',
    dist_version_from => 'lib/Alien/LibYAML.pm',
    alien_name => 'libyaml',
    alien_repository => {
        protocol => 'http',
        host     => 'bitbucket.org',
        location => '/xi/libyaml/get/',
        exact_filename => '0.1.5.tar.gz',
        exact_version => '0.1.5'
    },
    alien_build_commands => [
        '%pbootstrap',
        '%pconfigure --prefix=%s --enable-shared',
        'make',
        'make install'
    ],
    # Prerequisites inserted by DistZilla:
    ##{ $plugin->get_prereqs ##}
);

### Add generated file:
my $config_data_pm = catfile(qw(lib Alien LibYAML ConfigData.pm));
open my $MANIFEST, '>>', 'MANIFEST';
$MANIFEST->print($config_data_pm, "\n");
$MANIFEST->close;

$builder->create_build_script;
