BEGIN   { print "Exercise 3" }
NR == 1 { printf("%s  a+b*c\n", $0); next }
        { printf("%s  %d\n", $0, ($1 + $2 * $3)) }
