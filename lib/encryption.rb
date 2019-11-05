require_relative "encryption_help_module"
class Encryption
  include EncryptionHelpModule
  attr_reader :encryption_key, :message, :alphabet, :key_letter
  def initialize(encryption_key, message)
    @encryption_key = encryption_key
    @message = message
    @key_letter = [:a, :b, :c, :d]
  end

  def secret_message(message)
    alphabet_array
    encrypted = []
    message.chars.map do |letter|
     if @alphabet.include?(letter)
       encrypted << rotate(rotate_number(letter))
     else
       encrypted << letter
     end
   end
   encrypted.join
  end
end
