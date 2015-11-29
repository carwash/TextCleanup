use HTML::Restrict;
#available from http://search.cpan.org/~oalders/HTML-Restrict-2.2.2/lib/HTML/Restrict.pm

#Open and stringify a specific HTML file
  local $/ = undef;
  open $file, "AliceInWonderland.html" || die "Couldn't open file: $!";
  binmode $file;
  $string = <$file>;
  close $file;


#Process the stringified file to remove HTML tags
my $hr = HTML::Restrict->new();
my $processed = $hr->process($string);

#Set up new txt file
my $newfile = "AliceInWonderland.txt";

#Use the open() function to create the file
unless(open FILE, '>'.$newfile) {
     Die with error message 
    # if we can't open it.
    die "\nUnable to create $file\n";
}

# Write the cleaned raw text from the HTML file to the new file
print FILE $processed;
#Close the file
close FILE;
