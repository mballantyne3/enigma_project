require 'date'
require './lib/enigma'

input, output, key, date = ARGV

incoming_encryption = File.read(input).strip

enigma = Enigma.new

result = enigma.decrypt(incoming_encryption, key, date)

File.write(output, result[:encryption])

puts "Created '#{output}' with the key #{result[:key]} and date #{result[:date]}"

