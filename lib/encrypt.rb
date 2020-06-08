require_relative 'enigma'
message = ARGV[0]
file = File.open(message)
string = file.read.strip
enigma = Enigma.new
key = enigma.key
date = enigma.date
encrypted = enigma.encrypt(string, key, date)[:encryption]

encryption = ARGV[1]
new_file = File.new( encryption, 'w')
new_file.write(encrypted)
p "Created #{encryption} with the key #{key} and date #{date}"
