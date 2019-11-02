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

  def date_offset_calculator
    date = @date.to_i
    total = (date * date).to_s
    total[-4..-1]
  end
  
end
