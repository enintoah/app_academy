function range(start, end) {
  if (start === end) {
    return [end]
  }
  return arr = [start].concat(range(start + 1, end))
}


function sumRec(arr) {
    if (arr.length === 1) {
      return arr[0]
    }
    first = arr.pop()
    return first + sumRec(arr)
}


function exponent1(base, exp){
    if (exp === 1) {
      return base
    }
    return base * exponent1(base, exp - 1)
}

function exponent2(base, exp){
    if (exp === 1) {
        return base
    }

    if (exp % 2 === 0) {
        return exponent2((base, exp / 2) ** 2)
    } 
    
    else{
        return base * exponent2(base, (exp -1)/ 2) ** 2
    }
}

function fibonnaci(n){
    if (n < 2){
        return [1]
    }
    else if (n < 3){
        return [1, 1]
    }
    let a = fibonnaci(n - 1)

    a.push(a[n - 2] + a[n - 3]);
    return a;
}

Array.prototype.deepDup = function (){  
    let finarr = [];
    this.forEach(el =>{
        if (Array.isArray(el)) {
          finarr.push(el.deepDup())
        }
        else {
          finarr.push(el)
        }
    }) 
    return finarr
}

function bsearch(arr, target) {
  
}