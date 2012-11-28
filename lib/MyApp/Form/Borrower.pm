package MyApp::Form::Borrower;

use HTML::FormHandler::Moose;
extends 'MyApp::Form::Base';
with 'HTML::FormHandler::Widget::Theme::Bootstrap';


=head1 NAME

Form object for Borrower

=head1 DESCRIPTION

Catalyst Controller.

=cut


has '+item_class' => ( default => 'Borrower' );

__PACKAGE__->meta->make_immutable;

has_field 'name' => ( type => 'Text', required => 1,
    label    => "Name", unique   => 1,
    unique_message => 'That name is already in our user directory',
);
has_field 'phone' => ( type => 'Text', label => "Telephone",);
has_field 'url' => ( type => 'Text', label => 'URL',);
has_field 'email'      => ( type => 'Email', required => 1,
                label => "Email",);
has_field 'active' => ( type => 'Boolean', label => "Active?", option_label => ' ' );
has_field 'submit' => ( type => 'Submit', value => 'Save', element_class => ['btn'] );

=head1 AUTHOR

Gerda Shank

=head1 LICENSE AND COPYRIGHT

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut

__PACKAGE__->meta->make_immutable;
no HTML::FormHandler::Moose;
1;
