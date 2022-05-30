package API;

use lib 'E:\STAGE ANTIC\code\Pearl-EPP-Client\lib';
use strict;
use warnings;
use JSON::MaybeXS qw(encode_json decode_json);


sub whois {
    my $domain = $_[0];
    my %out = {domain => $domain, zxsxsa => "yes"};
    my $json = encode_json \%out;
    print $json;
    return $json;
}

sub getHost {
    return "get host";
}

sub getContact {
    return "get contact";
}

sub getDomain {
    return "get domain";
}


sub updateHost {
    return "update host";
}


sub updateContact {
    return "update contact";
}

sub registerDomain {
    return "register domain";
}

sub renewDomain {
    return "renew domain";
}

1;