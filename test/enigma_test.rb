require './test/test_helper'
require './lib/enigma'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
       "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end

  def test_it_can_get_string_from_indexes
    skip
    assert_equal "keder ohulw", @enigma.indexes_to_string([10, 31, 84, 31, 17, 53, 95, 34, 20, 38, 76])
  end

  def test_it_can_cipher
    skip
    assert_equal "keder ohulw", @enigma.cipher("HELLO WORLD", [3, 27, 73, 20])
  end

  def test_it_can_decipher
    skip
    assert_equal "hello world", @enigma.decipher("keder ohulw", [3, 27, 73, 20])
  end

  def test_it_ignores_non_alphabet_characters
    assert_equal "keder ohulw!", @enigma.cipher("HELLO WORLD!", [3, 27, 73, 20])
    assert_equal "hello world!", @enigma.decipher("keder ohulw!", [3, 27, 73, 20])
  end

  def test_it_can_get_indexes
    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
    assert_equal expected, @enigma.to_indexes("HELLO WORLD")
  end

  def test_it_can_add_shifts_to_indexes
    skip
    expected = [10, 31, 84, 31, 17, 53, 95, 34, 20, 38, 76]
    assert_equal expected, @enigma.("HELLO WORLD", [3, 27, 73, 20])
  end


  def test_it_can_generate_a_random_key
    skip
    @enigma.stubs(:rand_key).returns(02715)
    assert_equal 02715 , @enigma.rand_key
  end

  def test_it_can_generate_a_0_padded_key
    skip
    assert_equal "12715", @enigma.zero_pad(12715)
    assert_equal "02715", @enigma.zero_pad(2715)
    assert_equal "00715", @enigma.zero_pad(715)
    assert_equal "00015", @enigma.zero_pad(15)
    assert_equal "00005", @enigma.zero_pad(5)
    assert_equal "00000", @enigma.zero_pad(0)
  end

  def test_it_can_split_key_into_keys
    skip
    assert_equal ["02", "27", "71", "15"], @enigma.shift_keys("02715")
  end

  def test_it_can_get_date
    skip
    Date.stubs(:today).returns(Date.new(1995, 8, 4))
    assert_equal "040895", @enigma.date
  end

  def test_it_produces_offset_from_date
    skip
    assert_equal ["1", "0", "2", "5"], @enigma.produce_offset("040895")
  end

  def test_it_can_add_key_and_offset
    skip
    assert_equal [3, 27, 73, 20], @enigma.shifts("02715", "040895")
  end
end
