require "csv"

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

array = []
loop do
  puts "Give a name: "
  name = gets.chomp.capitalize
  break if name == "Quit" or name == "Exit"
  puts "Give their age: "
  age = gets.chomp
  puts "Give their gender, m or f: "
  gender = gets.chomp.downcase
  gender = gender == "m" ? "male" : gender == "f" ? "female" : "unknown"
  array << {name: name, age: age, gender: gender}
  p array
end

