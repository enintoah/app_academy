// Function.prototype.curry = function(num) {
//   let numbers = [];
//   let that = this
//   return function sum(next) {
//     numbers.push(next);
//     num -= 1;
//     if (num === 0) {
//       return that.apply(that, numbers)
//     }
//     else {
//       return sum;
//     }
//   }
// }

Function.prototype.curry = function(num) {
  let numbers = [];
  let that = this
  return function sum(...next) {
    numbers = numbers.concat(next);
    num -= 1;
    if (num === 0) {
      return that(...numbers);
    }
    else {
      return sum;
    }
  }
}


function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

console.log(sumThree(4, 20, 6)); 

let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
console.log(f1 = f1(6)); // = 30

console.log(sumThree.curry(3)(4)(20)(6))