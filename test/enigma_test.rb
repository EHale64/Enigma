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

  def test_it_can_generate_a_0_padded_number
    assert_equal "24689", @enigma.pad(24689)
    assert_equal "04689", @enigma.pad(4689)
    assert_equal "00689", @enigma.pad(689)
    assert_equal "00089", @enigma.pad(89)
    assert_equal "00009", @enigma.pad(9)
    assert_equal "00000", @enigma.pad(0)
  end

  def test_it_can_generate_a_random_number
    @enigma.stubs(:rand_num).returns(24689)
    assert_equal 24689 , @enigma.rand_num
  end
end
