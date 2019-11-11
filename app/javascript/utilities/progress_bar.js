document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if(progressBar) {
    var progress = progressBar.dataset.progress + '%'
    var completed = (progressBar.dataset.completed == 'true')
    var passed = (progressBar.dataset.passed == 'true')
    // console.log(typeof(completed))

    progressBar.style.width = progress
    progressBar.textContent = progress
    if(completed && passed) {
      progressBar.classList.add('bg-success')
    } else if(completed) {
      progressBar.classList.add('bg-danger')
    }
  }
})