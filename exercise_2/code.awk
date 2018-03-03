BEGIN {
  print "Exercise 2"

  printf("") > "holiday.txt"
  printf("") > "oncemore.txt"
  printf("") > "simulate.txt"

  while ((getline < "results.txt") > 0) {
    results[$1] = $2
  }

  while ((getline < "students.txt") > 0) {
    if ($3 in results) {
      if (results[$3] < 3.0) {
        print $1, $2 >> "oncemore.txt"
      } else {
        print $1, $2 >> "holiday.txt"
      }
    } else {
      print $1, $2 >> "simulate.txt"
    }
  }
}
