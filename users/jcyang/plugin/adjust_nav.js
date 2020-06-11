function adjustNav() {
  document.getElementById('li3').style.display = ''
  document.getElementById('li1').style.display = ''
  document.getElementById('li2').style.display = ''
  document.getElementById('li6').style.display = ''
  document.getElementById('li5').style.display = 'none'
  y0 = document.getElementById('li3').getBoundingClientRect().y
  y4 = document.getElementById('li6').getBoundingClientRect().y
  if (Math.abs(y4 - y0) > 1) {
    document.getElementById('li3').style.display = 'none'
    document.getElementById('li1').style.display = 'none'
    document.getElementById('li2').style.display = 'none'
    document.getElementById('li6').style.display = 'none'
    document.getElementById('li5').style.display = ''
  }
}
