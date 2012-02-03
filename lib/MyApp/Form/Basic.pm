package MyApp::Form::Basic;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';
with 'MyApp::Form::Basic::Theme';

has '+name' => ( default => 'basic_form' );
has_field 'foo' => ( type => 'Text', label => 'Label name' );
has_field 'bar' => ( type => 'Checkbox' );
has_field 'submit_btn' => ( type => 'Submit', value => 'Submit', widget => 'ButtonTag' );

1;
