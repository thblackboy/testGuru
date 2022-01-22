document.addEventListener('turbolinks:load', function() {
  let passageProgress = document.querySelector('.passage-progress')

  if (passageProgress) { setProgress(passageProgress) }
})

function setProgress (passageProgress) {
  let passedQuestionsCount = passageProgress.dataset.passedQuestionsCount
  let questionsCount = passageProgress.dataset.questionsCount
  let progressRatio = passedQuestionsCount / questionsCount * 100
  passageProgress.style.width = progressRatio + "%"
}
