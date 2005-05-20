use strict;
use Test::More;
use Games::Mastermind;

plan tests => 2;

my $mm = Games::Mastermind->new;
my @pegs = @{ $mm->pegs }; 

my @h;

for( 1 .. 4 ) {
    my $play = [ map { $pegs[rand @pegs] } 1 .. 4 ];
    my $marks = $mm->play( @$play );
    push @h, [ $play, $marks ];
}

is_deeply( \@h, $mm->history, "Didn't change history" );

# change a parameter
$mm->holes( 5 );
is_deeply( $mm->history, [], "The setters reset the game" );
