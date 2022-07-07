use Mojolicious::Lite -signatures;
use lib 'E:\STAGE ANTIC\code\Pearl-EPP-Client\lib';
use JSON;
use strict;
use Try::Tiny;
use Data::Dumper;
use EPP::Client;

options '*' => sub {
    my $self = shift;
    $self->res->headers->header('Access-Control-Allow-Origin' => '*');
    #$self->res->headers->header('Access-Control-Allow-Credentials' => 'true');
    #$self->res->headers->header('Access-Control-Allow-Methods' => 'GET, OPTIONS, POST, DELETE, PUT');
    #$self->res->headers->header('Access-Control-Allow-Headers' => 'Content-Type');
    #$self->res->headers->header('Access-Control-Max-Age' => '1728000');
    $self->respond_to(any => { data => '', status => 200 });
};

# objects info

my $ext = '.cm';
get '/info/host/:domain/:host' => sub ($c){
    my $host = $c->param('host').".".$c->param('domain').$ext;
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $info = $epp->host_info($host);
        if(defined($info)){
            $c->render(json => {"status",200,"info",$info});
        }else{
            $c->render(json => {"status",404,"error","object not found"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

get '/info/contact/:id' => sub ($c){
    my $contact = $c->param('id');
    my $authInfo = 'glen';
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $info = $epp->contact_info($contact,$authInfo);
        if(defined($info)){
            $c->render(json => {"status",200,"info",$info});
        }else{
            $c->render(json => {"status",404,"error","object not found"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

get '/info/domain/:domain' => sub ($c){
    my $domain = $c->param('domain').$ext;
    my $authInfo = 'Test2022';
    my $follow = 1;
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $info = $epp->domain_info($domain); #,$authInfo,$follow);
        if(defined($info)){
            $c->render(json => {"status",200,"info",$info});
        }else{
            $c->render(json => {"status",404,"error","object not found"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

# check objects 

get '/check/host/:domain/:host' => sub ($c){
    my $host = $c->param('host').".".$c->param('domain').$ext;
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $result = $epp->check_host($host);
        $c->render(json => {"check",$host,"status",200,"avail",$result});
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

get '/check/contact/:id' => sub ($c){
    my $id = $c->param('id');
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $result = $epp->check_contact($id);
        $c->render(json => {"check",$id,"status",200,"avail",$result});
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

get '/check/domain/:domain' => sub ($c){
    my $domain = $c->param('domain').$ext;
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $result = $epp->check_domain($domain);
        $c->render(json => {"check",$domain,"status",200,"avail",$result});
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

# create objects
post '/host' => sub ($c) {
    my $host = decode_json($c->req->body);
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        $epp->create_host($host);
        my $info = $epp->host_info($host->{"name"});
        if(defined($info)){
            $c->render(json => {"status",201,"info",$info});
        }else{
            $c->render(json => {"status",400,"message","Bad Requests"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

post '/contact' => sub ($c) {
    my $contact = decode_json($c->req->body);
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        $epp->create_contact($contact);
        my $info = $epp->contact_info($contact->{"id"});
        if(defined($info)){
            $c->render(json => {"status",201,"info",$info});
        }else{
            $c->render(json => {"status",400,"message","Bad Requests"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

post '/domain' => sub ($c) {
    my $domain = decode_json($c->req->body);
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        $epp->create_domain($domain);
        my $info = $epp->domain_info($domain->{"name"});
        if(defined($info)){
            $c->render(json => {"status",201,"info",$info});
        }else{
            $c->render(json => {"status",400,"message","Bad Requests"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

# update objects
put '/host' => sub ($c) {
    my $host = decode_json($c->req->body);
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        $epp->update_host($host);
        my $info = $epp->host_info($host->{"name"});
        if(defined($info)){
            $c->render(json => {"status",201,"info",$info});
        }else{
            $c->render(json => {"status",400,"message","Bad Requests"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

put '/contact' => sub ($c) {
    my $contact = decode_json($c->req->body);
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        $epp->update_contact($contact);
        my $info = $epp->contact_info($contact->{"id"});
        if(defined($info)){
            $c->render(json => {"status",201,"info",$info});
        }else{
            $c->render(json => {"status",400,"message","Bad Requests"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

put '/domain' => sub ($c) {
    my $domain = decode_json($c->req->body);
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        $epp->update_domain($domain);
        my $info = $epp->domain_info($domain->{"name"});
        if(defined($info)){
            $c->render(json => {"status",201,"info",$info});
        }else{
            $c->render(json => {"status",400,"message","Bad Requests"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

# renew domain
put '/domain/:name' => sub ($c) {
    my $domain = $c->param('name');
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $result = $epp->renew_domain($domain);
        if($result){
            my $info = $epp->host_info($domain->{"name"});
            if(defined($info)){
                $c->render(json => {"status",201,"info",$info});
            }else{
                $c->render(json => {"status",400,"message","Bad Requests"});
            }
        }else{
            $c->render(json => {"status",500,"error","Internal Server Error"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

app->hook(after_dispatch => sub {
    my $c = shift;
    $c->res->headers->header('Access-Control-Allow-Origin' => '*');
});

app->secrets(['My very secret passphrase.']);

app->start;