package MyApp::Schema::Result::Genre;

use strict;
use warnings;

use base 'DBIx::Class';

MyApp::Schema::Result::Genre->load_components("Core");
MyApp::Schema::Result::Genre->table("genre");
MyApp::Schema::Result::Genre->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "is_active",
  { data_type => 'INTEGER', is_nullable => 1 },
);
MyApp::Schema::Result::Genre->set_primary_key("id");
MyApp::Schema::Result::Genre->has_many(
  "books_genres",
  "MyApp::Schema::Result::BooksGenres",
  { "foreign.genre_id" => "self.id" },
);
MyApp::Schema::Result::Genre->many_to_many(
  books => 'books_genres', 'book'
);


1;
