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

  def test_it_can_generate_a_random_key
    @enigma.stubs(:rand_key).returns(24689)
    assert_equal 24689 , @enigma.rand_key
  end

  def test_it_can_generate_a_0_padded_key
    assert_equal "24689", @enigma.zero_pad(24689)
    assert_equal "04689", @enigma.zero_pad(4689)
    assert_equal "00689", @enigma.zero_pad(689)
    assert_equal "00089", @enigma.zero_pad(89)
    assert_equal "00009", @enigma.zero_pad(9)
    assert_equal "00000", @enigma.zero_pad(0)
  end

  def test_it_can_split_key_into_keys
    assert_equal ["24", "46", "68", "89"], @enigma.shift_keys("24689")
  end

  def test_it_can_get_date
    Date.stubs(:today).returns(Date.new(1990, 8, 16))
    assert_equal "160890", @enigma.date
  end

  def test_it_produces_offset_from_date
    assert_equal ["2", "1", "0", "0"], @enigma.produce_offset("160890")
  end

  def test_it_can_add_key_and_offset
    assert_equal [26, 47, 68, 89], @enigma.shifts("24689", "160890")
  end
end
