/*
  *
  * TODO: add your code here!
  *
*/
$('#message-wrapper').css("top","-45px");

$('#message-wrapper').animate({
  top: "0px"
},1500);

$( "#message-wrapper" ).click(function() {
  $( "#message" ).slideUp(1500)
});
