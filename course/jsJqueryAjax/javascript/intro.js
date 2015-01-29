// Create a variable with your name as a content and print it.
var miNombre = "Jose Ignacio";
console.log("Hola como estás " + miNombre);

// Create a function, with one argument, to say hello to the name. Use it with your name variable
function saludar(nombre){
	console.log("Hola como estás " + nombre);	
}
saludar("Amor");

// Create a loop to show the numbers from 1 to 5.
for(i=1; i<=5; i++){
	console.log(i);
}

// Create an array with some colors
colors = ["black", "white", "blue", "yellow", "red"];

// Iterate the color array and print the colors in different lines.
colors.forEach(function(color){
	console.log(color);
})

// Filter the array to exclude the red color (the array should contain all the previous colors except the red one).
var colorsWoRed = colors.filter(function(color){
	return color !== "red"
})
console.log(colorsWoRed);

// Transform the array to add "!!" at the end of each color. (The result should be something like: "red!!", "blue!!", "green!!"... )
var aExclam = colors.map(function(color){
	return color+"!!"
})
console.log(aExclam);


// Create an object with name, surname and age as a properties and create a function to show the person information as "Luis Rovirosa has 32 years".
var myObj = {
	name: "Jose Ignacio",
	surname: "Osorno Cardona",
	age: 31
}

console.log(myObj.name + " " + myObj.surname + " has " + myObj.age + " years old")
