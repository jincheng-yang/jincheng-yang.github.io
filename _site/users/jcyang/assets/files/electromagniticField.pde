void setup() {
  size(600, 600);
  ellipseMode(RADIUS);
  noFill();
  smooth();
}

void draw() {
  background(10, 15, 30);
  scale(75);
  translate(4, 4);
  rotate(atan2(mouseX - 300, 300 - mouseY));
  strokeWeight(0.007);
  int n = (int) map((mouseX - 300) * (mouseX - 300) + (mouseY - 300) * (mouseY - 300), 0, 180000, 5, 50);
  
  stroke(40, 70, 254, 80);  //Blue line  
  float angle = PI / 2 / n;
  for (int i = 1; i < n; i++) {
    float a = i * angle;
    float r = 1 / cos(a);
    float y = abs(tan(a));
    ellipse(0, y, r, r);
    ellipse(0, -y, r, r);
  }
  line(-8, 0, 8, 0);
  
  stroke(40, 240, 54, 80);  //Green line
  for (int i = 1; i < n; i++) {
    float a = i * angle;
    float x = 1 / cos(a);
    float r = abs(tan(a));
    ellipse(x, 0, r, r);
    ellipse(-x, 0, r, r);
  }
  line(0, -8, 0, 8);
}

void keyPressed() {
  saveFrame("capture.jpg");
}
