BEGIN {
  print "Exercise 2"

  printf "" > "holiday.txt"
  printf "" > "oncemore.txt"
  printf "" > "simulate.txt"

  while ((getline < "results.txt") > 0) results[$1] = $2
  while ((getline < "students.txt") > 0) {
    file = ($3 in results)? ((results[$3] < 3.0)? "oncemore.txt" : "holiday.txt") : "simulate.txt"
    print $1, $2 >> file
  }
}
