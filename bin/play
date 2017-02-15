#!/usr/bin/perl
use strict;
use warnings;
use FindBin;
use File::Spec;
use lib File::Spec->catdir( $FindBin::Bin, '..', 'lib' );
use Core::Game;

&begin;

sub begin {
  my ( $packs, $condition, $game, %cond );

  # variables
  $cond{1} = "value";
  $cond{2} = "suite";
  $cond{3} = "both";

  # summary
  print "Welcome to the card game called 'match'. There are two computer players, 'Rick' and 'Morty'.\n";
  print "Please consider the following options:\n";

  # get number of packs
  print "\nHow many packs do you want to use: ";
  $packs = <STDIN>;
  chomp $packs;
  die("Invalid number!") if ( !( $packs =~ /^\d+$/ ) );

  # get condition
  print "\nThese are the avaliable match conditions for the game.\n\n";
  print "1) - Check only the card values.\n";
  print "2) - Check only the suite of the card.\n";
  print "3) - Check both the value and the card suite matches.\n";
  print "\nPlease choose an option from the above list: ";
  $condition = <STDIN>;
  chomp $condition;
  die("Invalid condition!") if ( !$cond{$condition} );

  # deck warning
  if ( $packs > 1000 ) {
    print "\nYou are about to simulate a game with " . $packs * 52 . " cards in total...are you sure? (yes/no)";
    my $pkchk = <STDIN>;
    chomp $pkchk;
    die("Smart move, please check your parameters, thank you! :)") if ( !( $pkchk =~ /yes/ ) );
  }

  # start the game
  print "\nSimluating the game, please wait...\n\n";
  Game->new( { packs => $packs, condition => $cond{$condition} } )->start_game();
  print "\nSimluation finished!\n";

  return;
}
