BEGIN { print "Exercise 12" }
      { for(i = 3; i <= NF; i++) sum += $(i); printf("%-10s %-15s %d\n", $1, $2, sum); sum = 0 }
