package MyApp::Form::Base;
use utf8;
use HTML::FormHandler::Moose;

extends 'HTML::FormHandler::Model::DBIC';

with 'HTML::FormHandlerX::Form::JQueryValidator';

sub build_form_element_class { ['hfh', 'admin'] }

has_field validation_json => ( type => 'Hidden',  element_attr => { disabled => 'disabled' } );

sub default_validation_json { shift->as_escaped_json }

sub html_attributes {
    my ( $self, $field, $type, $attr ) = @_;
    $field->{label} .= ' *' if $type eq 'label' && $field->{required};
    return $attr;
}


1;
