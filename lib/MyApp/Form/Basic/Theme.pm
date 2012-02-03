package MyApp::Form::Basic::Theme;
use Moose::Role;

# set class for form tag (form_element_attr) and form wrapper (form_wrapper_attr)
sub build_form_wrapper_attr { { class => 'span9' } }
sub build_form_element_attr { { class => 'well' } }
sub build_widget_tags {
    # wrap the form with outside div (form_wrapper = 1, form_wrapper_tag = div)
    # wrap the fields (to get label) but with no wrapping div ( wrapper_tag => 0 )
    { form_wrapper => 1, form_wrapper_tag => 'div', wrapper_tag => 0,
        before_form => qq{<div class="row"><div class="span3"><p>Form completely rendered with FormHandler.</p></div>\n},
        after_form => '</div>',
    }
}

# individual field settings, including classes for form elements (form_element_attr),
# field wrappers (wrapper_attr), field labels (label_attr)
# widget_wrapper, labels strings,
# extra bits of rendering (after_element)
sub build_update_fields {{
   foo => { element_class => ['span3'], element_attr => { placeholder => 'Type something…' },
       widget_tags => { after_element => '<span class="help-inline">Associated help text!</span>' } },
   bar => { label => 'Check me out', label_class => ['checkbox'] },
   submit_btn => { element_class => ['btn'] },
}}

1;
