class Enigma
  attr_reader :message, :key, :date
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def encrypt
    encryption_key = EncryptionKey.new(@key, @date)
    encryption_work = Encryption.new(encryption_key, @message)
    encryption_work.secret_message
  end
end
