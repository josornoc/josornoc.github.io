$(document).ready(function () {

// Put a border in the following elements

// all the elements: Example
    var liElements = $("li");
	$("*").css("border", "solid 1px rgba(0,0,0,.1)");

// the div with the id of myContent
	$("div#myContent").css("border", "solid 1px");	

// li elements
	$("li").css("border", "solid 1px yellow");	

// li with the basic class
	$("li.basic").css("border", "solid 1px blue");	

// The first li element with css selectors
	//$("li:first-child").css("border", "dotted 2px gray");	
	$("li").eq("0").css("border", "dotted 2px gray");	

// The second li element with traversing filters
	//$("li:nth-child(2)").css("border", "dotted 2px red");	
	$("li").eq("1").css("border", "dotted 2px red");	

// The last p with css selectors
	//$("p:last").css("color", "red");		

// The last p with traversing filters
	$("p").last().css("color", "brown");		

// The label element that has an element with the id love
	$("label").has("#love").css("color", "blue");	

// The li element that has no new class
	$("li").not(".new").css("color", "gray");

// The a element with href property is 'http://www.api.jquery.com/'
	$("a[href='http://www.api.jquery.com/']").css("color", "green");

// The a element with href property starts by http://www.
	$("a[href^='http://www']").css("color", "green");

// The a element with href property contains api
	$("a[href*='api']").css("border", "dotted 2px red");

// The p elements
	$("p").css("color","#CCC");

// The p elements inside myContent div
	$("#myContent p").css("border", "dotted 2px blue");

// The parent element to the jquery-ui element
	$("#jquery-ui").parent().css("border", "dotted 2px green");

// The siblings to the slogan p
	$("p#slogan").siblings().css("color", "#00FF00"); //MISSING...

// The p elements not inside myContent div
	$("div").not("#myContent").eq("p").css("border", "solid 2px #0000FF"); //MISSING...

// The li elements that starts with jQuery. Tip: http://www.w3schools.com/jsref/jsref_substring.asp //I'M HERE
	//MISSING...
});





