TextCleanup is developed to clean HTML from a .html file and output raw text without HTML tags into a .txt file. 

Sample file of AliceInWonderland.html included.
(Entire text of Alice’s Adventures in Wonderland via http://www.gutenberg.org/files/11/11-h/11-h.htm) 

To execute, run the command

`perl HTMLToCleanTxt.pl`

in Terminal to create raw text files to work with.

You can name the files you want to process as arguments:

`HTMLToCleanTxt.pl MyFile01.html MyFile02.html`

…or a glob of all HTML files in the directory:

`HTMLToCleanTxt.pl *.html`

If only a single argument is given, and it's a text file, it's assumed to contain a list of files to be processed:

`HTMLToCleanTxt.pl FilesToProcess.txt`

Full instructions for working with this script in Perl: http://ow.ly/Vf09E

Contributors: Lisa Tagliaferri (http://lisatagliaferri.com), Marcus Smith (https://github.com/carwash)
