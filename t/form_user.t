use strict;
use warnings;
use Test::More;
use Data::Dumper;

use_ok( 'MyApp::Form::User' );

use MyApp::Schema;

my $schema = MyApp::Schema->connect('dbi:SQLite:db/book.db');

my $user = $schema->resultset('User')->find(1);

my $form = MyApp::Form::User->new;
$form->process( item => $user, params => {} );

my $rendered = $form->render_repeatable_js;
ok( $rendered, 'rendered repeatable js' );

$rendered = $form->render;
#diag( $rendered );

my $params = {
   'birthdate' => '1970-04-23',
   'country' => 'US',
   'occupation' => 'management',
   'opt_in' => 0,
   'user_name' => 'jdoe',
   'addresses.0.city' => 'Middle City',
   'addresses.0.country' => 'GK',
   'addresses.0.street' => '101 Main St',
   'addresses.0.address_id' => 1,
   'addresses.1.city' => 'DownTown',
   'addresses.1.country' => 'UT',
   'addresses.1.street' => '99 Elm St',
   'addresses.1.address_id' => 2,
   'addresses.2.address_id' => 3,
   'addresses.2.city' => 'Santa Lola',
   'addresses.2.country' => 'GF',
   'addresses.2.street' => '1023 Side Ave',
};
is_deeply( $form->fif, $params, 'correct params');

$params->{'addresses.3.address_id'} = '';
$params->{'addresses.3.city'} = 'Austin';
$params->{'addresses.3.country'} = 'US';
$params->{'addresses.3.street'} = 'Martin Luther King Drive';

$form->process( item => $user, params => $params );

is( $form->field('addresses.3.address_id')->value, 7, 'right address_id for new repeatable');

$schema->resultset('Address')->search( { address_id => { '>' =>  6 } } )->delete;

done_testing;
