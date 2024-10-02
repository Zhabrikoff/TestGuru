const updateTimer = (timeLeftElement) => {
  const endTime = parseInt(timeLeftElement.dataset.testEndTime, 10);

  const countdown = setInterval(() => {
    const currentTime = Math.floor(Date.now() / 1000);
    const timeLeft = endTime - currentTime;

    if (timeLeft <= 0) {
      clearInterval(countdown);
      window.location.href = timeLeftElement.dataset.redirectUrl;
    } else {
      timeLeftElement.textContent = `${Math.floor(timeLeft / 60)}:${timeLeft % 60 < 10 ? '0' : ''}${timeLeft % 60}`;
    }
  }, 1000);
};

document.addEventListener('turbo:load', () => {
  const timeLeftElement = document.querySelector('.timeLeft');

  if (timeLeftElement) {
    updateTimer(timeLeftElement);
  }
});

document.addEventListener('turbo:frame-load', () => {
  const timeLeftElement = document.querySelector('.timeLeft');

  if (timeLeftElement) {
    updateTimer(timeLeftElement);
  }
});
