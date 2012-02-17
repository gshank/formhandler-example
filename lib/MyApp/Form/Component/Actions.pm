package MyApp::Form::Component::Actions;
use HTML::FormHandler::Moose::Role;

has_field 'form_actions' => ( type => 'Compound', order => 99, widget_wrapper => 'Bootstrap',
    render_wrapper => 1, render_label => 0 );
has_field 'form_actions.save' => ( type => 'Submit', widget => 'ButtonTag',
    element_attr => { class => ['btn', 'btn-primary'] },
    widget_wrapper => 'None', value => "Save changes" );
has_field 'form_actions.cancel' => ( type => 'Reset', widget => 'ButtonTag',
    element_attr => { class => ['btn'] },
    widget_wrapper => 'None', value => "Cancel" );

1;
