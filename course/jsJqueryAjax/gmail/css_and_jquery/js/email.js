$(document).ready(function()
{
	// function addClases(){
	// 	$(".checked").addClass('col-md-1');
	// 	$(".starred").addClass('col-md-1');
	// 	$(".from").addClass('col-md-2');
	// 	$(".subject").addClass('col-md-4');
	// 	$(".preview").addClass('col-md-4');
	// 	$("#usage").addClass('col-md-3');
	// 	$("#brand").addClass('col-md-2');
	// 	$("#terms").addClass('col-md-3');
	// 	$("#last-activity").addClass('col-md-4')	
	// }	

	$("#blank-email").hide();
	$("#usage").addClass('col-md-3');
	$("#brand").addClass('col-md-2');
	$("#terms").addClass('col-md-3');
	$("#last-activity").addClass('col-md-4');

	var SERVER = 'https://vast-earth-2490.herokuapp.com';

	$("#updateEmails").bind("click", function(){

		console.log("loading new email.....");

		$.ajax({
			url: SERVER+"/email/new",
			type: "get",
			success: mailLdrSuccess,
			error: mailErrHndlr,
			complete: mailCmplHndlr
		});

		function mailLdrSuccess(data){
			console.log("mailLdrSuccess.....", data);
			serveEmails(data);
		};

		function mailErrHndlr(){
			console.log("mailErrHndlr.....");
		};

		function mailCmplHndlr(){
			console.log("mailCmplHndlr.....");
		};

		function serveEmails(data){
			$.each(data, function(index, val) {
				console.log(index, val, val);
				$("#emails").prepend(
				  "<li data-id="+index+">"+ 
						"<div class='checked' data-checked='false'></div>" +
						"<div class='starred' data-starred='false'></div>" +
						"<div class='from'>"+val.from+"</div>" +
						"<div class='subject'>"+val.subject+"</div>" +
						"<div class='preview'>"+val.preview+"</div>" +
				  '</li');
			});
		};
	});

	$("#emails").delegate("li", "click", function(event){		

		console.log("loading email with id num: " + event.currentTarget.dataset.id);

		$.ajax({
			url: SERVER+"/email/" + event.currentTarget.dataset.id,
			type: "get",
			success: snglMlSuccess,
			error: snglMlErr,
			complete: snglMlCmplt
		});

		function snglMlSuccess(data){
			console.log("Data - Returned Full info Email: ");
			console.log(data);
		}

		function snglMlErr(){
			console.log("snglMlErr....");	
		}

		function snglMlCmplt(){
			console.log("snglMlCmplt....");
		}

		function showEmail(data){
			//Show single email data here....
		}

	});
});


















