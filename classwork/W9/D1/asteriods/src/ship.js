const Bullet = require("./bullet");
const MovingObject = require("./moving_object");
const Util = require("./utils");

function Ship(hash) {
    MovingObject.call(this, hash)
    this.radius = 10;
    this.color = "#9370DB";
    this.vel = [0, 0]
}

Util.inherits(Ship, MovingObject)

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition()
  this.vel = [0, 0]
}

Ship.prototype.power = function(impulse) {
    this.vel = [(this.vel[0] + impulse[0]), (this.vel[1] + impulse[1])]
}

Ship.prototype.fireBullet = function() {
  let b = new Bullet
}

module.exports = Ship; 