BEGIN       { print "Exercise 4" }
$0 !~ "^;"  { total_fields += NF }
END         { print total_fields }
