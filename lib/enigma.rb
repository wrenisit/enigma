require './lib/encryption_key'
require './lib/encryption'
require './lib/decryption'


class Enigma
  attr_reader :message, :key, :date
  def initialize(message, key = random_number_generator, date = Time.now.strftime("%d%m%y"))
    @message = message
    @key = key
    @date = date
    @encryption_key = EncryptionKey.new(@key, @date)
    @encryption_key = @encryption_key.offset_maker
    @encryption_work = Encryption.new(@encryption_key, @message)
    @decryption = Decryption.new(@message, @encryption_key, @date)
  end

  def random_number_generator
    numbers_generated = []
    5.times do |number|
      numbers_generated << (rand(0...9))
    end
    numbers_generated.join
  end

  def encrypt
    @encryption_work.secret_message
  end

  def decrypt
    @decryption.known_message(@message)
  end
end
