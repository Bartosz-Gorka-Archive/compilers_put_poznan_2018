BEGIN   { print "Exercise 1" }
NR == 1 { selectedColumn = $1; next }
        { print $(selectedColumn) }
