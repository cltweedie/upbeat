// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var sound_id;

  $('#new-comment-button').click(showCommentForm);

  $('#new_comment').submit(function(event) {
    if ( $('#new-comment-body').val().length < 5 ) {
      event.preventDefault();
      var notice = $('<div>');
      notice.addClass('alert alert-warning');
      notice.text('Comment body must be at least 5 characters.')
      $('#new_comment').append(notice);
      return false;
    } else {
      return;
    }
  })

  $("#new_comment").on("ajax:success", function(e, data, status, xhr) {
    var comment = new Comment(data.producer_email, data.comment.body);
    comment.render();
    hideCommentForm();
  });
});

function saveSoundId(id) {
  sound_id = id;
}

function deleteSound() {
  $.ajax({
    url: '/sounds/' + sound_id,
    type: 'DELETE',
    success: function(result) {
      console.log("sound deleted");
      $("#sound-section-" + sound_id).remove();
    }
  });
}
