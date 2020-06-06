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

  def test_it_can_generate_a_random_number
    @enigma.stubs(:rand_num).returns(24689)
    assert_equal 24689 , @enigma.rand_num
  end

  def test_it_can_generate_a_0_padded_number
    assert_equal "24689", @enigma.zero_pad(24689)
    assert_equal "04689", @enigma.zero_pad(4689)
    assert_equal "00689", @enigma.zero_pad(689)
    assert_equal "00089", @enigma.zero_pad(89)
    assert_equal "00009", @enigma.zero_pad(9)
    assert_equal "00000", @enigma.zero_pad(0)
  end

  def test_it_can_split_number
    assert_equal ["24", "46", "68", "89"], @enigma.shift_keys("24689")
  end

end
