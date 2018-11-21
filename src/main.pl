#/usr/bin/perl
use utf8;
use v5.26;

use strict;
use warnings;


my ($length, $width, $height, $volume) = (0, 0, 0, 0);

sub Volume {
    my ($length, $width, $height) = @_;

    return ($length * $width * $height);
}

sub EnterLength {
    print "Enter length: ";
    chomp($length = <STDIN>);
}

sub EnterWidth {
    print "Enter width: ";
    chomp($width = <STDIN>);
}

sub EnterHeight {
    print "Enter height: ";
    chomp($height = <STDIN>);
}

sub PrintLength {
    say "Length: $length";
}

sub PrintWidth {
    say "Width: $width";
}

sub PrintHeight {
    say "Height: $height";
}

sub PrintVolume {
    say "Volume: $volume";
}

sub PrintDimensions {
    my ($l, $w, $h) = @_;

    PrintLength();
    PrintWidth();
    PrintHeight();
    PrintVolume();
}

EnterLength();
EnterWidth();
EnterHeight();

$volume = Volume($length, $width, $height);

PrintDimensions();
