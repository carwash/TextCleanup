#!/usr/bin/env perl

use strict;
use warnings;
use autodie 2.12 qw(:file);

use HTML::Restrict;
# Available from https://api.metacpan.org/source/OALDERS/HTML-Restrict-2.2.2/lib/HTML/Restrict.pm

use open IO => ':raw';

# Open and stringify a specific HTML file
open(my $file, '<', 'AliceInWonderland.html');
my $string = do {
	local $/;
	<$file>;
};
close $file;

# Process the stringified file to remove HTML tags
my $hr = HTML::Restrict->new();
my $processed = $hr->process($string);

# Use the open() function to create the new txt file
open(my $output, '>', 'AliceInWonderland.txt');

# Write the cleaned raw text from the HTML file to the new file
print $output $processed;

# Close the new file
close $output;
