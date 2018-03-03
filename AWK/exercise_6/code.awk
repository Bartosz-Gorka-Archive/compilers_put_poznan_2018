BEGIN               { print "Exercise 6"                    }
$3 ~ /[1-9][0-9]*/  { gsub(/\.|,/, "", $3); total += $3     }
END                 { printf("razem = %.2f\n", total / 100) }
