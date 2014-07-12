def old_roman_numeral(an_integer)
  #TODO: translate integer in roman number - old-style way
roman_numbers = {
    'M' => 1000,
    'D' => 500,
    'C' => 100,
    'L' => 50,
    'X' => 10,
    'V' => 5,
    'I' => 1
}

  roman_string = ""

  roman_numbers.each do |key,value|
    quotient = an_integer.divmod(value)[0]
    an_integer = an_integer.divmod(value)[1]
    if quotient >= 1
      roman_string += key*quotient
    end
  end
  roman_string
end

def new_roman_numeral(an_integer)
  #TODO: translate integer in roman number - modern-style way
  integer_to_roman = {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }

    result = ""
    integer_to_roman.each do |key,value|
      quotient = an_integer.divmod(key)[0]
      modulus = an_integer.divmod(key)[1]
      result << value * quotient
      an_integer = modulus
    end
    result
end




puts old_roman_numeral(9)
puts new_roman_numeral(19)
