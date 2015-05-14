$(document).ready(function() {

//ajax for votes

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

  //ajax post for adding new comments

  $('#commentform').on('submit', function(event){
    event.preventDefault();

    var $form = $( this ),

    comment = $form.find( "input[name='description']" ).val();
    // url = $form.attr( "action" );
    // var id = $(event.target).attr('data-id');
    var id = $(event.target).data('url');
    var url = '/posts/' + id + '/comments';


  $.ajax({
      method: 'POST',
      url: url,
      data: {
        comment_id: comment
      }
    }).done(function(result){
      $('#all_comments').append(result);
      // $('').toggle(false);

    });
  });


 //  //ajax get for displaying edit criteria form

 //  $('.edit').on('click', function(event){
 //    event.preventDefault();
 //    target = event.target;
 //    $.ajax({
 //      url: target.pathname
 //    }).done(function(result){
 //      $('.preflist').append(result);
 //    });
 //    });

 //  // ajax edit form

 //  $('.preflist').on('submit', '.editcrit', function(event){
 //    event.preventDefault();
 //      // debugger;
 //    target = event.target;
 //    var id = $(event.target).data('critId');

 //    var $form = $( this ),

 //    score = $form.find( "input[name='score']" ).val(),
 //    search = $form.find( "input[name='search']" ).val();
 //    // url = $form.attr( "action" );
 //  $.ajax({
 //      method: 'PATCH',
 //      url: target.action,
 //      data: {
 //        score: score,
 //        search: search
 //      }
 //    }).done(function(result){
 //      $('#crits_'+id).html(result);
 //    });
 //  });


 //  // ajax delete form

 //  $('body').on('click', '.ajax-delete', function(event){
 //    event.preventDefault();
 //    var id = $(event.target).attr('data-id');
 //    var url = '/user_preferences/' + id;
 //    $.ajax({
 //      method: 'DELETE',
 //      url: url
 //    }).done(function(result){
 //      var selector = "#crits_" + id;
 //      $(selector).remove();
 //    });
 //  });





});
