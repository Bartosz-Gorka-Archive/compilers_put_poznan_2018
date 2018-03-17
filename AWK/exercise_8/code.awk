BEGIN            { print "Exercise 8"                           }
"#replace .* .*" { replace[$2] = $3; next                       }
                 { for(i in replace) gsub(i, replace[i]); print }
