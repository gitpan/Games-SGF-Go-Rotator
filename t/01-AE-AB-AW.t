use strict;
use warnings;
use Games::SGF::Go::Rotator;

use Test::More tests => 2;

local $/ = undef;

my $sgf = Games::SGF::Go::Rotator->new();
$sgf->readFile("t/AE-AB-AW.sgf");
$sgf->rotate90();

open(my $rot90fh, 't/AE-AB-AW-90.sgf') || die("Can't open rot90 file");
is_deeply($sgf->writeText(), <$rot90fh>, "90 degree rotation works");

$sgf = Games::SGF::Go::Rotator->new();
$sgf->readFile("t/AE-AB-AW.sgf");
$sgf->rotate();

open(my $rot180fh, 't/AE-AB-AW-180.sgf') || die("Can't open rot180 file");
is_deeply($sgf->writeText(), <$rot180fh>, "180 degree rotation works");
