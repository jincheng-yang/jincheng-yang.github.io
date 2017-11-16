import java.util.List;

ArrayList<PVector> currentPoints;
ArrayList<Figure> fgs;

void setup() {
  size(600, 600);
  stroke(75, 58, 232);
  strokeWeight(4);
  fill(240, 5);
  background(240);
  fgs = new ArrayList<Figure>();
}

void draw() {
  rect(-10, -10, width + 20, height + 20);
  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
    currentPoints.add(new PVector(mouseX, mouseY));
  }
}

void mousePressed() {
  currentPoints = new ArrayList<PVector>();
}

void mouseReleased() {
  fgs.add(new Figure(currentPoints));
  //println(fgs);
}

class Figure {
  String letter;
  PVector[] p;
  Figure(ArrayList<PVector> p) {
    this.letter = "p";
    this.p = p.toArray(new PVector[p.size()]);
  }
}