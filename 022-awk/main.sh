#!/usr/bin/env sh

awk \
	'
# clean and sort input
BEGIN {
  RS=","  # set input record delimiter
}
{
  gsub("\"", "")  # remove double quotes
  arr[NR] = $1  # save name into array
}
END {
  asort(arr, sorted_arr);  # sort all input alphabetically
  # print names out alphabetically
  for (i = 1; i <= length(sorted_arr); i += 1) {
    print sorted_arr[i]
  }
}
' "./names.txt" | awk \
	'
# calulate the the result
BEGIN {
  convert="ABCDEFGHIJKLMNOPQRSTUVWXYZ"  # lookup map
  result = 0  # initialize final answer
}
  {
    name_score = 0
    for (i = 1; i < length($1) + 1; i += 1)
      name_score += index(convert, substr($1,i,1)) # lookup and add each letters score
    result += NR * name_score  # add (line number * name score) to final result
  }
END {
  print(result)
}
'
