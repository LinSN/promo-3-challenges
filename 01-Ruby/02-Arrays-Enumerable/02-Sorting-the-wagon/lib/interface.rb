require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name
  students << name if name !=""
  # TODO: Add the name we just gotto the students array

end while name != ""

def final_sentence(param,tab)
  if param==wagon_sort(tab).last
    print "and #{param}."
  elsif param==wagon_sort(tab).last(2).first
    print "#{param} "
   else
    print "#{param}, "
  end
end

  print "Congratulations! Your Wagon has #{students.size} students :  "
  wagon_sort(students).each{|x| final_sentence(x,students)}


# TODO: Call `wagon_sort` method and display the sorted student list
