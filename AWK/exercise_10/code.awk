BEGIN { print "Exercise 10"      }
      { for(i = 1; i <= NF; i++) {
          if($(i) != 0) {
            printf("%d", $(i))
            if(NF - i >= 1) printf("x")
            if(NF - i > 1) printf("^%d", NF - i)
          }

          if(i < NF && $(i) != 0) printf(" + ")
        }
      }
      { print "" }
