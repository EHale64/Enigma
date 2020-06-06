require 'date'
class Enigma
  def rand_key
    rand(99999)
  end

  def zero_pad(number)
    pad_num = number.to_s
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
