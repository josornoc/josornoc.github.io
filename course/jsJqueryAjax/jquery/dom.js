$(document).ready(function () {

// Change the width of the h1 element
	$("h1").width("75%")


// Increase the font-size of all elements to 120%
	$("body").css("font-size", "120%");

// Add the highlighted class to the elements that has the 'new' class
	$(".new").addClass("highlighted");

// Remove the title class from h1
	$("h1").removeClass("title");	

// Set the default age range in 20-30 ??????
	//$("#age-range option").eq("2").prop("selected", "selected");

// Set the default age range in 20-30 using travesing filters
	$("#age-range option").eq("2").prop("selected", "selected");	

// Uncheck the "I love learning" checkbox
	$("#love").prop("checked", false);

// Select yellow as a favourite color
	$("#color-yellow").prop("checked", "checked");	

// Write the selected name of the input in the result div
	//$("#result").text($("#name").val());

// Write the text of the selected age in the result div
	//$("#result").text($("#age-range").val());

// Writes the number of data likes of jquery-ui in the result div
	$("#result").text($("#jquery-ui").data("likes"));

// Increase in 100 the number of likes and show the number of likes in the result div
	n = $("#jquery-ui").data("likes");
	n += 100;
	$("#result").text(n);	
	
// Show the absolute position of the result div in the console
	console.log($("#result").offset());

// Move the result div to the position 100 top and 150 left
	$("#result").css("top", "100px")	
	$("#result").css("left", "700px")	

// Change the width and height of the result up to 300px
	//$("#result").width("300px")
	//$("#result").height("300px")

// Add " (User interface)" after "JQueryUI"
	$("#jquery-ui").append(" (User interface)");

// Add a li element with the text "Future JQ" between jQueryUI and jQueryMobile
	$("#jquery-ui").after("<li>Future JQ</li>")

// Add div containers with the class bordered around every li
	//$("li").wrap('<div class="bordered">')

// Add a div container with the class bordered around all li
	$("li").parent().wrap('<div class="bordered">')

// Remove the result div
	$("#result").remove();

    /**
     *  Final round
     */

// Set the font color of the color names according to their color
// Example: The red text should be in red, the blue text should be in blue...

	function colorize(item){
		item.parent().css("color", item.attr("value"));
	}

	colorize($("#color-red"))
	colorize($("#color-blue"))
	colorize($("#color-green"))
	colorize($("#color-yellow"))
	colorize($("#color-other"))
	
// Add links to the li elements, the url is the name ended with .com

	//link = $("li").text()+".com";
	//$("li").wrap("<a href='" + link + "'>");

	// $("li").each = funcion(i){
	// 	link = i.text() + ".com";
	// 	i.wrap("<a href='" + link + "'>");
	// }

	// $("li").each(function(obj, value){

	// 	console.log(value.text());

	// 	//link = value.text() + ".com";
	// 	//value.wrap("<a href='" + link + "'>");
	// });

	$.each($("li"), function( k, v ) {
	  console.log( "Key: " + k + ", Value: " + v );
	  console.log( v.innerHTML+"" );

		link = value.text() + ".com";
		// 	//value.wrap("<a href='" + link + "'>");

	});
});
















