#!/usr/bin/perl

package C::Something;

use strict;
use warnings;

sub new
{
	return bless {};
}

sub do_your_thing
{
	return "Module C does this.\n";
}

# 1;
