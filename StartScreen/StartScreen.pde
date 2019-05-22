float mX;
float mY;
PImage background;
PImage OranBerry;
PImage NanabBerry;
PImage RazzBerry;
PImage SitrusBerry;
PImage LumBerry;

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
  // print("" + mX + ", " + mY);
  image(background,0,0);
  drawBerries();
}


void drawBerries() {
  for (int i = 0; i < 1000; i = i + 50) {
    image(OranBerry, 20 + i, 20);
  }
}
