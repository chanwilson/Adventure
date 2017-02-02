use strict;
use warnings;
use Test::More;
use English;
use File::Slurp;
use YAML::XS qw(Load LoadFile);

=head1 NAME

103-yaml - Make sure mission YAML files can be parsed as YAML

=head1 SYNOPSIS

prove t/103-yaml.t

=head1 DESCRIPTION

A simple sanitizer for making sure the mission YAML files actually pass the YAML parser.  
Does no tests to confirm parsing into correct data structures

=cut

our $VERSION = '0.01';

my @files = glob "../missions/*";
for my $file ( @files ) {
    my $text = read_file($file);
    my $thing =  ok(Load($text),
		    "parsed $file as YAML successfully");
    1;    
}
done_testing();
