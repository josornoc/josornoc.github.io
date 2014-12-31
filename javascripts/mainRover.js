document.addEventListener("DOMContentLoaded", DOMloadedHandler)

function DOMloadedHandler(){
	var grid = createGrid;
	grid.addVehicle(0,0);
	init();
}

var createGrid = {
	addVehicle: function(xPos, yPos){
		vTmp = vehicle.setPosition(0,0)	
	}
}

vehicle = {

	xPos: 0,
	yPos: 0,
	headingDir: "North",

	getCoords: function(){
		return [xPos, yPos]
	},

	setPosition: function(newX, newY){
		xPos = newX;
		yPos = newY;
	},

	setDirection: function(str){
		headingDir = str;
	},

	getDirection: function(){
		return headingDir;
	},

	report: function(){
		console.log("Header direction: " + vehicle.getDirection());
		console.log("Coordinates: " + vehicle.getCoords());
	}
}

function initializeRover(){
	console.log('little mars rover initialized...')
	vehicle.setPosition(0,0);
	vehicle.setDirection('North');
}

function init(){
	initializeRover();
	validateStringEntered(requestNewPosition());
	vehicle.report();
}

function requestNewPosition(){

	r = prompt("Rover Position: " + "\n"
			  + vehicle.getCoords() + "\n"
			  + vehicle.getDirection() + "\n\n"
			  + "Enter character array of commands: " + "\n"
			  + "forward/backward (f,b); " + "\n"
			  + "turn the rover left/right (l,r)." + "\n");

	r = r.split(" ").join("");

	return r;
}

function validateStringEntered(str){
	str = str.split("");
	for (i=0; i < str.length; i++){
		evalChr(str[i].toLowerCase());
	}
}

function evalChr(str){
	if( str != "f" && str != "b" && str != "l" && str != "r" ){
		alert("Please enter only f, b, l, f chars only.")
	}else{
		moveRover(str);
	}
}

function moveRover(char){

	var directions = ["North", "East", "South", "West"];
	var cDirection = directions.indexOf(vehicle.getDirection());

	if(char == "r"){
		if(cDirection==directions.length-1){
			vehicle.setDirection(directions[0]);
		}
		else{
			vehicle.setDirection(directions[cDirection+1]);
		}
	}

	if(char == "l"){
		if(cDirection==0){
			vehicle.setDirection(directions[directions.length-1])
		}else{
			vehicle.setDirection(directions[cDirection-1]);
		}
	}

	if(char == "f"){

		var cCoords = vehicle.getCoords();

		switch(vehicle.getDirection()){
			case "North":
				vehicle.setPosition(cCoords[0], cCoords[1]+1);
				break;
			case "East":
				vehicle.setPosition(cCoords[0]+1, cCoords[1]);
				break;
			case "South":
				vehicle.setPosition(cCoords[0], cCoords[1]-1);
				break;
			case "West":
				vehicle.setPosition(cCoords[0]-1, cCoords[1]);
				break;
		}
	}
}


























// function createGrid(xSize, ySize){
// 	mContainer = document.getElementById('mainContainer');
// 	canvas = document.createElement('canvas');
// 	canvas.setAttribute('width', '1000');
// 	canvas.setAttribute('height', '1000');
// 	canvas.setAttribute('background', 'gray');
// 	mContainer.appendChild(canvas);
// }

// <canvas id="myCanvas" width="200" height="100"
// style="border:1px solid #000000;">
// </canvas>