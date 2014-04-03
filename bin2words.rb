#!/usr/bin/env ruby
# bin2words.rb by Patrick Webster <patrick@aushack.com>
# git clone https://github.com/aushack/bin2words
#
# version 1.0 - initial release - 20140403

# Dependencies.
require 'getoptlong' # Should be there
begin
  require 'inifile'
rescue Exception => e
  puts "The 'inifile' gem is required but not installed. Try 'gem install inifile'."
  exit 1
end

# Set values first.
inifile = IniFile.load('bin2words.ini') # Default key file.
wrap = true # Default is to limit line length
wraplen = 60 # Max line length

# Options
opts = GetoptLong.new(
  [ '--help',	  '-h',   GetoptLong::NO_ARGUMENT ],
  [ '--encode', '-e',   GetoptLong::REQUIRED_ARGUMENT ],
  [ '--decode',	'-d',   GetoptLong::REQUIRED_ARGUMENT ],
  [ '--key',	  '-k',   GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--nowrap',	'-n',   GetoptLong::NO_ARGUMENT ]
)

begin
opts.each do |opt, arg|
  case opt
    when '--nowrap'
      wrap = false
    when '--key'
      if not File.exist?(arg)
        puts "ERROR: specified key file #{arg} does not exist!\nHint: try \"-k bin2words.ini\" for the default key file."
        exit 1
      end
    inifile = IniFile.load(arg)
    when '--help'
      puts <<-EOF
Example:       #{$0} -e FILE > OUTPUT

 -h, --help:   Self explanatory.
 -k, --key:    Encode/decode key file. Otherwise default used (bin2words.ini)
 -n, --nowrap: Disable line length limit (wrap). Default is #{wraplen} characters.
 -e, --encode: Convert any file from binary (or text) to words.
 -d, --decode: Convert a bin2words encoded file back to binary file.
 FILE:         Source file to encode or decode.
 OUTPUT:       Script output is sent to STDOUT. Use > to write to file.

      EOF

    when '--encode'
      begin
        open(arg,"rb"){|f|
        len = 0
        while buf = f.read(1024)
          buf.each_byte { |bin|
            print inifile["bin2words"][bin.to_s] + " " # Spaces after all words is a must.
            if (wrap)
              if (len += inifile["bin2words"][bin.to_s].length) > wraplen # wrap at ~60 characters
                len = 0
                print "\n"
              end
            end
		      }
        end
        print "\n"
        }
      rescue => err
        puts "Exception: #{err}"
      end

    when '--decode'
      inifile = inifile["bin2words"].invert # Reverse the hash map.
      begin
	      open(arg,"rb"){|f|
	      f.read.scan(/[\w']+/) do |word| # Split words by the spaces.
	        print inifile[word.to_s].to_i.chr
	      end
        }
      rescue => err
        puts "Exception: #{err}"
      end
    end
  end

rescue => err
	err # Catch invalid getoptlong input etc.
end

# EOF
