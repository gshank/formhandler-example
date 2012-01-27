package MyApp::Controller::Bootstrap::Basic;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use MyApp::Form::Basic;

=head1 NAME

MyApp::Controller::Bootstrap::Basic - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub auto : Private {
    my ( $self, $c ) = @_;
    $c->stash( bootstrap => 1 );
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

}

sub native : Path('native') : Args(0) {
    my ( $self, $c ) = @_;
}

sub auto_render : Path('auto_render') : Args(0) {
    my ( $self, $c ) = @_;

    my $form = MyApp::Form::Basic->new;
    $form->process($c->req->body_parameters);
    $c->stash( form => $form );

}

sub tt_render : Path('tt_render') : Args(0) {
    my ( $self, $c ) = @_;

    my $form = MyApp::Form::Basic->new;
    $form->process($c->req->body_parameters);
    $c->stash( form => $form );

}


=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
