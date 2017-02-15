#!/usr/bin/perl -w
use FindBin;
use File::Spec;
use lib File::Spec->catdir( $FindBin::Bin, '..', 'lib' );
use Core::Game;

use Test::More tests => 1;

my $game;

my $ok=eval {
  $game = Game->new({ packs=> 1, condition=> 'value', test => 1 });
  1;
};

if (!$ok) {
  my $err=$@;
  die $err;
}



is($game->start_game(),1,'game start_game');

1;
