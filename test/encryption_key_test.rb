require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption_key'
require 'pry'
require 'mocha/minitest'

class EncryptionKeyTest < MiniTest::Test
  def test_it_exists
    encryption_key = EncryptionKey.new("011119")
    assert_instance_of EncryptionKey, encryption_key
  end

  def test_it_makes_random_number
    encryption_key = EncryptionKey.new("011119")
    assert_equal 5, encryption_key.random_number_generator.length
    random_set_a = encryption_key.random_number_generator
    random_set_b = encryption_key.random_number_generator
    refute random_set_a == random_set_b
    assert_equal random_set_a.length, random_set_b.length
  end

  def test_it_takes_a_date
    encryption_key = EncryptionKey.new("011119")
    assert_equal "011119", encryption_key.date
  end

  def test_it_calculates_offset_from_date
    encryption_key = EncryptionKey.new("011119")
    assert_equal "2161", encryption_key.date_offset_calculator
    encryption_key = EncryptionKey.new("091293")
    assert_equal "1849", encryption_key.date_offset_calculator
  end

  def test_it_assigns_offsets
    encryption_key = EncryptionKey.new("011119")
    expected = {a:14 , b:24 , c:40 , d:46}
    assert_equal expected.count, encryption_key.offset_maker.count
  end
end
