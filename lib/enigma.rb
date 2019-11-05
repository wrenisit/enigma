class Enigma
  attr_reader :message, :key, :date
  def initialize(message, key = random_number_generator, date = Time.now.strftime("%d%m%y"))
    @message = message
    @key = key
    @date = date
    @encryption_key = EncryptionKey.new(@key, @date)
    @encryption_key = @encryption_key.offset_maker
    @encryption_work = Encryption.new(@encryption_key, @message)
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
end
