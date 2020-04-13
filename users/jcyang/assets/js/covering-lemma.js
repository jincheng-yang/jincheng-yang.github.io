var view = d3.select('#vitali')

view_left = 0
view_width = 600
view_top = 0
view_height = 600
circle_count = 100
cube_count = 100
radius_max = 60
radius_min = 5

xs = new Array(circle_count)
ys = new Array(circle_count)
rs = new Array(circle_count)
ss = new Array(circle_count)
selected = []
removed = []

function generate() {
  for (var i = 0; i < circle_count; i++) {
    xs[i] = view_left + view_width * Math.random()
    ys[i] = view_left + view_width * Math.random()
    rs[i] = radius_min + (radius_max - radius_min) * Math.random()
    ss[i] = 'default'
    view.append('circle')
      .attr('cx', xs[i])
      .attr('cy', ys[i])
      .attr('r', rs[i])
      .attr('id', 'circle' + i)
      .attr('stroke-width', 1)
  }
  update_appearance()

  d3.selectAll('input[onclick = "generate()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "find_max()"]')
    .attr('disabled',null)
  d3.selectAll('input[onclick = "find_neighbors()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "remove()"]')
    .attr('disabled','disabled')
  d3.select('#show-hide')
    .attr('disabled',null)
}

function update_appearance() {
  for (var i = 0; i < circle_count; i++) {
    circ = d3.select('#circle' + i)
    if (ss[i] == 'default') {
      circ.attr('stroke', '#89438C')
          .attr('stroke-opacity', 1)
          .attr('fill', '#89438C')
          .attr('fill-opacity', 0.2)
    } else if (ss[i] == 'highlight') {
      circ.attr('stroke', '#89438C')
          .attr('stroke-opacity', 1)
          .attr('fill', '#89438C')
          .attr('fill-opacity', 0.8)
    } else if (ss[i] == 'fade') {
      circ.attr('stroke', '#89438C')
          .attr('stroke-opacity', 0.2)
          .attr('fill', '#89438C')
          .attr('fill-opacity', 0.1)
    } else if (ss[i] == 'none') {
      circ.attr('stroke', 'none')
          .attr('fill', 'none')
    }
  }
}

function find_max() {
  max_r = 0
  max_i = 0
  for (var i = 0; i < circle_count; i++) {
    if (ss[i] != 'none') {
      if (rs[i] > max_r) {
        max_i = i
        max_r = rs[i]
      }
    }
  }

  ss[max_i] = 'highlight'
  update_appearance() 
  selected.push(max_i)

  d3.selectAll('input[onclick = "find_max()"]')
    .attr('disabled',null)
  d3.selectAll('input[onclick = "find_neighbors()"]')
    .attr('disabled',null)
  d3.select('#show-hide')
    .attr('disabled','disabled')
}

function find_neighbors() {
  for (var i = 0; i < circle_count; i++) {
    if (ss[i] == 'default') {
      distance = dist(xs[i], ys[i], xs[max_i], ys[max_i])
      if (distance > rs[i] + rs[max_i]) {
        ss[i] = 'fade'
      }
    }
  }

  update_appearance() 

  d3.selectAll('input[onclick = "find_neighbors()"]')
    .attr('disabled',null)
  d3.selectAll('input[onclick = "remove()"]')
    .attr('disabled',null)
}

function remove() {
  for (var i = 0; i < circle_count; i++) {
    if (ss[i] == 'fade') {
      ss[i] = 'default'
    } else {
      ss[i] = 'none'
      removed.push(i)
    }
  }

  update_appearance()

  d3.selectAll('input[onclick = "find_max()"]')
    .attr('disabled',null)
  d3.selectAll('input[onclick = "find_neighbors()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "remove()"]')
    .attr('disabled','disabled')
  d3.select('#show-hide')
    .attr('disabled',null)
}

function show_selection() {
  for (var i = 0; i < circle_count; i++) ss[i] = 'fade'
  for (var i of selected) ss[i] = 'highlight'

  update_appearance()

  d3.selectAll('input[onclick = "find_max()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "find_neighbors()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "remove()"]')
    .attr('disabled','disabled')
  d3.select('#show-hide')
    .attr('value', 'Show Removed')
}

function show_removed() {
  for (var i = 0; i < circle_count; i++) ss[i] = 'fade'
  for (var i of removed) ss[i] = 'default'
  for (var i of selected) ss[i] = 'highlight'

  update_appearance()

  d3.selectAll('input[onclick = "find_max()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "find_neighbors()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "remove()"]')
    .attr('disabled','disabled')
  d3.select('#show-hide')
    .attr('value', 'Hide')
}

function hide() {
  remove()
  d3.select('#show-hide')
    .attr('value', 'Show Selection')
}

// Cubes version

var bview = d3.select('#besicovitch')

bxs = new Array(cube_count)
bys = new Array(cube_count)
brs = new Array(cube_count)
bss = new Array(cube_count)
bselected = []
bremoved = []

function bgenerate() {
  for (var i = 0; i < cube_count; i++) {
    bxs[i] = view_left + view_width * Math.random()
    bys[i] = view_left + view_width * Math.random()
    brs[i] = radius_min + (radius_max - radius_min) * Math.random()
    bss[i] = 'default'
    bview.append('rect')
      .attr('x', bxs[i] - brs[i])
      .attr('y', bys[i] - brs[i])
      .attr('width', brs[i] * 2)
      .attr('height', brs[i] * 2)
      .attr('id', 'cube' + i)
      .style('stroke-width', 1)
  }
  bupdate_appearance()
  
  d3.selectAll('input[onclick = "bgenerate()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "bfind_max()"]')
    .attr('disabled',null)
  d3.selectAll('input[onclick = "bfind_neighbors()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "bremove()"]')
    .attr('disabled','disabled')
  d3.select('#bshow-hide')
    .attr('disabled',null)
}

function bupdate_appearance() {
  for (var i = 0; i < cube_count; i++) {
    cube = d3.select('#cube' + i)
    if (bss[i] == 'default') {
      cube.style('stroke', '#89438C')
          .style('stroke-opacity', 1)
          .style('fill', '#89438C')
          .style('fill-opacity', 0.2)
    } else if (bss[i] == 'highlight') {
      cube.style('stroke', '#89438C')
          .style('stroke-opacity', 1)
          .style('fill', '#89438C')
          .style('fill-opacity', 0.7)
    } else if (bss[i] == 'fade') {
      cube.style('stroke', '#89438C')
          .style('stroke-opacity', 0.2)
          .style('fill', '#89438C')
          .style('fill-opacity', 0.1)
    } else if (bss[i] == 'none') {
      cube.style('stroke', 'none')
          .style('fill', 'none')
    }
  }
}

function bfind_max() {
  max_r = 0
  max_i = 0
  for (var i = 0; i < circle_count; i++) {
    if (bss[i] != 'none') {
      if (brs[i] > max_r) {
        max_i = i
        max_r = brs[i]
      }
    }
  }

  bss[max_i] = 'highlight'
  bupdate_appearance() 
  bselected.push(max_i)

  d3.selectAll('input[onclick = "bfind_max()"]')
    .attr('disabled',null)
  d3.selectAll('input[onclick = "bfind_neighbors()"]')
    .attr('disabled',null)
  d3.select('#bshow-hide')
    .attr('disabled','disabled')
}

function bfind_neighbors() {
  for (var i = 0; i < cube_count; i++) {
    if (bss[i] == 'default') {
      distance = Math.max(Math.abs(bxs[i] - bxs[max_i]), Math.abs(bys[i] - bys[max_i]))
      if (distance > brs[max_i]) {
        bss[i] = 'fade'
      }
    }
  }

  bupdate_appearance() 

  d3.selectAll('input[onclick = "bfind_neighbors()"]')
    .attr('disabled',null)
  d3.selectAll('input[onclick = "bremove()"]')
    .attr('disabled',null)
}

function bremove() {
  for (var i = 0; i < cube_count; i++) {
    if (bss[i] == 'fade') {
      bss[i] = 'default'
    } else {
      bss[i] = 'none'
      bremoved.push(i)
    }
  }

  bupdate_appearance()

  d3.selectAll('input[onclick = "bfind_max()"]')
    .attr('disabled',null)
  d3.selectAll('input[onclick = "bfind_neighbors()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "bremove()"]')
    .attr('disabled','disabled')
  d3.select('#bshow-hide')
    .attr('disabled',null)
}

function bshow_selection() {
  for (var i = 0; i < cube_count; i++) bss[i] = 'fade'
  for (var i of bselected) bss[i] = 'highlight'

  bupdate_appearance()

  d3.selectAll('input[onclick = "bfind_max()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "bfind_neighbors()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "bremove()"]')
    .attr('disabled','disabled')
  d3.select('#bshow-hide')
    .attr('value', 'Show Removed')
}

function bshow_removed() {
  for (var i = 0; i < cube_count; i++) bss[i] = 'fade'
  for (var i of bremoved) bss[i] = 'default'
  for (var i of bselected) bss[i] = 'highlight'

  bupdate_appearance()

  d3.selectAll('input[onclick = "bfind_max()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "bfind_neighbors()"]')
    .attr('disabled','disabled')
  d3.selectAll('input[onclick = "bremove()"]')
    .attr('disabled','disabled')
  d3.select('#bshow-hide')
    .attr('value', 'Hide')
}

function bhide() {
  bremove()
  d3.select('#bshow-hide')
    .attr('value', 'Show Selection')
}