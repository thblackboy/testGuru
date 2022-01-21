document.addEventListener('turbolinks:load', function () {
  var password = document.getElementById('user_password')
  var passwordConfirmation = document.getElementById('user_password_confirmation')
  if (password) { password.addEventListener('input', passwordMatch) }
  if (passwordConfirmation) { passwordConfirmation.addEventListener('input', passwordMatch) }
})

function passwordMatch() {
  var password = document.getElementById('user_password')
  var passwordConfirmation = document.getElementById('user_password_confirmation')
  if (password.value != "" && passwordConfirmation.value != "") {
      if(password.value != passwordConfirmation.value ) {
        password.classList.remove('success')
        passwordConfirmation.classList.remove('success')
        password.classList.add('fail')
        passwordConfirmation.classList.add('fail')
      } else {
        password.classList.remove('fail')
        passwordConfirmation.classList.remove('fail')
        password.classList.add('success')
        passwordConfirmation.classList.add('success')
      }
  } else {
    password.classList.remove('fail')
    passwordConfirmation.classList.remove('fail')
    password.classList.remove('success')
    passwordConfirmation.classList.remove('success')
  }
}