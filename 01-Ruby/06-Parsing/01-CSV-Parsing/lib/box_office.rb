#Encoding: utf-8
require 'csv'

def most_successfull(number, max_year, file_name)
  csv_options = { col_sep: ',',encoding:"ISO-8859-1:UTF-8"}
  filepath    = file_name

  movies_max_year = []

  CSV.foreach(filepath, csv_options) do |row|
    if row[1].to_i < max_year
      movies_max_year << {name: row[0], year: row[1].to_i, earnings: row[2].to_i}
    end
  end

 movies_max_year.sort_by{ |row| row[2]}.first(number)
end
