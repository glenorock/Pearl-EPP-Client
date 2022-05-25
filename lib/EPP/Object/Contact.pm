package EPP::Object::Contact;

use strict;
use warnings;
use lib 'E:\STAGE ANTIC\code\Pearl-EPP-Client\lib';
use EPP::Client;

sub getClient {
    return EPP::Client::getInstance()
}

sub check {
    my $epp = getClient();
    my $result = $epp->check_contact($_[0]);
    return $result;
}

sub info {
    my $epp = getClient();
    my $result = $epp->contact_info($_[0]);
    return $result;
}

sub create {
    my $epp = getClient();
    my $result = $epp->create_contact($_[0]);
    return $result;
}

sub update {
    my $epp = getClient();
    my $result = $epp->update_contact($_[0]);
    return $result;
}

1;