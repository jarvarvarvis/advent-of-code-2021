use warnings;

=begin

00100
10101
01100
10001
11001
00101
11001

First column:
- 0: 3
- 1: 4
=> gamma value first bit = 1

Second column:
- 0: 4
- 1: 3
=> gamma value second bit = 0
=cut


# Open the file
my $filename = 'input.txt';
open (my $fh, '<:encoding(UTF-8)', $filename)
    or die "Couldn't open file '$filename'!\n";

my @bit0_counts = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
my @bit1_counts = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

# Read lines
while (my $line = <$fh>) {
    my @chars = split("", $line);
    print "@chars";

    for my $i (0..11) {
	# If 0 or 1 are encountered, increment the respective element in $bit0_counts or $bit1_counts
	if ($chars[$i] == '0') {
	    $bit0_counts[$i] = $bit0_counts[$i] + 1;
	}
	if ($chars[$i] == '1') {
	    $bit1_counts[$i] = $bit1_counts[$i] + 1;
	}
    }
}

# Temporarily output the bit counts
print "\nFinal bit counts:\n";
print "Bit 0 counts: @bit0_counts\n";
print "Bit 1 counts: @bit1_counts\n";

# Calculate the final result
my $epsilon = 0;
my $gamma = 0;

for my $i (0..11) {
    my $bit0 = $bit0_counts[$i];
    my $bit1 = $bit1_counts[$i];

    my $bit_position = (11 - $i);

    # If there are more 0's in the current position...
    if ($bit0 > $bit1) {
	# the first bit of the gamma rate is 0.
	# the first bit of the epsilon rate is 1.
	$epsilon = $epsilon + 2 ** $bit_position;
    }
    # If there are more 1's in the current position...
    if ($bit1 > $bit0) {
	# the first bit of the gamma rate is 1.
	# the first bit of the epsilon rate is 0.
	$gamma = $gamma + 2 ** $bit_position;
    }
}

my $result = $epsilon * $gamma;

# 101001100111
print "Final result: $result\n";
