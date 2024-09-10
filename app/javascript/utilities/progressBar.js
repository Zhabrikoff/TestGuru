const updateProgressBar = (progressBar) => {
  const { questionsCompleted } = progressBar.dataset;
  const { numberOfQuestions } = progressBar.dataset;

  const percentageOfProgress = (questionsCompleted / numberOfQuestions) * 100;

  const progressBarElement = progressBar.querySelector('.progress-bar');
  if (progressBarElement) {
    progressBarElement.style.width = `${percentageOfProgress}%`;
    progressBarElement.setAttribute('aria-valuenow', percentageOfProgress);
  }
};

document.addEventListener('turbo:frame-load', () => {
  const progressBar = document.querySelector('.progress');

  if (progressBar) {
    updateProgressBar(progressBar);
  }
});

document.addEventListener('turbo:load', () => {
  const progressBar = document.querySelector('.progress');

  if (progressBar) {
    updateProgressBar(progressBar);
  }
});
