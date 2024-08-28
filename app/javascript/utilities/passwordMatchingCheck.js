const checkPassword = (e) => {
  const inputPassword = document.getElementById('password');
  const alert = document.querySelector('.octicon-alert');
  const check = document.querySelector('.octicon-check');

  if (e.target.value === '') {
    alert.classList.add('hide');
    check.classList.add('hide');
  } else if (e.target.value !== inputPassword.value) {
    alert.classList.remove('hide');
    check.classList.add('hide');
  } else {
    alert.classList.add('hide');
    check.classList.remove('hide');
  }
};

document.addEventListener('turbolinks:load', () => {
  const inputPasswordConfirmation = document.getElementById('password_confirmation');

  if (inputPasswordConfirmation) {
    inputPasswordConfirmation.addEventListener('input', checkPassword);
  }
});
