require_relative 'test_helper'
require './lib/encryption_key'


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
    encryption_key = EncryptionKey.new("24321", "011119")
    assert_equal "011119", encryption_key.date
  end

  def test_it_calculates_offset_from_date
    encryption_key = EncryptionKey.new("34920", "011119")
    assert_equal "2161", encryption_key.date_offset_calculator
    encryption_key = EncryptionKey.new("34920", "091293")
    assert_equal "1849", encryption_key.date_offset_calculator
  end

  def test_it_assigns_offsets
    encryption_key = EncryptionKey.new("011119")
    expected = {:a=>3, :b=>12, :c=>17, :d=>12}
    assert_equal expected.count, encryption_key.offset_maker.count
    encryption_key.stubs(:random_number_generator).returns([1,2,3,4,5])
    assert_equal expected, encryption_key.offset_maker
  end

  def test_default_date
    enigma_key = EncryptionKey.new
    assert_instance_of EncryptionKey, enigma_key
    assert_equal String, enigma_key.date.class
  end
end
