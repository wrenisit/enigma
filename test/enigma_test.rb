require_relative 'test_helper'
require './lib/encryption'
require './lib/encryption_key'
require './lib/decryption'
require './lib/enigma'


class EnigmaTest < MiniTest::Test
  def test_it_exists
    enigma = Enigma.new("hello", "12345", "041119")
    assert_instance_of Enigma, enigma
  end

  def test_initialize_data
    enigma = Enigma.new("hello", "12345", "041119")
    assert_equal "hello", enigma.message
    assert_equal "12345", enigma.key
    assert_equal "041119", enigma.date
  end

  def test_it_can_encrypt
    enigma = Enigma.new("hello world", "02715", "040895")
    assert_equal "keder ohulw", enigma.encrypt
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
  end

  def test_random_number_generator
    enigma = Enigma.new("hello world")
    assert_equal String, enigma.random_number_generator.class
  end

end
