ArrayList<Agent> agents;

int[] data;
int[] x;
int[] y;
float[] r;
float[] t;
int N;

void setup() {
  size(512, 512);
  noStroke();
  ellipseMode(RADIUS);
  //pixelDensity(displayDensity());
  
  agents = new ArrayList<Agent>();
  for (int i = 0; i < 40; i++) {
    agents.add(new Agent());
  }
  
  /** Load Sampled Data */
  data = new int[]{254 ,  137 , 264 ,  127, 310 ,  89 , 396 ,  104 , 435 ,  165 , 420 ,  241 , 336 ,  338 , 229 ,  411 , 192 ,  428 , 186 ,  395 , 163 ,  327 , 123 ,  283 , 83 ,  229 , 75 ,  174 , 101 ,  114 , 156 ,  88 , 201 ,  90 , 233 ,  105 , 249 ,  125};
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
}

void draw() {
  background(240);
  for (Agent agent: agents) {
    agent.show();
    if (random(100) < 0.2)
      agent.randomize();
  }
  if (frameCount < 140)
    agents.add(new Agent());
  for (int i = 0; i < 30; i++) {
    float theta = i * 2 * PI / 30;
    float testX = width / 2 + 200 * cos(theta);
    float testY = width / 2 + 200 * sin(theta);
    float[] output = squeeze(testX, testY);
    fill(0);
    //ellipse(output[0], output[1], 3, 3);
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

class Agent {
  float x;
  float y;
  int c;
  float size;
  
  public Agent() {
    size = random(4, 15);
    c = color(floor(random(180, 250)), floor(random(75, 105)), floor(random(170, 210)), random(160, 230));
    x = random(width);
    y = random(height);
  }
  
  void show() {
    fill(c);
    float[] xy = squeeze(x, y);
    ellipse(xy[0], xy[1], size, size);
    //ellipse(x, y, size, size);
    float r = dist(x, y, width / 2, height / 2);
    x += ((x - width / 2) / r * (200 - r) / 2 + (-y + height / 2)) * 0.01;
    y += ((y - height / 2) / r * (200 - r) / 2 + (x - width / 2)) * 0.01;
  }
  
  void randomize() {
    x = random(width);
    y = random(height);
  }
}