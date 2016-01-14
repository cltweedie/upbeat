// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function createSeller(producer_id) {
  $.ajax({
    url: '/producers/1/',
    data: { seller: "create" },
    type: 'PUT',
    success: function(result) {
      console.log("seller created");
      var notice = $('<div>');
      notice.addClass('alert alert-success');
      notice.text('Thank you for registering as a seller.')

      $('#alert-container').append(notice);
      $('#seller-register').hide();
    }
  });
}
