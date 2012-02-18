package MyApp::Schema::Result::User;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("user");
__PACKAGE__->add_columns(
  "user_id",
  { data_type => "INTEGER", is_nullable => 0, size => 8 },
  "user_name",
  { data_type => "VARCHAR", is_nullable => 0, size => 32 },
  "fav_cat",
  { data_type => "VARCHAR", is_nullable => 0, size => 32 },
  "fav_book",
  { data_type => "VARCHAR", is_nullable => 0, size => 32 },
  "occupation",
  { data_type => "VARCHAR", is_nullable => 0, size => 32 },
  "country_iso",
  { data_type => "character", default_value => undef, is_nullable => 1, size => 2, },
  "birthdate",
  { data_type => "DATETIME", is_nullable => 0 },
  "opt_in",
  { data_type => "INTEGER", size => 1 },
  "license_id",
  { data_type => "INTEGER", is_nullable => 0, size => 8 },
);
__PACKAGE__->set_primary_key("user_id");

#__PACKAGE__->has_many(
#  "books",
#  "MyApp::Schema::Result::Book",
#  { "foreign.author_id" => "self.id" },
#);

__PACKAGE__->has_many(
   "user_employers",
   "MyApp::Schema::Result::UserEmployer",
   { 'foreign.user_id' => 'self.user_id' }
);

__PACKAGE__->many_to_many(
   "employers" => "user_employers",
   "employer",
);


__PACKAGE__->has_many(
   "addresses",
   "MyApp::Schema::Result::Address",
   { 'foreign.user_id' => 'self.user_id' }
);

__PACKAGE__->belongs_to(
    'country',
    'MyApp::Schema::Result::Country',
    { iso => 'country_iso' },
);
__PACKAGE__->belongs_to('license' => 'MyApp::Schema::Result::License',
   { 'foreign.license_id' => 'self.license_id' } );
__PACKAGE__->has_one('options' => 'MyApp::Schema::Result::Options',
   { 'foreign.user_id' => 'self.user_id' } );

1;
