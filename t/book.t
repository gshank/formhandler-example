use strict;
use warnings;
use Test::More;

use_ok('MyApp::Schema');

my $schema = MyApp::Schema->connect('dbi:SQLite:db/book.db');
is( ref( $schema ), 'MyApp::Schema', 'correct schema' );
my $book_rs = $schema->resultset('Book');
is( ref( $book_rs ), 'DBIx::Class::ResultSet', 'correct resultset' );
my $book = $book_rs->find(1);
is( ref( $book ), 'MyApp::Schema::Result::Book', 'correct book' );


done_testing;
