# Alien::libgs1encoders

Build and install libgs1encoders, a C-based GS1 barcode parser

# SYNOPSIS

In your Makefile.PL:

```perl
use ExtUtils::MakeMaker;
use Alien::Base::Wrapper ();

WriteMakefile(
  Alien::Base::Wrapper->new('Alien::libgs1encoders')->mm_args2(
    # MakeMaker args
    NAME => 'My::XS',
    ...
  ),
);
```

In your Build.PL:

```perl
use Module::Build;
use Alien::Base::Wrapper qw( Alien::libgs1encoders !export );

my $builder = Module::Build->new(
  ...
  configure_requires => {
    'Alien::libgs1encoders' => '0',
    ...
  },
  Alien::Base::Wrapper->mb_args,
  ...
);

$build->create_build_script;
```

# DESCRIPTION

This distribution provides an alien wrapper for libgs1encoders. It requires a C
compiler. That's all!

# AUTHOR

hangy

# COPYRIGHT AND LICENSE

This software is copyright (c) 2023 by hangy.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
