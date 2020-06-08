require 'date'
class Shifts
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end

  def shifts
    shifts = []
    produce_offsets.each_with_index do |element, index|
      shifts << element.to_i + shift_keys[index].to_i
    end
    shifts
  end

  def shift_keys
    keys = []
    @key.chars.each_with_index do |char, index|
      next if index == 4
      keys << char + @key[index + 1]
    end
    keys
  end

  def produce_offsets
    squared_date = @date.to_i * @date.to_i
    squared_date.to_s.chars.last(4)
  end

  def zero_pad(key = @key)
    pad_num = key.to_s
    pad_num.insert(0, "0") until pad_num.size == 5
    pad_num
  end
end
