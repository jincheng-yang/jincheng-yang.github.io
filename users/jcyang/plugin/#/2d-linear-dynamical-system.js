var canvas = document.getElementById("myCanvas2");
var ctx = canvas.getContext("2d");
ctx.translate(200, 200);
ctx.scale(10, 10);
ctx.lineWidth = 0.01;

var width = 40;
var height = 40;
var DT = 0.01;
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
    if (Math.random() < 0.01) {
    	this.x = (Math.random() - 0.5) * width;
        this.y = (Math.random() - 0.5) * height;
    }
  }
  
  calculateSpeed() {
    this.dx = -(3 * this.x + 1 * this.y) * DT;
    this.dy = -(1 * this.x + 3 * this.y) * DT;
  }
  
  show() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, 0.05, 0, 2 * Math.PI);
    ctx.stroke();
  }
}

for (var i = 0; i < AGENT_COUNT; i++) {
  agents.push(new Agent((Math.random() - 0.5) * width, (Math.random() - 0.5) * height));
}

window.requestAnimationFrame(draw);

function draw() {
  clear();
  ctx.beginPath();
  ctx.arc(200, 200, 2, 0, 2 * Math.PI);
  ctx.stroke();
    
  for (i = 0; i < AGENT_COUNT; i++) {
    agents[i].update();
  }

  window.requestAnimationFrame(draw);
}

function clear() {
  ctx.fillStyle = 'rgba(250, 250, 250, 0.02)';
  ctx.fillRect(-width / 2, -height / 2, width, height);
}

