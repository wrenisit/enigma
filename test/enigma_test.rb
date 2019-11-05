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
end
