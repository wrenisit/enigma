class Enigma
  attr_reader :message, :key, :date
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @encryption_key = EncryptionKey.new(@key, @date)
    @encryption_key = @encryption_key.offset_maker
    @encryption_work = Encryption.new(@encryption_key, @message)
  end

  def encrypt
    @encryption_work.secret_message
  end
end
