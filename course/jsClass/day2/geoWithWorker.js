var url = "http://s.codepen.io/josornoc/pen/OPzMRR.js";
var worker = new Worker(url);
var open = document.getElementById("open");
var close = document.getElementById("close");

open.addEventListener("click", onOpen);
close.addEventListener("click", onClose);
worker.addEventListener("message", workerMsgHandler);

function workerMsgHandler(event){
  
  var title = "Titulo de Notificacion";
  var options = {  
    icon: event.data,
    //body: "Queremos enviar la imagen de donde estamos."
    body: event.data
  };

  var notif = new Notification(title, options);
  
  notif.onclick = function(){
    alert(event.data);
  }
}

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
          
          worker.postMessage({
          	  lat: latitude,
            lon: longitude
          });
        }
      }
    });
  }
}

function onClose(){
  Notification.close();
}



