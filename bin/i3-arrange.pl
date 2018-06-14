#!/usr/bin/perl
use strict;
use warnings;
use v5.10;

my $output = `xrandr`;
my @displays = ($output =~ /([\w\-]+)\sconnected/g);
my $delta=0;


sub print_help {
	print("Usage:
	i3-arrange <delta value for arranging workspaces>
	i3-arrange -h --help     Show this screen\n");
	exit;
	return;
}

if ($#ARGV==-1) {}
elsif ("$ARGV[0]" =~ /^\d+$/) {
	$delta=$ARGV[0];
}else {
	print_help();
}

my @substrs;
foreach my $i (0..9) {
	push @substrs, [($i+$delta)%($#displays+1), $i];
	system("i3-msg [workspace=$i] move workspace to output $displays[($i+$delta)%($#displays+1)] &>/dev/null");
}
my %dpwp;
for my $d (@displays) {
	$dpwp{$d} = "";
}
for my $i (0..$#substrs) {
	$dpwp{$displays[$substrs[$i][0]]} = $dpwp{$displays[$substrs[$i][0]]} . " $substrs[$i][1]";
}

print "Workspace configuration:\n";
for my $d (@displays) {
	print "$dpwp{$d} are on $d\n";
}
