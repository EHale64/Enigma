require './test/test_helper'
require './lib/enigma'
require './lib/shifts'
require 'mocha/minitest'

class ShiftsTest < Minitest::Test
  def setup
    @shifts = Shifts.new
  end

  def test_it_exists
    assert_instance_of Shifts, @shifts
  end

  def test_it_can_generate_a_0_padded_key
    assert_equal "12715", @shifts.zero_pad(12715)
    assert_equal "02715", @shifts.zero_pad(2715)
    assert_equal "00715", @shifts.zero_pad(715)
    assert_equal "00015", @shifts.zero_pad(15)
    assert_equal "00005", @shifts.zero_pad(5)
    assert_equal "00000", @shifts.zero_pad(0)
  end

  def test_it_can_split_key_into_keys
    assert_equal ["02", "27", "71", "15"], @shifts.shift_keys("02715")
  end

  def test_it_can_get_date
    Date.stubs(:today).returns(Date.new(1995, 8, 4))
    assert_equal "040895", @shifts.date
  end
end
