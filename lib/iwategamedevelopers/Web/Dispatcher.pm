package iwategamedevelopers::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;
use Encode;

any '/' => sub {
    my ($c) = @_;
    return $c->render('index.tt');
};

any '/games' => sub {
    my ($c) = @_;
    return $c->render('games/index.tt');
};

any '/wiki' => sub {
    my ($c) = @_;
    return $c->render('wiki/index.tt');
};

any '/link' => sub {
    my ($c) = @_;
    return $c->render('link/index.tt');
};

any qr{/p/(.*?)$} => sub {
    my ($c,$args) = @_;
    my $page_name = $args->{splat}->[0];
    warn ($page_name);
    return $c->render('p/'.$page_name.'.tt');
};

1;
