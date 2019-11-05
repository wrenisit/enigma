require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption'
require './lib/encryption_key'
require './lib/decryption'
require './lib/enigma'
require 'pry'
require 'mocha/minitest'

class EnigmaTest < MiniTest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_initialize_data
    enigma = Enigma.new("hello", "12345", "041119")
    assert_equal "hello", enigma.message
    assert_equal "12345", enigma.key
    assert_equal "041119", enigma.date
  end
end
