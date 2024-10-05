const updateTimer = (timeLeftElement, form) => {
  const endTime = parseInt(timeLeftElement.dataset.testEndTime, 10);

  const countdown = setInterval(() => {
    const currentTime = Math.floor(Date.now() / 1000);
    const timeLeft = endTime - currentTime;

    if (timeLeft <= 0) {
      clearInterval(countdown);
      form.submit();
    } else {
      timeLeftElement.textContent = `${Math.floor(timeLeft / 60)}:${timeLeft % 60 < 10 ? '0' : ''}${timeLeft % 60}`;
    }
  }, 1000);
};

document.addEventListener('turbo:load', () => {
  const timeLeftElement = document.querySelector('.timeLeft');
  const form = document.querySelector('.testFrom');

  if (timeLeftElement && form) {
    updateTimer(timeLeftElement, form);
  }
});

document.addEventListener('turbo:frame-load', () => {
  const timeLeftElement = document.querySelector('.timeLeft');
  const form = document.querySelector('.testFrom');

  if (timeLeftElement && form) {
    updateTimer(timeLeftElement);
  }
});
