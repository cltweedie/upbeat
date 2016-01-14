$(function() {
  // click event to show the comment form
  $('#new-comment-button').click(showCommentForm);

  // check the comment is long enough when submitted
  $('#new_comment').submit(function(event) { checkCommentIsValid(event) })

  // render the new comment on the DOM
  $("#new_comment").on("ajax:success", function(e, data, status, xhr) {
    var comment = new Comment(data.producer_email, data.comment.body);
    comment.render();
    hideCommentForm();
  });
});

function showCommentForm() {
  $('#new-comment-button').hide();
  $("#new-comment-body").val('');
  $('#new-comment-form').fadeIn('fast');
}

function hideCommentForm() {
  $('#new-comment-form').hide();
  $('#new-comment-button').fadeIn('fast');
}

function checkCommentIsValid(event) {
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
}

function Comment(producer, body) {
  this.producer = producer;
  this.body = body
}

Comment.prototype.render = function() {
  var commentContainer = $('<div>');
  commentContainer.addClass('col-md-6 col-md-offset-3');

  var panelDiv = $('<div>');
  panelDiv.addClass('panel panel-default');

  var panelHeading = $('<div>');
  panelHeading.addClass('panel-heading');
  panelHeading.text(this.producer);

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
  panelBody.text(this.body);

  panelDiv.append(panelHeading, panelBody);
  commentContainer.append(panelDiv);

  $('#comments').append(commentContainer);
}
