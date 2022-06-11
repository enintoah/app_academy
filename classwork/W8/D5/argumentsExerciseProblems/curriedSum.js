function curriedSum(num) {
  let numbers = [];
  return function sum(next) {
    numbers.push(next);
    num -= 1;
    let total;
    if (num === 0) {
      return total = numbers.reduce((acc, ele) => {
        return acc + ele;
    })}
    else {
      return sum;
    }
  }
}


const equals = curriedSum(4);
console.log(equals(5)(30)(20)(1)); // => 56