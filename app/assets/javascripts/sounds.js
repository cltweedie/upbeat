// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {

  $('#instrument-option').click(function() {
    console.log("clicked");
    $('#instrument-select').toggle();
  });

  $('#category-option').click(function() {
    console.log("clicked");
    $('#category-select').toggle();
  });

  $('#tag-option').click(function() {
    console.log("clicked");
    $('#tag-select').toggle();
  });

});
