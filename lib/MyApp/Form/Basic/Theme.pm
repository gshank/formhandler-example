package MyApp::Form::Basic::Theme;
use Moose::Role;

sub render_before_form {
    qq{<div class="row"><div class="span3"><p>With v2.0, we have lighter and smarter defaults for form styles. No extra markup, just form controls.</p></div>\n}
}
sub render_after_form { '</div>' }
sub build_wrapper_attr { { class => 'span9' } }
sub build_html_attr { { class => 'well' } }
sub build_widget_tags {
    { form_wrapper => 1, form_wrapper_tag => 'div', wrapper_tag => 0 }
}
sub build_field_rendering {{
   foo => { html_attr => { class => 'span3', placeholder => 'Try something...' } },
   bar => { label => 'Check me out', label_attr => { class => 'checkbox' } },
   submit_btn => { widget => 'ButtonTag', html_attr => { class => 'btn' } },
}}

1;
