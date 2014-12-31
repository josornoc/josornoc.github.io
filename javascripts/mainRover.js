document.addEventListener("DOMContentLoaded", DOMloadedHandler)

function DOMloadedHandler(){
	init();
}

grid = {

	xSize: 100,
	ySize: 100,
	obstacles: [],

	setGridSize: function(xSlots, ySlots){
		xSize = xSlots;
		ySlots = ySlots;
	},

	returnGridSize: function(){
		return [grid.xSize, grid.ySize];
	},

	addVehicle: function(xPos, yPos){
		v = vehicle.setPosition(xPos,yPos);	
	},

	addObstacle: function(obs){
		grid.obstacles.push(obs)
	},

	getObstacles: function(){
		return grid.obstacles;
	},

	setObstacles: function(arr){
		grid.obstacles = arr;
	}
}

obstacle = {

	xPos: 0,
	yPos: 0,
	name: undefined,

	initialize: function(n, i){
		obstacle.setName(n);
		obstacle.setCoords(i[0], i[1]);
		return obstacle;
	},

	setName: function(str){
		obstacle.name = str;
	},

	setCoords: function(n1,n2){
		obstacle.xPos = n1;
		obstacle.yPos = n2;
	},

	getCoords: function(){
		return [obstacle.xPos, obstacle.yPos];
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

		if(newX > grid.returnGridSize()[0]){
			xPos = 0;
		}else if(newX < 0){
			xPos = grid.returnGridSize()[0];
		}else{
			xPos = newX;	
		}

		if(newY > grid.returnGridSize()[1]){
			yPos = 0;
		}else if(newY < 0){
			yPos = grid.returnGridSize()[1];
		}else{
			yPos = newY;	
		}
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
	},

	initialize: function(pos, dir){
		vehicle.setDirection(dir);
		vehicle.setPosition(pos[0], pos[1]);
	},

	reqPosition: function(){
		validateStringEntered(requestNewPosition());
		vehicle.report();
		vehicle.reqPosition();
	}
}

function init(){

	console.log('little mars rover initialized...')
	vehicle.initialize([0,0], 'North');

	grid.addObstacle( obstacle.initialize('Roca', [1,1]));

	console.log('fOBS coords: ', grid.getObstacles()[0].getCoords());

	vehicle.initialize([0,0], 'North');
	vehicle.reqPosition();
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

	if(char == "b"){

		var cCoords = vehicle.getCoords();

		switch(vehicle.getDirection()){
			case "North":
				vehicle.setPosition(cCoords[0], cCoords[1]-1);
				break;
			case "East":
				vehicle.setPosition(cCoords[0]-1, cCoords[1]);
				break;
			case "South":
				vehicle.setPosition(cCoords[0], cCoords[1]+1);
				break;
			case "West":
				vehicle.setPosition(cCoords[0]+1, cCoords[1]);
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