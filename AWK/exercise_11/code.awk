BEGIN { print "Exercise 11" }
BEGIN { printf("%-12s SUMA\n", "") }
      { printf("%-2s | %-2s | %-2s | %-2s\n", $1, $2, $3, ($1+$2+$3)) }
