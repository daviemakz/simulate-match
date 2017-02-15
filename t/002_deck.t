#!/usr/bin/perl -w
use FindBin;
use File::Spec;
use lib File::Spec->catdir( $FindBin::Bin, '..', 'lib' );
use Core::Deck;

use Test::More tests => 3;

my $deck;

my $ok=eval {
  $deck = Deck->new();
  1;
};

if (!$ok) {
  my $err=$@;
  die $err;
}

is($deck->check_empty(),0,'deck check_empty');
is_deeply($deck->get_top_card(), { face_value => 2 , suite => 'hearts' }, 'deck get_top_card');
is($deck->shuffle_deck(),1,'deck shuffle_deck');

1;
