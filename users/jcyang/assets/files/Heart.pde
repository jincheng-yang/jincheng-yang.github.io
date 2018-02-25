ArrayList<Agent> agents;

int[] data;
int[] x;
int[] y;
float[] r;
float[] t;
int N;

boolean debug;

void setup() {
  size(512, 512);
  noStroke();
  ellipseMode(RADIUS);
  //pixelDensity(displayDensity());
  
  agents = new ArrayList<Agent>();
  for (int i = 0; i < 40; i++) {
    agents.add(new Agent());
  }
  
  /* Load Sampled Data */
  data = new int[]{329, 83, 389, 87, 438, 142, 441, 209, 421, 270, 379, 332, 333, 376, 277, 418, 254, 439, 210, 395, 158, 345, 108, 289, 83, 229, 75, 174, 101, 114, 156, 88, 226, 99, 259, 133, 292, 99};
  N = data.length / 2;
  x = new int[N];
  y = new int[N];
  r = new float[N];
  t = new float[N];
  for (int i = 0; i < N; i++) {
    x[i] = data[2 * i];
    y[i] = data[2 * i + 1];
    r[i] = dist(x[i], y[i], width / 2, height / 2);
    t[i] = atan2(y[i] - height / 2, x[i] - width / 2);
  }
  debug = false;
}

void draw() {
  background(240);
  for (Agent agent: agents) {
    agent.show();
    if (random(100) < 0.2)
      agent.randomize();
  }
  if (frameCount < 240)
    agents.add(new Agent());
  if (debug) {
    for (int i = 0; i < N; i++) {
      fill(0);
      stroke(0);
      ellipse(x[i], y[i], 5, 5);
    }
    
    if (mousePressed) {
      int i;
      for (i = 0; i < N; i++) {
        if (dist(mouseX, mouseY, x[i], y[i]) < 5) 
          break;
      }
      if (i < N) {
        x[i] = mouseX;
        y[i] = mouseY;
        r[i] = dist(x[i], y[i], width / 2, height / 2);
        t[i] = atan2(y[i] - height / 2, x[i] - width / 2);
      }
    }
  }
}

public float[] squeeze(float x, float y) {
  float radius = dist(x, y, width / 2, height / 2);
  float theta = atan2(y - height / 2, x - width / 2);
  
  float newRadius = 0;
  float newTheta = 0;
  float tx = 0;
  float ty = 0;
  for (int i = 0; i < N; i++) {
    newRadius += r[i] * sin(N * (theta / 2 - i * PI / N)) / sin(theta / 2 - i * PI / N) / N;
    tx += cos(t[i]) * sin(N * (theta / 2 - i * PI / N)) / sin(theta / 2 - i * PI / N) / N;
    ty += sin(t[i]) * sin(N * (theta / 2 - i * PI / N)) / sin(theta / 2 - i * PI / N) / N;
  }
  newTheta = atan2(ty, tx); //<>//
  newRadius *= radius / 200;
  return new float[]{width / 2 + newRadius * cos(newTheta), height / 2 + newRadius * sin(newTheta)};
}

/* Events */

void keyPressed() {
  if (key == 'd' || key == 'D') {
    debug = !debug;
  }
  
  if (key == 'p' || key == 'P') {
    for (int i = 0; i < N; i++) {
      print(x[i] + ",", y[i] + ", ");
    }
  }
  
  if (key == 'r' || key == 'R') {
    for (Agent agent: agents) {
      agent.randomize();
    }
  }
}

class Agent {
  float x;
  float y;
  int c;
  float size;
  
  public Agent() {
    size = random(4, 15);
    c = color(floor(random(180, 250)), floor(random(75, 105)), floor(random(170, 210)), random(120, 230));
    randomize();
  }
  
  void show() {
    fill(c);
    stroke(color((c & 0xFF0000) >> 16, (c & 0x00FF00) >> 8, c & 0x0000FF));
    float[] xy = squeeze(x, y);
    ellipse(xy[0], xy[1], size, size);
    //ellipse(x, y, size, size);
    float r = dist(x, y, width / 2, height / 2);
    x += ((x - width / 2) / r * (200 - r) / 1.5 + (-y + height / 2)) * 0.01;
    y += ((y - height / 2) / r * (200 - r) / 1.5 + (x - width / 2)) * 0.01;
  }
  
  void randomize() {
    x = random(-width * 0.5, 1.5 * width);
    y = random(-height * 0.5, 1.5 * height);
    // x = random(width);
    // y = random(height);
  }
}