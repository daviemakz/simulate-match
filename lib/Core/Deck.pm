package Deck;
use strict;
use warnings;
use Core::Deck::Card;
use List::Util qw(shuffle);

sub new {
  my ($class_name) = @_;
  my $self = {};
  bless( $self, $class_name );

  # base attributes
  $self->{'_cards'}      = _fill_deck();
  $self->{'_created'}    = 1;
  $self->{'_shuffled'}   = 0;
  $self->{'_deck_empty'} = 1;

  # function: shuffle the deck
  sub shuffle_deck {
    my $self = shift;
    $self->{'_shuffled'}   = 0;
    @{ $self->{'_cards'} } = shuffle( @{ $self->{'_cards'} } );
    return 1;
  }

  # function: get top (first card) card and remove it
  sub get_top_card {
    my $self     = shift;
    my $top_card = shift @{ $self->{'_cards'} };
    $self->check_empty();    # check if the deck is empty after removing card
    return $top_card;
  }

  # function: change deck empty status
  sub check_empty {
    my $self = shift;
    $self->{'_deck_empty'} = 0 if @{ $self->{'_cards'} };
    $self->{'_deck_empty'} = 1 if !@{ $self->{'_cards'} };
    return $self->{'_deck_empty'};
  }

  return $self;

}

sub _fill_deck {
  my @values = ( 2 .. 10, 'jack', 'queen', 'king', 'ace' );
  my @suites = ( 'hearts', 'spades', 'clubs', 'diamonds' );
  my @all_cards;
  foreach my $suite (@suites) {
    foreach my $value (@values) {
      push( @all_cards, Card->new( { face_value => $value, suite => $suite } ) );
    }
  }
  return \@all_cards;
}

return 1;
