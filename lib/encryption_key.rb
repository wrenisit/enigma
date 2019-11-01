class EncryptionKey
  attr_reader :date
  def initialize(date)
    @date = date
  end

  def random_number_generator
    numbers_generated = []
    5.times do |number|
      numbers_generated << (rand(0...9))
    end
    numbers_generated
  end
end
