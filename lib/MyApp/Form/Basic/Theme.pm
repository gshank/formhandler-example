package MyApp::Form::Basic::Theme;
use Moose::Role;

sub render_before_form {
    qq{<div class="row"><div class="span3"><p>Form completely rendered with FormHandler.</p></div>\n}
}
sub render_after_form { '</div>' }
sub build_wrapper_attr { { class => 'span9' } }
sub build_html_attr { { class => 'well' } }
sub build_widget_tags {
    { form_wrapper => 1, form_wrapper_tag => 'div', wrapper_tag => 0 }
}
sub build_update_fields {{
   foo => { label => 'Label name', element_class => 'span3', element_attr => { placeholder => "Type something…" },
       widget_tags => { after_element => '<span class="help-inline">Associated help text!</span>' },
   },
   bar => { label => 'Check me out', label_class => ['checkbox'] },
   submit_btn => { widget => 'ButtonTag', element_class => 'btn' },
}}

1;
