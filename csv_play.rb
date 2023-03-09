require "csv"

# BELOW: .foreach is like .each for CSV
# headers: true indicates that the CSV files uses headers and repeats the header for each output
# headers defaults to false unless told otherwise
CSV.foreach("play.csv", headers: true, col_sep: ",") { |row| puts row }