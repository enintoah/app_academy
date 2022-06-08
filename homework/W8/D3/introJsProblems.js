function titleize(arr, callback) {
	let newArr = arr.map(el => `Mx. ${el} Jingleheimer Schmidt`)
	newArr.forEach(el => callback(el))
}

function printCallback(doc) {
	console.log(doc)
}

function Elephant(name, height, tricks=[]) {
	this.name = name;
	this.height = height;
	this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
	console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`)
}

Elephant.prototype.grow = function() {
	this.height += 12
}

Elephant.prototype.addTrick = function(trick) {
	this.tricks.push(trick)
}

Elephant.prototype.play = function() {
	const random = Math.floor(Math.random() * this.tricks.length)
	console.log(`${this.name} is ${this.tricks[random]}!!!`)
}

Elephant.paradeHelper = function(name) {
	const random = Math.floor(Math.random() * name.tricks.length)
	console.log(`${name.name} is ${name.tricks[random]}!!!`)
}

Elephant.parade = function() {
	herd.forEach(el => Elephant.paradeHelper(el));
}




let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

function dinerBreakfast(food) {
	let finalstring = "I'd like cheesy scrambled eggs";
	let please = " please";
	this.breakfast = [];
	if (food) {
		this.breakfast.push(food);
	}
	this.breakfast.forEach (el => finalstring += `and ${el}`)
	console.log(finalstring += please)
}
