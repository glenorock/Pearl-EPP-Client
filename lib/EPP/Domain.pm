package EPP::Domain;

use strict;
use warnings;

sub getConfigs {
    # path to the server configuration file
    my $confFileName = "conf/server.conf";

    my $fh;
    open($fh,"<",$confFileName);

    my %conf;

    # extracting the settings file
    while (my $row = <$fh>){
        $row =~ s/^\s+|\s+$| //g;
        my @data = split("=",$row);
        $conf{"$data[0]"} = $data[1];
    }

    # typecasting the certain fields to intergers 
    $conf{"debug"} =  int($conf{"debug"});
    $conf{"port"} =  int($conf{"port"});
    $conf{"timeout"} =  int($conf{"timeout"});

    return %conf
}

sub getClient {
    my %conf = getConfigs();
    return Net::EPP::Simple->new(
        host => $conf{"host"},
        user => $conf{"user"},
        pass => $conf{"pass"},
        debug => int($conf{"debug"}),
        port => int($conf{"port"}),
        timeout => int($conf{"timeout"}),
    );
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