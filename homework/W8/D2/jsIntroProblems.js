function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  console.log(x);
}


function mysteryScoping5() {
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(word1, word2, word3) {
	console.log(`We shall ${word1.toUpperCase()} the ${word2.toUpperCase()} ${word3.toUpperCase()}`)
}

function isSubstring(string, substring) {
	if (string.includes(substring)) {
		return true 
	}
	return false 
}

function fizzBuzz(array) {
	let finarr = [];
	array.forEach(el => {
		if (el % 3 === 0 && el % 5 !== 0) {
			finarr.push(el);
		}
		else if (el % 3 !== 0 && el % 5 === 0) {
			finarr.push(el);
		}
	})
	return finarr
}

function isPrime(num) {
	for (i = 2; i < num; i++) {
		if (num % i === 0) {
			return false 
		}
	}
	return true 
}

function sumOfNPrimes(num) {
	let x = 0;
	let i = 0;
	let j = 2;
	while (i < num) {
		if (isPrime(j)) {
			x += j;
			i++;
		}
		j++;
	}
	return x 
}

