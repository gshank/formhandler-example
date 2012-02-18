package MyApp::Form::Basic::Theme;
use Moose::Role;

# set class for form tag (form_element_attr) and form wrapper (form_wrapper_attr)
sub build_form_wrapper_class { ['span9'] }
sub build_form_element_class { ['well'] }
sub build_render_form_wrapper {1}
sub build_form_tags {
    # wrap the form with outside div (form_wrapper = 1, form_wrapper_tag = div)
    # wrap the fields (to get label) but with no wrapping div ( wrapper_tag => 0 )
    {   form_wrapper_tag => 'div',
        before => qq{<div class="row"><div class="span3"><p>Form completely rendered with FormHandler.</p></div>\n},
        after => '</div>',
    }
}

sub build_update_subfields {{
   # wrap the fields with a label but no tag
   all => { do_wrapper => 0, do_label => 1 },
   foo => { element_class => ['span3'], element_attr => { placeholder => 'Type something…' },
       tags => { after_element => '<span class="help-inline">Associated help text!</span>' } },
   bar => { label => 'Check me out', label_class => ['checkbox'], tags => { checkbox_single_label => 1 }},
   submit_btn => { element_class => ['btn'] },
}}

1;
