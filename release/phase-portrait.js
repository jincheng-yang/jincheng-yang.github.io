var DT = 0.01;
var agents = [];
var TIME_SCALE = 0.2;
var AGENT_COUNT = 100;
var GRID = 3;
var MAX_AGENT_GRID = 20;
var TRAIL_LENGTH = 5;
var TRAIL_DELAY = 5;
var COLOR_SCHEME = new Array(TRAIL_LENGTH)
var UNIFORM_SPEED = false
var REVERSE_TIME = false
var SPEED_LIMIT = 2
var LOWER_SPEED_LIMIT = 1e-6
var CLOSENESS_EPSILON = 1e-3

// for (var i = 0; i < TRAIL_LENGTH; i++) {
//   COLOR_SCHEME[i] = "#" + i * 11 + i * 11 + i * 11;
// }
COLOR_SCHEME = ["#B8DEE6", "#DEB8E6", "#DEE6B8", "#E6B8DE", "#B8E6DE"]//, "#E6DEB8", "#B8B8B8"]

class Agent {
  
  constructor(i) {
    this.id = i
    this.xs = new Array(TRAIL_LENGTH)
    this.ys = new Array(TRAIL_LENGTH)
    this.randomize()
    this.calculateTrail()

    for (var j = TRAIL_LENGTH - 1; j > 0; j--) {      
      view.append("line")
        .attr("x1", window_left - 100)
        .attr("x2", window_left - 101)
        .attr("y1", window_left - 100)
        .attr("y2", window_left - 100)
        .attr("id", "line" + i + "-" + j)
        .attr("stroke-linecap", "round")
        .attr("vector-effect", "non-scaling-stroke")
        .style("stroke", COLOR_SCHEME[j])
        .style("stroke-opacity", 1 - 0.2 * j)
        .style("stroke-width", 5)
    }
  }
  
  randomize() {
    this.xs[0] = window_left + Math.random() * window_width
    this.ys[0] = window_bottom + Math.random() * window_height
  }

  calculateTrail() {
    for (var j = 1; j < TRAIL_LENGTH; j++) {
      [this.xs[j], this.ys[j]] = backward(this.xs[j - 1], this.ys[j - 1], TRAIL_DELAY)
    }
  }

  isOutside() {
    return this.xs[0] < window_left | this.xs[0] > window_right | this.ys[0] < window_bottom | this.ys[0] > window_top
  }

  update() {
    if (this.isOutside()) {
      this.randomize()
    } else {
      [this.xs[0], this.ys[0]] = forward(this.xs[0], this.ys[0], 1)
    }
    this.calculateTrail()
    this.show()
  }
  
  show() {
    for (var j = TRAIL_LENGTH - 1; j > 0; j--) {
      if (isNaN(this.xs[j] + this.xs[j - 1] + this.ys[j] + this.ys[j - 1])) {
        continue
      }
      if (Math.abs(this.xs[j] - this.xs[j - 1]) + Math.abs(this.ys[j] - this.ys[j - 1]) < LOWER_SPEED_LIMIT * window_width) {
        continue
      }
      d3.select("#line" + this.id + "-" + j)
        .attr("x1", this.xs[j])
        .attr("y1", -this.ys[j]) // Reverse the vertical axis
        .attr("x2", this.xs[j - 1])
        .attr("y2", -this.ys[j - 1])
    }
  }
}

for (var i = 0; i < AGENT_COUNT; i++) {
  agents.push(new Agent(i));
}

function forward(x, y, n) {
  var vx, vy
  for (var i = 0; i < n; i++) {
    [vx, vy] = calculateSpeed(x, y)
    dx = vx * DT
    dy = vy * DT
    x += dx
    y += dy
  }
  return [x, y]
}

function backward(x, y, n) {
  var vx, vy
  for (var i = 0; i < n; i++) {
    [vx, vy] = calculateSpeed(x, y)
    dx = vx * DT
    dy = vy * DT
    x -= dx
    y -= dy
  }
  return [x, y]
}

function calculateSpeed(x, y) {
  vx = code_vx.evaluate({x: x, y: y})
  vy = code_vy.evaluate({x: x, y: y})

  if (UNIFORM_SPEED) {
    if (vx * vx + vy * vy > 0) {
      var v_norm = Math.sqrt(vx * vx + vy * vy)
      vx /= v_norm
      vy /= v_norm
    }
  }

  // Speed Limit
  var current_speed_limit = SPEED_LIMIT * window_width
  if (vx * vx + vy * vy > current_speed_limit * current_speed_limit) {
    var v_norm = Math.sqrt(vx * vx + vy * vy)
    vx = vx / v_norm * current_speed_limit
    vy = vy / v_norm * current_speed_limit
  }

  if (REVERSE_TIME) {
    vx = -vx
    vy = -vy
  }
  return [vx, vy]
}

// updateArgument();
window.requestAnimationFrame(draw2);
var start = new Date().getTime();

async function draw2() {
  DT = (new Date().getTime() - start) * 0.001 * TIME_SCALE
  start = new Date().getTime()

  for (const a of agents) {
    a.update();
  }

  distribution_control();
  // await new Promise(r => setTimeout(r, 30));

  window.requestAnimationFrame(draw2);
}

function distribution_control() {
  // If two agents are too close, initialize one of them
  for (var i = 0; i < AGENT_COUNT - 1; i++) {
    for (var j = i + 1; j < AGENT_COUNT; j++) {
      if (Math.abs(agents[i].xs[0] - agents[j].xs[0]) + Math.abs(agents[i].ys[0] - agents[j].ys[0]) < CLOSENESS_EPSILON * window_width) {
        agents[j].randomize()
        continue
      }
    }
  }

  // Have at most MAX_AGENT_GRID in each box
  count_num = []
  for (var i = 0; i < GRID; i++) {
    count_num.push(new Array(GRID).fill(0))
  } // Initialize GRID by GRID zero matrix

  random_index = getRandomIndex(AGENT_COUNT)
  for (var i = 0; i < AGENT_COUNT; i++) {
    a = agents[random_index[i]]
    if (!a.isOutside()) {
      xi = Math.floor(GRID * (a.xs[0] - window_left) / window_width)
      yi = Math.floor(GRID * (a.ys[0] - window_bottom) / window_height)
      if (count_num[xi][yi]++ > MAX_AGENT_GRID) {
        a.randomize()
        a.calculateTrail()
      }
    }
  }
}

function getRandomIndex(n) {
  arr = []
  for (var i = 0; i < n; i++) {
    position = Math.floor(Math.random() * (i + 1))
    arr.splice(position, 0, i)
  }
  return arr
}

