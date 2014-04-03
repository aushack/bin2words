bin2words
=========

Binary to Words (Text) Conversion Tool
Created by Patrick Webster <patrick@aushack.com>

INTRODUCTION
------

The purpose of bin2words (Binary to Words) is a simple binary format to word conversion tool. E.g. 0x41 = "2600", 0x20 = "PRISM" etc (strings).
The point is just a bit of fun, really. It could be useful in obfuscating messages, similar to rot13, or transferring other data such as AVI files. Who is to say what a random word document is?
The actual purpose is for myself to get a grasp of the differences between Subversion and Git, because I always screw up my Git changes.

SYNTAX
------

 -h, --help:   Self explanatory.
 -e, --encode: Convert any file from binary (or text) to words.
 -d, --decode: Convert a bin2words encoded file back to binary file.
 -k, --key:    Encode/decode key file. Otherwise default used (bin2words.ini)
 FILE:         Source file to encode or decode.
 OUTPUT:       Script output is sent to STDOUT. Use > to write to disk.

USAGE
-----

`
./bin2words.rb -e image.gif > image.txt
./bin2words.rb -d image.txt > image-new.gif
./bin2words.rb -k infosec.ini -e image.gif > image.txt
./bin2words.rb -k infosec.ini -d image.txt > image-new.gif
`

KEY FILE
--------

bin2words ships with two default key files:

* The first is bin2words.ini, which is a series of 256 words, all of which are 3 letter words only. If you do not specify a key file with the -k switch, this will be used by default.
* The second is infosec.ini, which is a series of 256 words, all of varying length, and generally related to potential "keywords" that governments of the world may be intercepting.

You can create your own key file, by ensuring the format is as follows:
`
[bin2words]
0=the
1=yes
2=who
3=web
4=pup
5=ran
...
250=vat
251=ads
252=fix
253=may
254=gem
255=and
`
If you do not tag the ini file with [bin2words], or do not include words values for all 0-255 values, bin2words will not work and should return an error.
Furthermore, if you specify the same word multiple times accidentally, the decoded file will become corrupted. You may wish to use a bindiff tool to confirm that the source file, which is encoded, then decoded, is an exact match of the original source file.

SECURITY
--------

The encoded data which bin2words generates is significantly complex to deciper. For example, ROT13 is easily reversible as each character is always mapped to another character, however since bin2words utilises a key file, it is not an easy task to determine what an encoded file originally contained. Because of this reason, bin2words includes the 2 default key files, so that publicly encoded messages with the default keys may be decoded by the public, such as spoiler alerts or jokes on websites and mailing lists etc.

bin2words is not encryption. Most file formats, such as PDF, JPG, AVI, EXE etc, have specific file headers (and footers or padding) which are static and may be used to break an encoded bin2words document. For example, PDF files start with a header of '%PDF'. If a third party obtains a bin2words encoded file that they believe is a PDF document, they can deduce that the first 4 "words" of the file match the binary value for '%PDF' and partially decode the document, allowing them to progressively fill in the gaps until they have the fully decoded document.

If you want to secretly share information, use encryption. If you want to share data semi-publicly, avoid sharing the key file with the encoded message (unless you want this to happen), such as sharing a MP3 with friends but without the web provider noticing the content is infact MP3.

EXAMPLE
-------

$ echo "hello world from bin2words!" > message

1. Using the default bin2words.ini key:

$ ./bin2words.rb -e message 
lay nut ray ray pad pal fob pad red ray hot pal one red pad for pal her pox bed not fob pad red hot hah own mad 

2. Using the infosec.ini key file:

$ ./bin2words.rb -k infosec.ini -e message 
virus illuminati USA USA AU 767 PROMIS AU NATO USA MITM 767 president NATO AU USSR 767 ROT13 war UK interception PROMIS AU NATO MITM IRA 737 Firewalls 

PERFORMANCE
-----------

Using the default key, it took 80 seconds to encode a 100MB AVI file resulting in a 400MB text document (1 byte = 4 bytes).
By compressing the text document with bz2, the ZIP archive of the 400MB text document was a reasonable 104MB.
Using the default key, it took only 75 seconds to decode the 400MB text document back into the 100MB AVI file. 

REQUIREMENTS
------------

bin2words utilises the 'inifile' gem. If you do not have this installed, type 'gem install inifile' to install it first.

EOF
