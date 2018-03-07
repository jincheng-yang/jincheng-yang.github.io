//Mandelbrot.pde
//Basic Practice for Processing Design Course

/**
 * adjust image siz and position
 *    
 * MOUSE
 * left click          : zoom in
 * right click         : zoom out
 *
 * KEYS
 * s                   : save png
 * UP                  : speed up
 * DOWN                : speed down
 * 
 */

float centerX = 0, centerY = 0;                          //Cordinate of the center of window 
float siz = 2;                                          //siz of window
float speed = 0.05;                                      //Zooming speed

void setup() {
  size(400, 400);
  background(240);
}

void draw() {
  for (int i = 0; i < 400; i++) {
    for (int j = 0; j < 400; j++) {
      float x = centerX + siz * (i - 200) / 200;        //Calculate the cordinate (x, y) of pixel (i, j)
      float y = centerY + siz * (200 - j) / 200;
      set(i, j, color(iteratorTime(x, y) * 8));          //Calculate the iterator time of this pixel and decide the color
    }
  }
  if (mousePressed) {
    if (mouseButton == LEFT) {
      siz *= 1 - speed;                                 //zoom in
      centerX += siz * (mouseX - 200) / 200 * speed;    //calculate new center cordinate
      centerY += siz * (200 - mouseY) / 200 * speed;
    } else {
      siz *= 1 + speed;                                 //zoom out
      centerX -= siz * (mouseX - 200) / 200 * speed;
      centerY -= siz * (200 - mouseY) / 200 * speed;
    }
  }
}

void keyPressed(){
  if (key == 's' || key == 'S') {                        //save image
    saveFrame("Mandelbrot.png");
    println("Done Saving.");
  }
  if (key == CODED) {
    if (keyCode == UP) {                                 //speed up
      speed *= 1.1;
    }
    if (keyCode == DOWN) {                               //speed down
      speed /= 1.1;
    }
    println("Current speed: " + speed);
  }
}

int iteratorTime(float x, float y) {                     //calculate iterator time
  float zx = 0;
  float zy = 0;
  for (int i = 0; i < 30; i++) {
    float zd = zx * zx + zy * zy;
    if (zd > 4) {                                        //if the length of complex number z(n) is bigger than 2, it is out of bound
      return i + 1;
    }
    float q = (zx - 1/4) * (zx - 1/4) + y * y;
    float p = sqrt(q);
    if ((x < p - 2 * p * p + 1 / 4) && (x + 1) * (x + 1) + y * y < 1 / 16) {
      return 0;
    }
    float nzx = zx * zx - zy * zy + x;                   //calculate z(n+1)
    float nzy = 2 * zx * zy + y;
    if (zx == nzx && zy == nzy) return 0;
    zy = nzy;
    zx = nzx;
  }
  return 0;
}
