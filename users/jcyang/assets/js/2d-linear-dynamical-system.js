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

var DT = 0.002;
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
    if (Math.random() < 0.01 | this.x < window_left | this.x > window_right | this.y < window_bottom | this.y > window_top) {
    	this.x = window_left + Math.random() * window_width;
      this.y = window_bottom + Math.random() * window_height;
    }
  }
  
  calculateSpeed() {
    this.dx = (a11 * this.x + a12 * this.y) * DT;
    this.dy = (a21 * this.x + a22 * this.y) * DT;
  }
  
  show() {
    ctx2.beginPath();
    ctx2.arc(this.x, -this.y, stroke_width, 0, 2 * Math.PI);
    ctx2.stroke();
  }
}

for (var i = 0; i < AGENT_COUNT; i++) {
  agents.push(new Agent((Math.random() - 0.5) * window_width, (Math.random() - 0.5) * window_height));
}

updateArgument();
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

/**  
 * Our arguments include: 
 * A matrix (four inputs), 
 * Determinent/Trace (two numbers), 
 * Real Eigenvalues (two numbers), 
 * Real/Imaginary Part of Eigenvalues (two numbers), 
 * isReal (Boolean), 
 * Eigendirection (two numbers),
 * Direction/Eccentricity.
*/

function updateArgument() {
	a11 = parseFloat(document.getElementById("a11").value);
	a12 = parseFloat(document.getElementById("a12").value);
	a21 = parseFloat(document.getElementById("a21").value);
  a22 = parseFloat(document.getElementById("a22").value);
  det = a11 * a22 - a12 * a21;
  tr = a11 + a22;
  if (tr * tr - 4 * det >= 0) {
    realEigens = true;
    lambda1 = (tr + Math.sqrt(tr * tr - 4 * det)) / 2;
    lambda2 = (tr - Math.sqrt(tr * tr - 4 * det)) / 2;
    eigenvector1 = normalize([a12, lambda1 - a11]);
    eigenvector2 = normalize([a12, lambda2 - a11]);
  } else {
    realEigens = false;
    lambda_alpha = tr / 2;
    lambda_beta = Math.sqrt(-tr * tr + 4 * det) / 2;
    eccentricity = -a12 / a21;
    rotational_angle = Math.atan2(a11 - a22, 2 * Math.sqrt(-a21 * a12)) / 2;
    eigenvector1 = [Math.cos(rotational_angle), Math.sin(rotational_angle)];
    eigenvector2 = [Math.cos(rotational_angle), Math.sin(rotational_angle)];
  }

  document.getElementById("det_tr").innerHTML = "Det(A) = " + det + ", Tr(A) = " + tr + ", ";//λ1 = " + lambda1 + ", λ2 = " + lambda2 + ".";
  document.getElementById("cir").setAttribute("cx", tr / 8 * 50);
  document.getElementById("cir").setAttribute("cy", -det / 16 * 50);

  clear2All();
}

function updateArgumentByEigens() {

}

function normalize(x) {
  norm = Math.sqrt(x[0] * x[0] + x[1] * x[1]);
  return [x[0] / norm, x[1] / norm]
}

// Draw background grid
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

// Draw a line
function line(x1, y1, x2, y2) {
  ctx2.beginPath();
  ctx2.moveTo(x1, y1);
  ctx2.lineTo(x2, y2);
  ctx2.stroke();
}

var selectedElement = false;

// Deal with drag events
function makeDraggable(evt) {
  var svg = evt.target;
  svg.addEventListener('mousedown', startDrag);
  svg.addEventListener('mousemove', drag);
  svg.addEventListener('mouseup', endDrag);
  svg.addEventListener('mouseleave', endDrag);
  function startDrag(evt) {
    if (evt.target.classList.contains('draggable')) {
      selectedElement = evt.target;
      offset = getMousePosition(evt);
      offset.x -= parseFloat(selectedElement.getAttributeNS(null, "cx"));
      offset.y -= parseFloat(selectedElement.getAttributeNS(null, "cy"));
    }
  }

  function getMousePosition(evt) {
    var CTM = svg.getScreenCTM();
    return {
      x: (evt.clientX - CTM.e) / CTM.a,
      y: (evt.clientY - CTM.f) / CTM.d
    };
  }

  function drag(evt) {
    if (selectedElement) {
      evt.preventDefault();
      var coord = getMousePosition(evt);
      selectedElement.setAttributeNS(null, "cx", coord.x - offset.x);
      selectedElement.setAttributeNS(null, "cy", coord.y - offset.y);
      det = -(coord.y - offset.y) * 16.0 / 50.0;
      tr = (coord.x - offset.x) * 8.0 / 50.0;
      document.getElementById("det_tr").innerHTML = "Det(A) = " + det + ", Tr(A) = " + tr + ".";
    }
  }

  function endDrag(evt) {
    selectedElement = null;
  }
}