#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';

use Act::Dispatcher;
use Plack::Builder;
use Plack::App::Directory;

builder {
    enable 'Session::Cookie';
    enable "SimpleLogger", level => "warn";
    #Act::Dispatcher->to_app;
    mount "/" => Act::Dispatcher->to_app();
    mount "/blarg/css" => Plack::App::Directory->new({root => '/Users/zjt/Act/wwwdocs/css'});
    mount "/blarg/js" => Plack::App::Directory->new({root => '/Users/zjt/Act/wwwdocs/js'});
    mount "/blarg/img" => Plack::App::Directory->new({root => '/Users/zjt/Act/wwwdocs/img'});
};
