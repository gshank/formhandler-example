use strict;
use warning;
use Test::More;

use_ok('MyApp::Form::Basic');

my $form = MyApp::Form::Basic->new;
ok( $form, 'form built' );

done_testing;
