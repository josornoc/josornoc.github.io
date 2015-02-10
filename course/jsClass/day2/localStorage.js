c = document.getElementById("content");
c2 = document.getElementById("content2");

var person = {
  name:"John Doe",
  age:41,
  status:"murdered",
  description:"dismembered and disemboweled"
}

objPerson = JSON.stringify(person);

console.log(objPerson);

window.localStorage.setItem("object", objPerson);

res = window.localStorage.getItem("object");
 
console.log( JSON.parse(res) );

//c.innerHTML = JSON.parse(res);
//c2 = document.getElementById("content2");
//c2.innerHTML = window.sessionStorage.getItem(name);









