	// $("#id").load(url)
	// $.get(url, function(data){ })
	// $.post(url, dataToSend,
	//  function(data){ })
	// $.ajax({
	// url: "http://...",
	// type: "get",
	// data: ''
	// ,
	// dataType: "json"
	// success: mySuccessFunction,
	// error: myErrorFunction,
	// complete: myCompleteFunction
	// })


// $(document).ready(function () {

// 	var SERVER = 'https://calm-dawn-7104.herokuapp.com';
// 	var res = $("#result");

// 	//Replace myContent content with the result of the request google.html
// 	$("#myContent").load(SERVER+"/google.html");

	// Replace the result div when click on it with the response of submitting the content 
	// of input text "name" to the /hello/
	// Example: If the content is "Luis" you should call '/hello/Luis'

	// res.click(function(){
	// 	var name = $("#name").val();
	// 	$.get(SERVER+"/hello/"+name, function(data){ 
	// 		res.text(data);
	// 	});
	// });

	// Replace the result div when click on it when the user changes the amount or the currency
	// with the call to /exchange/ with the parameters amount and currency.
	// Example: /exchange/?amount=100&currency=euro

	// res.click(function(){

	// var amount = $("#amount").val();
	// var currency = $("#currency").val();

	// console.log("res click", amount, currency);

	// $.get(SERVER+"/exchange/?amount="+amount+"&currency="+currency,function(data){ 
	// 			console.log(data[currency]);
	// 			res.text("€: " + data.euro + " / $: "+ data.dollar + " / £: " + data.pound + " / ¥: " + data.yen);
	// 		});
	// });


	// Save (POST) the personal form to the /add route when click on the result div
	// Look the the AJAX Response and the status code
	// res.bind("click", function(){

	// 	var url = SERVER+"/add";
	// 	var data =$('#personal').serialize();
	// 	var pResponsef = function(data){ 
	// 		console.log(data);	
	// 	};

	// 	console.log($('#personal').serialize())

	// 	$.post(url, data, pResponsef);

	// });


	// Make a get request to /sleep when click on the result div
	// Show loading while the response does not arrive
	// Show the result if everything is ok
	// Show 'Error' if there is some problem and change the background-color to red
	// When the request ends adds the bordered class to the response


$(document).ready(function () {

	var SERVER = 'https://calm-dawn-7104.herokuapp.com';
	var res = $("#result");
	$("#myContent").load(SERVER+"/google.html");

	res.bind("click", function(){

		console.log("loading.....");
		res.text("Loading...")

		$.ajax({
			url: SERVER+"/sleep",
			type: "get",
			success: mySuccessFunction,
			error: myErrorFunction,
			complete: myCompleteFunction
		});

		function mySuccessFunction(){
			console.log("mySuccessFunction");
			res.text("Ok")
		};

		function myErrorFunction(){
			console.log("myErrorFunction");
			res.text("Error");
			$("body").css("background-color", "red");
		};

		function myCompleteFunction(data){
			console.log("myCompleteFunction: ",);
			res.text("Ok!")
			res.addClass('bordered');
		}
	})
})


	
	







	// $.ajax({
	// url: "http://...",
	// type: "get",
	// data: ''
	// ,
	// dataType: "json"
	// success: mySuccessFunction,
	// error: myErrorFunction,
	// complete: myCompleteFunction
	// })

	

	// dataToSend = {
	// 	name:$("#name").val(),
	// 	ageRange:$("#age-range").val(),
	// 	ilove:$("#love").prop("checked"),
	// 	favColor:
	// };
	//console.log(dataToSend);

















