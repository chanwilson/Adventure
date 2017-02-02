use strict;
use warnings;
use Test::Most;
use English;
use File::Slurp;
use YAML::XS qw(Load LoadFile);

=head1 NAME

103-yaml-action-castle - Confirm Action Castle YAML parses correctly

=head1 SYNOPSIS

prove t/103-yaml-action-castle.t

=head1 DESCRIPTION

Make sure data struct is correct

=cut

our $VERSION = '0.01';

my $file = '../missions/action_castle.yaml';
my $text = read_file($file);
my $thing;
ok( $thing = Load($text),
    "parsed $file as YAML successfully");

my @top_keys = (qw(name locations score player items), 'game over');
cmp_bag( [ keys %{$thing} ],
	 [ @top_keys ],
	 "Confirm expected top-level keys of @top_keys for $file"
     );

1;    

done_testing();
