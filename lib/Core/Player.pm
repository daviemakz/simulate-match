package Player;
use strict;
use warnings;
use base qw(Class::Accessor);
Player->mk_accessors(qw( cards_owned name ));

sub new {
  my ( $class_name, $player_name ) = @_;
  my $self = { cards_owned => 0, name => $player_name };
  bless( $self, $class_name );

  # function: add cards to players 'stack'
  sub add_cards {
    my ( $self, $new_cards ) = @_;
    $self->{'cards_owned'} += $new_cards;
    return 1;
  }

  # function: get player name
  sub get_name {
    my $self = shift;
    return $self->{'name'}->{'name'};
  }

  return $self;
}

return 1;
