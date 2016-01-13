// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var sound_id;

  $('#new-comment-button').click(showCommentForm);

  $("#new_comment").on("ajax:success", function(e, data, status, xhr) {

    var commentContainer = $('<div>');
    commentContainer.addClass('col-md-6 col-md-offset-3');

    var panelDiv = $('<div>');
    panelDiv.addClass('panel panel-default');

    var panelHeading = $('<div>');
    panelHeading.addClass('panel-heading');
    panelHeading.text(data.producer_email);

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1
    var yyyy = today.getFullYear();

    var date = $('<span>');
    date.addClass('text--right');
    date.append(dd + "/" + mm + "/" + yyyy);

    panelHeading.append(date);

    var panelBody = $('<div>');
    panelBody.addClass('panel-body');
    panelBody.text(data.comment.body);

    panelDiv.append(panelHeading, panelBody);
    commentContainer.append(panelDiv);

    $('#comments').append(commentContainer);
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

function showCommentForm() {
  $('#new-comment-button').hide();
  $('#new-comment-form').fadeIn('fast');
}

function hideCommentForm() {
  $('#new-comment-form').hide();
  $('#new-comment-button').fadeIn('fast');
}

