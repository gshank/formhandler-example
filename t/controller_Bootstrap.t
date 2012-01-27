use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::Bootstrap;

ok( request('/bootstrap')->is_success, 'Request should succeed' );
done_testing();
