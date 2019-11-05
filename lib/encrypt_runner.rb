message_file_name = ARGV[0]
encrypted_file_name = ARGV[1]

require 'pry';binding.pry
message_to_encrypt = File.open("./lib/#{message_file_name}", "r").read
encrypted_message = Enigma.new(message_to_encrypt, date)
encrypted_file = File.open("./lib/#{encrypted_file_name}", "w")
encrypted_file.write(encrypted_message)
encrypted_file.close
puts "Created #{encrypted_file_name} with the key #{key_used} and date #{date_used}"
