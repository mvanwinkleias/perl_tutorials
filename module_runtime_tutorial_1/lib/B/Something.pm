#!/usr/bin/perl

package B::Something;

use strict;
use warnings;

sub new
{
	return bless {};
}

sub do_your_thing
{
	my ($self, $something) = @_;
	my $pkg = __PACKAGE__;
	print "Hello!  This is $pkg.  Doin my thing with $something.\n";
	
}

1;

