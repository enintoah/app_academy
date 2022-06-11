function sum(args) {
  let total = 0;
  for(let i = 0; i<arguments.length; i++){
      total += arguments[i];
  }
  return total;
}

function sum2(...args) {
  let total = 0;
  for(i = 0; i < args.length; i++) {
    total += args[i]
  }
  return total
}
