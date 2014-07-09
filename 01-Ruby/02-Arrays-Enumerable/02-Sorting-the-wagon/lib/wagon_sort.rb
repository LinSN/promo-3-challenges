def wagon_sort(students)
  students.sort_by {|x| [x.downcase, x]}
  # TODO: return a copy of students, sorted alphabetically
end
