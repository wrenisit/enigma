require_relative 'enigma'

message_file_name = ARGV[0]
encrypted_file_name = ARGV[1]
message = File.open("./lib/#{message_file_name}", "r").read
decrypted_message_object = Enigma.new(message)
decrypted_message = encrypted_message_object.decrypt
decrypted_file = File.open("./lib/#{decrypted_file_name}", "w")
decrypted_file.write(encrypted_message)
decrypted_file.close
puts "Created #{decrypted_file_name} with the key #{decrypted_message_object.key} and date #{encrypted_message_object.date}"
