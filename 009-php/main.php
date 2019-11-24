<?php

// a^2 + b^2 = c^2
// a + b + c = 1000

// b = 1000 - (a + c)
// b > a
// c > b

// since c > b > a, a must be less than 1000/3 -1 (332)
// c has to be larger than b, which is larger than a, so c > 334
// if a = 1, b = 2, 1 + 2 + c = 1000; c < 997

for ($c = 335; $c < 997; $c++) {
	for ($a = 1; $a < 333; $a++) {
		$b = 1000 - ($a + $c);
    if ($a < $b && $b < $c) {
      if (($a * $a) + ($b * $b) == ($c * $c)) {
        echo "$a + $b + $c = 1000\n";
        echo "$a * $b * $c = " . $a * $b * $c . "\n";
        exit(0);
      }
		}
	}
}
