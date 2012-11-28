#!/usr/bin/env perl

use inc::Module::Install 1.02;
use Module::Install::Catalyst;

name 'MyApp';
all_from 'lib/MyApp.pm';

requires 'Catalyst::Runtime' => '5.90007';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Plugin::Session';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General';
requires 'DBIx::Class';
requires 'HTML::FormHandler';
requires 'HTML::FormHandler::Model::DBIC';
requires 'Catalyst::View::TT';
requires 'Catalyst::Model::DBIC::Schema';
requires 'DBD::SQLite';
requires 'HTML::FormHandlerX::Form::JQueryValidator';

test_requires 'Test::More' => '0.88';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
