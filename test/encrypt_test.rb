require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require 'pry'
require 'mocha/minitest'

class EncryptTest < MiniTest::Test
  def test_it_exists
    encrypt = Encrypt.new
    assert_instance_of Encrypt, encrypt
  end
end
