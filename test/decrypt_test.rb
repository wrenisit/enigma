require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encryption_key'
require 'pry'
require 'mocha/minitest'

class DecryptTest < MiniTest::Test
  def setup
    @message = "vbydbxigeiq"
    @key = EncryptionKey.new("011119")
    @key.stubs(:random_number_generator).returns([1,2,3,4,5])
    @decrypt = Decrypt.new(@key.offset_maker, @message)
  end

  def test_it_exists
    assert_instance_of Decrypt, @decrypt
  end

  def test_it_initializes
    assert_equal @message, @decrypt.message
    expected = {a:14 , b:24 , c:40 , d:46}
    assert_equal expected, @decrypt.decryption_key
  end

  def test_it_decrypts_messages
    assert_equal "hello world", @decrypt.secret_messages(@message)
  end
end
