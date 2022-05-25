package EPP::Client;

use Net::EPP::Simple;
use strict;
use warnings;

sub getConfigs{
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

sub new{
    my $class = shift;
    my $self = Net::EPP::Simple->new(
        host => shift,
        user => shift,
        pass => shift,
        debug => shift,
        port => shift,
        timeout => shift,
    );
    bless  $self, $class; 
    return $self;
}

# get an epp client instance
sub getInstance
{
    my %conf = getConfigs();
    return new EPP::Client(
        $conf{"host"},
        $conf{"user"},
        $conf{"pass"},
        $conf{"debug"},
        $conf{"port"},
        $conf{"timeout"},
    );
}


1;