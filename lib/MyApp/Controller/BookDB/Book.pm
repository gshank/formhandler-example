package MyApp::Controller::BookDB::Book;

use Moose;
BEGIN {
   extends 'Catalyst::Controller';
}

use MyApp::Form::Book;

has 'edit_form' => ( isa => 'MyApp::Form::Book', is => 'rw',
   lazy => 1, default => sub { MyApp::Form::Book->new } );

=head1 NAME

MyApp::Controller::Book

=head1 SYNOPSIS

See L<MyApp>

=head1 DESCRIPTION

Book Controller

=cut

sub book_base : Chained PathPart('bookdb/book') CaptureArgs(0)
{
   my ( $self, $c ) = @_;
    $c->stash( bootstrap => 1 );
}

sub default : Chained('book_base') PathPart('') Args
{
   my ( $self, $c ) = @_;
   return $self->do_list($c);
}

sub list : Chained('book_base') PathPart('list') Args(0)
{
   my ( $self, $c ) = @_;
   return $self->do_list($c);
}

sub do_list
{
   my ( $self, $c ) = @_;

   my $books = [ $c->model('DB::Book')->all ];
   my @columns = ( 'title', 'author_list', 'publisher', 'year' );
   $c->stash( books => $books, columns => \@columns,
              template => 'bookdb/book/list.tt' );
}

sub create : Chained('book_base') PathPart('create') Args(0)
{
   my ( $self, $c ) = @_;
   # Create the empty book row for the form
   my $book = $c->model('DB::Book')->new_result({});
$DB::single=1;
   $c->stash( book => $book );
   return $self->form($c);
}

sub item : Chained('book_base') PathPart('') CaptureArgs(1)
{
   my ( $self, $c, $book_id ) = @_;
   $c->stash( book => $c->model('DB::Book')->find($book_id) );
}

sub edit : Chained('item') PathPart('edit') Args(0)
{
   my ( $self, $c ) = @_;
   return $self->form($c);
}

sub form
{
   my ( $self, $c ) = @_;

   my $result = $self->edit_form->run( item => $c->stash->{book},
      params => $c->req->parameters,
      action => $c->uri_for($c->action, $c->req->captures ),
   );
   $c->stash( template => 'bookdb/book/form.tt', form => $result );
   return unless $result->validated;
   $c->res->redirect( $c->uri_for('list') );
}

sub delete : Chained('item') PathPart('delete') Args(0)
{
   my ( $self, $c ) = @_;

   $c->stash->{book}->delete;
   $c->res->redirect( $c->uri_for('list') );
}

sub view : Chained('item') PathPart('') Args(0)
{
   my ( $self, $c, $id ) = @_;

}

sub do_return : Chained('item') PathPart('return') Args(0)
{
   my ( $self, $c ) = @_;

   my $book = $c->stash->{book};
   $book->borrowed(undef);
   $book->borrower(undef);
   $book->update;

   $c->res->redirect( '/book/' . $book->id );
   $c->detach;
}

=back

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software . You can redistribute it and/or modify
it under the same terms as perl itself.

=cut

1;
