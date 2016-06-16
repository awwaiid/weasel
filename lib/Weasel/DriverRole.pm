
=head1 NAME

Weasel::DriverRole - API definition for driver wrappers

=head1 VERSION

0.01

=head1 SYNOPSIS

  use Moose;
  use Weasel::DriverRole;

  with 'Weasel::DriverRole';

  ...  # (re)implement the functions in Weasel::DriverRole

=head1 DESCRIPTION


=cut

package Weasel::DriverRole;

use strict;
use warnings;

use Carp;
use Moose::Role;

=head1 ATTRIBUTES

=over

=item started

=cut

has 'started' => (is => 'rw',
                  isa => 'Bool',
                  default => 0);

=back

=head1 METHODS

=over

=item implements

=cut

sub implements {
    # returning a too-old number with intent: we want warnings if this
    #  method hasn't been implemented by the driver
    return '0.00';
}

=item start

=cut

sub start { my $self = shift; $self->started(1); }

=item stop

=cut

sub stop { my $self = shift; $self->started(0); }

=item restart

=cut

sub restart { my $self = shift; $self->stop; $self->start; }

=item find_all( $parent_id, $locator, $scheme )

Returns the _id values for the elements to be instanciated, matching
the C<$locator> using C<scheme>.

Depending on context, the return value is a list or an arrayref.

=cut

sub find_all {
    croak "Abstract inteface method 'find_all' called";
}

=item get( $url )

=cut

sub get {
    croak "Abstract interface method 'get' called";
}

=item wait_for( $callback )

=cut

sub wait_for {
    croak "Abstract interface method 'wait_for' called";
}


=item click( [ $element_id ] )

Clicks on an element if an element id is provided, or on the current
mouse location otherwise.

=cut

sub click {
    croak "Abstract interface method 'click' called";
}

=item dblclick()

Double clicks on the current mouse location.

=cut

sub dblclick {
     croak "Abstract interface method 'dblclick' called";
}

=item get_attribute($element_id, $attribute_name)

=cut

sub get_attribute {
    croak "Abstract interface method 'get_attribute' called";
}

=item set_attribute($element_id, $attribute_name, $value)

=cut

sub set_attribute {
    croak "Abstract interface method 'set_attribute' called";
}

=item get_selected($element_id)

=cut

sub get_selected {
    croak "Abstract interface method 'get_selected' called";
}

=item set_selected($element_id, $value)

=cut

sub set_selected {
    croak "Abstract interface method 'set_selected' called";
}

=item screenshot($fh)

=cut

sub screenshot {
    croak "Abstract interface method 'screenshot' called";
}

=item tag_name($element_id)

=cut

sub tag_name {
    croak "Abstract interface method 'tag_name' called";
}

=back

=head1 SEE ALSO

L<Weasel>

=head1 COPYRIGHT

 (C) 2016  Erik Huelsmann

Licensed under the same terms as Perl.

=cut



1;