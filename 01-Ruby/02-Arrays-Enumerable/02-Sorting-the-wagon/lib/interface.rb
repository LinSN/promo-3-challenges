require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name
  students << name if name !=""
  # TODO: Add the name we just gotto the students array

end while name != ""
  classified_wagon = wagon_sort(students)

  print "Congratulations! Your Wagon has #{students.size} students :  "
  puts classified_wagon[0..students.size-2].join(", ") + " and " + classified_wagon.last


# TODO: Call `wagon_sort` method and display the sorted student list
