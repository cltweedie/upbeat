// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var sound_id;

  $('#new-comment-button').click(showCommentForm);

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
