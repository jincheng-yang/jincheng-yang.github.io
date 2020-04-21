function adjustNav() {
  document.getElementById('li0').style.display = ''
  document.getElementById('li1').style.display = ''
  document.getElementById('li2').style.display = ''
  document.getElementById('li4').style.display = ''
  document.getElementById('li5').style.display = 'none'
  y0 = document.getElementById('li0').getBoundingClientRect().y
  y4 = document.getElementById('li4').getBoundingClientRect().y
  if (Math.abs(y4 - y0) > 1) {
    document.getElementById('li0').style.display = 'none'
    document.getElementById('li1').style.display = 'none'
    document.getElementById('li2').style.display = 'none'
    document.getElementById('li4').style.display = 'none'
    document.getElementById('li5').style.display = ''
  }
}
