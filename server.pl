use Mojolicious::Lite -signatures;
use lib 'E:\STAGE ANTIC\code\Pearl-EPP-Client\lib';
use API;

get '/whois/:domain' => sub ($c){
    my $foo = $c->param('domain');
    my $result = API::whois($foo);
    $c->render(json => $result);
};

# get objects

get '/host/:id' => sub ($c){
    my $id = $c->param('id');
    my $result = API::getHost($id);
    $c->render(json => $result);
};

get '/contact/:id' => sub ($c){
    my $id = $c->param('id');
    my $result = API::getContact($id);
    $c->render(json => $result);
};

get '/domain/:id' => sub ($c){
    my $id = $c->param('id');
    my $result = API::getDomain($id);
    $c->render(json => $result);
};

app->start;