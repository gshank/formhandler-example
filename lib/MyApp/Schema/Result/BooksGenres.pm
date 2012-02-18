package MyApp::Schema::Result::BooksGenres;

use strict;
use warnings;

use base 'DBIx::Class';

MyApp::Schema::Result::BooksGenres->load_components("Core");
MyApp::Schema::Result::BooksGenres->table("books_genres");
MyApp::Schema::Result::BooksGenres->add_columns(
  "book_id",
  {
    data_type => "INTEGER",
    is_foreign_key => 1,
    is_nullable => 0,
    size => undef,
  },
  "genre_id",
  {
    data_type => "INTEGER",
    is_foreign_key => 1,
    is_nullable => 0,
    size => undef,
  },
);
MyApp::Schema::Result::BooksGenres->set_primary_key(('book_id', 'genre_id'));

MyApp::Schema::Result::BooksGenres->belongs_to(
  "book",
  "MyApp::Schema::Result::Book",
  { id => "book_id" },
);
MyApp::Schema::Result::BooksGenres->belongs_to(
  "genre",
  "MyApp::Schema::Result::Genre",
  { id => "genre_id" },
);


1;
