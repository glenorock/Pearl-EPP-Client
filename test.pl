#!/usr/bin/perl
use strict;
use Data::Dumper;

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

print Dumper(\%conf);