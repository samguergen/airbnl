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

$('#commentlink').on('click', function(event){
  console.log(event)
  event.preventDefault();
  $.ajax({
    type: "GET",
    url: this.href,
  }).done(function(response){
    console.log(response)
    $('#comments_section').append(response)
  });
});

});
