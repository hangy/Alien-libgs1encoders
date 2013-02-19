#!/usr/bin/env perl

use v5.10;
use strict;
use warnings FATAL => "all";
use Alien::LibYAML;
use Test::More tests => 2;

my $libyaml = Alien::LibYAML->new;
ok defined($libyaml->libs), "libs directory defined";
ok defined($libyaml->cflags), "cflags defined";
