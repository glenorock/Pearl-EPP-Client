#!/usr/bin/perl

use Net::EPP::Simple;
use strict;
 
my $epp = Net::EPP::Simple->new(
	host    => '192.168.35.216',
	user    => 'test',
	pass    => 'Test2022',
	debug => 1,
	port => 700,
	timeout => 15,
);

my $domain = 'example.cm';

my $result = $epp->check_domain($domain);

print($result)