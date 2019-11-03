class Encrypt
  attr_reader :encryption_key, :message
  def initialize(encryption_key, message)
    @encryption_key = encryption_key
    @message = message
  end
end
