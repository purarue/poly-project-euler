const LOWER_BOUND: u64 = 3;
const UPPER_BOUND_GUESS: u64 = 99999;

fn factorial(n: u64) -> u64 {
    if n < 2 {
        1
    } else {
        n * factorial(n - 1)
    }
}

fn digit_factorial(n: u64) -> u64 {
    n.to_string()
        .chars()
        .map(|d| d.to_digit(10).unwrap() as u64)
        .map(factorial)
        .sum()
}

fn is_curious_number(n: u64) -> bool {
    digit_factorial(n) == n
}

fn main() {
    println!(
        "{}",
        (LOWER_BOUND..UPPER_BOUND_GUESS)
            .filter(|&x| is_curious_number(x))
            .sum::<u64>()
    )
}
