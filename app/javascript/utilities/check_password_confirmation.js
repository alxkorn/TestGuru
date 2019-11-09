document.addEventListener('turbolinks:load', function() {
  var password_confirmation = document.querySelector('.password_confirmation')
  if (password_confirmation) {
    password_confirmation.addEventListener(
      'input',
      check_password_confirmation)
    }
})

function check_password_confirmation () {
  var password_confirmation = document.querySelector('.password_confirmation')
  var password = document.querySelector('.password')
  var password_icons = document.querySelector('.password_icons')
  var password_confirmation_icons = document.querySelector('.password_confirmation_icons')

  if (password_confirmation.value == "") {
    manipulate_icons({'x':'add', 'check':'add'}, password_icons)
    manipulate_icons({'x':'add', 'check':'add'}, password_confirmation_icons)
    return 
  }

  if (password_confirmation.value == password.value) {
    manipulate_icons({'x':'add', 'check':'remove'}, password_icons)
    manipulate_icons({'x':'add', 'check':'remove'}, password_confirmation_icons)
  } else {
    manipulate_icons({'x':'remove', 'check':'add'}, password_icons)
    manipulate_icons({'x':'remove', 'check':'add'}, password_confirmation_icons)
  }
  
}

function manipulate_icons (instructions, area, style_name='hide') {
  var changed_area = area.cloneNode(deep=true)

  for(var icon_name in instructions) {
    var action = instructions[icon_name]
    var icons = changed_area.querySelectorAll('.octicon-' + icon_name)
    for(var i = 0; i < icons.length; i++) {
      icons[i].classList[action](style_name)
    }
  }

  area.parentNode.replaceChild(changed_area, area)
}