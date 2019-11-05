require_relative 'enigma'

message_file_name = ARGV[0]
encrypted_file_name = ARGV[1]
message = File.open("./lib/#{message_file_name}", "r").read
encrypted_message = Enigma.new(message)
encrypted_file = File.open("./lib/#{encrypted_file_name}", "w")
encrypted_file.write(encrypted_message)
encrypted_file.close
puts "Created #{encrypted_file_name} with the key #{encrypted_message.key} and date #{encrypted_message.date}"
