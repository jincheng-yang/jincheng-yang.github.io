ArrayList<Pedal> pedals;
final float PHI = 2 * PI * (1 - (sqrt(5) - 1) / 2);
final float RAD = 40;

void setup() {
  size(600, 600);
  stroke(192, 255, 179);
  ellipseMode(RADIUS);
  pedals = new ArrayList<Pedal>();
  pedals.add(new Pedal(0, RAD - 10));
}

void draw() {
  pedals.add(new Pedal(frameCount, RAD * exp(frameCount / 400.0) - 10));
  background(255);
  translate(width / 2, height / 2);
  int i = frameCount - 1;
  Pedal pi = pedals.get(i);
  float maxR = 0;
  for (int j = pedals.size() - 1; j >= 0; j--) {
    Pedal pj = pedals.get(j);
    if (i > j - 50) {
      float thisR = pj.maxR * cos(pi.angle - pj.angle);
      maxR = max(maxR, thisR);
    }
    pj.radius = pedals.get(j).maxR * (1 - 1.0 / (frameCount - j));
    pj.show();
  }
  pedals.get(i).maxR = maxR + RAD / 2;
  if (frameCount > 300) noLoop();
}

class Pedal {
  float angle;
  int index;
  float radius;
  float maxR;
  float size;
  int close;
  color c;
  Pedal(int n, float s) {
    index = n;
    angle = n * PHI;
    radius = 0;
    maxR = 0;
    close = 0;
    if (n % 3 == 0) {
      c = color(random(50, 100), random(225, 250), random(50, 100), 200);
    } else if (n % 3 == 1) {
      c = color(random(100, 150), random(185, 215), random(100, 150), 200);
    } else {
      c = color(random(50, 100), random(150, 175), random(50, 100), 200);
    }
    size = s;
  }
  
  void show() {
    fill(c);
    ellipse(x(), y(), size, size);
  }
  
  float x() {
    return radius * cos(angle);
  }
  
  float y() {
    return -radius * sin(angle);
  }
}