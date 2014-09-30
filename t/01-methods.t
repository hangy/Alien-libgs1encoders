#!/usr/bin/env perl

use strict;
use warnings FATAL => "all";
use Alien::LibYAML;
use Test::More tests => 2;

my $libyaml = Alien::LibYAML->new;
ok defined($libyaml->libs), "libs directory defined";
ok defined($libyaml->cflags), "cflags defined";
