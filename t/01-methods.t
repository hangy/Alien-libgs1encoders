#!/usr/bin/env perl

use strict;
use Alien::LibYAML;
use Test::More skip_all => 'test requires Alien::LibYAML already installed';
use Test::More tests => 2;

my $libyaml = Alien::LibYAML->new;
ok defined($libyaml->libs), "libs directory defined";
ok defined($libyaml->cflags), "cflags defined";
