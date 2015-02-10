Tinder = window.Tinder || {};

Tinder.on = function(btn,eventType,f){
	btn.addEventListener(eventType,f);
}

function onSuccess(){

	// latitude = position.coords.latitude;  
  // longitude = position.coords.longitude;

  var lat = 41.3916171;
	var lon = 2.17705;
  var imgUrl = "https://maps.googleapis.com/maps/api/staticmap?center="  + lat + "," + lon + "&zoom=15&size=300x300";

  document.getElementById("location").src = imgUrl;
}

Tinder.getLocation = function(){
	//navigator.geolocation.getCurrentPosition(onSuccess);
	onSuccess();
}

var currentAddress;

Tinder.ajaxRequest = function(){

	var lat = "41.3916171";
	var lng = "2.17705";
	var latlng = lat+","+lng;

	var url = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+latlng+"&sensor=true_or_false";
	var xhr = new XMLHttpRequest();

	xhr.open("POST", url);  
	xhr.send(); 

	xhr.onload = function() {

	  var response = JSON.parse(this.responseText);
	  console.log(response);
	  currentAddress = response.results[0].formatted_address;
	  document.getElementById("address").innerHTML = "You're on " + currentAddress + " " + "bitch!";

	  for(var i=0; i<response.results.length; i++){
	  	console.log(response.results[i].formatted_address);
	  }
	}
}

Tinder.store = function(){

	var lat = "41.3916171";
	var lng = "2.17705";

	var objectToStore = {
		lat: lat,
		lng: lng,
		address: currentAddress
	}

	console.log(JSON.stringify(objectToStore));
	window.localStorage.setItem("geoLocation", JSON.stringify(objectToStore));
}














