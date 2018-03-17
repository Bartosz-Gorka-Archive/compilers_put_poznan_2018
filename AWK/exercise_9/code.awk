BEGIN                     { print "Exercise 9"    }
/^\$\$\$.*$/, /^!!!.*$/   { gsub(" ", "_"); print }
