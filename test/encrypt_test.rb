require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require './lib/encryption_key'
require 'pry'
require 'mocha/minitest'

class EncryptTest < MiniTest::Test
  def setup
    @message = "hello world"
    @key = EncryptionKey.new("011119")
    @key.stubs(:random_number_generator).returns([1,2,3,4,5])
    @encrypt = Encrypt.new(@key.offset_maker, @message)
  end
  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_initialization_data
    assert_equal 4, @encrypt.encryption_key.count
    assert_equal @message, @encrypt.message
  end

end
