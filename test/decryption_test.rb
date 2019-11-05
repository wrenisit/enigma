require_relative 'test_helper'
require './lib/decryption'
require './lib/encryption_key'


class DecryptionTest < MiniTest::Test
  def setup
    @message = "vbydbxigeiq"
    @key = EncryptionKey.new("011119")
    @key.stubs(:random_number_generator).returns([1,2,3,4,5])
    @decryption = Decryption.new(@key.offset_maker, @message)
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end

  def test_it_initializes
    assert_equal @message, @decryption.message
    expected = {a:14 , b:24 , c:40 , d:46}
    assert_equal expected, @decryption.decryption_key
  end

  def test_it_decrypts_messages
    assert_equal "hello world", @decryption.known_message(@message)
  end
end
