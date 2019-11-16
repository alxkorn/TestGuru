document.addEventListener('turbolinks:load', function() {
  var timer = $('#timer')
  if(timer.length) {
    var timeLimit = timer.data('timeLimit')
    setInterval(function() {
      if(timeLimit>0) {
        timeLimit-=1
        $('#min').html(parseInt(timeLimit/60))
        $('#sec').html(timeLimit%60)
      } else {
        $('form').submit()
      }
    }, 1000)
  }
})