#/usr/bin/perl
use utf8;
use v5.26;

use strict;
use warnings;


sub Sum {
    my %table = @_;

    my $sum = 0;

    for my $entry (keys %table) {
        $sum += $table{$entry};
    }

    return $sum;
}

sub Avg {
    my %table = @_;
    my $sum = Sum(%table);

    return ($sum / keys %table);
}

open(GRADES, "<:utf8", "grades.txt") || die "Failed to open grades file: $!\n";
binmode(STDOUT, ':utf8');

my %grades;

while (my $line = <GRADES>) {
    $_ = $line;

    my ($name, $score);

    if (($name, $score) = m/([a-zA-Z \.]+)\s(\d{2,3})/) {
        $grades{$name} = $score;
    } else {
        print STDERR "[ERROR]: Failed to parse line " . __LINE__ . "\n";
    }
}

sub PrintSortedHashtable {
    my %table = @_;

    for my $entry (sort keys %table) {
        say "$entry: $table{$entry}";
    }
}

PrintSortedHashtable(%grades);

say "\n" x 10;

say "Sum: " . Sum(%grades);
say "Avg: " . Avg(%grades);
