require 'date'
require_relative 'shifts'
class Enigma
  attr_reader :alphabet, :key, :date

  def initialize
    @alphabet = Array("a".."z")<< " "
    @key = rand(99999).to_s
    @date = Date.today.strftime("%d%m%y")
  end

  def encrypt(string, key = @key, date = @date)
    shifts = Shifts.new(key, date)
    ciphered_string = cipher(string, shifts.shift_values)
    encryption_output(ciphered_string, key, date)
  end

  def decrypt(string, key, date = @date)
    shifts = Shifts.new(key, date)
    deciphered_string = decipher(string, shifts.shift_values)
    decryption_output(deciphered_string, key, date)
  end

  def cipher(string, shifts)
    transformed_indexes = transform_indexes(string, shifts, '+')
    indexes_to_string(transformed_indexes)
  end

  def decipher(string, shifts)
    transformed_indexes = transform_indexes(string, shifts, '-')
    indexes_to_string(transformed_indexes)
  end

  def to_indexes(string)
    string_array = string.downcase.chars
    string_array.map do |char|
      (char unless @alphabet.include?(char)) || @alphabet.find_index(char)
    end
  end

  def indexes_to_string(shifts)
    shifts.map do |number|
      (number if number.class == String) || @alphabet.rotate(number)[0]
    end.join
  end

  def transform_indexes(string, shifts, operator)
    indexes_plus_shifts = []
    to_indexes(string).each_with_index do |element, index|
      if element.class == String
        indexes_plus_shifts << element
      else
        indexes_plus_shifts << element.send(operator, shifts[index%4])
      end
    end
    indexes_plus_shifts
  end

  def encryption_output(string, key, date)
    {
      encryption: string,
      key: key,
      date: date
    }
  end

  def decryption_output(string, key, date)
    {
      decryption: string,
      key: key,
      date: date
    }
  end
end
