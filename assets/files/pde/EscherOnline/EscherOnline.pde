float EL5;
final int MAX_ITERATION_LEVEL = 5;
Cross[] c;

PVector absolute_center;
Cross center;
Cross candidate;

String s;
boolean mixed;

int border_left;
int border_right;
int border_top;
int border_bottom;

int oldX;
int oldY;
int newX;
int newY;

void setup() {
  noFill();
  strokeWeight(1);
  stroke(137, 67, 140, 80);
  //pixelDensity(2);
  ellipseMode(CENTER);
  background(255);
  size(1000, 400);
  
  border_left = width / 4;
  border_right = width / 4 * 3;
  border_top = height / 4;
  border_bottom = height / 4 + width / 2;
  
  EL5 = edgeLength(5, HALF_PI);
  absolute_center = new PVector(width / 2, height);
  center = new Cross();
  
  c = new Cross[4];
  s = "";
  
  oldX = width / 2;
  oldY = height / 2;
  newX = width / 2;
  newY = height / 2;
}

void draw() {
  background(255);
  
  move(-1);
  //if (mousePressed) {
  //  oldX = newX;
  //  oldY = newY;
  //  newX = mouseX;
  //  newY = mouseY;
  //}
  //parallelTranslateCenter(new PVector(oldX, oldY), new PVector(newX, newY));
  
  //candidate = center;
  mainGenerate(0);  
  //center = candidate;
  
  //println(frameRate);
}

float modPI(float x) {
  return (x % PI + PI) % PI;
}

float mod2PI(float x) {
  return (x % (2 * PI) + 2 * PI) % (2 * PI);
}

//float a2d(float a) {
//  float ctg = ctg(a);
//  float csc = 1 / sin(a);
//  return -log(ctg + csc);
//}

//float d2a(float d) {
//  float ctg = (exp(-d) - exp(d)) / 2;
//  return HALF_PI - atan(ctg);
//}

float a2expd(float a) {
  float ctg = ctg(a);
  float csc = 1 / sin(a);
  if (modPI(a) < HALF_PI) {
    return 1 / (ctg + csc);
  } else {
    return csc - ctg;
  }
}

float expd2a(float expd) {
  float ctga = (1 / expd - expd) / 2;
  return HALF_PI - atan(ctga);
}

float ctg(float a) {
  if (abs(sin(a)) > 0.5) {
    return tan(HALF_PI - modPI(a));
  } else {
    return 1 / tan(a);
  }
}

float distance(float a1, float a2) {
  //return a2d(a2) - a2d(a1);
  return log(a2expd(a2) / a2expd(a1));
}

float distance(PVector p1, PVector p2) {
  return dist(p1.x, p1.y, p2.x, p2.y);
}

float parallelTranslate(float a1, float d) {
  //float d1 = a2d(modPI(a1));
  float expd1 = a2expd(modPI(a1));
  float a2 = a1;
  if (mod2PI(a1) < PI) {
    //float d2 = d1 + d;
    float expd2 = expd1 * exp(d);
    //a2 = d2a(d2);
    a2 = expd2a(expd2);
  } else {
    float expd2 = expd1 / exp(d);
    //float d2 = d1 - d;
    //a2 = d2a(d2) + PI;
    a2 = expd2a(expd2) + PI;
  }
  return a1 - PI + mod2PI(a2 - a1 + PI);
}

float angleDiff(int n, float a, float test) {
  float a0 = HALF_PI / 2;
  for (int i = 0; i < n; i++) {
    a0 = parallelTranslate(a0, test) - a;
  }
  return a0 - HALF_PI / 2;
}

float edgeLength(int n, float a) {
  float left = 1;
  float right = 1.5;
  float al = angleDiff(n, a, left) + 2 * PI;
  float ar = angleDiff(n, a, right) + 2 * PI;
  while (al > 0) {
    left /= 2;
    al = angleDiff(n, a, left) + 2 * PI;
  }
  while (ar < 0) {
    right *= 2;
    ar = angleDiff(n, a, right) + 2 * PI;
  }
  float center = (left + right) / 2;
  float ac;
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

void move(int i) {
  switch (i) {
    case -1:
      for (int j = 0; j < 4; c[j] = new Cross(center), j++);
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
      for (Cross cr: c) cr.d[1] *= -1;
      break;
    case 3:
      move(1);
      move(6);
      for (Cross cr: c) cr.d[1] *= -1;
      break;
    case 4:
      move(0);
      move(7);
      for (Cross cr: c) cr.d[0] *= -1;
      break;
  }
}

void mainGenerate(int level) {
  if (level > MAX_ITERATION_LEVEL || !c[0].visible() && !c[1].visible() && 
                   !c[2].visible() && !c[3].visible()) {
    return;
  }
  
  if (level == 0) {
    move(-1);
    c[0].show(0);
    c[0].show(1);
  }
  
  Cross c0 = new Cross(c[0]);
  Cross c1 = new Cross(c[1]);
  Cross c2 = new Cross(c[2]);
  Cross c3 = new Cross(c[3]);
  String s0 = s;
  
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
  
  if (s.charAt(s.length() - 1) > '1') {
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
  
  //for (Cross cr: c) {
  //  if (level < 3 && distance(candidate.c, absolute_center) > distance(cr.c, absolute_center)) {
  //    candidate = new Cross(cr);
  //  }
  //}
}

boolean pure(String s, char c) {
  for (int i = 0; i < s.length(); i++) {
    if (s.charAt(i) != c) return false;
  }
  return true;
} //<>//

void parallelTranslateCenter(PVector v1, PVector v2) {
  if (v1.equals(v2)) return;
  Edge trail = new Edge(v1, v2);
  
  Edge from = new Edge(v1, center.c);
  float ang = angleInBetween(trail, from, v1);
  ang += trail.a(v2);
  Edge to = new Edge(v2, ang);
  
  float a1 = from.a(v1);
  float a2 = from.a(center.c);
  float dist = distance(a1, a2);
  
  float a3 = to.a(v2);
  float a4;
  if (abs(to.cx - from.cx) > to.r + from.r) {
    a4 = parallelTranslate(a3, -dist);
  } else {
    a4 = parallelTranslate(a3, dist);
  }
  PVector destination = to.p(a4);
  
  center.c = destination;
  center.a[0] += a4 - a2;
  center.a[1] += a4 - a2;
  center.a[0] = modPI(center.a[0]);
  center.a[1] = modPI(center.a[1]);
}

PVector intersection(Edge e1, Edge e2) {
  float px = e1.r * e1.r - e2.r * e2.r - e1.cx * e1.cx + e2.cx * e2.cx;
  px = px / 2 / (e2.cx - e1.cx);
  float py = sqrt(e1.r * e1.r - (e1.cx - px) * (e1.cx - px));
  return new PVector(px, py);
}

float angleInBetween(Edge e1, Edge e2, PVector p) {
  return e2.a(p) - e1.a(p);
}

float angleInBetween(Edge e1, Edge e2) {
  PVector p = intersection(e1, e2);
  return e2.a(p) - e1.a(p);
}

void mousePressed() {
  oldX = mouseX;
  oldY = mouseY;
  newX = mouseX;
  newY = mouseY;
}









class Cross {
  PVector c;
  float[] a;
  int[] d;
  
  Cross() {
    a = new float[2];
    d = new int[2];
    a[0] = QUARTER_PI;
    a[1] = HALF_PI + a[0];
    c = absolute_center;
    d[0] = d[1] = 1;
  }
  
  Cross(Cross c) {
    a = new float[2];
    d = new int[2];
    copy(c);
  }
  
  void copy(Cross c) {
    this.c = c.c;
    a[0] = c.a[0];
    a[1] = c.a[1];
    d[0] = c.d[0];
    d[1] = c.d[1];
  }
  
  void push(int i, int j) {
    /**
    i = 0 or 1. Circle i is pushed along circle (1 - i). 
    j = 1 or -1. j = 1 if pushing forward, and j = -1 if pulling backward.
    */
    
    float oldAngle = a[1 - i];
    float newAngle = parallelTranslate(oldAngle, EL5 * j * (1 - 2 * i) * d[1 - i]);
    if ((modPI(oldAngle) - HALF_PI) * (modPI(newAngle) - HALF_PI) < 0) {
      d[i] *= -1; //d determines if the direction should be flipped
    }
    c = new Edge(c, oldAngle).p(newAngle);
    a[1 - i] = newAngle;
    a[i] = modPI(newAngle + HALF_PI);
  }
  
  boolean visible() {
    return new Edge(c, a[0]).visible() || new Edge(c, a[1]).visible();
  }
  
  void show(int i) {
    new Edge(c, a[i]).show();
  }
}









class Edge {
  float cx;
  float r;
  
  float x(float a) {
    return cx + r * cos(a);
  }
  
  float y(float a) {
    return r * sin(a);
  }
  
  PVector p(float a) {
    return new PVector(x(a), y(a));
  }
  
  float a(PVector p) {
    return atan2(p.y, p.x - cx);
  }
  
  Edge(float cx, float r) {
    this.cx = cx;
    this.r = r;
  }
  
  Edge(PVector point1, PVector point2) {
    cx = (point1.x + point2.x) / 2 + 
        (point1.y + point2.y) / 2 * 
        (point2.y - point1.y) / (point2.x - point1.x);
    r = dist(point1.x, point1.y, cx, 0);
  }
  
  Edge(PVector basePoint, float a) {
    cx = basePoint.x - basePoint.y * ctg(a);
    r = basePoint.y / abs(sin(a));
  }
  
  Edge(Edge e) {
    this.cx = e.cx;
    this.r = e.r;
  }
  
  void show() {
    if (visible())
      ellipse(cx, 0, 2 * r, 2 * r);
  }
  
  boolean visible() {
    return r > 1 && cx + r > 0 && cx - r < width;
  }

}