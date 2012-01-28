package MyApp::Controller::Captcha;

use HTML::FormHandler;

use Moose;
use namespace::autoclean;
use HTTP::Date;
use MyApp::Form::Captcha;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

MyCatalystApp::Controller::Captcha - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $form = MyApp::Form::Captcha->new(
    	ctx => $c,
    );

    if($form->process($c->req->params)){
    	$c->res->body("verification succeeded");
	return;
    }
    $c->stash( form => $form );
}

=head2 image

returns the image belonging to the current captcha

=cut

sub image : Local {
    my ( $self, $c ) = @_;

    my $captcha = $c->session->{captcha};
    $c->response->body($captcha->{image});
    $c->response->content_type('image/'. $captcha->{type});
    $c->res->headers->expires( time() );
    $c->res->headers->header( 'Last-Modified' => HTTP::Date::time2str );
    $c->res->headers->header( 'Pragma'        => 'no-cache' );
    $c->res->headers->header( 'Cache-Control' => 'no-cache' );
}

sub get_rnd :Local{
	my ( $self, $c ) = @_;
	my $captcha = $c->session->{captcha};
	die "no captcha in session" unless $captcha;
	$c->res->body($captcha->{rnd});
}

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
