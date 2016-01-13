// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function showCommentForm() {
  $('#new-comment-button').hide();
  $('#new-comment-form').fadeIn('fast');
}

function hideCommentForm() {
  $('#new-comment-form').hide();
  $('#new-comment-button').fadeIn('fast');
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
