$(document).ready(function () {

// When the page is loaded replace the slogan by "Bazinga!"
$(document).ready(function(){
	$("#slogan").text("Bazinga!");
})

// When you click on the input to write my name the previous name is deleted
$("#name").focus(function(){
	console.log('name selected...');
	console.log($("input#name").attr("name"));
	$("#name").val("");
});

// When you move your mouse over one jQuery projects it change the background-color to silver
$("#myContent li").bind("mouseenter", function(){
	$(this).css("background-color", "silver");
});	

// With the previous one active, when the user leaves the element remove the background-color
$("#myContent li").bind("mouseleave", function(){
	$(this).css("background-color", "none");
	//$(this).removeClass("bordered");
});

// When you move your mouse enter on each jQuery projects it change the background-color to silver
// $("#myContent li").bind("mouseenter", function(){
// 	$(this).css("background-color", "silver");
// });	

//When you move your mouse enter on each jQuery projects it change the background-color to silver" to "
//Only when the mouse is over one jQuery project has the bordered class"
$("#myContent li").bind("mouseover mouseleave", function(){
	$(this).toggleClass("bordered");
});

// When I finish to write my name I want my name written in the result div
$("#name").blur(function(){
	$("#result").text($("#name").val())
});

//When I click on any element of the body show the mouse x and y in the result div
//$("body").click(myFn);

function myFn(event){
	console.log(event)
	$("#result").text( "x: " + event.pageX + " y: " + event.pageY );
}

// Adds a div with "Hello" at the end of the body when you click on the result div

// $("#result").bind("click", function(){
// 	$("body").append("<div>Hello</div>");
// });

// $("#result").click(function(){
// 	$("body").append("<div>Hello</div>");
// });

// Adds a div with "Hello" when you click on the result div only the first time
$("#result").bind("click", function(){
	$("body").append("<div>Hello</div>");
	$("#result").unbind("click")
});

// Adds a new "jQueryUI" element when clicks over one jQuery project
$("#myContent").delegate("li", "click", function(){
	$("#myContent li").last().after("<li>jQueryUI</li>");
});

// Avoid the navigation when you click a link
$("a").on("click", function(event){
	//alert("Event: " + event.type + " ---")
	//event.preventDefault();
});

// When you click a link go to ironhack.com
$("a").on("click", function(event){
	event.preventDefault();
	window.open("http://www.ironhack.com");
});	

// When you click on myContent div toggle the class bordered to the result
// except if jquery-ui element is clicked.
$("#myContent").bind("click", function(event){
	if(event.target.id != "jquery-ui"){
		$("#result").toggleClass('bordered');
	}
});

// I want the result div follows my mouse until I click (then will be fixed on the page)
$(document).bind("mousemove", function(event){
	//$("#result").css("top", event.pageY)
	//console.log(event.pageY);
	$("#result").css("top", event.pageY - $("#result").width()/4)
	$("#result").css("left", event.pageX - $("#result").height())
});


// When you select a part of the input name the selected part is shown in the result div

    /**
     * Final round
     */

// Duplicate the jQuery projects when clicks over them
// When you uncheck "I love learning" you get an alert with "Really???"

// When you resize the page show the size in the result div

// I want the result div follows my mouse until I click (then will be fixed on the page)
// The mouse should be in the center of the div

});