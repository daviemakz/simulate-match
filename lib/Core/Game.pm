package Game;
use strict;
use warnings;
use Core::Deck;
use Core::Player;
use base qw(Class::Accessor);
use feature qw(say);
Game->mk_accessors(qw( packs condition ));

my @player_names = ( 'rick', 'morty' );

sub new {
  my ( $class_name, $details ) = @_;
  my $self = $details;
  bless( $self, $class_name );

  # add base attributes
  $self->{'players'} = _get_players();
  $self->{'decks'}   = _get_decks( $self->{'packs'} );
  $self->{'run'} = { count         => 0,
                     previous_card => { value => '',
                                        suite => ''
                                      } };

  # function: start the game
  sub start_game {
    my $self = shift;
    my $current_card;

    # one deck at the time...
    foreach my $current_deck ( @{ $self->{'decks'} } ) {

      # shuffle array & get top card
      $current_deck->shuffle_deck();

      # reset run details
      $self->{'run'}->{'count'}                    = 0;
      $self->{'run'}->{'previous_card'}->{'value'} = '';
      $self->{'run'}->{'previous_card'}->{'suite'} = '';

      while ( !$current_deck->check_empty() ) {

        # current card
        my $current_card       = $current_deck->get_top_card();
        my $current_card_facev = $current_card->face_value();
        my $current_card_suite = $current_card->suite();

        # compare: current card
        my $cp_current_card = { value => $current_card_facev,
                                suite => $current_card_suite
                              };

        # compare: previous card
        my $cp_previous_card = { value => $self->{'run'}->{'previous_card'}->{'value'},
                                 suite => $self->{'run'}->{'previous_card'}->{'suite'} };

        # check match & decide what to do
        if ( _can_match( $self->{'condition'}, $cp_current_card, $cp_previous_card ) ) {

          # assign count to player
          foreach my $player ( @{ $self->{'players'} } ) {
            if ( $player->get_name() eq $player_names[ rand @player_names ] ) {
              $player->add_cards( $self->{'run'}->{'count'} );
            }
          }

          # reset run details
          $self->{'run'}->{'count'}                    = 0;
          $self->{'run'}->{'previous_card'}->{'value'} = '';
          $self->{'run'}->{'previous_card'}->{'suite'} = '';

        } else {

          # add card to count
          $self->{'run'}->{'count'}++;
          $self->{'run'}->{'previous_card'}->{'value'} = $current_card_facev;
          $self->{'run'}->{'previous_card'}->{'suite'} = $current_card_suite;

        }

      }

    }

    # check who won?
    _get_winner( $self->{'players'}, $self->{'test'} );

    return 1;
  }

  return $self;
}

sub _get_winner {
  my ( $self, $test ) = @_;
  return                                                                     if $test;
  say "Result of the game: Draw!"                                            if @{$self}[0]->cards_owned() eq @{$self}[1]->cards_owned();
  say "Result of the game: " . ucfirst( @{$self}[0]->get_name() ) . " wins!" if @{$self}[0]->cards_owned() > @{$self}[1]->cards_owned();
  say "Result of the game: " . ucfirst( @{$self}[1]->get_name() ) . " wins!" if @{$self}[0]->cards_owned() < @{$self}[1]->cards_owned();
  say "Total cards for " . ucfirst( @{$self}[0]->get_name() ) . ": " . @{$self}[0]->cards_owned();
  say "Total cards for " . ucfirst( @{$self}[1]->get_name() ) . ": " . @{$self}[1]->cards_owned();
  return;
}

sub _get_players {
  my @players;
  foreach my $player (@player_names) {
    push( @players, Player->new( { name => $player } ) );
  }
  return \@players;
}

sub _get_decks {
  my $decks_counts = shift;
  my @decks;
  for my $deck_count ( 1 .. $decks_counts ) {
    push( @decks, Deck->new() );
  }
  return \@decks;
}

sub _can_match {
  my ( $condition, $current, $previous ) = @_;
  my $value_match = $current->{'value'} eq $previous->{'value'} ? 1 : 0;
  my $suite_match = $current->{'suite'} eq $previous->{'suite'} ? 1 : 0;
  return 1 if ( $value_match && ( $condition eq 'value' ) );
  return 1 if ( $suite_match && ( $condition eq 'suite' ) );
  return 1 if ( $value_match || $suite_match ) && ( ( $condition eq 'both' ) );
  return 0;
}

return 1;
