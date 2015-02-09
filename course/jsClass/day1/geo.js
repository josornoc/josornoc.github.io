var open = document.getElementById("open");
var close = document.getElementById("close");

open.addEventListener("click", onOpen);
close.addEventListener("click", onClose);

function onOpen(){
  
  if(!window.Notification){
    alert("No notification...");
    return;
  }
  
  if(Notification.permission !== "denied"){
    Notification.requestPermission(function(permission){
      if(permission==="granted"){
        
        var latitude;
        var longitude;
        
        if (navigator.geolocation) {
         console.log("Yay, geolocation enabled!")
         navigator.geolocation.getCurrentPosition(onSuccess)
        }

        function onSuccess(position){
          
          latitude = position.coords.latitude;  
          longitude = position.coords.longitude;
          
          var title = "Hola Amor";
          var options = {
            icon: "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false",
            body: "Queremos enviar la imagen de donde estamos."
          };
          
          var notif = new Notification(title, options);        
          notif.onclick = function(){
            //alert("Hola amor, tu latitud es: " + latitude + ", y tu longitud es: " + longitude);
            document.getElementById("mapa").src = options.icon;
          }
        }
      }
    });
  }
}

function onClose(){
  Notification.close();
}



