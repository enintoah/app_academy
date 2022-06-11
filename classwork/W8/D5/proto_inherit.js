function MovingObject(name, speed) {
  this.name = name;
  this.speed = speed;
}

MovingObject.prototype.move = function(distance) {
  console.log(`${this.name} moved ${distance} miles!!`)
}

function Asteroid(material, size, name){
    MovingObject.call(this, name)
    this.material = material;
    this.size = size;
}

Asteroid.prototype.crash = function(){
    console.log(`${this.name} crashed!`);
}

function Ship(type, numofpeople, name) {
  this.type = type;
  this.numofpeople = numofpeople;
  MovingObject.call(this, name)
}

Ship.prototype.sail = function() {
  console.log(`${this.name} has set sail!`)
}





titanic = new Ship("cruise", 1000, "Titanic")
titanic.sail()
// titanic.move(100)

moon = new Asteroid("rock", "big", "The moon")
moon.crash()
// moon.move(1000)

car = new MovingObject("toyota AE86", 40)
car.move(50)
// car.sail()