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
  receiveArgumentFromPage();
  det = a11 * a22 - a12 * a21;
  tr = a11 + a22;
  isReal = true;
  if (tr * tr - 4 * det >= 0) {
    isReal = true;
    lambda1 = (tr + Math.sqrt(tr * tr - 4 * det)) / 2;
    lambda2 = (tr - Math.sqrt(tr * tr - 4 * det)) / 2;
    eigenvector1 = normalize([a12, lambda1 - a11]);
    eigenvector2 = normalize([a12, lambda2 - a11]);
  } else {
    isReal = false;
    lambda_alpha = tr / 2;
    lambda_beta = Math.sqrt(-tr * tr + 4 * det) / 2;
    lambda_beta *= Math.sign(a21 - a12); // Sign of beta is always the same as a12 - a21.
    eccentricity_coeff = (a21 - a12) / lambda_beta; // This will always be positive. 
    eccentricity = (eccentricity_coeff - Math.sqrt(eccentricity_coeff * eccentricity_coeff - 4)) / 2; // Choose the one between 0 and 1
    rotational_angle = Math.atan2(a22 - a11, a12 + a21) / 2;
    rotational_vector = [Math.cos(rotational_angle), Math.sin(rotational_angle)];
    eigenvector1 = rotational_vector;
    eigenvector2 = [eigenvector1[1], -eigenvector1[0]];
  }

  setArgumentToPage();
  clear2All();
}

function updateArgumentByDetTr() {
  receiveArgumentFromPage();
  computeLambdabyTrDet();
  computeL();
  computeAfromLP();
  setArgumentToPage();
  clear2All();
}

function updateArgumentByLambda() {
  receiveArgumentFromPage();
  computeTrDetbyLambda();
  computeL();
  computeAfromLP();
  setArgumentToPage();
  clear2All();
}

function updateArgumentByDirection() {
  receiveArgumentFromPage();
  computeP();
  computeAfromLP();
  setArgumentToPage();
  clear2All();
}

function receiveArgumentFromPage() {
  a11 = parseFloat(document.getElementById("a11").value);
	a12 = parseFloat(document.getElementById("a12").value);
	a21 = parseFloat(document.getElementById("a21").value);
  a22 = parseFloat(document.getElementById("a22").value);
  det = parseFloat(document.getElementById("det").value);
  tr = parseFloat(document.getElementById("tr").value);
  isReal = document.getElementById("realEigens").checked;
  lambda1 = parseFloat(document.getElementById("lambda1").value);
  lambda2 = parseFloat(document.getElementById("lambda2").value);
  lambda_alpha = parseFloat(document.getElementById("lambdaa").value);
  lambda_beta = parseFloat(document.getElementById("lambdab").value);
  computeL();
  eigenvector1 = normalize([parseFloat(document.getElementById("v11").value), parseFloat(document.getElementById("v12").value)]);
  eigenvector2 = normalize([parseFloat(document.getElementById("v21").value), parseFloat(document.getElementById("v22").value)]);
  rotational_vector = normalize([parseFloat(document.getElementById("v31").value), parseFloat(document.getElementById("v32").value)]);
  rotational_angle = Math.atan2(rotational_vector[1], rotational_vector[0])
  eccentricity = parseFloat(document.getElementById("eccentricity").value);
  computeP();
}

function computeAfromLP() {
  AMatrix = matrixMultiplication(matrixMultiplication(PMatrix, LambdaMatrix), matrixInverse(PMatrix));
  a11 = AMatrix[0][0];
  a12 = AMatrix[0][1];
  a21 = AMatrix[1][0];
  a22 = AMatrix[1][1];
}

function computeL() {
  if (isReal) {
    LambdaMatrix = [[lambda1, 0], [0, lambda2]];
  } else {
    LambdaMatrix = [[lambda_alpha, -lambda_beta], [lambda_beta, lambda_alpha]];
  }
}

function computeP() {
  if (isReal) {
    PMatrix = [eigenvector1, eigenvector2];
  } else {
    PMatrix = [[Math.cos(rotational_angle), -eccentricity * Math.sin(rotational_angle)], [Math.sin(rotational_angle), eccentricity * Math.cos(rotational_angle)]];
  }
}

function computeTrDetbyLambda() {
  if (isReal) {
    tr = lambda1 + lambda2;
    det = lambda1 * lambda2;
  } else {
    tr = 2 * lambda_alpha;
    det = lambda_alpha * lambda_alpha + lambda_beta * lambda_beta;
  }
}

function computeLambdabyTrDet() {
  if (tr * tr - 4 * det >= 0) {
    isReal = true;
    lambda1 = (tr + Math.sqrt(tr * tr - 4 * det)) / 2;
    lambda2 = (tr - Math.sqrt(tr * tr - 4 * det)) / 2;
  } else {
    isReal = false;
    lambda_alpha = tr / 2;
    lambda_beta = Math.sqrt(-tr * tr + 4 * det) / 2 * Math.sign(lambda_beta); // do not change sign suddenly
  }
}

function setA() {
  document.getElementById("a11").value = a11;
  document.getElementById("a12").value = a12;
  document.getElementById("a21").value = a21;
  document.getElementById("a22").value = a22;
}

function setLambda() {
  document.getElementById("lambda1").value = lambda1;
  document.getElementById("lambda2").value = lambda2;
  document.getElementById("lambdaa").value = lambda_alpha;
  document.getElementById("lambdab").value = lambda_beta;
  document.getElementById("realEigens").checked = isReal;
  document.getElementById("complexEigens").checked = !isReal;
}

function setDirection() {
  document.getElementById("v11").value = eigenvector1[0];
  document.getElementById("v12").value = eigenvector1[1];
  document.getElementById("v21").value = eigenvector2[0];
  document.getElementById("v22").value = eigenvector2[1];
  document.getElementById("v31").value = rotational_vector[0];
  document.getElementById("v32").value = rotational_vector[1];
  document.getElementById("eccentricity").value = eccentricity;
}

function setDetTr() {
  document.getElementById("tr").value = tr;
  document.getElementById("det").value = det;
}

function setDetTrDiagram() {
  document.getElementById("cir").setAttribute("cx", tr / 8 * 50);
  document.getElementById("cir").setAttribute("cy", -det / 16 * 50);
}

function setArgumentToPage() {
  setA();
  setLambda();
  setDirection();
  setDetTr();
  setDetTrDiagram();
}

function normalize(x) {
  norm = Math.sqrt(x[0] * x[0] + x[1] * x[1]);
  return [x[0] / norm, x[1] / norm]
}

function matrixMultiplication(a, b) {
  c00 = a[0][0] * b[0][0] + a[0][1] * b[1][0];
  c01 = a[0][0] * b[0][1] + a[0][1] * b[1][1];
  c10 = a[1][0] * b[0][0] + a[1][1] * b[1][0];
  c11 = a[1][0] * b[0][1] + a[1][1] * b[1][1];
  return [[c00, c01], [c10, c11]];
}

function matrixInverse(a) {
  detA = a[0][0] * a[1][1] - a[0][1] * a[1][0];
  if (detA == 0) {
    return [];
  }
  c00 = a[1][1] / detA;
  c11 = a[0][0] / detA;
  c01 = -a[0][1] / detA;
  c10 = -a[1][0] / detA;
  return [[c00, c01], [c10, c11]];
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
      computeLambdabyTrDet();
      computeL();
      computeAfromLP();
      setA();
      setDetTr()
      setLambda();
    }
  }

  function endDrag(evt) {
    if (selectedElement) {
      selectedElement = null;
      updateArgumentByDetTr();
    }
  }
}