package MyApp::Form::Controls::Theme;
use Moose::Role;

with 'HTML::FormHandler::Widget::Theme::Bootstrap';

# widget wrapper must be set before the fields are built in BUILD
sub build_do_form_wrapper {1}
sub build_form_wrapper_class {['span8']}
sub build_form_tags {{
    wrapper_tag => 'div',
    after_start => '<fieldset><legend>Controls Bootstrap supports</legend>',
    before_end => '</fieldset>',
}}

sub build_update_subfields {{
    input01 => { tags => { after_element => '<p class="help-block">In addition to freeform text, any HTML5 text-based input appears like so.</p>' },
                 element_class => 'input-xlarge',
               },
    optionsCheckbox => { option_label => 'Option one is this and that—be sure to include why it’s great' },
    fileInput => { element_class => 'input-file' },
    textarea => { element_class => 'input-xlarge' },
}}

1;
