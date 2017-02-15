#!/usr/bin/perl -w
use FindBin;
use File::Spec;
use lib File::Spec->catdir( $FindBin::Bin, '..', 'lib' );
use Core::Player;

use Test::More tests => 1;

my $player;

my $ok=eval {
  $player = Player->new({ cards_owned => 0, name => 'robert'  });
  1;
};

if (!$ok) {
  my $err=$@;
  die $err;
}

is($player->get_name(),'robert','player get_name');
is($player->cards_owned(),0,'player cards_owned,');
is($player->add_cards(10),1,'player add_cards');
is($player->cards_owned(),10,'player cards_owned updated');

1;
