var Tinder = window.Tinder || {};

// Geolocate Function
Tinder.geolocate = function(onSuccess) {
  // Check that the Geolocation API is available
  if (!navigator.geolocation) throw new Error("Geolocation API not available.")

  var options = {
    enableHighAccuracy: true,
    maximumAge: 30000,
    timeout: 60000
  }

  // Get geolocation
  navigator.geolocation.getCurrentPosition(onSuccess, onError, options);
  // navigator.geolocation.watchPosition(onSuccess, onError, options);
};

function onError(error){
  console.log("Error getting geolocation. ", error);
}
