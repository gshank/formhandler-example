package MyApp::Schema::Result::Book;

use Moose;
use MIME::Base64;
use Business::ISBN 'valid_isbn_checksum';

use base 'DBIx::Class';

# following attribute is non useful, since it does
# nothing that persists, but shows how you could
# do something more complicated
has 'comment' => ( isa => 'Str|Undef', is => 'rw',
  trigger => \&set_extra );

sub set_extra
{
   my ($self, $value) = @_;
   $self->extra($value);
}


MyApp::Schema::Result::Book->load_components("Core");
MyApp::Schema::Result::Book->table("book");
MyApp::Schema::Result::Book->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "isbn",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 100,
    extra => { field_def => { type => 'TextArea', size => '64', temp => 'testing' } },
  },
  "publisher",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "pages",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "year",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "format",
  {
    data_type => "INTEGER",
    is_foreign_key => 1,
    is_nullable => 0,
    size => undef,
  },
  "borrower",
  {
    data_type => "INTEGER",
    is_foreign_key => 1,
    is_nullable => 0,
    size => undef,
  },
  "borrowed",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "owner",
  {
    data_type => "INTEGER",
    is_foreign_key => 1,
    is_nullable => 0,
    size => undef,
  },
  "extra",
  { data_type => "varchar", is_nullable => 0, size => 100 },
);
MyApp::Schema::Result::Book->set_primary_key("id");
MyApp::Schema::Result::Book->belongs_to(
  "format",
  "MyApp::Schema::Result::Format",
  { id => "format" },
);
MyApp::Schema::Result::Book->belongs_to(
  "borrower",
  "MyApp::Schema::Result::Borrower",
  { id => "borrower" },
);
MyApp::Schema::Result::Book->belongs_to(
  "owner",
  "MyApp::Schema::Result::User",
  { user_id => "owner" },
);
MyApp::Schema::Result::Book->has_many(
  "books_genres",
  "MyApp::Schema::Result::BooksGenres",
  { "foreign.book_id" => "self.id" },
);
MyApp::Schema::Result::Book->many_to_many(
  genres => 'books_genres', 'genre'
);
__PACKAGE__->has_many(
  "book_authors",
  "MyApp::Schema::Result::AuthorBooks",
  { "foreign.book_id" => "self.id" },
);
__PACKAGE__->many_to_many(
  authors => 'book_authors', 'author'
);
__PACKAGE__->add_unique_constraint( 'isbn' => ['isbn'] );

sub author_list {
    my $self = shift;
    my @authors = $self->authors->all;
    my @author_names; 
    foreach my $author (@authors) {
        push @author_names, $author->name;
    }
    return join(', ', @author_names);
}

sub barcode {
    my $self = shift;

    if ($self->isbn) {
        my $isbn = Business::ISBN->new($self->isbn) or return;
        return encode_base64($isbn->png_barcode);
    }
    return;
}

1;
