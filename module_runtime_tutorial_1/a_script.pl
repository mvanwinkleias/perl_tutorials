#!/usr/bin/perl

use strict;
use warnings;

use Module::Runtime 'use_module';
use Data::Dumper;
use Try::Tiny;

use FindBin qw($RealBin);
use lib "$RealBin/lib";

=pod

=head1 SYNOPSIS

  	./a_script.pl A B A

=head1 DESCRIPTION

This script demonstrates Module::Runtime loading.

For each command line argument the script:

=over 4

=item Checks that the type exists in %VALID_TYPES

=item Loads the module, and calls new()

=back

For each of the objects defined, it calls do_your_thing();

3 Modules are defined:

=over 4

=item A::Something

=item B::Something

=item C::Something

=back

C::Something is purposefully broken.  It's inclusion is in a try ... catch ... block.


=cut

my %VALID_TYPES = (
	'A' => {
		package_name => 'A::Something',
	},
	'B' => {
		package_name => 'B::Something',
	},
	'C' => {
		package_name => 'C::Something',
	},
);


my @types = @ARGV;

my @objects;

foreach my $type (@types)
{
	if (! defined $VALID_TYPES{$type})
	{
		warn "Type $type doesn't exist.\n";
	}
	else
	{
		try{
			push @objects, use_module(
				$VALID_TYPES{$type}->{'package_name'}
			)->new();
		}
		catch{
			warn "Unable to load module for $type: " 
				. $VALID_TYPES{$type}->{'package_name'};
		}
		
	}
}



my $count = 0;
foreach my $object (@objects)
{
	$count++;
	$object->do_your_thing($count);
}

