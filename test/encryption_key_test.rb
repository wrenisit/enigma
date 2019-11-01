require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption_key'
require 'pry'

class EncryptionKeyTest < MiniTest::Test
  def test_it_exists
    encryption_key = EncryptionKey.new
    assert_instance_of EncryptionKey, encryption_key
  end

  def test_it_makes_random_number
    encryption_key = EncryptionKey.new
    assert_equal 5, encryption_key.random_number_generator.length
  end
end
