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
        new Notification("Hi!")
      }
    });
  }
}

function onClose(){
  Notification.close();
}



