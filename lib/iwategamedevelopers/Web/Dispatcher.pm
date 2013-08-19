package iwategamedevelopers::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;

any '/' => sub {
    my ($c) = @_;
    return $c->render('index.tt');
};

any '/games' => sub {
    my ($c) = @_;
    return $c->render('games/index.tt');
};

any '/igf' => sub {
    my ($c) = @_;
    return $c->render('igf/index.tt');
};

any '/link' => sub {
    my ($c) = @_;
    return $c->render('link/index.tt');
};

1;
