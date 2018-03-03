BEGIN { print "Exercise 7"  }
      { i++; total += $(i); }
END   { print total         }
