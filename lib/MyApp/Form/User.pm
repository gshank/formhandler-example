package MyApp::Form::User;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Widget::Theme::BootstrapFormMessages';
with 'HTML::FormHandler::Render::RepeatableJs';

has '+widget_wrapper' => ( default => 'Bootstrap' );


has_field 'user_name' => (
    type => 'Text',
);

has_field 'occupation' => (
    type => 'Text',
);

has_field 'country' => (
    type => 'Select',
    empty_select => '-- Choose a Country --',
);

has_field 'birthdate' => (
    type => 'Date',
);

has_field 'opt_in' => (
    type => 'Checkbox',
);

# this uses the Simple wrapper in order to use a fieldset
has_field 'addresses' => (
    type => 'Repeatable',
    widget_wrapper => 'Simple',
    tags => { controls_div => 1 },
    do_wrapper => 1,
    do_label => 1,
    setup_for_js => 1,
    init_contains => {
        widget_wrapper => 'Simple',
        tags => { wrapper_tag => 'fieldset', controls_div => 1 },
        wrapper_class => ['well'],
    },
);

has_field 'addresses.remove' => (
    type => 'RmElement',
    element_class => ['btn-mini'],
    html => '<i class="icon-remove"></i>',
    tags => { after_wrapper => '<br />' },
);

has_field 'addresses.street' => (
    type => 'Text',
);

has_field 'addresses.city' => (
    type => 'Text',
);

has_field 'addresses.country' => (
    type => 'Select',
    empty_select => '-- Choose a Country --',
);

has_field 'add_address' => (
    type => 'AddElement',
    value => 'Add Address',
    repeatable => 'addresses',
);

has_field 'save' => (
    type => 'Submit',
    value => 'Save',
    element_class => ['btn', 'btn-primary']
);



1;
