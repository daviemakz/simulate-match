#!/usr/bin/perl -w
use FindBin;
use File::Spec;
use lib File::Spec->catdir( $FindBin::Bin, '..', 'lib' );
use Core::Deck::Card;

use Test::More tests => 4;

my $card;

my $ok=eval {
  $card = Card->new({ face_value=> 'ace', suite=> 'spades' });
  1;
};

if (!$ok) {
  my $err=$@;
  die $err;
}

is($card->face_value(),'ace','card face_value');
is($card->face_value('king'),'king','card face_value modify');
is($card->suite(),'spades','card suite');
is($card->suite('clubs'),'clubs','card suite modify');

1;
