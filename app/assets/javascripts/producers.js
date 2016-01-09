// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function createSeller(producer_id) {
  $.ajax({
    url: '/producers/1/',
    data: { seller: "create" },
    type: 'PUT',
    success: function(result) {
      console.log("seller created");
    }
  });
}
