require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require './lib/encryption_key'
require 'pry'
require 'mocha/minitest'

class EncryptTest < MiniTest::Test
  def setup
    message = "hello world"
    key = EncryptionKey.new("040211")
    @encrypt = Encrypt.new(key, message)
  end
  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

end
