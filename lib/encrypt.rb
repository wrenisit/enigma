class Encrypt
  attr_reader :encryption_key, :message, :alphabet, :key_letter
  def initialize(encryption_key, message)
    @encryption_key = encryption_key
    @message = message
    @key_letter = [:a, :b, :c, :d]
  end

  def alphabet_array
    @alphabet = []
    ("a".."z").each { |letter|  alphabet << letter }
    @alphabet << " "
  end

  def rotate(number)
    alphabet_array
    @alphabet.rotate(number).first
  end

  def shift_start_point(letter)
    alphabet_array
    @alphabet.find_index(letter)
  end

   def find_which_key_fits
     this_key = @key_letter.first
     @key_letter.rotate!
     this_key
   end

  # def secret_message(message)
  #   require 'pry'; binding.pry
  #   message.chars.map do |letter|
  #     shift_start_point(letter)
  #
  #
  # end
end
