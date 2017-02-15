use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile( NAME          => 'Core::Game',
               AUTHOR        => 'David Makuni <d.makuni@live.co.uk>',
               VERSION       => '1.0.0',
               ABSTRACT      => 'Simlates a game called "match!"',
               PL_FILES      => {},
               LICENSE       => 'gpl',
               PREREQ_PM     => {
                'List::Util' => 0,
                'Class::Accessor' => 0
               },
               TEST_REQUIRES => { 'Test::More' => 0, },
               EXE_FILES     => ['bin/play-match'],
               test          => { TESTS => 't/*.t' },
             );
