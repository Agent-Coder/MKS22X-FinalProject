float mX;
float mY;
PImage background;
PImage OranBerry;
PImage NanabBerry;
PImage RazzBerry;
PImage SitrusBerry;
PImage LumBerry;
boolean detectStart = false;

void setup() {
 size(750,750);
 //String[] fontList = PFont.list();
 //printArray(fontList);
 background = loadImage("StartScreen.png");
 OranBerry = loadImage("OranBerry.png");
 LumBerry = loadImage("LumBerry.png");
 SitrusBerry = loadImage("SitrusBerry.png");
 RazzBerry = loadImage("RazzBerry.png");
 NanabBerry = loadImage("NanabBerry.png");
 background.resize(1000,750);
}

void draw(){
  background(255);
  mX = mouseX;
  mY = mouseY;
  //print("X " + mX + ", Y " + mY);
  image(background,0,0);
  drawBerries();
  if (detectStart == false && mousePressed == true && mX >= 315 && mX <=410 &&
      mY >=385 && mY <=415) {
        detectStart = true;
       // print("good");
       //SOMEHOW IMPLEMENT CALLING TO OTHER LEVELS
      }
}

void drawBerries() {
  for (int i = 0; i < 1000; i = i + 50) {
    image(OranBerry, 20 + i, 20);
  }
}


 


//X315 Y385
//X410 Y385
//X315 Y415
//X410 Y415
