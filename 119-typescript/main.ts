const digit_sum = (n: number): number => {
  return n
    .toString()
    .split("")
    .map((d) => parseInt(d))
    .reduce((a, b) => a + b);
};

const solve = (subscript: number): number => {
  let results: number[] = [];
  for (let base = 2; base < 99999; base++) {
    for (let exp = 2; exp < 10; exp++) {
      const res = Math.pow(base, exp);
      if (digit_sum(res) == base) results.push(res);
    }
  }
  return results.sort((a, b) => a - b)[subscript - 1];
};

(() => {
  const { args } = Deno;
  console.log(solve(parseInt(args[0])));
})();
