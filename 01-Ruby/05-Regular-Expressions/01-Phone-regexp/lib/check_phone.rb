def french_phone_number?(phone_number)
  # TODO: true or false?
  if phone_number.gsub(/\-|\s/, '') =~ /^0[1-9]\d{8}$/ || phone_number.gsub(/\-|\s/, '') =~ /^\+33\d{9}$/
    true
  else
    false
  end
end

puts french_phone_number?("0466456789")