document.addEventListener("turbolinks:load", function() {
  $('#flash-dismiss').click(function() {
    $('.flash').slideUp()
  })
})