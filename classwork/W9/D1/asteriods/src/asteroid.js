const MovingObject = require("./moving_object");
const Util = require("./utils");

function Asteroid(hash) {
  MovingObject.call(this, hash)
  this.vel = Util.randomVec(5)
  this.color = "#FF1493",
  this.radius = 15
};

Util.inherits(Asteroid, MovingObject)

Asteroid.prototype.collideWith = function(otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate()
  }
}


module.exports = Asteroid; 