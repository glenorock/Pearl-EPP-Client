use Mojolicious::Lite -signatures;
use lib 'E:\STAGE ANTIC\code\Pearl-EPP-Client\lib';
use JSON;
use strict;
use Try::Tiny;
use Data::Dumper;
use EPP::Client;

# objects info

get '/info/host/:host' => sub ($c){
    my $host = $c->param('host');
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

get '/info/contact/:id/:authInfo' => sub ($c){
    my $contact = $c->param('id');
    my $authInfo = $c->param('authInfo');
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

get '/info/contact/:id/' => sub ($c){
    my $contact = $c->param('id');
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $info = $epp->contact_info($contact);
        if(defined($info)){
            $c->render(json => {"status",200,"info",$info});
        }else{
            $c->render(json => {"status",404,"error","object not found"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

get '/info/domain/:domain/:authInfo/:follow' => sub ($c){
    my $host = $c->param('host');
    my $authInfo = $c->param('authInfo');
    my $follow = $c->param('follow');
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $info = $epp->host_info($host,$authInfo,$follow);
        if(defined($info)){
            $c->render(json => {"status",200,"info",$info});
        }else{
            $c->render(json => {"status",404,"error","object not found"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

get '/info/domain/:domain/:authInfo' => sub ($c){
    my $host = $c->param('host');
    my $authInfo = $c->param('authInfo');
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $info = $epp->host_info($host,$authInfo);
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
    my $host = $c->param('host');
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

# check objects 

get '/check/host/:host' => sub ($c){
    my $host = $c->param('host');
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $result = $epp->check_host($host);
        if ($result == 0){
            $c->render(json => {"check",$host,"status",200,"avail",$result,"message","Host is already provisioned"});
        }else{
            $c->render(json => {"check",$host,"status",200,"avail",$result,"message","Host is available"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

get '/check/contact/:id' => sub ($c){
    my $id = $c->param('id');
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $result = $epp->check_contact($id);
        if ($result == 1){
            $c->render(json => {"check",$id,"status",200,"avail",$result,"message","Contact exists"});
        }else{
            $c->render(json => {"check",$id,"status",200,"avail",$result,"message","Contact does not exist"});
        }
    }else{
        $c->render(json => {"status",500,"error","Internal Server Error"});
    }
};

get '/check/domain/:domain' => sub ($c){
    my $domain = $c->param('domain');
    my $epp = EPP::Client::getInstance();
    if(defined($epp)){
        my $result = $epp->check_host($domain);
        if ($result == 1){
            $c->render(json => {"check",$domain,"status",200,"avail",0,"message","Host is already provisioned"});
        }else{
            $c->render(json => {"check",$domain,"status",200,"avail",1,"message","Host is available"});
        }
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
        my $info = $epp->host_info($domain->{"name"});
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
        my $info = $epp->host_info($domain->{"name"});
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
put '/domain' => sub ($c) {
    my $domain = decode_json($c->req->body);
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

app->start;