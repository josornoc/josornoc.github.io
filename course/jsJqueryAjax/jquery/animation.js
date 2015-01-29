$(document).ready(function () {

// Hide the result div
	//$("#result").hide()

// Hide the result div using fade with 1s duration
	//$("#result").hide(1000)

// Hide and show the result div using slide
	//$("#result").slideToggle()
	//$("#result").slideToggle(500)

// Hide using slide, wait one second and fade
	//$("#result").slideUp()
	//$("#result").fadeIn(1000)

// Create your own speed and use it
	// $.fx.speeds['really-slow'] = 8000;
	// $("#result").animate({
	// 	left: "-=500",
	// 	top: "-=500",
	// }, 'really-slow');

// Set the default animation speed to 2000
	// $.fx.speeds['_default'] = 2000;

// Slide jquery projects and when it's done show on the result div that it's done

	$("li").hide();
	$("li").slideToggle(whenItEnds);

	function whenItEnds(){
		$("#result").text("It's Done")
	}

	// $("li").slideToggle(function(){
	// 	$("#result").text("It's Done")
	// });
	
	// 	$("#result").text("It's Done")
	// });

// Move to the left in 10 seconds the result div with linear animation
	$("#result").animate({
	 	left: "-=500",
	}, 10000, 'linear');
});


