package MyApp::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';
use Template::Stash;

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
    WRAPPER => 'site/wrapper.tt',
);

Template::Stash->define_vmethod('scalar', 'as_label' => \&as_label);

sub as_label {
    my $column = shift;
    $column =~ s/_/ /g;
    return ucfirst($column);
}

=head1 NAME

MyApp::View::TT - TT View for MyApp

=head1 DESCRIPTION

TT View for MyApp.

=head1 SEE ALSO

L<MyApp>

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
