// M_1_5_02_TOOL.pde
// Agent.pde, GUI.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * noise values (noise 2d) are used to animate a bunch of agents.
 * 
 * KEYS
 * m                   : toogle menu open/close
 * 1-2                 : switch noise mode
 * space               : new noise seed
 * backspace           : clear screen
 * s                   : save png
 */

// ------ agents ------
Agent[] agents = new Agent[10000]; // create more ... to fit max slider agentsCount
int agentsCount = 8000;
float noiseScale = 300, noiseStrength = 10; 
float overlayAlpha = 2.5, agentsAlpha = 150, strokeWidth = 0.25;
int drawMode = 1;

// ------ Peremeters ------
float speed = 0.03;
float X0 = -1;
float X1 = 1;
float Y0 = -1;
float Y1 = 1;
float R = 7;
float Bound = 1000000;

void setup(){
  size(600,600,P2D);
  background(255);
  smooth();

  //pixelDensity(2);
  
  for(int i=0; i<agents.length; i++) {
    agents[i] = new Agent();
  }

}


void draw(){
  float ix = map(mouseX, 0, width, X0, X1);
  float iy = map(mouseY, 0, height, Y1, Y0);
  //frame.setTitle("(" + ix + ", " + iy + ")");
  fill(255, overlayAlpha);
  noStroke();
  rect(0,0,width,height);

  stroke(0, agentsAlpha);
  //draw agents
  for(int i=0; i<agentsCount; i++) agents[i].update();
}


void keyReleased(){
  if (key == '1') {
    speed *= 1.2;
    println("speed = " + speed);
  }
  if (key == '2') {
    speed /= 1.2;
    println("speed = " + speed);
  }
  if (key == ' ') {
    int newNoiseSeed = (int) random(100000);
    println("newNoiseSeed: "+newNoiseSeed);
    noiseSeed(newNoiseSeed);
  }
  if (key == DELETE || key == BACKSPACE) background(255);
}

float vx(float x, float y) {  
  //return map(x, 0, width, 0, 1) * (1 - sigma1 * map(y, 0, height, 0, 1));
  float ix = map(x, 0, width, -5, 5);
  float iy = map(y, 0, height, 5, -5);
  float delta = 1; float m = 1; 
  //return ix * (ix + iy - 1) * speed;
  return (4 * ix + 3 * iy) * speed;
}

float vy(float x, float y) {
  float ix = map(x, 0, width, -5, 5);
  float iy = map(y, 0, height, 5, -5);
  float a = 1;
  //return -iy * (2 * ix + 3 * iy / 2 - 3) * speed;
  return -(-10 * ix - 3 * iy) * speed;
}

class Agent {
  PVector p, pOld;
  float stepSize, angle;
  boolean isOutside = false;
  color c;

  Agent() {
    p = new PVector(X0 + random(X1 - X0), Y0 + random(Y1 - Y0));
    pOld = new PVector(p.x,p.y);
    float rdmR = random(1);
    float rdmA = random(2*PI);
    p.x = rdmR * cos(rdmA);
    p.y = rdmR * sin(rdmA);
    pOld.set(p);
    stepSize = random(1,5);
    c = (int)random(0xFFFFFF);
  }

  void update() {
    float U = 1 - p.x * p.x - p.y * p.y;
    if (U < 0 || random(100) < 1) {
      float rdmR = sqrt(random(1));
      float rdmA = random(2*PI);
      p.x = rdmR * cos(rdmA);
      p.y = rdmR * sin(rdmA);
      pOld.set(p);
      return;
    }
    U = sqrt(U);
    float x = p.x;
    float y = p.y;    
    
    /*
    Here is the tangent vector space.
    */
    
    float dx = x/2/U*(-2*U*U*U+4*U*y*y+2*R*U*U*(x+y)-R*y*y*(2*x+y));
    float dy = y/2/U*(-6*U*U*U-4*U*x+R*x*x*(2*x+y)+R*U*U*(4*x+3*y));
    
    float rd = dist(0,0,dx,dy);
    if (rd > 1) {
      dx = dx / rd;
      dy = dy / rd;
    }
    
    p.x += dx * speed;
    p.y += dy * speed;
    if (p.x * p.x + p.y * p.y > 1) {
      float rdmR = sqrt(random(1));
      float rdmA = random(2*PI);
      p.x = rdmR * cos(rdmA);
      p.y = rdmR * sin(rdmA);
      pOld.set(p);
      return;
    }

    strokeWeight(strokeWidth * stepSize);
    int b = c & 0x0000FF;
    int g = (c >> 8) & 0x0000FF;
    int r = (c >> 16) & 0x0000FF;
    stroke(r, g, b, agentsAlpha);
    float x1 = map(pOld.x, X0, X1, 0, width);
    float x2 = map(p.x, X0, X1, 0, width);
    float y1 = map(pOld.y, Y0, Y1, height, 0);
    float y2 = map(p.y, Y0, Y1, height, 0);
    line(x1, y1, x2, y2);
    pOld.set(p);
  }
}