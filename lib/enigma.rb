require 'date'
class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = Array("a".."z")<< " "
  end

  def cipher(string, shifts)
    indexes_plus_shifts = []
    to_indexes(string).each_with_index do |element, index|
      if element.class == String
        indexes_plus_shifts << element
      else
        indexes_plus_shifts << element + shifts[index%4]
      end
    end
    indexes_to_string(indexes_plus_shifts)
  end

  def decipher(string, shifts)
    indexes_plus_shifts = []
    to_indexes(string).each_with_index do |element, index|
      if element.class == String
        indexes_plus_shifts << element
      else
        indexes_plus_shifts << element - shifts[index%4]
      end
    end
    indexes_to_string(indexes_plus_shifts)
  end

  def to_indexes(string)
    string_array = string.downcase.chars
    string_array.map do |char|
      if @alphabet.include?(char) == false
        char = char
      else
        @alphabet.find_index(char)
      end
    end
  end

  def indexes_to_string(shifts)
    shifts.map do |number|
      if number.class == String
        number
      else
        @alphabet.rotate(number)[0]
      end
    end.join
  end

  def encryption_output(string, key, date)
    output = {}
    output[:encryption] = string
    output[:key] = key
    output[:date] = date
    output
  end

  def decryption_output(string, key, date)
    output = {}
    output[:decryption] = string
    output[:key] = key
    output[:date] = date
    output
  end
end
  # def rand_key
  #   rand(99999)
  # end
  #
  # def zero_pad(key)
  #   pad_num = key.to_s
  #   pad_num.insert(0, "0") until pad_num.size == 5
  #   pad_num
  # end
  #
  # def shift_keys(key)
  #   keys = []
  #   key.chars.each_with_index do |char, index|
  #     next if index == 4
  #     keys << char + key[index + 1]
  #   end
  #   keys
  # end
  #
  # def date
  #   date = Date.today.strftime("%d%m%y")
  # end
  #
  # def produce_offset(date)
  #   squared_date = date.to_i * date.to_i
  #   squared_date.to_s.chars.last(4)
  # end
  #
  # def shifts(key, date)
  #   key_array = shift_keys(zero_pad(key))
  #   offset = produce_offset(date)
  #   shifts = []
  #   offset.each_with_index do |element, index|
  #     shifts << element.to_i + key_array[index].to_i
  #   end
  #   shifts
  # end
