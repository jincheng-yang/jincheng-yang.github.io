// const width = .offsetWidth;
// const height = document.getElementById("mt").offsetHeight;
//$("#mt").height();//document.getElementById('mt').style.height;
// console.log("height" + height);
var mainTitle = document.getElementById("mt");
var width = mainTitle.offsetWidth;
const height = mainTitle.offsetHeight;

var canvas = document.getElementById("myCanvas");
canvas.setAttribute("width", "" + width);
canvas.setAttribute("height", "" + height);

const PI = Math.PI;
const HALF_PI = Math.PI / 2;
const QUARTER_PI = Math.PI / 4;
const EL5 = edgeLength(5, HALF_PI);
const MAX_ITERATION_LEVEL = 8;

class PVector {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
}

var absolute_center = new PVector(width / 2, width);
init();

function modPI(x) {
  // returns a positive number in [0, PI) that is congruent to x mod PI
  return (x % PI + PI) % PI;
}

function mod2PI(x) {
  // returns a positive number in [0, 2 PI) that is congruent to x mod 2 PI
  return (x % (2 * PI) + 2 * PI) % (2 * PI);
}

function ctg(a) {
  // returns cotangent of a, especially avoiding the question of precision
  if (Math.abs(Math.sin(a)) > 0.5) {
    return Math.tan(HALF_PI - modPI(a));
  } else {
    return 1 / Math.tan(a);
  }
}

function a2expd(a) {
  // returns csc(a) - ctg(a)
  ctga = ctg(a);
  csc = 1 / Math.sin(a);
  if (modPI(a) < HALF_PI) {
    return 1 / (ctga + csc);
  } else {
    return csc - ctga;
  }
}

function expd2a(expd) {
  // returns arcctg((1/x - x) / 2)
  ctga = (1 / expd - expd) / 2;
  return HALF_PI - Math.atan(ctga);
}

function distance(a1, a2) {
  // The distance between two points on a geodesic, given their angle on the geodesic.
  return Math.log(a2expd(a2) / a2expd(a1));
}

function dist(x1, y1, x2, y2) {
  // returns the Euclidean distance of two points.
  var dx = x2 - x1;
  var dy = y2 - y1;
  return Math.sqrt(dx * dx + dy * dy);
}

function distancePt(p1, p2) {
  // returns the Euclidean distance of two points.
  return dist(p1.x, p1.y, p2.x, p2.y);
}

function angleDiff(n, a, test) {
  a0 = HALF_PI / 2;
  for (i = 0; i < n; i++) {
    a0 = parallelTranslate(a0, test) - a;
  }
  return a0 - HALF_PI / 2;
}

function edgeLength(n, a) {
  // return the edge length of a right n-polygon with inner angle a
  var left = 1;
  var right = 1.5;
  var al = angleDiff(n, a, left) + 2 * PI;
  var ar = angleDiff(n, a, right) + 2 * PI;
  while (al > 0) {
    left /= 2;
    al = angleDiff(n, a, left) + 2 * PI;
  }
  while (ar < 0) {
    right *= 2;
    ar = angleDiff(n, a, right) + 2 * PI;
  }
  var center = (left + right) / 2;
  var ac;
  while (right - left > 1.2e-7) {
    center = (left + right) / 2;
    ac = angleDiff(n, a, center) + 2 * PI;
    if (al * ac > 0) {
      left = center;
      al = ac;
    } else {
      right = center;
    }
  }
  return center;
}

function parallelTranslate(a1, d) {
  // returns the angle of a point on a geodesic with distance d away from another point with angle a on the same geodesic
  expd1 = a2expd(modPI(a1));
  a2 = a1;
  if (mod2PI(a1) < PI) {
    expd2 = expd1 * Math.exp(d);
    a2 = expd2a(expd2);
  } else {
    expd2 = expd1 / Math.exp(d);
    a2 = expd2a(expd2) + PI;
  }
  return a1 - PI + mod2PI(a2 - a1 + PI);
}

function move(i) {
  switch (i) {
    case -1:
      for (j = 0; j < 4; c[j] = Cross.C(center), j++);
      break;
    case 0:
      c[0].push(0, 1);
      c[1].push(0, -1);
      c[2].push(0, -1);
      c[3].push(0, 1);
      break;
    case 1:
      c[0].push(1, 1);
      c[1].push(1, 1);
      c[2].push(1, -1);
      c[3].push(1, -1);
      break;
    case 6:
      c[0].push(0, -1);
      c[1].push(0, 1);
      c[2].push(0, 1);
      c[3].push(0, -1);
      break;
    case 7:
      c[0].push(1, -1);
      c[1].push(1, -1);
      c[2].push(1, 1);
      c[3].push(1, 1);
      break;
    case 2:
      move(0);
      move(1);
      move(1);
      move(6);
      for (var cr of c) cr.d[1] *= -1;
      break;
    case 3:
      move(1);
      move(6);
      for (var cr of c) cr.d[1] *= -1;
      break;
    case 4:
      move(0);
      move(7);
      for (var cr of c) cr.d[0] *= -1;
      break;
  }
}

function pure(s, c) {
  for (i = 0; i < s.length; i++) {
    if (s.charAt(i) != c) return false;
  }
  return true;
}

function mainGenerate(level) {

  if (level == 0) {
    move(-1);
    c[0].show(0);
    c[0].show(1);
  }

  if (level > MAX_ITERATION_LEVEL || !c[0].visible() && !c[1].visible() && 
                                     !c[2].visible() && !c[3].visible()) {
    return;
  }
  
  var c0 = Cross.C(c[0]);
  var c1 = Cross.C(c[1]);
  var c2 = Cross.C(c[2]);
  var c3 = Cross.C(c[3]);
  var s0 = s;
  
  s += 0;
  move(0);
  mainGenerate(level + 1);
  c[0].copy(c0);
  c[1].copy(c1);
  c[2].copy(c2);
  c[3].copy(c3);
  s = s0;
  
  s += 1;
  move(1);
  mainGenerate(level + 1);
  c[0].copy(c0);
  c[1].copy(c1);
  c[2].copy(c2);
  c[3].copy(c3);
  s = s0; 
  
  s += 2;
  move(2);
  mainGenerate(level + 2);
  c[0].copy(c0);
  c[1].copy(c1);
  c[2].copy(c2);
  c[3].copy(c3);
  s = s0;
  
  if (level == 0) {
    return;
  }
  
  if (s.charAt(s.length - 1) > '1') {
    s += 3;
    move(3);
    mainGenerate(level + 1);
    c[0].copy(c0);
    c[1].copy(c1);
    c[2].copy(c2);
    c[3].copy(c3);
    s = s0;
    
    s += 4;
    move(4);
    mainGenerate(level + 1);
    c[0].copy(c0);
    c[1].copy(c1);
    c[2].copy(c2);
    c[3].copy(c3);
    s = s0;
    
  } else if (!s.endsWith("01")) {
    if (s.endsWith("0")) {
      c[0].show(0);
      c[2].show(0);
      if (!pure(s, '0')) {
        c[1].show(0);
        c[3].show(0);
      }
    } else {
      c[0].show(1);
      c[2].show(1);
      if (!pure(s, '1')) {
        c[1].show(1);
        c[3].show(1);
      }
    }
  }
  
  for (var cr of c) {
    if (level < 3 && distancePt(candidate.c, absolute_center) > distancePt(cr.c, absolute_center)) {
      candidate = Cross.C(cr);
      // candidate traces the vertex closest to the absolute center
    }
  }
}

function angleBetween(e1, e2, p) {
  return e2.a(p) - e1.a(p);
}

function parallelTranslateCenter(v1, v2) {
  if (v1.x == v2.x && v1.y == v2.y) return;
  var trail = Edge.PtPt(v1, v2);
  var from = Edge.PtPt(v1, center.c);
  var ang = angleBetween(trail, from, v1);
  ang += trail.a(v2);
  var to = Edge.PtA(v2, ang);
  
  var a1 = from.a(v1);
  var a2 = from.a(center.c);
  var dist = distance(a1, a2);
  
  var a3 = to.a(v2);
  var a4;
  if (Math.abs(to.cx - from.cx) > to.r + from.r) {
    a4 = parallelTranslate(a3, -dist);
  } else {
    a4 = parallelTranslate(a3, dist);
  }
  var destination = to.p(a4);
  
  center.c = destination;
  center.a[0] += a4 - a2;
  center.a[1] += a4 - a2;
  center.a[0] = modPI(center.a[0]);
  center.a[1] = modPI(center.a[1]);
}

class Edge {
  
  x(a) {
    return this.cx + this.r * Math.cos(a);
  }
  
  y(a) {
    return this.r * Math.sin(a);
  }
  
  p(a) {
    return new PVector(this.x(a), this.y(a));
  }
  
  a(p) {
    return Math.atan2(p.y, p.x - this.cx);
  }
  
  constructor(cx, r) {
    this.cx = cx;
    this.r = r;
  }
  
  static PtPt(point1, point2) {
    // using two point to construct a geodesic
    var e = new Edge(0, 0);
    e.cx = (point1.x + point2.x) / 2 + 
        (point1.y + point2.y) / 2 * 
        (point2.y - point1.y) / (point2.x - point1.x);
    e.r = dist(point1.x, point1.y, e.cx, 0);
    return e;
  }
  
  static PtA(basePoint, a) {
    // using a point and the tangent vector at that point to construct a geodesic
    var e = new Edge(0, 0);
    e.cx = basePoint.x - basePoint.y * ctg(a);
    e.r = basePoint.y / Math.abs(Math.sin(a));
    return e;
  }
  
  static E(e0) {
    // copy an edge
    var e = new Edge(e.cx, e.r);
    return e;
  }
  
  show() {
    if (this.visible()) {
      ctx.beginPath();
      ctx.arc(this.cx, 0, this.r, 0, PI);
      ctx.stroke();
    }
  }
  
  visible() {
    return this.r > 1 && this.cx + this.r > 0 && this.cx - this.r < width;
  }
}

class Cross {
  
  constructor() {
    this.a = [QUARTER_PI, PI - QUARTER_PI];
    this.c = absolute_center;
    this.d = [1, 1];
  }
  
  static C(c) {
    var thisc = new Cross();
    thisc.c = c.c;
    thisc.a[0] = c.a[0];
    thisc.a[1] = c.a[1];
    thisc.d[0] = c.d[0];
    thisc.d[1] = c.d[1];
    return thisc;
  }
  
  copy(c) {
    this.c = c.c;
    this.a[0] = c.a[0];
    this.a[1] = c.a[1];
    this.d[0] = c.d[0];
    this.d[1] = c.d[1];
  }

  push(i, j) {
    /**
    i = 0 or 1. Circle i is pushed along circle (1 - i). 
    j = 1 or -1. j = 1 if pushing forward, and j = -1 if pulling backward.
    */
    
    var oldAngle = this.a[1 - i];
    var newAngle = parallelTranslate(oldAngle, EL5 * j * (1 - 2 * i) * this.d[1 - i]);
    if ((modPI(oldAngle) - HALF_PI) * (modPI(newAngle) - HALF_PI) < 0) {
      this.d[i] *= -1; //d determines if the direction should be flipped
    }
    this.c = Edge.PtA(this.c, oldAngle).p(newAngle);
    this.a[1 - i] = newAngle;
    this.a[i] = modPI(newAngle + HALF_PI);
  }
  
  visible() {
    return Edge.PtA(this.c, this.a[0]).visible() || Edge.PtA(this.c, this.a[1]).visible();
  }
  
  show(i) {
    Edge.PtA(this.c, this.a[i]).show();
  }
}

var center = new Cross();
var candidate = new Cross();
var c = [];
var s = "";
var mouseDown = false;
var oldMouse = new PVector(width / 4, height / 4);
var newMouse = new PVector(width / 4, height / 4);

window.requestAnimationFrame(draw);

function draw() {
  clear();
  parallelTranslateCenter(oldMouse, newMouse);
  candidate = center;
  mainGenerate(0);
  center = candidate;

  if (mouseDown) {
    oldMouse.x = newMouse.x;
    oldMouse.y = newMouse.y;
  }

  window.requestAnimationFrame(draw);
  ctx.fillStyle = 'rgba(0, 0, 0, 0.3)';
  ctx.fillRect(0, 0, canvas.width, canvas.height)
}

function clear() {
  ctx.fillStyle = 'white';
  ctx.fillRect(0, 0, canvas.width, canvas.height);
}

// canvas.addEventListener('mousedown', function(e) {
//   mouseDown = true;
//   oldMouse.x = e.clientX;
//   oldMouse.y = e.clientY;
//   newMouse.x = e.clientX;
//   newMouse.y = e.clientY;
// });

// canvas.addEventListener('mousemove', function(e) {
//   if (mouseDown) {
//     newMouse.x = e.clientX;
//     newMouse.y = e.clientY;
//   }
// });

// canvas.addEventListener('mouseup', function(e) {
//   mouseDown = false;
// });

mainTitle.addEventListener('mousedown', function(e) {
  mouseDown = true;
  oldMouse.x = e.clientX;
  oldMouse.y = e.clientY;
  newMouse.x = e.clientX;
  newMouse.y = e.clientY;
});

mainTitle.addEventListener('mousemove', function(e) {
  if (mouseDown) {
    newMouse.x = e.clientX;
    newMouse.y = e.clientY;
  }
});

mainTitle.addEventListener('mouseup', function(e) {
  mouseDown = false;
});

$(window).resize(function(){
  init();
});

window.onload = function () {
  init();
}

function init() {
  width = mainTitle.offsetWidth;
  canvas.setAttribute("width", "" + width);
  ctx = canvas.getContext("2d");
  ctx.strokeStyle = "rgba(137, 67, 140, 0.7)";
  ctx.lineWidth = 0.5;
  absolute_center.x = width / 2;
  absolute_center.y = width;
}