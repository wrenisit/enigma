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

  def offset_maker(random_number)
    date = date_offset_calculator
    encryption_key = {}
    encryption_key[:a] = (date[0].to_i + random_number[0...2].join.to_i)
    encryption_key[:b] = (date[1].to_i + random_number[1...3].join.to_i)
    encryption_key[:c] = (date[2].to_i + random_number[2...4].join.to_i)
    encryption_key[:d] = (date[3].to_i + random_number[3...5].join.to_i)
    encryption_key
  end
end
