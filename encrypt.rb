require 'date'
require './lib/enigma'

input, output = ARGV
incoming_message = File.read(input).strip

enigma = Enigma.new

result = enigma.encrypt(incoming_message)

File.write(output, result[:encryption])

puts "Created '#{output}' with the key #{result[:key]} and date #{result[:date]}"
