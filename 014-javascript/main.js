class Collatz {
  constructor(num) {
    this.num = num;
    this.chain_length = 1;
  }

  done() {
    return this.num == 1;
  }

  next() {
    if (this.num % 2 == 0) {
      this.num = this.num / 2;
    } else {
      this.num = 3 * this.num + 1;
    }
    this.chain_length++;
  }

  find_chain_length() {
    while (!this.done()) {
      this.next();
    }
    return this.chain_length;
  }
}

let longest_chain = 1;
let longest_chain_length = 1;

for (let i = 2; i < 1000000; i++) {
  let i_chain_length = new Collatz(i).find_chain_length();
  if (i_chain_length > longest_chain_length) {
    longest_chain = i;
    longest_chain_length = i_chain_length;
  }
}

console.log(longest_chain);
