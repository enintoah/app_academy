const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) { 
    rl.question("Please give us a number!:  ", response => {
      if (isNaN(response)) {
        console.log('get serious');
        return addNumbers(sum, numsLeft, completionCallback);
      }
      else {
        sum += parseInt(response);
        console.log(`New sum = ${sum}`);
        return addNumbers(sum, numsLeft - 1, completionCallback);
      }
    })
  }
  if (numsLeft === 0) {
    console.log(completionCallback(sum));
    rl.close()
  }
}


addNumbers(0, 3, sum => `Total Sum: ${sum}`);