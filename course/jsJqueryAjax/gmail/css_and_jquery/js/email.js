$(document).ready(function()
{
	//  function addClases(){
	// 	$(".checked").addClass('col-md-1');
	// 	$(".starred").addClass('col-md-1');
	// 	$(".from").addClass('col-md-2');
	// 	$(".subject").addClass('col-md-4');
	// 	$(".preview").addClass('col-md-4');
	// 	$("#usage").addClass('col-md-3');
	// 	$("#brand").addClass('col-md-2');
	// 	$("#terms").addClass('col-md-3');
	// 	$("#last-activity").addClass('col-md-4')	
	//	$("#blank-email").hide();

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

			var i = 0;

			$.each(data, function(index, val) {

				console.log(index, val, val);
				i++;	
				rString  = "<li data-id="+index+">";
				rString += "<a href='#' class='list-group-item'>";
				rString += "<div>";
				rString += "<span class='glyphicon glyphicon-star-empty star-icon' aria-hidden='true'></span>"
				rString += "</div>";
				rString += "<h4 class='list-group-item-heading from'>" + val.from + "-" + val.subject +"</h4>";
				rString += "<p class='list-group-item-text preview'>" + val.preview + "</p>";
				rString += "</a>";
				rString += "</li>";

				$("#emails .list-group").prepend(rString);
			});
			
			$("#new-messages").text(i);

		};
	});

	var starredItems = [];

	$("#starred-msgs").bind("click", function(){

		console.log(starredItems);

		$("#emails .list-group").empty();

		$.each(starredItems, function(index, val) {

			console.log(starredItems[index][0].dataset.id);
			
			$("#emails .list-group").prepend(val);

			// rString  = "<li data-id="+starredItems[index][0].dataset.id+">";
			// rString += "<a href='#' class='list-group-item'>";
			// rString += "<div>";
			// rString += "<span class='glyphicon glyphicon-star star-icon' aria-hidden='true'></span>"
			// rString += "</div>";
			// rString += "<h4 class='list-group-item-heading from'>" + val.from + "-" + val.subject +"</h4>";
			// rString += "<p class='list-group-item-text preview'>" + val.preview + "</p>";
			// rString += "</a>";
			// rString += "</li>";
			// $("#emails .list-group").prepend(rString);
		});

	});

	$("#emails").delegate(".star-icon", "click", function(event){
		$(event.currentTarget).toggleClass('glyphicon-star-empty');
		$(event.currentTarget).toggleClass('glyphicon-star');
		readStarredElements();
		event.stopPropagation();
	});

	function readStarredElements(){
		starredItems = [];
		$.each($(".list-group li .glyphicon-star"), function(k, v){
			starredItems.push($(v).parent().parent().parent());
		});
		$("#starred-msgs-badge").text(starredItems.length);
		//var totalItems = $(".list-group li").length;
	};

	$("#emails").delegate("li", "click", function(event){		

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

			$("#email-content-title").text("From: " + data.from);
			$("#email-content-subtitle").text("Subject: " + data.subject);
			$("#email-content-body").text(data.email);
			$("#email-content-footer").text("§ Osorno's Copyright §");
		}

		function snglMlErr(){
			console.log("snglMlErr....");	
		}

		function snglMlCmplt(){
			console.log("snglMlCmplt....");
			toggleMlWindow();
		}

		function toggleMlWindow(){
			$("#emails").fadeOut('slow');
			$("#emailContent").fadeIn('slow');
		}
	});

	$("#newEmail").bind("click", function(){
		console.log("#newEmail clicked");
		$("#blank-email").fadeIn('slow');
	});
	
	//POST NEW EMAIL
	$("#sendEmail").bind("click", function(e){

		e.preventDefault();

		//first send a basic email, 
		//then we should open the window of new email and complete functionality...
		console.log("sending new email....");
		mlObj = $("#new_email").serialize();
		console.log(mlObj);

		$.ajax({
			url: SERVER+"/email",
			type: "POST",
			data: mlObj,
			success: snglMlSuccess,
			error: snglMlErr,
			complete: snglMlCmplt
		});

		function snglMlSuccess(data){
			console.log("snglMlSuccess.... Data answer below:");
			console.log(data);
		}

		function snglMlErr(){
			console.log("snglMlErr....");	
		}

		function snglMlCmplt(){
			console.log("snglMlCmplt....");	
			$("#blank-email").fadeOut('slow');
		}
	});	

	$("#cancelEmail").bind("click", function(e){
		e.preventDefault();
		$("#blank-email").fadeOut('slow');
	});	

	$("#close__mail__btn").bind("click", function(e){
		e.preventDefault();
		$("#emails").fadeIn('slow');
		$("#emailContent").fadeOut('slow');
	});	
});


















