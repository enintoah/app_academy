function MovingObject(hash) {
    this.pos = hash.pos;
    this.vel = hash.vel;
    this.radius = hash.radius;
    this.color = hash.color;
    this.game = hash.game
};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
}

MovingObject.prototype.move = function() {
  const pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]]  
  this.pos = this.game.wrap(pos)
}

MovingObject.prototype.isCollidedWith = function(otherObject) {
  let x1 = this.pos[0];
  let y1 = this.pos[1];
  let x2 = otherObject.pos[0];
  let y2 = otherObject.pos[1];
  const distance = Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2);
  if (distance < (this.radius + otherObject.radius)) {
    return true;
  } else {
    return false;
  }
}

MovingObject.prototype.collideWith = function(otherObject) {
//   this.game.remove(this);
//   this.game.remove(otherObject); 
}

module.exports = MovingObject;
