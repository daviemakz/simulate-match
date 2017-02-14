package Game;
use strict;
use warnings;
use Core::Deck;
use Core::Player;
use Data::Dumper;
use base qw(Class::Accessor);
Game->mk_accessors(qw( packs condition ));

# player names
my @player_names = ('rick','morty');

sub new {
  my ($class_name, $details ) = @_;
  my $self = $details;
  bless( $self, $class_name );

  # add base attributes
  $self->{'players'} = _get_players();
  $self->{'decks'} = _get_decks($self->{'packs'});
  $self->{'run'} = {
    count => 0,
    previous_card => {
      value => '',
      suit => ''
    }
  };

  # function: start the game
  sub start_game {
    my $self = shift;
    foreach my $current_deck (@{$self->{'decks'}}) {
      $current_deck->shuffle_deck(); # shuffle beforehand
      while (!($current_deck->check_empty())) {
        my $current_card = $current_deck->get_top_card();
        my $compare_current_card = {};
        my $compare_previous_card = {};

        exit;
      }
    }
    return;
  }

  return $self;
}

sub _get_players {
  my @players;
  foreach my $player (@player_names) {
    push (@players, Player->new({name => $player}));
  }
  return \@players;
}

sub _get_decks {
  my $decks_counts = shift;
  my @decks;
  for my $deck_count (0 .. $decks_counts) {
    push(@decks,Deck->new());
  }
  return \@decks;
}

sub _can_match {
  my ($condition, $current, $previous) = @_;
  my $value_match = $current->{'value'} eq $previous->{'value'} ? 1 : 0;
  my $suite_match = $current->{'suite'} eq $previous->{'suite'} ? 1 : 0;
  return 1 if ($value_match && ($condition eq 'value'));
  return 1 if ($suite_match && ($condition eq 'suite'));
  return 1 if ($value_match && $suite_match) && (($condition eq 'both'));
  return 0;
}

return 1;
