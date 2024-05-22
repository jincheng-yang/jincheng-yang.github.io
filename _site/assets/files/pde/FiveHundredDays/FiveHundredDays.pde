/* @pjs font="/~yang/assets/font/ArialRoundedMTBold.ttf, /~yang/assets/font/AvenirNextCondensed-Regular.ttf, /~yang/assets/font/YuKyo_Yoko-Medium.ttc"; */

int act;

PImage tracyLogo, caseyLogo, worldMap;
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
float act1time;
float act2time;
float waitingTime;

boolean parted;

float tx1, tx2, ty1, ty2, cx1, cx2, cy1, cy2;
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

String pathToMe;

void setup() {
  size(1080, 720);
  
  pathToMe = "";
  pathToMe = "/~yang/assets/files/pde/FiveHundredDays/";
  readStuff();
  
  albumImg = new PImage[album.length];
  albumImgLarge = new PImage[album.length];
  for (int i = 0; i < album.length; i++) {
    albumImgLarge[i] = loadImage(pathToMe + "image/album/" + album[i]);
    albumImg[i] = loadImage(pathToMe + "image/album/thumbnail/" + album[i]);
  }
  
  act = 1;
  
  dateCount = 0;
    
  tracyLogo = loadImage(pathToMe + "image/tracy-logo.jpg");
  caseyLogo = loadImage(pathToMe + "image/casey-logo.jpg");
  worldMap = loadImage(pathToMe + "image/map.jpg");
  opening = loadImage(pathToMe + "video/opening.png");
  bubbleImg = new PImage[15];
  bubbleImgLarge = new PImage[15];
  for (int i = 1; i < 16; i++) {
    bubbleImg[i - 1] = loadImage(pathToMe + "image/bubble/thumbnail/Cutting" + i + ".png");
    bubbleImgLarge[i - 1] = loadImage(pathToMe + "image/bubble/N" + i + ".png");
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
  
  mydate = new MyDate(2016, 10, 24);
  
  cDot = new Dot(cColor, 108.983743, 34.247461);
  tDot = new Dot(tColor, 108.983743, 34.247461);
  tTimeZone = cTimeZone = 8;
  oldTimeDiff = currentTimeDiff = 0;
  
  parted = false;
  
  bubbles = new Bubble[500];
  
  font = createFont("ArialRoundedMTBold", 24, true);
  font2 = createFont("YuKyo_Yoko-Medium", 12, true);
  font3 = createFont("AvenirNextCondensed-Regular", 24, true);
  font4 = createFont("AvenirNextCondensed-Regular", 48, true);
  font5 = createFont("ArialRoundedMTBold", 16, true);

  background(255);
  image(worldMap, 0, worldMapPaddingTop);
  updateInfos();
  
  act1time = 0.13;
  act2time = 1.0;
  waitingTime = 0;
}

void draw() {  
  if (frameCount % 20 == 0 && act < 3) image(worldMap, 0, worldMapPaddingTop); //<>//
  
  if (keyPressed && key == 'K') {
    act = 3;
    waitingTime = 0;
  }

  if (act < 3) {
    cDot.erase();
    tDot.erase();
  }
  
  if (act == 2) {
    waitingTime += 1 / frameRate;
    if (waitingTime < act2time) {
      float t = waitingTime;
      t = (3 - 2 * t) * t * t;
      tDot.x = tx1 * (1 - t) + tx2 * t;
      tDot.y = ty1 * (1 - t) + ty2 * t;
      cDot.x = cx1 * (1 - t) + cx2 * t;
      cDot.y = cy1 * (1 - t) + cy2 * t;
      currentTimeDiff = round(oldTimeDiff * (1 - t) + t * (tTimeZone - cTimeZone));
    } else {
      act = 1;
      waitingTime = 0;
      tDot.x = tx2;
      tDot.y = ty2;
      cDot.x = cx2;
      cDot.y = cy2;
      currentTimeDiff = tTimeZone - cTimeZone;
      oldTimeDiff = currentTimeDiff;
    }
  }
  
  if (act == 1) {
    waitingTime += 1 / frameRate;
    if (waitingTime > act1time) { //<>//
      updateInfos();
      waitingTime = 0;
    }
    for (int i = 0; i < dateCount; i++) {
      bubbles[i].angle += PI / 500 / Bubble.bubbleWidth;
    }
  }
  
  if (act == 3) {
    waitingTime += 1 / frameRate;
    fill(255, waitingTime * 120);
    noStroke();
    rect(0, worldMapPaddingTop, width, height);
    if (waitingTime > 2) {
      waitingTime = 0;
      act = 4;
    }
  }
  
  if (act == 5) {
    background(255);
    translate(0, height - worldMapPaddingTop);
  }
  
  if (act == 4) {
    background(255);
    waitingTime += 1 / frameRate;
    float t = waitingTime / 2;
    t = (3 - 2 * t) * t * t ;
      translate(0, t * (height - worldMapPaddingTop));
    if (waitingTime > 2) 
      act = 5;
  }
  
  fill(color(255));
  rect(0, 0, width, worldMapPaddingTop);
  rect(0, worldMapPaddingTop + worldMap.height, width, height);
  
  fill(tColor);
  textFont(font, 24);
  rect(logoPadding - shadowWidth, logoPaddingTop - shadowWidth, logoSize + shadowWidth * 2, logoSize + shadowWidth * 2, roundAngleRadius); 
  image(tracyLogo, logoPadding, logoPaddingTop, logoSize, logoSize);
  textAlign(LEFT);
  text("Tracy", logoPadding + logoSize + logoPadding / 4, logoPaddingTop + logoSize / 3);
  
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

void updateInfos() {
  dateString = mydate.toString(1);
  
  tx1 = tx2 = tDot.x;
  ty1 = ty2 = tDot.y; //<>//
  cx1 = cx2 = cDot.x;
  cy1 = cy2 = cDot.y;
  
  // Update Tracy's City
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
  
  // Update Tracy's Institute
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
  if(++dateCount == 500) {
    act = 3;
    waitingTime = 0;
  }
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
    
    life += 60 / frameRate;
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
    
    life += 60 / frameRate;
    life %= 60;
    d.life += 60 / frameRate;
    d.life %= 60;
  }
  
  void erase() {
    float px = floor(map(x + 180, -124.32 + 180, 134.78 + 180, 132, 910));
    float py = floor(map(90 - y, 90 - 9.51, 90 -48.96, 412 - 3.4, 279 - 3.4));
    
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
    date = "2016.10.24"; 
    days = "1 day";
    photo = false;
  }
  
  void show() {
    tint(255, (life += 4 * 60 / frameRate));
    if (life > 256) life = 255;
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

void readStuff() {
  nttl = new ArrayList<TAItem>();
  ntal = new ArrayList<TAItem>();
  nctl = new ArrayList<TAItem>();
  ncal = new ArrayList<TAItem>();
  ncities = new ArrayList<City>();
  ninstitutes = new ArrayList<Institute>();

  String lines[] = loadStrings(pathToMe + "data.txt");
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
  
  for (int i = 0; i < 10; i++) {
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
  
  album = new String[25];
  for (int i = 0; i < 25; i++) {
    album[i] = lines[j++];
  }
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