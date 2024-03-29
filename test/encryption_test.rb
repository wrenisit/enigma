require_relative 'test_helper'
require './lib/encryption'
require './lib/encryption_key'


class EncryptionTest < MiniTest::Test
  def setup
    @message = "hello world"
    @key = EncryptionKey.new("011119")
    @key.stubs(:random_number_generator).returns([1,2,3,4,5])
    @encryption = Encryption.new(@key.offset_maker, @message)
  end
  def test_it_exists
    assert_instance_of Encryption, @encryption
  end

  def test_initialization_data
    assert_equal 4, @encryption.encryption_key.count
    assert_equal @message, @encryption.message
  end

  def test_it_makes_alphabet_array
    assert_equal 27, @encryption.alphabet_array.count
    assert_equal "a", @encryption.alphabet_array.first
    assert_equal " ", @encryption.alphabet_array.last
  end

  def test_rotate_method
    assert_equal "c", @encryption.rotation(2)
    assert_equal "m", @encryption.rotation(12)
    assert_equal " ", @encryption.rotation(26)
    assert_equal "c", @encryption.rotation(29)
    assert_equal "a", @encryption.rotation(54)
  end

  def test_shift_start_point
    assert_equal 2, @encryption.shift_start_point("c")
    assert_equal 10, @encryption.shift_start_point("k")
    assert_equal 26, @encryption.shift_start_point(" ")
  end

  def test_find_which_key_fits
    assert_equal :a, @encryption.find_which_key_fits
    assert_equal :b, @encryption.find_which_key_fits
    assert_equal :c, @encryption.find_which_key_fits
    assert_equal :d, @encryption.find_which_key_fits
    assert_equal :a, @encryption.find_which_key_fits
  end

  def test_secret_message
    expected = "kqbxrlm uxu"
    assert_equal expected, @encryption.secret_message
  end
end
