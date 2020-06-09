require_relative 'enigma'
encrypted = ARGV[0]
file = File.open(encrypted)
string = file.read.strip
enigma = Enigma.new
key = ARGV[2]
date = ARGV[3]
message = enigma.decrypt(string, key, date)[:decryption]
decryption = ARGV[1]
decrypted = File.new( decryption, 'w')
decrypted.write(message)
p "Created #{decryption} with the key #{key} and date #{date}"
