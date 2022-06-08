Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    this.forEach((el, index) => {
      if (el > this[index + 1] && (index + 1) < (this.length)) {
        [this[index], this[index + 1]] = [this[index + 1], this[index]]
        sorted = false;
      }
    })
  }
  return this 
}

String.prototype.substrings = function() {
    let finarr = [];
    let i = 0;
    let j = 0;
    while (i <= this.length) {
        while (j <= this.length) {
            if (j > i) {
                finarr.push(this.substring(i, j))
            }
            j++; 
        }
        i++;
        j = i + 1; 
    }
    return finarr 
}

