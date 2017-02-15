use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile( NAME          => 'Core::Game',
               AUTHOR        => 'David Makuni <d.makuni@live.co.uk>',
               VERSION_FROM  => 'lib/Core/Game.pm',
               ABSTRACT      => 'Simlates a game called "match!"',
               PL_FILES      => {},
               LICENSE       => 'gpl',
               PREREQ_PM     => { 'List::Util' => 0, },
               TEST_REQUIRES => { 'Test::More' => 0, },
               EXE_FILES     => ['bin/play'],
               test          => { TESTS => 't/*.t' },
             );
