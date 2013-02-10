use strict;
use warnings;
use Test::More;

use_ok( 'MyApp::Form::User' );

use MyApp::Schema;

my $schema = MyApp::Schema->connect('dbi:SQLite:db/book.db');

my $user = $schema->resultset('User')->find(1);

my $form = MyApp::Form::User->new;
$form->process( item => $user, params => {} );

my $rendered = $form->render_repeatable_js;
ok( $rendered, 'rendered repeatable js' );

$rendered = $form->render;
diag( $rendered );

done_testing;
