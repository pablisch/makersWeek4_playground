require "csv"

# *** SECTION BELOW from ruby-doc https://ruby-doc.org/3.0.5/stdlibs/csv/CSV.html

# Parsing a string
string = "Pablo, 53\nSabina, 40\nGurutze, 47"
p CSV.parse(string) # => [["Pablo", "53"], ["Sabina", "40"], ["Gurutze", "47"]]
p CSV.parse_line(string) # => ["Pablo", "53"]
p string.parse_csv # => ["Pablo", "53"] returns first linen only

# Parsing via filepath - writing to new or exisitng csv file
string = "Pablo, 53\nSabina, 40\nGurutze, 47"
path = "new.csv"
File.write(path, string)

# Parsing via filepath - writing to user specified file
string = "Pablo, 53\nSabina, 40\nGurutze, 47"
puts "enter a filename without the .csv entension: "
path = "#{gets.chomp}.csv"
File.write(path, string)
# Read newly written file
p CSV.read(path)
# This can be outputed in a more informative way
puts "#{path} reads as #{CSV.read(path)}" # => <filename> reads as [["Pablo", "53"], ["Sabina", "40"], ["Gurutze", "47"]]
puts

# Output each row of a file
puts "*** output each row of a file ***"
CSV.foreach("play.csv") do |row|
  p row
end
puts

# output complete CSV table as an object - NOTE: I don't know how to work with the object!
puts "*** output a complete CSV table as an object ***"
p CSV.table("play.csv") # => #<CSV::Table mode:col_or_row row_count:3>
puts

# Simple genrating CSV - outputs string with line breaks
output_str = CSV.generate do |csv|
  csv << ["Pablo", "me"]
  csv << ["Barry", "father"]
  csv << ["Megan", "mother"]
  csv << ["Toby", "brother"]
end
p output_str # => "Pablo,me\nBarry,father\nMegan,mother\nToby,brother\n"
puts

# generate a single line of CSV
p CSV.generate_line(["Sabina", "female"]) # => "Sabina,female\n"
puts

# CSV extended Array method turns array into a CSV string
p ["Sabina", "female"].to_csv # => "Sabina,female\n"
puts

# The above is messy with nested arrays! 
p [["Sabina", "female"], ["Pablo", "male"]].to_csv # => "\"[\"\"Sabina\"\", \"\"female\"\"]\",\"[\"\"Pablo\"\", \"\"male\"\"]\"\n"
puts

# *** SECTION BELOW from https://medium.com/swlh/parsing-a-csv-file-in-ruby-6de8afd382c8 and own experimentation

# BELOW: .foreach is like .each for CSV
# foreach takes args such as the filename, headers and column separators
# headers: true indicates that the CSV files uses headers and repeats the header for each output
# headers defaults to false unless told otherwise
# col_seps... in this case it doesn't seem to matter what i put as the col sep!
CSV.foreach("play.csv", headers: true, col_sep: ",") { |row| puts row }
puts

# No header arg needed when headers: false
CSV.foreach("play.csv", col_sep: ",") { |row| puts row }
puts

# In this case, removing col-sep makes no difference
CSV.foreach("play.csv") { |row| puts row }
puts

# writing CSV date from a file to an local array
data_arr = []
CSV.foreach("play.csv") { |row| data_arr << row }
p data_arr
puts

# 
nest = [%w[Pablo male teacher], %w[Sabina female teacher], %w[Gurutze female teacher]]
CSV.open("teachers.csv", "w") do |csv|
  nest.each { |row| csv << row }
end
CSV.foreach("teachers.csv") { |row| p row }
puts


# adding a local line to the same array
# puts "Give a name: "
# name = gets.chomp.capitalize
# puts "Give their age: "
# age = gets.chomp
# puts "Give their gender, m or f: "
# gender = gets.chomp.downcase
# gender = gender == "m" ? "male" : gender == "f" ? "female" : "unknown"
# data_arr << [name, age, gender]
# p data_arr
# puts

# add a series of entries... destination not configured
# array = []
# loop do
#   puts "Give a name: "
#   name = gets.chomp.capitalize
#   break if name == "Q" or name == "X"
#   puts "Give their age: "
#   age = gets.chomp
#   puts "Give their gender, m or f: "
#   gender = gets.chomp.downcase
#   gender = gender == "m" ? "male" : gender == "f" ? "female" : "unknown"
#   array << {name: name, age: age, gender: gender}
#   p array
# end

