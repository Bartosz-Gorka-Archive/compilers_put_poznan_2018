BEGIN { print "Exercise 9" }
      { gsub(" ", "_") }
$0 ~ /^\$\$\$$/ { correct = 1; }
correct
$0 ~ /^!!!/ { correct = 0 }
