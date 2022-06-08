// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let arr = new Array(8).fill().map(() => new Array(8).fill());
  arr[3][3] = new Piece("white")
  arr[4][4] = new Piece("white")
  arr[4][3] = new Piece("black")
  arr[3][4] = new Piece("black")
  return arr
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  // pos.forEach(i => {
  //   if (i < 0 || i > 7) {
  //     return false 
  //   }
  // })
  // return true 
   if (pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7) {
      return false ;
    }
    else {
      return true ;
    }
  }
 


/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw new Error ('Not valid pos!');
  } else {
    return this.grid[pos[0]][pos[1]]
  }

};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.grid[pos[0]][pos[1]] === undefined) {
    return false
  }
  return (this.grid[pos[0]][pos[1]].color === color)
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !(this.grid[pos[0]][pos[1]] === undefined) 
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip=[]){
  let next = helper(pos, dir)
  if (!this.isValidPos(next)) {
    return []
  } 
  if (!this.isOccupied(next)) {
    return []
  }
  if (!this.isMine(next, color)) {
    piecesToFlip.push(next)
    return this._positionsToFlip(next, color, dir, piecesToFlip)
  }
  if (this.isMine(next, color)) {
    return piecesToFlip
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  let arr;
  if (this.isOccupied(pos)) {
    return false
  }
  let valid = false
  Board.DIRS.forEach (el => {
    arr = this._positionsToFlip(pos, color, el)
    if (arr.length > 0) {
      valid = true 
    }
  })
  return valid
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  let arr = [];
  if (!this.validMove(pos, color)) {
    throw new Error ('Invalid move!');
  }
  Board.DIRS.forEach (el => {
    arr.push(this._positionsToFlip(pos, color, el))
  })
  let newArr = arr.flat(1)
  newArr.forEach(el => {
    this.grid[el[0]][el[1]].flip()
  })
  this.grid[pos[0]][pos[1]] = new Piece(color)
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let newArr = [];
  for(i=0;i<7;i++) {
    for(j=0;j<7;j++) {
      if (this.validMove([i, j], color)) {
        newArr.push([i, j])
      }
    }
  }
  return newArr
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  let arr = this.validMoves(color)
  if (arr.length > 0) {
    return true 
  }
  return false 
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (this.hasMove("white") || this.hasMove("black")) {
    return false 
  }
  return true 
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  this.grid.forEach (row => 
    console.log(row))
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE



function helper(pos, dir) {
  const newPos = [];
  newPos.push(pos[0] + dir[0]);
  newPos.push(pos[1] + dir[1]);
  return newPos;
}

