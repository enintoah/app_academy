const View = require("./ttt-view.js")
const Game = require("./../ttt_node/game.js");
const Board = require("../ttt_node/board.js");

window.View = View; 
window.Game = Game;

document.addEventListener("DOMContentLoaded", () => {
  console.log("DOM IS LOADED")
  const ttt_figure = document.getElementsByClassName("ttt")[0]
  const game = new Game()
  const view = new View(game, ttt_figure)
});
