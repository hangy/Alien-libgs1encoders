# Alien::LibYAML [![Build Status](https://travis-ci.org/PerlAlien/Alien-LibYAML.svg)](http://travis-ci.org/PerlAlien/Alien-LibYAML)

Build and install libyaml, a C-based YAML parser and emitter

# SYNOPSIS

In your Makefile.PL:

```perl
use ExtUtils::MakeMaker;
use Alien::Base::Wrapper ();

WriteMakefile(
  Alien::Base::Wrapper->new('Alien::LibYAML')->mm_args2(
    # MakeMaker args
    NAME => 'My::XS',
    ...
  ),
);
```

In your Build.PL:

```perl
use Module::Build;
use Alien::Base::Wrapper qw( Alien::LibYAML !export );

my $builder = Module::Build->new(
  ...
  configure_requires => {
    'Alien::LibYAML' => '0',
    ...
  },
  Alien::Base::Wrapper->mb_args,
  ...
);

$build->create_build_script;
```

# DESCRIPTION

This distribution provides an alien wrapper for libyaml. It requires a C
compiler. That's all!

# SEE ALSO

- [YAML::XS](https://metacpan.org/pod/YAML::XS)

    Perl bindings for libyaml (library bundled with distribution).

# COPYRIGHT AND LICENSE

Copyright © 2014 Richard Simões. libyaml written and copyrighted by Kirill
Simonov. Both libyaml and this distribution are released under the terms of the
**MIT License** and may be modified and/or redistributed under the same or any
compatible license.

# AUTHOR

Original author: Richard Simões (RSIMOES)

Current maintainer: Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2013-2018 by Richard Simões.

This is free software, licensed under:

```
The MIT (X11) License
```
