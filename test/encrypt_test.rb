require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require './lib/encryption_key'
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

  def test_it_makes_alphabet_array
    assert_equal 27, @encrypt.alphabet_array.count
    assert_equal "a", @encrypt.alphabet_array.first
    assert_equal " ", @encrypt.alphabet_array.last
  end

  def test_rotate_method
    assert_equal "c", @encrypt.rotate(2)
    assert_equal "m", @encrypt.rotate(12)
    assert_equal " ", @encrypt.rotate(26)
    assert_equal "c", @encrypt.rotate(29)
    assert_equal "a", @encrypt.rotate(54)
  end

  def test_shift_start_point
    assert_equal 2, @encrypt.shift_start_point("c")
    assert_equal 10, @encrypt.shift_start_point("k")
    assert_equal 26, @encrypt.shift_start_point(" ")
  end

  def test_find_which_key_fits
    assert_equal :a, @encrypt.find_which_key_fits
    assert_equal :b, @encrypt.find_which_key_fits
    assert_equal :c, @encrypt.find_which_key_fits
    assert_equal :d, @encrypt.find_which_key_fits
    assert_equal :a, @encrypt.find_which_key_fits
  end

  def test_secret_message
    expected = "vbydbxigeiq"
    assert_equal expected, @encrypt.secret_message(@message)
    assert_equal "lvfes bf bamoboxk", @encrypt.secret_message("this method works")
    assert_equal "vlajov!", @encrypt.secret_message("hooray!")
  end
end
