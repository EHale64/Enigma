require 'date'
require_relative 'shifts'
class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = Array("a".."z")<< " "
  end

  def encrypt(string, key, date)
    shifts = Shifts.new(key, date)
    encryption_output(cipher(string, shifts.shifts), key, date)
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
