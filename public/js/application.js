$(document).ready(function() {

$('.pvotes').on('submit', function(event){
  event.preventDefault();
  $.ajax({
    type: this.method,
    url: this.action,
  }).done(function(response){
    $('#votes').replaceWith(response)
  });
});
});
