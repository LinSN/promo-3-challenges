# Encoding: utf-8

def mail_joke(email)
  # TODO: Return a joke suited to the email provided
  email_match = email.match(/\A([-\w]+)\.?([-\w]+)?@(\w+).(\w+)\z/)
  if email.include?("@")
    if "#{email_match[3]}.#{email_match[4]}" == "lewagon.org"
      "Well done #{email_match[1]}, you're skilled and capable"
    elsif "#{email_match[3]}.#{email_match[4]}" == "gmail.com"
      "#{email_match[1]}, you're an average but modern person"
    elsif "#{email_match[3]}.#{email_match[4]}" == "live.com"
      "#{email_match[1]} #{email_match[2]}, aren't you born before 1973?"
    else
      "Sorry voyageurdufutur, we don't know how to judge '#{email_match[3]}.#{email_match[4]}'"
    end
  else
    raise ArgumentError
  end

end

puts mail_joke("boris@lewagon.org")