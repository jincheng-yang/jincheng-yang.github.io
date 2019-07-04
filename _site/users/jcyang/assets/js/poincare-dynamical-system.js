var canvas2 = document.getElementById("myCanvas2");
var ctx2 = canvas2.getContext("2d");

var window_width = 8;
var window_height = 8;
var window_left = -window_width / 2;
var window_right = window_width / 2;
var window_top = window_height / 2;
var window_bottom = -window_height / 2;

var scaling_width = canvas2.width / window_width;
var scaling_height = canvas2.height / window_height;
var stroke_width = 1.00 / scaling_width;

ctx2.translate(-window_left * scaling_width, window_top * scaling_height);
ctx2.scale(scaling_width, scaling_height);
ctx2.lineWidth = stroke_width;

var DT = 0.001;
var agents = [];
let AGENT_COUNT = 500;

class Agent {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.dx = 0;
    this.dy = 0;
  }
  
  update() {
    this.x += this.dx;
    this.y += this.dy;
    this.show();
    this.calculateSpeed();

    var RR = 4;
    var UU = RR * RR + this.x * this.x + this.y * this.y;
    var UU = Math.sqrt(UU);

    if (Math.random() < 0.01 | UU > 5 * RR) {
      do {
        var x_hat = Math.random() * RR - RR / 2;
        var y_hat = Math.random() * RR - RR / 2;
      } while (x_hat * x_hat + y_hat * y_hat > RR * RR);
      this.x = x_hat * UU / RR;
      this.y = y_hat * UU / RR;
    	// this.x = window_left + Math.random() * window_width;
      // this.y = window_bottom + Math.random() * window_height;
    }
  }
  
  calculateSpeed() {
    this.dx = (2 * this.x - 2 * this.x * this.y) * DT;
    this.dy = (2 * this.y - this.x * this.x + this.y * this.y) * DT
  }
  
  show() {
    ctx2.beginPath();
    var RR = 4;
    var UU = RR * RR + this.x * this.x + this.y * this.y;
    var UU = Math.sqrt(UU);
    var new_x = this.x * RR / UU;
    var new_y = this.y * RR / UU;
    // ctx2.arc(this.x, -this.y, stroke_width, 0, 2 * Math.PI);
    ctx2.arc(new_x, -new_y, stroke_width, 0, 2 * Math.PI);
    ctx2.stroke();
  }
}

for (var i = 0; i < AGENT_COUNT; i++) {
  agents.push(new Agent((Math.random() - 0.5) * window_width, (Math.random() - 0.5) * window_height));
}

window.requestAnimationFrame(draw2);

function draw2() {
  clear2();
  drawGrid();
    
  for (i = 0; i < AGENT_COUNT; i++) {
    agents[i].update();
  }

  window.requestAnimationFrame(draw2);
}

function clear2() {
  ctx2.fillStyle = 'rgba(250, 250, 250, 0.02)';
  ctx2.fillRect(window_left, -window_top, window_width, window_height);
}

function clear2All() {
  ctx2.fillStyle = 'white';
  ctx2.fillRect(window_left, -window_top, window_width, window_height);
}

function normalize(x) {
  norm = Math.sqrt(x[0] * x[0] + x[1] * x[1]);
  return [x[0] / norm, x[1] / norm]
}

function drawGrid() {
  ctx2.strokeStyle = 'rgba(128, 128, 128, 0.3)';
  for (i = Math.floor(window_left); i <= Math.ceil(window_right); i++) {
    line(i, -window_top, i, -window_bottom);
  }
  for (j = Math.floor(window_bottom); j <= Math.ceil(window_top); j++) {
    line(window_left, -j, window_right, -j);
  }
  ctx2.strokeStyle = 'rgba(0, 0, 32, 0.8)';
  line(0, -window_top, 0, -window_bottom);
  line(window_left, 0, window_right, 0);
}

function line(x1, y1, x2, y2) {
  ctx2.beginPath();
  ctx2.moveTo(x1, y1);
  ctx2.lineTo(x2, y2);
  ctx2.stroke();
}