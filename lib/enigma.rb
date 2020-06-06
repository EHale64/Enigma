class Enigma

  def pad(number)
    pad_num = number.to_s
    pad_num.insert(0, "0") until pad_num.size == 5
    pad_num
  end

  def rand_num
    rand(99999)
  end
end
