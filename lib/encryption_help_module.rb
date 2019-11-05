module EncryptionHelpModule

  def alphabet_array
    @alphabet = []
    ("a".."z").each { |letter|  @alphabet << letter }
    @alphabet << " "
  end

  def shift_start_point(letter)
    alphabet_array
    @alphabet.find_index(letter)
  end

  def rotation(number)
    alphabet_array
    @alphabet.rotate(number).first
  end

  def find_which_key_fits
    this_key = @key_letter.first
    @key_letter.rotate!
    this_key
  end

  def rotate_number(letter, encryption_key)
    #binding.pry
    encryption_key[find_which_key_fits] + shift_start_point(letter)
  end
end
