#include <stdio.h>

int square(int c) {
	return c * c;
}

int main() {
	int sum_of_squares = 0;
	int square_of_sums = 0;

	for (int i = 1; i <= 100; i++) {
		sum_of_squares += square(i);
		square_of_sums += i;
	}
	square_of_sums = square(square_of_sums);
	printf("%d\n", square_of_sums - sum_of_squares);
	return 0;
}
