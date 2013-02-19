#!/usr/bin/env perl

use v5.10;
use strict;
use warnings FATAL => "all";
use utf8;

use Alien::Base::ModuleBuild;

my $builder = Alien::Base::ModuleBuild->new(
    dist_name => "Alien-LibYAML",
    license => "MIT",
    dist_abstract => q(Build and install LibYAML),
    dist_author => q"Richard Simões <rsimoes AT cpan DOT org>",
    dist_version_from => "lib/Alien/LibYAML.pm",
    alien_name => "libyaml",
    alien_repository => {
        protocol => "http",
        host     => "pyyaml.org",
        location => "/download/libyaml/",
        pattern  => qr(^yaml-([\d\.]+)\.tar\.gz$)
    },
    alien_build_commands => [
        "%pconfigure --prefix=%s --enable-shared",
        "make",
        "make install"
    ],
    # Prerequisites inserted by DistZilla:
    ##{ $plugin->get_prereqs ##}
);

$builder->create_build_script;
