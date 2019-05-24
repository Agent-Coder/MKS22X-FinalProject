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
 one = loadImage("L1.png");
 two = loadImage("L2.png");
 three = loadImage("L3.png");
 four = loadImage("L4.png");
 five = loadImage("L5.png");
 one.resize(100,100);
 two.resize(100,100);
 three.resize(100,100);
 four.resize(100,100);
 five.resize(100,100);
 setupText();
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
     drawLevelScreen(); 
     clickLevel = true;
     //print("good");
  }
}
