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
  if (location.equals("startScreen")) {
    boolean detectStart = false;
    image(background,0,0);
    drawBerries();
    drawBerries2();
    drawBerries3();
    if (detectStart == false && mousePressed == true && mX >= 335 && mX <=425 &&
      mY >= 395 && mY <=431) {
        detectStart = true;
        location = "levelSelect";
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
