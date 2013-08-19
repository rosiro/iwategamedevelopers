use strict;
use utf8;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), 'extlib', 'lib', 'perl5');
use lib File::Spec->catdir(dirname(__FILE__), 'lib');
use Plack::Builder;

use iwategamedevelopers::Web;
use iwategamedevelopers;

{
    my $c = iwategamedevelopers->new();
}

builder {
    enable 'Plack::Middleware::Static',
        path => qr{^(?:/static/)},
            root => File::Spec->catdir(dirname(__FILE__),'template');
    enable 'Plack::Middleware::Static',
        path => qr{^(?:/robots\.txt|/favicon\.ico)$},
            root => File::Spec->catdir(dirname(__FILE__), 'template');
    enable 'Plack::Middleware::ReverseProxy';
    iwategamedevelopers::Web->to_app();
};
