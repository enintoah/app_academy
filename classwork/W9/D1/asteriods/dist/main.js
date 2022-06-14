/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction Asteroid(hash) {\n  MovingObject.call(this, hash)\n  this.vel = Util.randomVec(5)\n  this.color = \"#FF1493\",\n  this.radius = 15\n};\n\nUtil.inherits(Asteroid, MovingObject)\n\nAsteroid.prototype.collideWith = function(otherObject) {\n  if (otherObject instanceof Ship) {\n    otherObject.relocate()\n  }\n}\n\n\nmodule.exports = Asteroid; \n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\")\n\nfunction Bullet(hash) {\n  MovingObject.call(this, hash)\n  this.radius = 3;\n  this.color = \"#9370DB\";\n  this.vel = [0, 0]\n}\n\nUtil.inherits(Bullet, MovingObject)\n\nmodule.exports = Bullet; \n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\")\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\")\n\nfunction Game() {\n  this.DIM_X = 900\n  this.DIM_Y = 700\n  this.NUM_ASTEROIDS = 15\n  this.bullets = []\n  this.asteroids = []\n  this.addAsteroids()\n  this.ship = new Ship({ pos: this.randomPosition(), game: this})\n  this.objects = this.allObjects()\n}\n\nGame.prototype.addAsteroids = function() {\n  this.asteroids = []; \n  while (this.asteroids.length < this.NUM_ASTEROIDS) {\n    this.asteroids.push(new Asteroid({ pos: this.randomPosition(), game: this}))\n  }\n};\n\nGame.prototype.randomPosition = function() {\n  return [(Math.floor((Math.random() * this.DIM_X) + 1)),  (Math.floor((Math.random() * this.DIM_Y) + 1))]  \n}\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, 900, 700)\n  this.objects.forEach(el => {\n    el.draw(ctx)\n  })\n}\n\nGame.prototype.moveObjects = function() {\n  this.objects.forEach(el => {\n    el.move()\n  })\n}\n\nGame.prototype.wrap = function(pos) {\n  if (pos[0] <= 0) {\n    pos[0] = 900;\n  } else if (pos[1] >= 700) {\n    pos[1] = 0;\n  } else if (pos[0] >= 900) {\n    pos[0] = 0;\n  } else if (pos[1] <= 0) {\n    pos[1] = 700;\n  }\n  return pos;\n}\n\nGame.prototype.checkCollisions = function() {\n  for (let i=0; i < this.objects.length; i++) {\n    for (let j=0; j < this.objects.length; j++) {\n      if (j > i) {\n        if (this.objects[i].isCollidedWith(this.objects[j])) {\n          this.objects[i].collideWith(this.objects[j]);\n        }\n      }\n    }\n  }\n}\n\nGame.prototype.step = function() {\n  this.moveObjects();\n  this.checkCollisions();\n}\n\nGame.prototype.remove = function(asteroid) {\n  let asteroidIndex = this.asteroids.indexOf(asteroid);\n  this.asteroids.splice(asteroidIndex, 1);\n}\n\nGame.prototype.allObjects = function() {\n  // this.asteroids.push(this.ship);\n  return this.asteroids.concat([this.ship])\n}\n\nmodule.exports = Game; \n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n  this.game = new Game()\n  this.ctx = ctx\n}\n\nGameView.prototype.start = function() {\n  const that = this;\n  this.bindKeyHandlers()\n  setInterval(el => {\n    that.game.step();\n    that.game.draw(that.ctx)\n    }, 20)\n  \n};\n\nGameView.prototype.bindKeyHandlers = function() {\n  const ship = this.game.ship\n  key('up', function(){ ship.power([0, -3]) });\n  key('down', function(){ ship.power([0, 3]) });\n  key('left', function(){ ship.power([-3, 0]) });\n  key('right', function(){ ship.power([3, 0]) });\n  \n}\n\n\nmodule.exports = GameView; \n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Webpack is working!\")\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\")\n\nwindow.Asteroid = Asteroid; \nwindow.MovingObject = MovingObject;\nwindow.Game = Game; \nwindow.GameView = GameView;\nwindow.Ship = Ship;\nwindow.Bullet = Bullet;\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n  console.log('DOM fully loaded and parsed');\n  const canvas = document.getElementById(\"game-canvas\");\n  const ctx = canvas.getContext(\"2d\");\n  canvas.width = 900;\n  canvas.height = 700;\n  const gm1 = new GameView(ctx)\n  window.gm1 = gm1\n  gm1.start()\n});\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(hash) {\n    this.pos = hash.pos;\n    this.vel = hash.vel;\n    this.radius = hash.radius;\n    this.color = hash.color;\n    this.game = hash.game\n};\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n\n  ctx.arc(\n    this.pos[0],\n    this.pos[1],\n    this.radius,\n    0,\n    2 * Math.PI,\n    false\n  );\n\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function() {\n  const pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]]  \n  this.pos = this.game.wrap(pos)\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  let x1 = this.pos[0];\n  let y1 = this.pos[1];\n  let x2 = otherObject.pos[0];\n  let y2 = otherObject.pos[1];\n  const distance = Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2);\n  if (distance < (this.radius + otherObject.radius)) {\n    return true;\n  } else {\n    return false;\n  }\n}\n\nMovingObject.prototype.collideWith = function(otherObject) {\n//   this.game.remove(this);\n//   this.game.remove(otherObject); \n}\n\nmodule.exports = MovingObject;\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Bullet = __webpack_require__(/*! ./bullet */ \"./src/bullet.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction Ship(hash) {\n    MovingObject.call(this, hash)\n    this.radius = 10;\n    this.color = \"#9370DB\";\n    this.vel = [0, 0]\n}\n\nUtil.inherits(Ship, MovingObject)\n\nShip.prototype.relocate = function() {\n  this.pos = this.game.randomPosition()\n  this.vel = [0, 0]\n}\n\nShip.prototype.power = function(impulse) {\n    this.vel = [(this.vel[0] + impulse[0]), (this.vel[1] + impulse[1])]\n}\n\nShip.prototype.fireBullet = function() {\n  let b = new Bullet\n}\n\nmodule.exports = Ship; \n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate () {}\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n      // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;