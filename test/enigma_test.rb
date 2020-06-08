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
    @enigma.expects(:key).returns("02715")
    @enigma.stubs(:date).returns("040895")
    assert_equal expected, @enigma.alphabet
    assert_equal "02715" , @enigma.key
    assert_equal "040895" , @enigma.date
  end

  def test_it_can_get_string_from_indexes
    assert_equal "keder ohulw", @enigma.indexes_to_string([10, 31, 84, 31, 17, 53, 95, 34, 20, 38, 76])
  end

  def test_it_can_cipher
    assert_equal "keder ohulw", @enigma.cipher("HELLO WORLD", [3, 27, 73, 20])
  end

  def test_it_can_decipher
    assert_equal "hello world", @enigma.decipher("keder ohulw", [3, 27, 73, 20])
  end

  def test_it_ignores_non_alphabet_characters
    assert_equal "keder ohulw!&", @enigma.cipher("HELLO WORLD!&", [3, 27, 73, 20])
    assert_equal "hello world!&", @enigma.decipher("keder ohulw!&", [3, 27, 73, 20])
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

  def test_it_renders_output_as_hash
    expected =   {
     encryption: "keder ohulw",
     key: "02715",
     date: "040895"
                  }

    expected2 =   {
     decryption: "hello world",
     key: "02715",
     date: "040895"
                  }
    assert_equal expected, @enigma.encryption_output("keder ohulw", "02715", "040895")
    assert_equal expected2, @enigma.decryption_output("hello world", "02715", "040895")
  end

  def test_it_can_encrypt
    expected =   {
     encryption: "keder ohulw",
     key: "02715",
     date: "040895"
                  }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    expected = {
     decryption: "hello world",
     key: "02715",
     date: "040895"
              }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_with_todays_date
    expected =   {
     encryption: "nib udmcxpu",
     key: "02715",
     date: "080620"
                  }
    @enigma.stubs(:date).returns("080620")
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_with_todays_date
    expected = {
     decryption: "hello world",
     key: "02715",
     date: "080620"
              }
  @enigma.stubs(:date).returns("080620")
    assert_equal expected, @enigma.decrypt("nib udmcxpu", "02715")
  end

  def test_it_can_encrypt_with_default_key_and_date
    skip
    expected =   {
     encryption: "nib udmcxpu",
     key: "02715",
     date: "080620"
                  }
    @enigma.stubs(:key).returns(02715)
    assert_equal expected, @enigma.encrypt("hello world")
  end
end
