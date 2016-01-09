#!/usr/bin/env perl

use strict;
use warnings;
use 5.014; # Some modern features such as say() and the /r flag on s/// are used.
use autodie 2.12 qw(:file);

use Fcntl 'O_RDONLY';
use Tie::File;
# Available from https://api.metacpan.org/source/TODDR/Tie-File-1.00/lib/Tie/File.pm
use HTML::Restrict;
# Available from https://api.metacpan.org/source/OALDERS/HTML-Restrict-2.2.2/lib/HTML/Restrict.pm

use open IO => ':raw';

# Get a list of files to process from the command line
my @files;
if (@ARGV) {
	# If there is only one argument, and it's a text file, use it as the list of files to be processed instead
	if (@ARGV == 1 && $ARGV[0] =~ /\.txt$/) {
		tie @files, 'Tie::File', $ARGV[0], mode => O_RDONLY or die "Could not read from file '$ARGV[0]'\n";
	}
	else {
		@files = @ARGV;
	}
}
# If no files specified, default to 'AliceInWonderland.html'
else {
	@files = (qw[AliceInWonderland.html]);
}

# Create a new HTML::Restrict object to process the data
my $hr = HTML::Restrict->new();

# Process each file in turn
for my $file (@files) {
	# Open and stringify a specific HTML file
	open(my $fh, '<', $file);
	my $string = do {
		local $/;
		<$fh>;
	};
	close $fh;

	# Process the stringified file to remove HTML tags
	my $processed = $hr->process($string);

	# Name the output file according to the input file
	my $outfile = $file =~ s/(.*)\..{3,4}$/$1.txt/r;

	# Use the open() function to create the new txt file
	open(my $output, '>', $outfile);

	# Write the cleaned raw text from the HTML file to the new file
	print $output $processed;

	# Close the new file
	close $output;
}

say join('', 'Finished processing ', scalar @files, ' file', (@files == 1 ? '' : 's'), '.');
