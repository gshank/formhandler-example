package MyApp::Form::Controls;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';
with 'MyApp::Form::Controls::Theme';
with 'MyApp::Form::Component::Actions';

has '+name' => ( default => 'control_form' );
has_field 'input01' => ( type => 'Text', label => 'Text input' );
has_field 'optionsCheckbox' => ( type => 'Checkbox', checkbox_value => "option1", label => 'Checkbox' );
has_field 'select01' => ( type => 'Select', label => 'Select list' );
has_field 'multiSelect' => ( type => 'Multiple', label => 'Multi-select' );
has_field 'fileInput' => ( type => 'File', label => 'File input' );
has_field 'textarea' => ( type => 'TextArea', cols => 20, rows => 4 );
sub options_select01 {
    return ( 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5 );
}
sub options_multiSelect {
    return ( 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5 );
}

1;
