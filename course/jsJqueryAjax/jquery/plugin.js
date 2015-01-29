$(document).ready(function () {

	// Create a plugin called reedify that sets the text color to red
	$.fn.reedify = function() {
	    this.css("color", "red");
	};
	//$("body").reedify();

	// Apply the function to the li elements of jQuery projects
	$("li").reedify();

	// Apply the reedify method and after a fade transition of 1 second
	//$("li").fadeOut('slow');

	// Add an automatic invocation to all the red class elements
	// $.fn.automaticInvocation = function() {
	//     alert("Lucid");
	// };
	// $(".red").automaticInvocation();

	//Create a plugin that remove all the spaces
	// $.fn.rmvWhiteSpaces = function(){
	// 	console.log(this);
	// 	this.text(this.text().replace(" ", ""));
	// };

	$.fn.rmvWhiteSpaces = function(){
		$.each(this, function(index, val) {
			 $(val).text($(val).text().split(" ").join(""));
		});
	};

	// And apply it to the p elements
	$("p").rmvWhiteSpaces();
});