$(function(){
  $('#image-overlay').hide();

  $('#my-image').on("click", function() {
    $('#image-overlay').show();
    $('#image-overlay').append("<div><img src='img/mouton.jpg' height='480' width='640'></div>")
   });

  $('#image-overlay').on("click", function() {
    $('#image-overlay').hide();
    $('#image-overlay').empty()
  });

})