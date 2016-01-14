// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var sound_id;
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
