class Shifts
  def zero_pad(key)
    pad_num = key.to_s
    pad_num.insert(0, "0") until pad_num.size == 5
    pad_num
  end
end
