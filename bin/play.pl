#!/usr/bin/perl
use strict;
use warnings;
use FindBin;
use File::Spec;
use lib File::Spec->catdir( $FindBin::Bin, '..', 'lib' );
use Core::Game;
use Data::Dumper;

# Game
my $game = Game->new({ packs=> 1, condition=> 'suit' });
$game->start_game();

# print Dumper($game);

# Player
# my $player = Player->new();
# print Dumper($player);
# $player->add_cards(10);
# print Dumper($player);
# $player->add_cards(10);
# print Dumper($player);

# Deck
# my $deck = Deck->new();
# $deck->shuffle_deck();
# print Dumper();
# my $card = $deck->get_top_card();
# print Dumper($card->suite());
