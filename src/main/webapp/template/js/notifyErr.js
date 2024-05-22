// var oldHTML = document.getElementsByTagName("body")
var newElement = document.createElement(
    "script")
newElement.src = "https://cdn.jsdelivr.net/npm/sweetalert2@11"
document.body.appendChild(newElement)
$(document).ready(function() {
    console.log( "ready!" );


});

function notify(obj){
    Swal.fire(obj)
}


