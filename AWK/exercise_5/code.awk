BEGIN { print "Exercise 5" }
      { for(i = 1; i <= NF; i++) {
          if(match($(i), "^[A-Z]\\..")) {
            printf("%s %s ", substr($(i), 3), substr($(i), 1, 2))
          } else {
            printf("%s ", $(i))
          }
        }
      }
      { print "" }
