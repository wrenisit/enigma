require_relative 'test_helper'
require './lib/decryption'
require './lib/encryption_key'


class DecryptionTest < MiniTest::Test
  def setup
    @message = "keder ohulw"
    @key = EncryptionKey.new("02715", "040895")
    @decryption = Decryption.new(@message, @key.offset_maker, @message)
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end

  def test_it_initializes
    assert_equal @message, @decryption.message
    expected = {:a=>3, :b=>27, :c=>73, :d=>20}
    assert_equal expected, @decryption.decryption_key
  end

  def test_it_decrypts_messages
    assert_equal "hello world", @decryption.known_message(@message)
  end

  def test_known_message
    assert_equal @message, @decryption.message
    assert_equal "hello world", @decryption.known_message(@message)
  end

  def test_alphabet_array
    assert_equal 27, @decryption.alphabet_array.count
  end

end
