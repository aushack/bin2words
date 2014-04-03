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

# Options
opts = GetoptLong.new(
  [ '--help',	'-h', GetoptLong::NO_ARGUMENT ],
  [ '--encode', '-e', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--decode',	'-d', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--key',	'-k', GetoptLong::OPTIONAL_ARGUMENT ]
)

begin
opts.each do |opt, arg|
  case opt
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
 -e, --encode: Convert any file from binary (or text) to words.
 -d, --decode: Convert a bin2words encoded file back to binary file.
 -k, --key:    Encode/decode key file. Otherwise default used (bin2words.ini)
 FILE:         Source file to encode or decode.
 OUTPUT:       Script output is sent to STDOUT. Use > to write to disk.

      EOF

    when '--encode'
      begin
        open(arg,"rb"){|f|
        while buf = f.read(1024)
          buf.each_byte { |bin|
            print inifile["bin2words"][bin.to_s] + " " # Spaces after all words is a must.
		      }
        end
        }
      rescue => err
        puts "Exception: #{err}"
      end

    when '--decode'
      begin
	      open(arg,"rb"){|f|
	      f.read.scan(/[\w']+/) do |word| # Split words by the spaces.
	        if (word == inifile["bin2words"]["0"]) # There are better ways to do this, but this is less confusing. Probably should be optimised though.
		        print 0.chr
	        elsif (word == inifile["bin2words"]["1"])
		        print 1.chr
	        elsif (word == inifile["bin2words"]["2"])
		        print 2.chr
	        elsif (word == inifile["bin2words"]["3"])
		        print 3.chr
	        elsif (word == inifile["bin2words"]["4"])
		        print 4.chr
	        elsif (word == inifile["bin2words"]["5"])
		        print 5.chr
	        elsif (word == inifile["bin2words"]["6"])
		        print 6.chr
	        elsif (word == inifile["bin2words"]["7"])
		        print 7.chr
	        elsif (word == inifile["bin2words"]["8"])
		        print 8.chr
	        elsif (word == inifile["bin2words"]["9"])
		        print 9.chr
	        elsif (word == inifile["bin2words"]["10"])
		        print 10.chr
	        elsif (word == inifile["bin2words"]["11"])
		        print 11.chr
	        elsif (word == inifile["bin2words"]["12"])
		        print 12.chr
	        elsif (word == inifile["bin2words"]["13"])
		        print 13.chr
	        elsif (word == inifile["bin2words"]["14"])
		        print 14.chr
	        elsif (word == inifile["bin2words"]["15"])
		        print 15.chr
	        elsif (word == inifile["bin2words"]["16"])
		        print 16.chr
	        elsif (word == inifile["bin2words"]["17"])
		        print 17.chr
	        elsif (word == inifile["bin2words"]["18"])
		        print 18.chr
	        elsif (word == inifile["bin2words"]["19"])
		        print 19.chr
	        elsif (word == inifile["bin2words"]["20"])
		        print 20.chr
	        elsif (word == inifile["bin2words"]["21"])
		        print 21.chr
	        elsif (word == inifile["bin2words"]["22"])
		        print 22.chr
	        elsif (word == inifile["bin2words"]["23"])
		        print 23.chr
	        elsif (word == inifile["bin2words"]["24"])
		        print 24.chr
	        elsif (word == inifile["bin2words"]["25"])
		        print 25.chr
	        elsif (word == inifile["bin2words"]["26"])
		        print 26.chr
	        elsif (word == inifile["bin2words"]["27"])
		        print 27.chr
	        elsif (word == inifile["bin2words"]["28"])
		        print 28.chr
	        elsif (word == inifile["bin2words"]["29"])
		        print 29.chr
	        elsif (word == inifile["bin2words"]["30"])
		        print 30.chr
	        elsif (word == inifile["bin2words"]["31"])
		        print 31.chr
	        elsif (word == inifile["bin2words"]["32"])
		        print 32.chr
	        elsif (word == inifile["bin2words"]["33"])
		        print 33.chr
	        elsif (word == inifile["bin2words"]["34"])
		        print 34.chr
	        elsif (word == inifile["bin2words"]["35"])
		        print 35.chr
	        elsif (word == inifile["bin2words"]["36"])
		        print 36.chr
	        elsif (word == inifile["bin2words"]["37"])
		        print 37.chr
	        elsif (word == inifile["bin2words"]["38"])
		        print 38.chr
	        elsif (word == inifile["bin2words"]["39"])
		        print 39.chr
	        elsif (word == inifile["bin2words"]["40"])
		        print 40.chr
	        elsif (word == inifile["bin2words"]["41"])
		        print 41.chr
	        elsif (word == inifile["bin2words"]["42"])
		        print 42.chr
	        elsif (word == inifile["bin2words"]["43"])
		        print 43.chr
	        elsif (word == inifile["bin2words"]["44"])
		        print 44.chr
	        elsif (word == inifile["bin2words"]["45"])
		        print 45.chr
	        elsif (word == inifile["bin2words"]["46"])
		        print 46.chr
	        elsif (word == inifile["bin2words"]["47"])
		        print 47.chr
	        elsif (word == inifile["bin2words"]["48"])
		        print 48.chr
	        elsif (word == inifile["bin2words"]["49"])
		        print 49.chr
	        elsif (word == inifile["bin2words"]["50"])
		        print 50.chr
	        elsif (word == inifile["bin2words"]["51"])
		        print 51.chr
	        elsif (word == inifile["bin2words"]["52"])
		        print 52.chr
	        elsif (word == inifile["bin2words"]["53"])
		        print 53.chr
	        elsif (word == inifile["bin2words"]["54"])
		        print 54.chr
	        elsif (word == inifile["bin2words"]["55"])
		        print 55.chr
	        elsif (word == inifile["bin2words"]["56"])
		        print 56.chr
	        elsif (word == inifile["bin2words"]["57"])
		        print 57.chr
	        elsif (word == inifile["bin2words"]["58"])
		        print 58.chr
	        elsif (word == inifile["bin2words"]["59"])
		        print 59.chr
	        elsif (word == inifile["bin2words"]["60"])
		        print 60.chr
	        elsif (word == inifile["bin2words"]["61"])
		        print 61.chr
	        elsif (word == inifile["bin2words"]["62"])
		        print 62.chr
	        elsif (word == inifile["bin2words"]["63"])
		        print 63.chr
	        elsif (word == inifile["bin2words"]["64"])
		        print 64.chr
	        elsif (word == inifile["bin2words"]["65"])
		        print 65.chr
	        elsif (word == inifile["bin2words"]["66"])
		        print 66.chr
	        elsif (word == inifile["bin2words"]["67"])
		        print 67.chr
	        elsif (word == inifile["bin2words"]["68"])
		        print 68.chr
	        elsif (word == inifile["bin2words"]["69"])
		        print 69.chr
	        elsif (word == inifile["bin2words"]["70"])
		        print 70.chr
	        elsif (word == inifile["bin2words"]["71"])
		        print 71.chr
	        elsif (word == inifile["bin2words"]["72"])
		        print 72.chr
	        elsif (word == inifile["bin2words"]["73"])
		        print 73.chr
	        elsif (word == inifile["bin2words"]["74"])
		        print 74.chr
	        elsif (word == inifile["bin2words"]["75"])
		        print 75.chr
	        elsif (word == inifile["bin2words"]["76"])
		        print 76.chr
	        elsif (word == inifile["bin2words"]["77"])
		        print 77.chr
	        elsif (word == inifile["bin2words"]["78"])
		        print 78.chr
	        elsif (word == inifile["bin2words"]["79"])
		        print 79.chr
	        elsif (word == inifile["bin2words"]["80"])
		        print 80.chr
	        elsif (word == inifile["bin2words"]["81"])
		        print 81.chr
	        elsif (word == inifile["bin2words"]["82"])
		        print 82.chr
	        elsif (word == inifile["bin2words"]["83"])
		        print 83.chr
	        elsif (word == inifile["bin2words"]["84"])
		        print 84.chr
	        elsif (word == inifile["bin2words"]["85"])
		        print 85.chr
	        elsif (word == inifile["bin2words"]["86"])
		        print 86.chr
	        elsif (word == inifile["bin2words"]["87"])
		        print 87.chr
	        elsif (word == inifile["bin2words"]["88"])
		        print 88.chr
	        elsif (word == inifile["bin2words"]["89"])
		        print 89.chr
	        elsif (word == inifile["bin2words"]["90"])
		        print 90.chr
	        elsif (word == inifile["bin2words"]["91"])
		        print 91.chr
	        elsif (word == inifile["bin2words"]["92"])
		        print 92.chr
	        elsif (word == inifile["bin2words"]["93"])
		        print 93.chr
	        elsif (word == inifile["bin2words"]["94"])
		        print 94.chr
	        elsif (word == inifile["bin2words"]["95"])
		        print 95.chr
	        elsif (word == inifile["bin2words"]["96"])
		        print 96.chr
	        elsif (word == inifile["bin2words"]["97"])
		        print 97.chr
	        elsif (word == inifile["bin2words"]["98"])
		        print 98.chr
	        elsif (word == inifile["bin2words"]["99"])
		        print 99.chr
	        elsif (word == inifile["bin2words"]["100"])
		        print 100.chr
	        elsif (word == inifile["bin2words"]["101"])
		        print 101.chr
	        elsif (word == inifile["bin2words"]["102"])
		        print 102.chr
	        elsif (word == inifile["bin2words"]["103"])
		        print 103.chr
	        elsif (word == inifile["bin2words"]["104"])
		        print 104.chr
	        elsif (word == inifile["bin2words"]["105"])
		        print 105.chr
	        elsif (word == inifile["bin2words"]["106"])
		        print 106.chr
	        elsif (word == inifile["bin2words"]["107"])
		        print 107.chr
	        elsif (word == inifile["bin2words"]["108"])
		        print 108.chr
	        elsif (word == inifile["bin2words"]["109"])
		        print 109.chr
	        elsif (word == inifile["bin2words"]["110"])
		        print 110.chr
	        elsif (word == inifile["bin2words"]["111"])
		        print 111.chr
	        elsif (word == inifile["bin2words"]["112"])
		        print 112.chr
	        elsif (word == inifile["bin2words"]["113"])
		        print 113.chr
	        elsif (word == inifile["bin2words"]["114"])
		        print 114.chr
	        elsif (word == inifile["bin2words"]["115"])
		        print 115.chr
	        elsif (word == inifile["bin2words"]["116"])
		        print 116.chr
	        elsif (word == inifile["bin2words"]["117"])
		        print 117.chr
	        elsif (word == inifile["bin2words"]["118"])
		        print 118.chr
	        elsif (word == inifile["bin2words"]["119"])
		        print 119.chr
	        elsif (word == inifile["bin2words"]["120"])
		        print 120.chr
	        elsif (word == inifile["bin2words"]["121"])
		        print 121.chr
	        elsif (word == inifile["bin2words"]["122"])
		        print 122.chr
	        elsif (word == inifile["bin2words"]["123"])
		        print 123.chr
	        elsif (word == inifile["bin2words"]["124"])
		        print 124.chr
	        elsif (word == inifile["bin2words"]["125"])
		        print 125.chr
	        elsif (word == inifile["bin2words"]["126"])
		        print 126.chr
	        elsif (word == inifile["bin2words"]["127"])
		        print 127.chr
	        elsif (word == inifile["bin2words"]["128"])
		        print 128.chr
	        elsif (word == inifile["bin2words"]["129"])
		        print 129.chr
	        elsif (word == inifile["bin2words"]["130"])
		        print 130.chr
	        elsif (word == inifile["bin2words"]["131"])
		        print 131.chr
	        elsif (word == inifile["bin2words"]["132"])
		        print 132.chr
	        elsif (word == inifile["bin2words"]["133"])
		        print 133.chr
	        elsif (word == inifile["bin2words"]["134"])
		        print 134.chr
	        elsif (word == inifile["bin2words"]["135"])
		        print 135.chr
	        elsif (word == inifile["bin2words"]["136"])
		        print 136.chr
	        elsif (word == inifile["bin2words"]["137"])
		        print 137.chr
	        elsif (word == inifile["bin2words"]["138"])
		        print 138.chr
	        elsif (word == inifile["bin2words"]["139"])
		        print 139.chr
	        elsif (word == inifile["bin2words"]["140"])
		        print 140.chr
	        elsif (word == inifile["bin2words"]["141"])
		        print 141.chr
	        elsif (word == inifile["bin2words"]["142"])
		        print 142.chr
	        elsif (word == inifile["bin2words"]["143"])
		        print 143.chr
	        elsif (word == inifile["bin2words"]["144"])
		        print 144.chr
	        elsif (word == inifile["bin2words"]["145"])
		        print 145.chr
	        elsif (word == inifile["bin2words"]["146"])
		        print 146.chr
	        elsif (word == inifile["bin2words"]["147"])
		        print 147.chr
	        elsif (word == inifile["bin2words"]["148"])
		        print 148.chr
	        elsif (word == inifile["bin2words"]["149"])
		        print 149.chr
	        elsif (word == inifile["bin2words"]["150"])
		        print 150.chr
	        elsif (word == inifile["bin2words"]["151"])
		        print 151.chr
	        elsif (word == inifile["bin2words"]["152"])
		        print 152.chr
	        elsif (word == inifile["bin2words"]["153"])
		        print 153.chr
	        elsif (word == inifile["bin2words"]["154"])
		        print 154.chr
	        elsif (word == inifile["bin2words"]["155"])
		        print 155.chr
	        elsif (word == inifile["bin2words"]["156"])
		        print 156.chr
	        elsif (word == inifile["bin2words"]["157"])
		        print 157.chr
	        elsif (word == inifile["bin2words"]["158"])
		        print 158.chr
	        elsif (word == inifile["bin2words"]["159"])
		        print 159.chr
	        elsif (word == inifile["bin2words"]["160"])
		        print 160.chr
	        elsif (word == inifile["bin2words"]["161"])
		        print 161.chr
	        elsif (word == inifile["bin2words"]["162"])
		        print 162.chr
	        elsif (word == inifile["bin2words"]["163"])
		        print 163.chr
	        elsif (word == inifile["bin2words"]["164"])
		        print 164.chr
	        elsif (word == inifile["bin2words"]["165"])
		        print 165.chr
	        elsif (word == inifile["bin2words"]["166"])
		        print 166.chr
	        elsif (word == inifile["bin2words"]["167"])
		        print 167.chr
	        elsif (word == inifile["bin2words"]["168"])
		        print 168.chr
	        elsif (word == inifile["bin2words"]["169"])
		        print 169.chr
	        elsif (word == inifile["bin2words"]["170"])
		        print 170.chr
	        elsif (word == inifile["bin2words"]["171"])
		        print 171.chr
	        elsif (word == inifile["bin2words"]["172"])
		        print 172.chr
	        elsif (word == inifile["bin2words"]["173"])
		        print 173.chr
	        elsif (word == inifile["bin2words"]["174"])
		        print 174.chr
	        elsif (word == inifile["bin2words"]["175"])
		        print 175.chr
	        elsif (word == inifile["bin2words"]["176"])
		        print 176.chr
	        elsif (word == inifile["bin2words"]["177"])
		        print 177.chr
	        elsif (word == inifile["bin2words"]["178"])
		        print 178.chr
	        elsif (word == inifile["bin2words"]["179"])
		        print 179.chr
	        elsif (word == inifile["bin2words"]["180"])
		        print 180.chr
	        elsif (word == inifile["bin2words"]["181"])
		        print 181.chr
	        elsif (word == inifile["bin2words"]["182"])
		        print 182.chr
	        elsif (word == inifile["bin2words"]["183"])
		        print 183.chr
	        elsif (word == inifile["bin2words"]["184"])
		        print 184.chr
	        elsif (word == inifile["bin2words"]["185"])
		        print 185.chr
	        elsif (word == inifile["bin2words"]["186"])
		        print 186.chr
	        elsif (word == inifile["bin2words"]["187"])
		        print 187.chr
	        elsif (word == inifile["bin2words"]["188"])
		        print 188.chr
	        elsif (word == inifile["bin2words"]["189"])
		        print 189.chr
	        elsif (word == inifile["bin2words"]["190"])
		        print 190.chr
	        elsif (word == inifile["bin2words"]["191"])
		        print 191.chr
	        elsif (word == inifile["bin2words"]["192"])
		        print 192.chr
	        elsif (word == inifile["bin2words"]["193"])
		        print 193.chr
	        elsif (word == inifile["bin2words"]["194"])
		        print 194.chr
	        elsif (word == inifile["bin2words"]["195"])
		        print 195.chr
	        elsif (word == inifile["bin2words"]["196"])
		        print 196.chr
	        elsif (word == inifile["bin2words"]["197"])
		        print 197.chr
	        elsif (word == inifile["bin2words"]["198"])
		        print 198.chr
	        elsif (word == inifile["bin2words"]["199"])
		        print 199.chr
	        elsif (word == inifile["bin2words"]["200"])
		        print 200.chr
	        elsif (word == inifile["bin2words"]["201"])
		        print 201.chr
	        elsif (word == inifile["bin2words"]["202"])
		        print 202.chr
	        elsif (word == inifile["bin2words"]["203"])
		        print 203.chr
	        elsif (word == inifile["bin2words"]["204"])
		        print 204.chr
	        elsif (word == inifile["bin2words"]["205"])
		        print 205.chr
	        elsif (word == inifile["bin2words"]["206"])
		        print 206.chr
	        elsif (word == inifile["bin2words"]["207"])
		        print 207.chr
	        elsif (word == inifile["bin2words"]["208"])
		        print 208.chr
	        elsif (word == inifile["bin2words"]["209"])
		        print 209.chr
	        elsif (word == inifile["bin2words"]["210"])
		        print 210.chr
	        elsif (word == inifile["bin2words"]["211"])
		        print 211.chr
	        elsif (word == inifile["bin2words"]["212"])
		        print 212.chr
	        elsif (word == inifile["bin2words"]["213"])
		        print 213.chr
	        elsif (word == inifile["bin2words"]["214"])
		        print 214.chr
	        elsif (word == inifile["bin2words"]["215"])
		        print 215.chr
	        elsif (word == inifile["bin2words"]["216"])
		        print 216.chr
	        elsif (word == inifile["bin2words"]["217"])
		        print 217.chr
	        elsif (word == inifile["bin2words"]["218"])
		        print 218.chr
	        elsif (word == inifile["bin2words"]["219"])
		        print 219.chr
	        elsif (word == inifile["bin2words"]["220"])
		        print 220.chr
	        elsif (word == inifile["bin2words"]["221"])
		        print 221.chr
	        elsif (word == inifile["bin2words"]["222"])
		        print 222.chr
	        elsif (word == inifile["bin2words"]["223"])
		        print 223.chr
	        elsif (word == inifile["bin2words"]["224"])
		        print 224.chr
	        elsif (word == inifile["bin2words"]["225"])
		        print 225.chr
	        elsif (word == inifile["bin2words"]["226"])
		        print 226.chr
	        elsif (word == inifile["bin2words"]["227"])
		        print 227.chr
	        elsif (word == inifile["bin2words"]["228"])
		        print 228.chr
	        elsif (word == inifile["bin2words"]["229"])
		        print 229.chr
	        elsif (word == inifile["bin2words"]["230"])
		        print 230.chr
	        elsif (word == inifile["bin2words"]["231"])
		        print 231.chr
	        elsif (word == inifile["bin2words"]["232"])
		        print 232.chr
	        elsif (word == inifile["bin2words"]["233"])
		        print 233.chr
	        elsif (word == inifile["bin2words"]["234"])
		        print 234.chr
	        elsif (word == inifile["bin2words"]["235"])
		        print 235.chr
	        elsif (word == inifile["bin2words"]["236"])
		        print 236.chr
	        elsif (word == inifile["bin2words"]["237"])
		        print 237.chr
	        elsif (word == inifile["bin2words"]["238"])
		        print 238.chr
	        elsif (word == inifile["bin2words"]["239"])
		        print 239.chr
	        elsif (word == inifile["bin2words"]["240"])
		        print 240.chr
	        elsif (word == inifile["bin2words"]["241"])
		        print 241.chr
	        elsif (word == inifile["bin2words"]["242"])
		        print 242.chr
	        elsif (word == inifile["bin2words"]["243"])
		        print 243.chr
	        elsif (word == inifile["bin2words"]["244"])
		        print 244.chr
	        elsif (word == inifile["bin2words"]["245"])
		        print 245.chr
	        elsif (word == inifile["bin2words"]["246"])
		        print 246.chr
	        elsif (word == inifile["bin2words"]["247"])
		        print 247.chr
	        elsif (word == inifile["bin2words"]["248"])
		        print 248.chr
	        elsif (word == inifile["bin2words"]["249"])
		        print 249.chr
	        elsif (word == inifile["bin2words"]["250"])
		        print 250.chr
	        elsif (word == inifile["bin2words"]["251"])
		        print 251.chr
	        elsif (word == inifile["bin2words"]["252"])
		        print 252.chr
	        elsif (word == inifile["bin2words"]["253"])
		        print 253.chr
	        elsif (word == inifile["bin2words"]["254"])
		        print 254.chr
	        elsif (word == inifile["bin2words"]["255"])
		        print 255.chr
	        else
			        puts "ERROR: Something went wrong with the conversion (word string value '#{word.to_s}') not found in key file. Expecting a .ini file with binary decimal = word pairs."
			        puts "Example ini file contents should be as follows (all words must be unique, all binary values from 0-255 must exist):"
			        puts "[bin2words]\n0=dog\n1=cow\n2=hat\n...\n255=cat"
			        exit 1
		      end
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
