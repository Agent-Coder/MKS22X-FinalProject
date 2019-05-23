float mX;
float mY;
PImage background;
PImage bluebackground;
PImage OranBerry;
PImage NanabBerry;
PImage RazzBerry;
PImage SitrusBerry;
PImage LumBerry;
String location = "startScreen";

void setup() {
 size(750,750);
 background = loadImage("StartScreen.png");
 bluebackground = loadImage("BlueBackground.png");
 OranBerry = loadImage("OranBerry.png");
 LumBerry = loadImage("LumBerry.png");
 SitrusBerry = loadImage("SitrusBerry.png");
 RazzBerry = loadImage("RazzBerry.png");
 NanabBerry = loadImage("NanabBerry.png");
 background.resize(1000,750);
 bluebackground.resize(1000,750);
}

void draw(){
  background(255);
  mX = mouseX;
  mY = mouseY;
  //print("X " + mX + ", Y " + mY);
  if (location.equals("startScreen")) {
    boolean detectStart = false;
    image(background,0,0);
    drawBerries();
    if (detectStart == false && mousePressed == true && mX >= 315 && mX <=410 &&
      mY >=385 && mY <=415) {
        detectStart = true;
        location = "levelSelect";
       // print("good");
      }
  }
  if (location.equals("levelSelect")) {
     boolean clickLevel = false;
     image(bluebackground,0,0);
  }
}



//WORK ON THIS SOON??
void drawBerries() {
  int disty = 0;
  int distx = 0;
  int berryswitch = 0;
  int rowC = 0;
  for (int i = 0; i < 6; i++) {
    if (rowC % 2 == 0) {
      for (int x = 0; x < 12; x++) {
        if (berryswitch % 5 == 0) {
         image(OranBerry, 22 + distx, 20 + disty);
        }
        if (berryswitch % 5 == 1) {
         image(LumBerry, 22 + distx, 20 + disty);
        }if (berryswitch % 5 == 2) {
         image(NanabBerry, 22 + distx, 20 + disty);
        }if (berryswitch % 5 == 3) {
         image(SitrusBerry, 22 + distx, 20 + disty);
        }if (berryswitch % 5 == 4) {
         image(RazzBerry, 22 + distx, 20 + disty);
        }
         berryswitch++;   
         distx = distx + 60;
      }
    } else {
        for (int x = 0; x < 11; x++) {
          if (berryswitch % 5 == 0) {
           image(OranBerry, 50 + distx, 20 + disty);
          }
          if (berryswitch % 5 == 1) {
           image(LumBerry, 50 + distx, 20 + disty);
          }if (berryswitch % 5 == 2) {
           image(NanabBerry, 50 + distx, 20 + disty);
          }if (berryswitch % 5 == 3) {
           image(SitrusBerry, 50+ distx, 20 + disty);
          }if (berryswitch % 5 == 4) {
           image(RazzBerry, 50 + distx, 20 + disty);
          }
          berryswitch++;   
          distx = distx + 60;
        }
      }
   disty = disty + 45;
   distx = 0;
   rowC++;
  }
}
