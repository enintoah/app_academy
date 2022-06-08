function doubler(num) {
  return num * 2;
}

Array.prototype.myMap = function(callback) {
  let finarr = [];
    this.myEach(el => {
        finarr.push(callback(el))
    })
    return finarr
}

Array.prototype.myEach = function(callback) {
    for (i = 0; i < this.length; i++) {
      callback(this[i])
    }
}

Array.prototype.myReduce = function(callback, ele) {
  let accumulator = 0
  if (ele === undefined) {
    accumulator = this[0]
    for(i = 1; i < this.length; i++) {
      accumulator = callback(accumulator, this[i])
    }
  }
  else {
    accumulator = ele
    this.myEach(el => {
      accumulator = callback(accumulator, el)
    })
  }
  return accumulator
}

function add(acc, el) {
  if (acc > el) {
    return acc; 
  }
  else {
    return el; 
  }
}

