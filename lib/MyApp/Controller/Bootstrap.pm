package MyApp::Controller::Bootstrap;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use MyApp::Form::Basic;
use MyApp::Form::Controls;

=head1 NAME

MyApp::Controller::Bootstrap - Catalyst Controller

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

#   $c->response->body('Matched MyApp::Controller::Bootstrap in Bootstrap.');
}


sub basic :Path('basic') :Args(0) {
    my ( $self, $c ) = @_;

    my $form1 = MyApp::Form::Basic->new( html_prefix => 1, name => 'form1' );
    $form1->process($c->req->body_parameters);
    my $form2 = MyApp::Form::Basic->new( html_prefix => 1, name => 'form2', widget_wrapper => 'None' );
    $form2->process($c->req->body_parameters);
    my $form3 = MyApp::Form::Basic->new( html_prefix => 1, name => 'form3' );
    $form3->process($c->req->body_parameters);
    $c->stash( form1 => $form1, form2 => $form2, form3 => $form3 );
}


sub controls :Path('controls') :Args(0) {
    my ( $self, $c ) = @_;

    my $form1 = MyApp::Form::Controls->new( html_prefix => 1, name => 'form1' );
    $form1->process($c->req->body_parameters);
    my $form2 = MyApp::Form::Controls->new( html_prefix => 1, name => 'form2', widget_wrapper => 'None' );
    $form2->process($c->req->body_parameters);
    my $form3 = MyApp::Form::Controls->new( html_prefix => 1, name => 'form3' );
    $form3->process($c->req->body_parameters);
    $c->stash( form1 => $form1, form2 => $form2, form3 => $form3 );
}


=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
