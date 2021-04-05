document.addEventListener('DOMContentLoaded', () => {
  document.querySelector('.account-button').addEventListener('click', () => {
    const loginContainer = document.getElementById('account-housing')
    const currentShowState = loginContainer.style.display
    if (currentShowState == 'none' || currentShowState == '') {
      loginContainer.style.display = 'initial'
    } else {
      loginContainer.style.display = 'none'
    }
  })
})
