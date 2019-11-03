class Encrypt
  attr_reader :encryption_key, :message, :alphabet
  def initialize(encryption_key, message)
    @encryption_key = encryption_key
    @message = message
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
end
