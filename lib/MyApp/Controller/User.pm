package MyApp::Controller::User;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use MyApp::Form::User;

=head1 NAME

MyApp::Controller::User - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub auto : Private {
    my ( $self, $c ) = @_;
    $c->stash( bootstrap => 1 );
}


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

}

sub edit : Path('edit') : Args(1) {
    my ( $self, $c, $user_id ) = @_;

    my $user = $c->model('DB::User')->find($user_id);
    my $form = MyApp::Form::User->new;
    $form->process( item => $user, params => $c->req->body_parameters );
    $c->stash( form => $form );

}


sub view  :Path('view') :Args(1) {
    my ( $self, $c ) = @_;

}


=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
