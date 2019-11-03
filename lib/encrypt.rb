class Encrypt
  attr_reader :encryption_key, :message
  def initialize(encryption_key, message)
    @encryption_key = encryption_key
    @message = message
  end

  def alphabet_array
    alphabet = []
    ("a".."z").each { |letter|  alphabet << letter }
    alphabet << " "
  end


end
