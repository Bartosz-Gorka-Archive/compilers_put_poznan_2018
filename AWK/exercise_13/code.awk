BEGIN { print "Exercise 13"
  while ((getline < "description.txt") > 0) {
    rows = $1
    columns = $2
  }

  while ((getline < "rectangle.txt") > 0) {
    if(length($0) != columns) invalid = 1
    gsub(/x*/, "x", $0)
    if($0 != "x") invalid = 1
    read_rows_count++
  }
  if(read_rows_count != rows) invalid = 1

  print invalid? "Invalid format" : "Correct file"
}
