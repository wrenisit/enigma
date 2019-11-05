class EncryptionKey
  attr_reader :date, :key
  def initialize(key = random_number_generator.join, date = Time.now.strftime("%d%m%y"))
    @date = date
    @key = key
  end

  def random_number_generator
    numbers_generated = []
    5.times do |number|
      numbers_generated << (rand(0...9))
    end
    numbers_generated.join
  end

  def date_offset_calculator
    date = @date.to_i
    total = (date * date).to_s
    total[-4..-1]
  end

  def offset_maker
    date_offsets = date_offset_calculator
    encryption_key = {}
    encryption_key[:a] = (date_offsets[0].to_i + @key[0...2].to_i)
    #binding.pry
    encryption_key[:b] = (date_offsets[1].to_i + @key[1...3].to_i)
    encryption_key[:c] = (date_offsets[2].to_i + @key[2...4].to_i)
    encryption_key[:d] = (date_offsets[3].to_i + @key[3...5].to_i)
    encryption_key
  end
end
