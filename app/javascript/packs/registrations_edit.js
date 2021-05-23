document.addEventListener('DOMContentLoaded', function() {

  const owner_button = document.getElementById("owner_button")


  owner_button.addEventListener('click', function() {
    document.getElementById("account-address-field").style.display = ''
  })
})