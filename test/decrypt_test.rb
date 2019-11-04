require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encryption_key'
require 'pry'
require 'mocha/minitest'

class DecryptTest < MiniTest::Test
  def setup
    @message =
    @key = EncryptionKey.new("011119")
    @key.stubs(:random_number_generator).returns([1,2,3,4,5])
    @decrypt = Decrypt.new(@key.offset_maker, @message)
  end
end
