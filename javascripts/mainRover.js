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

	getObstaclesCoords: function(){
		for(var i=0; i<grid.obstacles.length; i++){
			return grid.obstacles[i].getCoords();
		}
	},

	setObstacles: function(arr){
		grid.obstacles = arr;
	}
}

var obstacle = {

	xPos: 0,
	yPos: 0,
	name: undefined,

	initialize: function(n, i){
		obstacle.setName(n);
		obstacle.setCoords(i[0], i[1]);
		return obstacle;
	},

	getName: function(){
		return obstacle.name;
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
	mvmStory: [],

	getMvMStory: function(){
		return vehicle.mvmStory;
	},

	addMvMStory: function(mvmCoor){
		vehicle.mvmStory.push(mvmCoor);	
	},

	getCoords: function(){
		return [xPos, yPos]
	},

	setPosition: function(newX, newY){

		var pXpos;
		var pYpos;

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

		if( chkIfObstacle(xPos, yPos)){
			
			console.log("Rover has hitted an obstacle!!!", vehicle.getCoords());
			console.log(vehicle.getMvMStory()[vehicle.getMvMStory().length-1]);
			
			pXpos = vehicle.getMvMStory()[vehicle.getMvMStory().length-1][0];
			pYpos = vehicle.getMvMStory()[vehicle.getMvMStory().length-1][1];

			vehicle.setPosition(pXpos, pYpos);

		}else{

			console.log("Rover HAS NOT hitted an obstacle!!!", vehicle.getCoords());
			vehicle.addMvMStory(vehicle.getCoords());
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
		vehicle.mvmStory = [];
		vehicle.addMvMStory(pos);
		vehicle.setDirection(dir);
		vehicle.setPosition(pos[0], pos[1]);
	},

	setStory: function(){

	},

	reqPosition: function(){

		npos = requestNewPosition();

		if(npos != "error"){

			validateStringEntered( npos );
			vehicle.report();
			vehicle.reqPosition();	

		}else{

			alert("Please write commands, f, b, l, r");
			//vehicle.reqPosition();
		}
	}
}

function chkIfObstacle(n1, n2){

	console.log(n1,n2,grid.getObstaclesCoords());

	if(n1 == grid.getObstaclesCoords()[0] && n2 == grid.getObstaclesCoords()[1]){

		console.log("There is an obstacle here, rover can't move");
		return true;

	}else{

		console.log("No obstacle");

		return false;
	}
}

function requestNewPosition(){

	r = prompt("Rover Position: "
			  + vehicle.getCoords() + "\n"
			  + "Facing: " + vehicle.getDirection() + "\n\n"
			  + "Enter character array of commands: " + "\n"
			  + "forward/backward (f,b); " + "\n"
			  + "turn the rover left/right (l,r)." + "\n");

	if(r == "" || r == null || r == undefined){

		r = "error";

	}else{

		r = r.split(" ").join("");	
	}

	return r;
}

function init(){

	grid.addObstacle( obstacle.initialize('Roca', [2,2]) );

	console.log('little mars rover initialized...')
	console.log( grid.getObstaclesCoords() );

	vehicle.initialize([0,0], 'North');
	vehicle.reqPosition();
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





