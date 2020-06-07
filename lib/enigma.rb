require 'date'
class Enigma
  def rand_key
    rand(99999)
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

  def produce_offset(date)
    squared_date = date.to_i * date.to_i
    squared_date.to_s.chars.last(4)
  end

  def shifts(key, date)
    key_array = shift_keys(zero_pad(key))
    offset = produce_offset(date)
    shifts = []
    offset.each_with_index do |element, index|
      shifts << element.to_i + key_array[index].to_i
    end
    shifts
  end

  def to_indexes(string)
    alphabet = Array("a".."z")<< " "
    string_array = string.downcase.chars
    string_array.map do |char|
      alphabet.find_index(char)
    end
  end

  def shifted_indexes(string, shift)
    to_indexes(string).map do |number|
      number + shift
    end
  end

  def cipher(string, shift)
    alphabet = Array("a".."z")<< " "
    shifted_indexes(string, shift).map do |number|
      alphabet.rotate(number)[0]
    end.join
  end
end
