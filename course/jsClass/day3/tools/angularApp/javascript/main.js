function init($scope)
{
	
  $scope.$watch('$viewContentLoaded', function(){

		var length = $(".thumbnail").length;
		var currentPerson = length;
		var container;
		var btn;

		setListener();

		function setListener(){
			currentPerson--;
			container = $(".thumbnail").eq(currentPerson)[0];
			btn = $(".btn__containers").eq(currentPerson)[0];
			btn.addEventListener("click", function(){
				$(container).animate({ 
					opacity: 0
				}, 500, cCmlpHandler );
			});	

			console.log( $(".location").last()[0] );

			//getLocation();
			//console.log( $(".location").eq(currentPerson)[0] );
		}

		function cCmlpHandler(){
			$(container).hide(0, setListener);
		}

		function getLocation(){

			var lat = "41.3916171";
			var lng = "2.17705";
			var latlng = lat+","+lng;
			var url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + latlng + "&sensor=true_or_false";
			var xhr = new XMLHttpRequest();

			xhr.open("POST", url);  
			xhr.send(); 

			xhr.onload = function() {

			  var response = JSON.parse(this.responseText);
			  currentAddress = response.results[response.results.length - 3].formatted_address;
			  console.log(currentAddress);

			  //document.getElementById("address").innerHTML = "You're on " + currentAddress + " " + "bitch!";
			  // for(var i=0; i<response.results.length; i++){
			  // 	console.log(response.results[i].formatted_address);
			  // }

			}
		}
  });
};





