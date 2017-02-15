package Card;
use strict;
use warnings;
use base qw(Class::Accessor);
Card->mk_accessors(qw( face_value suite ));

sub new {
  my ( $class_name, $details ) = @_;
  my $self = $details;
  bless( $self, $class_name );
  return $self;
}

return 1;
