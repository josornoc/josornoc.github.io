if(!window.Tinder) alert("Tinder.js not available!");

// User $ instead of window.Tinder
var $ = window.Tinder;

// Global variables
var latitude;
var longitude;
var mapURL;
var address;

// use query.tinder.js
var button1 = $.query("#getGeolocation");
var button2 = $.query("#getAddress");
var button3 = $.query("#saveData");
var button4 = $.query("#showNotification");

$.on(button1, "click", onGetGeolocation);
$.on(button2, "click", onGetAddress);
$.on(button3, "click", onSaveData);
$.on(button4, "click", onShowNotification);

// use geolocation.tinder.js
function onGetGeolocation(event) {
  $.geolocate(function(position) {
    latitude = position.coords.latitude;
    longitude = position.coords.longitude;
    mapURL = "http://maps.googleapis.com/maps/api/staticmap?center="
           + latitude + "," + longitude
           + "&zoom=14&size=100x100";

    alert("Got Geolocation: " + latitude + ", " + longitude);
  });
}

// use ajax.tinder.js
function onGetAddress(event) {
  if(!latitude || !longitude) alert("First you need geolocation.");

  var url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='+latitude+','+longitude+'&sensor=true_or_false';

  $.ajax(url, {}, function(response) {
    address = response.results[0].formatted_address;
    alert("Got address: " + address);
  })
}

// use storage.tinder.js
function onSaveData(event) {
  if(!address || !mapURL) alert("You need Geolocation and Address first!");

  $.save("TinderData", { address: address, url: mapURL });
  alert("Data saved correctly.")
}

// use notification.tinder.js
function onShowNotification(event) {
  var data = $.get("TinderData");

  if(!data) alert("You need to Save Data first!");

  $.notify("You are here", { icon: data.url, body: data.address });
}