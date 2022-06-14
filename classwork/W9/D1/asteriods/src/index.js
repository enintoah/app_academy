console.log("Webpack is working!")

const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");
const Ship = require("./ship.js")
const Bullet = require("./bullet.js")

window.Asteroid = Asteroid; 
window.MovingObject = MovingObject;
window.Game = Game; 
window.GameView = GameView;
window.Ship = Ship;
window.Bullet = Bullet;

window.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  const canvas = document.getElementById("game-canvas");
  const ctx = canvas.getContext("2d");
  canvas.width = 900;
  canvas.height = 700;
  const gm1 = new GameView(ctx)
  window.gm1 = gm1
  gm1.start()
});


