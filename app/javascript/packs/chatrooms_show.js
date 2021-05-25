document.addEventListener('DOMContentLoaded', function() {
  const message_form = document.getElementById("message-input")

  message_form.addEventListener("submit", function(e) {
    e.preventDefault()
    this.submit()
    document.getElementsByClassName("text-field")[0].value = ''
  })
})