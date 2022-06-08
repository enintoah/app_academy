Array.prototype.uniq = function() { 
  let finarr = [];
  this.forEach(el => {
    if (finarr.includes(el)) {
    }
    else {
      finarr.push(el)
    }
  })
  return finarr;
}

Array.prototype.twoSum = function() {
  let finarr = []; 
  this.forEach((el1, idx1) =>{
    this.forEach((el2, idx2) => {
      if (idx2 > idx1 && el1 + el2 === 0) {
        finarr.push([idx1, idx2]);
      }
    })
  })
  return finarr
}

Array.prototype.transpose = function() {
  let finarr = []; 
  let i = 0;
  let j = 0;
  while (i < this[0].length) {
    let temparr = [];
    this.forEach(subarr => {
      temparr.push(subarr[i])
    })
    finarr.push(temparr)
    i++;
  }
  return finarr;
}


