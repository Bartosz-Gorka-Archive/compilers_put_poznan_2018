BEGIN                 { print "Exercise 8"                              }
$0 ~ "#replace .* .*" { replace[$2] = $3; next                          }
                      { for(i in replace) gsub(i, replace[i]); print $0 }
