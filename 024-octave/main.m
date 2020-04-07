#!/usr/bin/env octave

ans = sortrows(  # sort numerically on row values
    perms([1,2,3,4,5,6,7,8,9,0])  # get all permutations
)(1000000, :);  # get a millionth row

# format nicely and print
printf("%s\n", strrep(int2str(ans), " ", ""))

