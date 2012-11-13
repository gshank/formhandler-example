package MyApp::Form::Captcha;

use HTML::FormHandler::Moose;
extends qw/HTML::FormHandler/;
#with 'HTML::FormHandler::TraitFor::Captcha';
#with qw/
#    HTML::FormHandler::Render::Simple
#    HTML::FormHandler::TraitFor::Captcha
#/;

has_field submit => ( type => "Submit" );

__PACKAGE__->meta->make_immutable;
1;
