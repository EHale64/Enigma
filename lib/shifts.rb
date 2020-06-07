require 'date'
class Shifts

  def initialize(key, date)
    @key = key
    @date = date
  end

  def zero_pad(key)
    pad_num = key.to_s
    pad_num.insert(0, "0") until pad_num.size == 5
    pad_num
  end

  def shift_keys(key)
    keys = []
    key.chars.each_with_index do |char, index|
      next if index == 4
      keys << char + key[index + 1]
    end
    keys
  end

  def date
    date = Date.today.strftime("%d%m%y")
  end
end
