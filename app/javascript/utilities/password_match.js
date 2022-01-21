document.addEventListener('turbolinks:load', function () {
  const passFields = document.querySelector('.password-fields')
  if (passFields) { passFields.addEventListener('input', passwordMatch) }
})
let passwords
function passwordMatch() {
  if (passwords == null) { passwords = this.querySelectorAll('input') }
  if (passwords[0].value != "" && passwords[1].value != "") {
      if(passwords[0].value != passwords[1].value ) {
        passwords[0].classList.remove('success')
        passwords[1].classList.remove('success')
        passwords[0].classList.add('fail')
        passwords[1].classList.add('fail')
      } else {
        passwords[0].classList.remove('fail')
        passwords[1].classList.remove('fail')
        passwords[0].classList.add('success')
        passwords[1].classList.add('success')
      }
  } else {
    passwords[0].classList.remove('fail')
    passwords[1].classList.remove('fail')
    passwords[0].classList.remove('success')
    passwords[1].classList.remove('success')
  }
}
