#!/usr/bin/perl -w
use FindBin;
use File::Spec;
use lib File::Spec->catdir( $FindBin::Bin, '..', 'lib' );
use Core::Game;
use Core::Deck;
use Core::Player;
use Core::Deck::Card;

use Test::More tests => 4;

BEGIN {
  use_ok('Core::Deck::Card');
  use_ok('Core::Player');
  use_ok('Core::Deck');
  use_ok('Core::Game');
}

1;
