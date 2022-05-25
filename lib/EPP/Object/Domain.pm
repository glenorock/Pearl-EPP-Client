package EPP::Object::Domain;

use strict;
use warnings;
use lib 'E:\STAGE ANTIC\code\Pearl-EPP-Client\lib';
use EPP::Client;

sub getClient {
    return EPP::Client::getInstance()
}

sub check {
    my $epp = getClient();
    my $result = $epp->check_domain($_[0]);
    return $result;
}

sub info {
    my $epp = getClient();
    my $result = $epp->domain_info($_[0]);
    return $result;
}

sub create {
    my $epp = getClient();
    my $result = $epp->create_domain($_[0]);
    return $result;
}

sub update {
    my $epp = getClient();
    my $result = $epp->update_domain($_[0]);
    return $result;
}

1;