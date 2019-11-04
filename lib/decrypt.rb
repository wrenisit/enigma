require_relative 'encryption_help_module'
class Decrypt
  #include EncryptionHelpModule
  attr_reader :decryption_key, :message, :key_letter
  def initialize(decryption_key, message)
    @decryption_key = decryption_key
    @message = message
    @key_letter = [:a, :b, :c, :d]
  end

  def secret_messages(message)
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

  def alphabet_array
    @alphabet = []
    ("a".."z").each { |letter|  @alphabet << letter }
    @alphabet << " "
  end

  def shift_start_point(letter)
    alphabet_array
    @alphabet.find_index(letter)
  end

  def rotate(number)
    alphabet_array
    @alphabet.rotate(number).first
  end

  def find_which_key_fits
    this_key = @key_letter.first
    @key_letter.rotate!
    this_key
  end

  def drotate_number
    @decryption_key[find_which_key_fits]
  end
end
