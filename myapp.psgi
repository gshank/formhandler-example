#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';
use MyApp;
use Plack::Builder;

builder {
    enable 'Plack::Middleware::BufferedStreaming';
    MyApp->psgi_app(@_);
};
