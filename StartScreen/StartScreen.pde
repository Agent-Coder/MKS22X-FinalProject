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
int animateCount = 0;
String playerChar = "";
String selectedLevel = "";

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
 ManaphyIdle1 = loadImage("ManaphyIdleDown1.png");
 ManaphyIdle2 = loadImage("ManaphyIdleDown2.png");
 EmpoleonIdle1 = loadImage("EmpoleonIdleDown1.png");
 EmpoleonIdle2 = loadImage("EmpoleonIdleDown2.png");
 GlaceonIdle1 = loadImage("GlaceonIdleDown1.png");
 GlaceonIdle2 = loadImage("GlaceonIdleDown2.png");
 ManaphyIdle1.resize(50,50);
 ManaphyIdle2.resize(50,50);
 EmpoleonIdle1.resize(47,55);
 EmpoleonIdle2.resize(51,55);
 GlaceonIdle1.resize(50,50);
 GlaceonIdle2.resize(50,50);
}

void draw(){
  background(255);
  mX = mouseX;
  mY = mouseY;
  if (location.equals("startScreen")) {
    image(background,0,0);
    drawBerries();
    drawBerries2();
    drawBerries3();
    detectStartGame();
  }
  
  if (location.equals("levelSelect")) {
     image(bluebackground,0,0);
     drawLevelScreen();
     detectLevelSelect();
     detectPokemonSelect();
     animateCharSelect();
     drawReady();
    }
}

void mousePressed() {
  println("" + mX + ", " + mY);
}
