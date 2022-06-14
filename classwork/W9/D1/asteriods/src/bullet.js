const MovingObject = require("./moving_object");
const Util = require("./utils")

function Bullet(hash) {
  MovingObject.call(this, hash)
  this.radius = 3;
  this.color = "#9370DB";
  this.vel = [0, 0]
}

Util.inherits(Bullet, MovingObject)

module.exports = Bullet; 