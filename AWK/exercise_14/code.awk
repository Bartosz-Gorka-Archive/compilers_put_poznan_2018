BEGIN { print "Exercise 14"
  while ((getline < "description.txt") > 0) {
    rows = $1
    columns = $2
  }

  while ((getline < "rectangle.txt") > 0) {
    read_rows_count++
    if(length($0) != columns) invalid = 1
    gsub(/x\ +x/, "_", $0)
    gsub(/x+/, "_", $0)
    if($0 != "_") invalid = 1
  }
  if(read_rows_count != rows) invalid = 1

  print invalid? "Invalid format" : "Correct file"
}
