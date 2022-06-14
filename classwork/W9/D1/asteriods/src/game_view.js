const Game = require("./game");

function GameView(ctx) {
  this.game = new Game()
  this.ctx = ctx
}

GameView.prototype.start = function() {
  const that = this;
  this.bindKeyHandlers()
  setInterval(el => {
    that.game.step();
    that.game.draw(that.ctx)
    }, 20)
  
};

GameView.prototype.bindKeyHandlers = function() {
  const ship = this.game.ship
  key('up', function(){ ship.power([0, -3]) });
  key('down', function(){ ship.power([0, 3]) });
  key('left', function(){ ship.power([-3, 0]) });
  key('right', function(){ ship.power([3, 0]) });
  
}


module.exports = GameView; 