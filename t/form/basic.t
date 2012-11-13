use strict;
use warnings;
use Test::More;
use HTML::FormHandler::Test;

use_ok('MyApp::Form::Basic');

my $form = MyApp::Form::Basic->new;
ok( $form, 'form built' );
$form->process();

my $rendered = $form->field('foo')->render;
my $expected =
'<label for="foo">Label name</label><input name="foo" id="foo" type="text" class="span3" placeholder="Type something…" value="" /><span class="help-inline">Associated help text!</span>';

is_html( $rendered, $expected, 'rendered ok' );

done_testing;
