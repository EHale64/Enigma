class Enigma

  def zero_pad(number)
    pad_num = number.to_s
    pad_num.insert(0, "0") until pad_num.size == 5
    pad_num
  end

  def rand_num
    rand(99999)
  end

  def shift_keys(key)
    keys = []
    key.chars.each_with_index do |char, index|
      next if index == 4
      keys << char + key[index + 1]
    end
    keys
  end
end
