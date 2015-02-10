var lat = "41.385064";
var lng = "2.173403";
var latlng = lat+","+lng;

var url = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+latlng+"&sensor=true_or_false";
var xhr = new XMLHttpRequest();

Tinder.ajax = function(url, callback){
	xhr.open("POST", url);  
	xhr.send(); 
	xhr.onload = function() {
	  var response = JSON.parse(this.responseText);
	  console.log(response);
	}
}
