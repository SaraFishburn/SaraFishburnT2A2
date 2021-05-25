document.addEventListener('DOMContentLoaded', function() {

  const owner_button = document.getElementById("owner_button")
  const profile_pic = document.getElementById("user_profile_pic")
  const edit_icon = document.getElementById("edit-profile-pic-icon")

  edit_icon.addEventListener("click", function() {
    document.getElementById("user_profile_pic").click()
  })


  profile_pic.addEventListener("change", function() {
    console.log(document.getElementsByName("profile_pic_submit"))
    document.getElementsByName("profile_pic_submit")[0].click()
  })

  owner_button.addEventListener('click', function() {
    document.getElementById("account-address-field").style.display = ''
  })

})