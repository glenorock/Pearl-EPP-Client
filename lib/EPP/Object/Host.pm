package EPP::Object::Host;

use strict;
use warnings;
use lib 'E:\STAGE ANTIC\code\Pearl-EPP-Client\lib';
use EPP::Client;

sub getClient {
    return EPP::Client::getInstance()
}

sub check {
    my $epp = getClient();
    my $result = $epp->check_host($_[0]);
    return $result;
}

sub info {
    my $epp = getClient();
    my $result = $epp->host_info($_[0]);
    return $result;
}

sub create {
    my $epp = getClient();
    my $result = $epp->create_host($_[0]);
    return $result;
}

sub update {
    my $epp = getClient();
    my $result = $epp->update_host($_[0]);
    return $result;
}

1;