require 'date'
require './lib/enigma'

incoming_message = File.read(ARGV[0]).strip

enigma = Enigma.new

result = enigma.encrypt(incoming_message)

File.write(ARGV[1], result[:encryption])

puts "Created '#{ARGV[1]}' with the key #{result[:key]} and date #{result[:date]}"
