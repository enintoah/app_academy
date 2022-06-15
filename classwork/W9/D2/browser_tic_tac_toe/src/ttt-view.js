const Board = require("../ttt_node/board");
const Game = require("../ttt_node/game");

class View {
  constructor(game, el) {
    this.el = el 
    this.game = game
    this.setupBoard()
    this.bindMove()
  }

  setupBoard() {
    const ul = document.createElement("ul")
    ul.classList.add("board")
    for (let i=0; i < 3; i++) {
      for (let j=0; j < 3; j++) {
        let li = document.createElement("li")
        li.dataset.pos = `[${i}, ${j}]`
        ul.append(li)
      }
    }
    this.el.append(ul)
  }

  bindMove(){
    // console.log(this)
    const list = document.getElementsByClassName("board")[0]
    list.addEventListener("click", this.handleClick.bind(this))
  }

  handleClick(e) {
    // debugger;
    e.preventDefault();
    let current = e.target
    this.makeMove(current)
  }

  makeMove(square) {
    let pos = square.dataset.pos 
    let game = this.game
    let cp = game.currentPlayer
    pos = this.change(pos)
    game.playMove(pos)
      if (cp === 'x') {
        square.classList.add("x")
      }
      else {
        square.classList.add("o")
    }
    this.gameOver()
  }

  gameOver() {
    let that = this
    let game = this.game
    if (game.isOver()) {
      debugger;
      const h2 = document.createElement("h2")
      if (game.winner() === "x") {
        debugger;
        h2.innerHTML = "X IS THE WINNER!!!!"
      }
      else if (game.winner() === "o") {
        h2.innerHTML = "O IS THE WINNER!!!!"
      }
      else {
        h2.innerHTML = "DRAW!!!!"
      }
      that.el.append(h2)
    }
  }

  change(str) {
    let finarr = [];
    for (let i=0; i<str.length; i++) {
      if (str[i] === '0') {
        finarr.push(0)
      }
      else if (str[i] === '1') {
        finarr.push(1)
      }
      else if (str[i] === '2') {
        finarr.push(2)
      }
    }
    return finarr
  }
}

module.exports = View;

