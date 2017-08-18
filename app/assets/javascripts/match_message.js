$(function() {
  $('.matching_item').on('click', function(e) {
    $('.box_message_inner_right').show();
  });

  $('.button_message_submit').on('click', function(e){
    var message = $('.message_textarea').val();
    console.log(message)
  })
});
