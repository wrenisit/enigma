require_relative 'encryption_help_module'
class Decryption
  include EncryptionHelpModule
  attr_reader :decryption_key, :message, :key_letter
  def initialize(decryption_key, message)
    @decryption_key = decryption_key
    @message = message
    @key_letter = [:a, :b, :c, :d]
  end

  def known_message(message)
    alphabet_array
    changed_message = []
    message.chars.map do |letter|
     if @alphabet.include?(letter)
       changed_message << rotate(shift_start_point(letter) - @decryption_key[find_which_key_fits])
     else
       changed_message << letter
     end
   end
   changed_message.join
  end
end
