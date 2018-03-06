import java.io.*;
import java.util.*;

/* @pjs font="Avenir.ttf, Ariall.ttf, Kyokasho.ttc"; */

boolean retina;
int act;
int unavailableCount;

PImage teddyLogo, caseyLogo, worldMap;
PImage opening;

color tColor, cColor, dColor;
color tDarker, cDarker;

Dot tDot, cDot;

int logoSize, logoPadding, logoPaddingTop, roundAngleRadius;
int shadowWidth;
int worldMapPaddingTop;
PFont font, font2, font3, font4, font5;

JSONObject data;
JSONArray ttl, ctl, tal, cal, cities, institutes;

ArrayList<TAItem> nttl, nctl, ntal, ncal;
ArrayList<City> ncities;
ArrayList<Institute> ninstitutes;

static String[] dateSuffixes =
  //    0     1     2     3     4     5     6     7     8     9
     { "th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th",
  //    10    11    12    13    14    15    16    17    18    19
       "th", "th", "th", "th", "th", "th", "th", "th", "th", "th",
  //    20    21    22    23    24    25    26    27    28    29
       "th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th",
  //    30    31
       "th", "st" };
String dateString;
int dateCount;
String tInstitute, cInstitute;

boolean parted;

float tx1, tx2, ty1, ty2, cx1, cx2, cy1, cy2;
int movingStage;
int cTimeZone;
int tTimeZone;
int oldTimeDiff, currentTimeDiff;

Bubble[] bubbles;
PImage[] bubbleImg;
PImage[] bubbleImgLarge;
PImage[] albumImg;
PImage[] albumImgLarge;
String[] album;

MyDate mydate;

void setup() {
  size(1080, 720);
  album = new String[]{"2017.11.02.png", "2017.03.01.png", "2017.01.11.png", "2017.01.01.png", "2016.12.22.png", "2017.04.30.png", "2017.01.03.png", "2017.10.21.png", "2017.07.03.png", "2017.10.24.png", "2017.07.01.png", "2017.02.14.png", "2017.09.21.png", "2017.09.23.png", "2017.07.26.png", "2017.12.28.png", "2017.09.30.png", "2017.07.20.png", "2017.04.02.png", "2017.01.27.png", "2017.06.15.png", "2017.03.18.png", "2017.11.24.png", "2017.01.09.png", "2017.03.27.png"};

  albumImg = new PImage[album.length];
  albumImgLarge = new PImage[album.length];
  for (int i = 0; i < album.length; i++) {
    albumImgLarge[i] = loadImage("data/assets/image/album/" + album[i]);
    albumImg[i] = loadImage("data/assets/image/album/thumbnail/" + album[i]);
  }
  
  act = 1;
  unavailableCount = 0;
  movingStage = 0;
  retina = false;
  
  /* Comment the following two lines if not in retina mode*/
  //retina = true;
  //pixelDensity(displayDensity());
  
  dateCount = 0;
    
  teddyLogo = loadImage("data/assets/image/teddy-logo.jpg");
  caseyLogo = loadImage("data/assets/image/casey-logo.jpg");
  worldMap = loadImage("data/assets/image/map.jpg");
  opening = loadImage("data/assets/video/opening.png");
  bubbleImg = new PImage[15];
  bubbleImgLarge = new PImage[15];
  for (int i = 1; i < 16; i++) {
    bubbleImg[i - 1] = loadImage("data/assets/image/bubble/thumbnail/Cutting" + i + ".png");
    bubbleImgLarge[i - 1] = loadImage("data/assets/image/bubble/N" + i + ".png");
  }  
  
  logoPadding = 100;
  logoPaddingTop = 70;
  logoSize = 50;
  worldMapPaddingTop = 180;
  shadowWidth = 5;
  roundAngleRadius = 5;
  tColor = color(128, 152, 240);
  cColor = color(240, 128, 152);
  dColor = color(158, 90, 198);
  
  colorMode(HSB);
  tDarker = color(hue(tColor), saturation(tColor) * 1.2, brightness(tColor));// * 0.8);
  cDarker = color(hue(cColor), saturation(cColor) * 1.2, brightness(cColor));// * 0.8);
  colorMode(RGB);
  noStroke();
  ellipseMode(CENTER);
  
  loadData();
  
  mydate = new MyDate(2016, 10, 24);
  
  cDot = new Dot(cColor, 108.983743, 34.247461);
  tDot = new Dot(tColor, 108.983743, 34.247461);
  tTimeZone = cTimeZone = 8;
  oldTimeDiff = currentTimeDiff = 0;
  
  parted = false;
  
  bubbles = new Bubble[500];
  
  if (retina) {
    font = loadFont("data/assets/font/ArialRoundedMTBold-48.vlw");
    font2 = loadFont("data/assets/font/YuKyo_Yoko-Medium-24.vlw");
    font3 = loadFont("data/assets/font/AvenirNextCondensed-Regular-48.vlw");
    font4 = loadFont("data/assets/font/AvenirNextCondensed-Regular-96.vlw");
    font5 = loadFont("data/assets/font/ArialRoundedMTBold-32.vlw");
  } else {
    //font = loadFont("data/assets/font/ArialRoundedMTBold-24.vlw");
    font = createFont("Kyokasho", 24);
    //font2 = loadFont("data/assets/font/YuKyo_Yoko-Medium-12.vlw");
    font2 = createFont("Kyokasho", 12);
    //font3 = loadFont("data/assets/font/AvenirNextCondensed-Regular-24.vlw");
    font3 = createFont("Avenir", 24);
    //font4 = loadFont("data/assets/font/AvenirNextCondensed-Regular-48.vlw");
    font4 = createFont("Avenir", 48);
    //font5 = loadFont("data/assets/font/ArialRoundedMTBold-16.vlw");
    font5 = createFont("Ariall", 16);
  }

  background(255);
  image(worldMap, 0, worldMapPaddingTop);
  updateInfos();
}

void draw() {  
  image(worldMap, 0, worldMapPaddingTop); //<>//
  
  if (act < 3) {
    cDot.erase();
    tDot.erase();
  }
  
  if (act == 2) {
    movingStage++;
    if (movingStage < 60) {
      float t = movingStage / 60.0;
      t = (3 - 2 * t) * t * t ;
      tDot.x = tx1 * (1 - t) + tx2 * t;
      tDot.y = ty1 * (1 - t) + ty2 * t;
      cDot.x = cx1 * (1 - t) + cx2 * t;
      cDot.y = cy1 * (1 - t) + cy2 * t;
      currentTimeDiff = round(oldTimeDiff * (1 - t) + t * (tTimeZone - cTimeZone));
    } else {
      act = 1;
      movingStage = 0;
      oldTimeDiff = currentTimeDiff;
    }
  }
  
  if (act == 1) {
    if (frameCount % 8 == 0) //<>//
      updateInfos();
    for (int i = 0; i < dateCount; i++) {
      bubbles[i].angle += PI / 500 / Bubble.bubbleWidth;
    }
  }
  
  if (act == 3) {
    fill(255, (movingStage++) * 2);
    noStroke();
    rect(0, worldMapPaddingTop, width, height);
    if (movingStage == 30) {
      movingStage = 0;
      act = 4;
    }
  }
  
  if (act == 5) {
    background(255);
    translate(0, height - worldMapPaddingTop);
  }
  
  if (act == 4) {
    background(255);
    float t = (movingStage++) / 120.0;
    t = (3 - 2 * t) * t * t ;
    translate(0, t * (height - worldMapPaddingTop));
    if (movingStage == 120) {
      act = 5;
    }
  }
  
  fill(color(255));
  rect(0, 0, width, worldMapPaddingTop);
  rect(0, worldMapPaddingTop + worldMap.height, width, height);
  
  fill(tColor);
  textFont(font, 24);
  rect(logoPadding - shadowWidth, logoPaddingTop - shadowWidth, logoSize + shadowWidth * 2, logoSize + shadowWidth * 2, roundAngleRadius); 
  image(teddyLogo, logoPadding, logoPaddingTop, logoSize, logoSize);
  textAlign(LEFT);
  text("Teddy", logoPadding + logoSize + logoPadding / 4, logoPaddingTop + logoSize / 3);
  
  rect(logoPadding + logoSize + logoPadding / 4, logoPaddingTop + logoSize / 2 + 3, 50, 2);
  
  fill(tDarker);
  textFont(font2, 12);
  
  text(tInstitute, logoPadding + logoSize + logoPadding / 4, logoPaddingTop + logoSize);
  
  fill(cColor);
  textFont(font, 24);
  rect(width - logoPadding - logoSize - shadowWidth, logoPaddingTop - shadowWidth, logoSize + shadowWidth * 2, logoSize + shadowWidth * 2, roundAngleRadius);
  image(caseyLogo, width - logoPadding - logoSize, logoPaddingTop, logoSize, logoSize);
  textAlign(RIGHT);
  text("Casey", width - logoPadding - logoSize - logoPadding / 4, logoPaddingTop + logoSize / 3);
  
  rect(width - logoPadding - logoSize - logoPadding / 4, logoPaddingTop + logoSize / 2 + 3, -50, 2);
  
  fill(cDarker);
  textFont(font2, 12);
  text(cInstitute, width - logoPadding - logoSize - logoPadding / 4, logoPaddingTop + logoSize);
  
  int offset = 30;
  int offset2 = 40;
  fill(dColor);
  textFont(font3, 24);
  textAlign(LEFT);
  text(dateString, width / 2 + 20 - offset, logoPaddingTop + offset2);
  text(findDistance(tDot.x, tDot.y, cDot.x, cDot.y) + " km", width / 2 + 20 - offset, logoPaddingTop + logoSize / 3 * 2 + offset2);
  
  textAlign(RIGHT);
  text(dateCount + (dateCount > 1 ? " Days" : " Day"), width / 2 - 20 - offset, logoPaddingTop + offset2);
  text(abs(currentTimeDiff) + " h", width / 2 - 20 - offset, logoPaddingTop + logoSize / 3 * 2 + offset2);
  
  rect(width / 2 - 1 - offset, logoPaddingTop -18 + offset2, 2, logoSize);

  if (act < 3) {
    if (parted) {
      if (tDot.x < cDot.x) {
        tDot.show(false);
        cDot.show(true);
      } else {
        tDot.show(true);
        cDot.show(false);
      }
    } else {
      cDot.showMixed(tDot);
    }
  } else {
    image(opening, width / 2 - 200, 10 - 150 - 300 + worldMapPaddingTop / 2, 400, 300);
  }
      
  for (Bubble b: bubbles) {
    if (b != null) b.show();
  }
  
  if (act == 5) {
    for (Bubble b: bubbles) {
      if (b != null) {
        if (dist(mouseX, mouseY, b.px, b.py + height - worldMapPaddingTop) < 6) {
          if (b.photo) {
            image(albumImgLarge[b.index], width / 2 - 200, - 300 + worldMapPaddingTop / 2 - 200, 400, 400);
          } else {
            image(bubbleImgLarge[b.index], width / 2 - 200, - 300 + worldMapPaddingTop / 2 - 200, 400, 400);
          }
          noFill();
          colorMode(HSB);
          stroke(hue(dColor), saturation(dColor) * 0.6, brightness(dColor) * 2);
          ellipse(width / 2, - 300 + worldMapPaddingTop / 2, 400, 400);
          noStroke();
          
          textFont(font5, 16);
          textAlign(LEFT);
          textStressed(b.cCity, cColor, width / 2 + 10, - 300 + worldMapPaddingTop / 2 + 150);
          
          textFont(font5, 16);
          textAlign(RIGHT);
          textStressed(b.tCity, tColor, width / 2 - 10, - 300 + worldMapPaddingTop / 2 + 150);
          
          textFont(font5, 16);
          textAlign(CENTER);
          textStressed("x", dColor, width / 2, - 300 + worldMapPaddingTop / 2 + 150 - 2);
          
          textFont(font4, 48);
          textStressed(b.days, dColor, width / 2, - 300 + worldMapPaddingTop / 2 - 24);
          
          textFont(font5, 16);
          textStressed(b.date, dColor, width / 2, - 300 + worldMapPaddingTop / 2 + 125);
          
          stroke(255);
          fill(dColor);
          rect(width / 2 - 30, - 300 + worldMapPaddingTop / 2 + 10, 60, 3, 2);
        }
      }
    }
  }
  
}


//void mouseClicked() {
//  println(mouseX, mouseY, frameRate);
//  movingStage = 0;
//  act = 3;
//}

void updateInfos() {
  dateString = mydate.toString(1);
  
  tx1 = tx2 = tDot.x;
  ty1 = ty2 = tDot.y; //<>//
  cx1 = cx2 = cDot.x;
  cy1 = cy2 = cDot.y;
  
  // Update Teddy's City
  for (int i = 0; i < nttl.size(); i++) {
    TAItem thisObj = nttl.get(i);
    
    if (mydate.day == thisObj.Day &&
              mydate.month == thisObj.Month && 
              mydate.year == thisObj.Year) {
      for (int j = 0; j < ncities.size(); j++) {
        City thisCity = ncities.get(j);
        if (thisCity.Namecn.equals(thisObj.Place)) {
          tx2 = thisCity.Longitude;
          ty2 = thisCity.Latitude;
          tDot.caption = thisCity.Nameen;
          tTimeZone = thisCity.TimeZone;
          act = 2;
        }
      }
    }
  }
  
  // Update Casey's City
  for (int i = 0; i < nctl.size(); i++) {
    TAItem thisObj = nctl.get(i);
    
    if (mydate.day == thisObj.Day &&
              mydate.month == thisObj.Month && 
              mydate.year == thisObj.Year) {
      for (int j = 0; j < ncities.size(); j++) {
        City thisCity = ncities.get(j);
        if (thisCity.Namecn.equals(thisObj.Place)) {
          cx2 = thisCity.Longitude;
          cy2 = thisCity.Latitude;
          cDot.caption = thisCity.Nameen;
          cTimeZone = thisCity.TimeZone;
          act = 2;
        }
      }
    }
  }
  
  parted = (abs(cx1 - tx1) + abs(cx2 - tx2) + abs(cy1 - ty1) + abs(cy2 - ty2) > 1);
  
  // Update Teddy's Institute
  for (int i = 0; i < ntal.size(); i++) {
    TAItem thisObj = ntal.get(i);
    
    if (mydate.day == thisObj.Day &&
              mydate.month == thisObj.Month && 
              mydate.year == thisObj.Year) {
      for (int j = 0; j < ninstitutes.size(); j++) {
        Institute thisInstitute = ninstitutes.get(j);
        if (thisInstitute.Namecn.equals(thisObj.Place)) {
          tInstitute = thisInstitute.Nameen;
        }
      }
    }
  }
  
  // Update Casey's Institute
  for (int i = 0; i < ncal.size(); i++) {
    TAItem thisObj = ncal.get(i);
    
    if (mydate.day == thisObj.Day &&
              mydate.month == thisObj.Month && 
              mydate.year == thisObj.Year) {
      for (int j = 0; j < ninstitutes.size(); j++) {
        Institute thisInstitute = ninstitutes.get(j);
        if (thisInstitute.Namecn.equals(thisObj.Place)) {
          cInstitute = thisInstitute.Nameen;
        }
      }
    }
  }
  
  
  if (!parted) {
    bubbles[dateCount] = new Bubble(floor(random(5)), 370 - worldMapPaddingTop / 2 - 15 * (dateCount % Bubble.bubbleWidth));
  } else if(currentTimeDiff == 0) {
    bubbles[dateCount] = new Bubble(floor(random(5)) + 5, 370 - worldMapPaddingTop / 2 - 15 * (dateCount % Bubble.bubbleWidth));    
  } else {
    bubbles[dateCount] = new Bubble(floor(random(5)) + 10, 370 - worldMapPaddingTop / 2 - 15 * (dateCount % Bubble.bubbleWidth));
  }
  bubbles[dateCount].tCity = tDot.caption;
  bubbles[dateCount].cCity = cDot.caption;
  bubbles[dateCount].days = (dateCount + 1) + (dateCount > 0 ? " days" : " day");
  bubbles[dateCount].date = mydate.toString(2);
  
  for (int i = 0; i < album.length; i++) {
    String s = album[i];
    if (s.substring(0, 10).equals(mydate.toString(3))) {
      bubbles[dateCount].photo = true;
      bubbles[dateCount].index = i;
    }
  }
  
  mydate.nextDay();
  for (int i = 0; i < dateCount; i++) {
    bubbles[i].angle = 2 * PI * (dateCount - i) / 500;
  }
  if(++dateCount == 500) act = 3;
}

color colorAdjust(color c, boolean darken) {
  colorMode(HSB);
  color newColor;
  if (darken) {
    newColor = color(hue(c), saturation(c) * 1.3, brightness(c));
  } else {
    newColor = color(hue(c), saturation(c) * 0.6, brightness(c) * 2);
  }
  colorMode(RGB);
  return newColor;
}

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames() {
  File file = new File(sketchPath() + "/data/assets/image/album/thumbnail/");
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    return null;
  }
}

void textStressed(String s, color c, float x, float y) {
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      fill(255);
      text(s, x + i, y + j);
    }
  }
  fill(colorAdjust(c, true));
  text(s, x, y);
}


class Dot {
  color c;
  float x;
  float y;
  String caption;
  float life;
  
  Dot(color c, float x, float y) {
    this.c = c;
    this.x = x;
    this.y = y;
    caption = new String("");
    life = 0;
  }
  
  void show(boolean left) {
    float px = floor(map(x + 180, -124.32 + 180, 134.78 + 180, 132, 910));
    float py = floor(map(90 - y, 90 - 9.51, 90 -48.96, 432 - 3.4, 299 - 3.4));
    
    colorMode(HSB);
    fill(hue(c), saturation(c) * 0.6, brightness(c) * 2);
    colorMode(RGB);
    stroke(255);
    ellipse(px, py, 8, 8);
    textFont(font, 16);
    if (left) {
      textAlign(LEFT);
      textStressed(caption, c, px + 10, py + 6);
    } else {
      textAlign(RIGHT);
      textStressed(caption, c, px - 10, py + 6);
    }
    colorMode(HSB);
    noFill();
    stroke(hue(c), saturation(c) * 0.6, brightness(c) * 2, 255 - 8 * life);
    colorMode(RGB);
    ellipse(px, py, 12 + life, 12 + life);
    noStroke();
    
    life++;
    life %= 60;
  }
  
  void showMixed(Dot d) {
    float px = floor(map(x + 180, -124.32 + 180, 134.78 + 180, 132, 910));
    float py = floor(map(90 - y, 90 - 9.51, 90 -48.96, 432 - 3.4, 299 - 3.4));
    
    colorMode(HSB);
    fill(hue(d.c), saturation(d.c) * 0.6, brightness(d.c) * 2);
    colorMode(RGB);
    stroke(255);
    ellipse(px, py, 8, 8);
    textFont(font, 16);
    textAlign(LEFT);
    textStressed(caption, c, px + 10, py + 6);
    
    colorMode(HSB);
    noFill();
    stroke(hue(d.c), saturation(d.c) * 0.6, brightness(d.c) * 2, 255 - 8 * life);
    colorMode(RGB);
    ellipse(px, py, 12 + life, 12 + life);
    noStroke();
    
    life++;
    life %= 60;
    d.life++;
    d.life %= 60;
  }
  
  void erase() {
    float px = floor(map(x + 180, -124.32 + 180, 134.78 + 180, 132, 910));
    float py = floor(map(90 - y, 90 - 9.51, 90 -48.96, 412 - 3.4, 279 - 3.4));
    
    if (retina)
      for (int i = -250; i <= 250; i++) {
        for (int j = -100; j <= 100; j++) {
          set(2 * floor(px) + i, 2 * floor(py) + j, worldMap.get(floor(px) + i / 2, floor(py) + j / 2 - worldMapPaddingTop));
        }
      }
     else 
      for (int i = -125; i <= 125; i++) {
        for (int j = -50; j <= 50; j++) {
          set(floor(px) + i, floor(py) + j, worldMap.get(floor(px) + i, floor(py) + j - worldMapPaddingTop));
        }
      }
  }
}

int findDistance(float f1, float t1, float f2, float t2) {
  
  t1 = t1 * PI / 180;
  f1 = f1 * PI / 180;
  t2 = t2 * PI / 180;
  f2 = f2 * PI / 180;
  if (abs(t1 - t2) + abs(f1 - f2) < 0.0001) return 0;
  float x1 = cos(f1) * cos(t1);
  float y1 = sin(f1) * cos(t1);
  float z1 = sin(t1);
  float x2 = cos(f2) * cos(t2);
  float y2 = sin(f2) * cos(t2);
  float z2 = sin(t2);
  float innerProd = x1 * x2 + y1 * y2 + z1 * z2;
  float angle = acos(innerProd);
  
  return floor(angle * 6378);
}


class Bubble {
  static final int bubbleWidth = 5;
  float R;
  int index;
  float angle;
  int life;
  float px;
  float py;
  String tCity;
  String cCity;
  String date;
  String days;
  
  boolean photo;
  
  Bubble(int index, float R) {
    this.index = index;
    this.angle = 0;
    this.R = R;
    life = 0;
    tCity = "Xi'an";
    cCity = "Xi'an";
    date = "2016.01.24"; 
    days = "1 day";
    photo = false;
  }
  
  void show() {
    tint(255, (life+= 4));
    if (life == 256) life = 252;
    px = width / 2 - R * sin(angle);
    py = - 300 + worldMapPaddingTop / 2 + R * cos(angle);
    if (photo) {
      image(albumImg[index], px - 6, py - 6, 12, 12);
    } else {
      image(bubbleImg[index], px - 6, py - 6, 12, 12);
    }
    noTint();
  }
}

void loadData() {
  readStuff();
  
  //data = loadJSONObject("data.json");
  //cities = data.getJSONArray("City");
  //institutes = data.getJSONArray("Institute");
  //ttl = data.getJSONArray("TeddyTravelLog");
  //ctl = data.getJSONArray("CaseyTravelLog");
  //tal = data.getJSONArray("TeddyAcademicLog");
  //cal = data.getJSONArray("CaseyAcademicLog");
  
  //nttl = new ArrayList<TAItem>();
  //for (int i = 0; i < ttl.size(); i++) {
  //  nttl.add(new TAItem(ttl.getJSONObject(i).getInt("Year"), 
  //    ttl.getJSONObject(i).getInt("Month"), 
  //    ttl.getJSONObject(i).getInt("Day"), 
  //    ttl.getJSONObject(i).getString("Place")));
  //}
  
  //nctl = new ArrayList<TAItem>();
  //for (int i = 0; i < ttl.size(); i++) {
  //  nctl.add(new TAItem(ctl.getJSONObject(i).getInt("Year"), 
  //    ctl.getJSONObject(i).getInt("Month"), 
  //    ctl.getJSONObject(i).getInt("Day"), 
  //    ctl.getJSONObject(i).getString("Place")));
  //}
  
  //ntal = new ArrayList<TAItem>();
  //for (int i = 0; i < tal.size(); i++) {
  //  ntal.add(new TAItem(tal.getJSONObject(i).getInt("Year"), 
  //    tal.getJSONObject(i).getInt("Month"), 
  //    tal.getJSONObject(i).getInt("Day"), 
  //    tal.getJSONObject(i).getString("Place")));
  //}
  
  //ncal = new ArrayList<TAItem>();
  //for (int i = 0; i < tal.size(); i++) {
  //  ncal.add(new TAItem(cal.getJSONObject(i).getInt("Year"), 
  //    cal.getJSONObject(i).getInt("Month"), 
  //    cal.getJSONObject(i).getInt("Day"), 
  //    cal.getJSONObject(i).getString("Place")));
  //}
  
  //ncities = new ArrayList<City>();
  //for (int i = 0; i < cities.size(); i++) {
  //  ncities.add(new City(cities.getJSONObject(i).getString("Name-cn"),
  //    cities.getJSONObject(i).getString("Name-en"),
  //    cities.getJSONObject(i).getFloat("Longitude"),
  //    cities.getJSONObject(i).getFloat("Latitude"),
  //    cities.getJSONObject(i).getInt("TimeZone")));
  //}
  
  //ninstitutes = new ArrayList<Institute>();
  //for (int i = 0; i < institutes.size(); i++) {
  //  ninstitutes.add(new Institute(institutes.getJSONObject(i).getString("Name-cn"),
  //    institutes.getJSONObject(i).getString("Name-en")));
  //}
  
  //writeStuff();
  //readStuff();
}

class City {
  String Namecn;
  String Nameen;
  float Longitude;
  float Latitude;
  int TimeZone;
  
  City(String nc, String ne, float lo, float la, int tz) {
    Namecn = nc;
    Nameen = ne;
    Longitude = lo;
    Latitude = la;
    TimeZone = tz;
  }
}

class Institute {
  String Namecn;
  String Nameen;
  
  Institute (String nc, String ne) {
    Namecn = nc;
    Nameen = ne;
  }
}

class TAItem {
  int Year;
  int Month;
  int Day;
  String Place;
  
  TAItem(int y, int m, int d, String p) {
    Year = y;
    Month = m;
    Day = d;
    Place = p;
  }
}

void writeStuff() {
  PrintWriter output = createWriter("data.txt"); 
  for (TAItem item: nttl) {
    output.println(item.Year);
    output.println(item.Month);
    output.println(item.Day);
    output.println(item.Place);
  }
  
  for (TAItem item: nctl) {
    output.println(item.Year);
    output.println(item.Month);
    output.println(item.Day);
    output.println(item.Place);
  }
  
  for (TAItem item: ntal) {
    output.println(item.Year);
    output.println(item.Month);
    output.println(item.Day);
    output.println(item.Place);
  }
  
  for (TAItem item: ncal) {
    output.println(item.Year);
    output.println(item.Month);
    output.println(item.Day);
    output.println(item.Place);
  }
  
  for (City c: ncities) {
    output.println(c.Namecn);
    output.println(c.Nameen);
    output.println(c.Longitude);
    output.println(c.Latitude);
    output.println(c.TimeZone);
  }
  
  for (Institute i: ninstitutes) {
    output.println(i.Namecn);
    output.println(i.Nameen);
  }
  
  output.close();
  println(nttl.size(), nctl.size(), ntal.size(), ncal.size(), ncities.size(), ninstitutes.size());
  
}

void readStuff() {
  
  nttl = new ArrayList<TAItem>();
  ntal = new ArrayList<TAItem>();
  nctl = new ArrayList<TAItem>();
  ncal = new ArrayList<TAItem>();
  ncities = new ArrayList<City>();
  ninstitutes = new ArrayList<Institute>();
  
  
  try {
    //File f = new File("/Users/Teddy/Documents/GitHub/teddyyjc.github.io/users/jcyang/assets/files/FiveHundredDays/data.txt");
    //File f = new File([""], "/users/jcyang/assets/files/FiveHundredDays/data.txt");
    //Scanner sc = new Scanner(f); 
    //String username = scanner.nextLine();
    //FileReader fr = new FileReader(f);
    //BufferedReader reader = new BufferedReader(fr);
    String lines[] = loadStrings("/users/jcyang/assets/files/FiveHundredDays/data.txt");
    int j = 0;
    
    for (int i = 0; i < 44; i++) {
      int y = int(lines[j++]);
      int m = int(lines[j++]);
      int d = int(lines[j++]);
      String p = lines[j++];
      nttl.add(new TAItem(y, m, d, p));
    }
    
    for (int i = 0; i < 44; i++) {
      int y = int(lines[j++]);
      int m = int(lines[j++]);
      int d = int(lines[j++]);
      String p = lines[j++];
      nctl.add(new TAItem(y, m, d, p));
    }
    
    for (int i = 0; i < 8; i++) {
      int y = int(lines[j++]);
      int m = int(lines[j++]);
      int d = int(lines[j++]);
      String p = lines[j++];
      ntal.add(new TAItem(y, m, d, p));
    }
    
    for (int i = 0; i < 8; i++) {
      int y = int(lines[j++]);
      int m = int(lines[j++]);
      int d = int(lines[j++]);
      String p = lines[j++];
      ncal.add(new TAItem(y, m, d, p));
    }
    
    for (int i = 0; i < 24; i++) {
      String nc = lines[j++];
      String ne = lines[j++];
      float lo = float(lines[j++]);
      float la = float(lines[j++]);
      int tz = int(lines[j++]);
      ncities.add(new City(nc, ne, lo, la, tz));
    }
    
    
    for (int i = 0; i < 8; i++) {
      String nc = lines[j++];
      String ne = lines[j++];
      ninstitutes.add(new Institute(nc, ne));
    }
    //reader.close();
    
  } catch (IOException e) {
    e.printStackTrace();
  }
  
  //println(nttl.size(), nctl.size(), ntal.size(), ncal.size(), ncities.size(), ninstitutes.size());
  
}

class MyDate {
  int year;
  int month;
  int day;
  
  final int[] daysOfMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  final String[] mons = {"Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sept.", "Oct.", "Nov.", "Dec."};
  
  MyDate(int y, int m, int d) {
    year = y;
    month = m;
    day = d;
  }
  
  void nextDay() {
    day++;
    if (day > daysOfMonth[month - 1]) {
      day = 1;
      month++;
      if (month > 12) {
        month = 1;
        year++;
      }
    }
  }
  
  String toString(int i) {
    if (i == 1) {
      return mons[month - 1] + " " + day + dateSuffixes[day] + ", " + year;
    }
    if (i == 2) {
      return year + "." + month + "." + day;
    }
    if (i == 3) {
      return year + "." + (month < 10 ? "0" + month : month) + "." + (day < 10 ? "0" + day : day);
    }
    return null;
  }
}