const Asteroid = require("./asteroid")
const Ship = require("./ship")

function Game() {
  this.DIM_X = 900
  this.DIM_Y = 700
  this.NUM_ASTEROIDS = 15
  this.bullets = []
  this.asteroids = []
  this.addAsteroids()
  this.ship = new Ship({ pos: this.randomPosition(), game: this})
  this.objects = this.allObjects()
}

Game.prototype.addAsteroids = function() {
  this.asteroids = []; 
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    this.asteroids.push(new Asteroid({ pos: this.randomPosition(), game: this}))
  }
};

Game.prototype.randomPosition = function() {
  return [(Math.floor((Math.random() * this.DIM_X) + 1)),  (Math.floor((Math.random() * this.DIM_Y) + 1))]  
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, 900, 700)
  this.objects.forEach(el => {
    el.draw(ctx)
  })
}

Game.prototype.moveObjects = function() {
  this.objects.forEach(el => {
    el.move()
  })
}

Game.prototype.wrap = function(pos) {
  if (pos[0] <= 0) {
    pos[0] = 900;
  } else if (pos[1] >= 700) {
    pos[1] = 0;
  } else if (pos[0] >= 900) {
    pos[0] = 0;
  } else if (pos[1] <= 0) {
    pos[1] = 700;
  }
  return pos;
}

Game.prototype.checkCollisions = function() {
  for (let i=0; i < this.objects.length; i++) {
    for (let j=0; j < this.objects.length; j++) {
      if (j > i) {
        if (this.objects[i].isCollidedWith(this.objects[j])) {
          this.objects[i].collideWith(this.objects[j]);
        }
      }
    }
  }
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
  let asteroidIndex = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(asteroidIndex, 1);
}

Game.prototype.allObjects = function() {
  // this.asteroids.push(this.ship);
  return this.asteroids.concat([this.ship])
}

module.exports = Game; 