float mX;
float mY;
PImage background;

void setup() {
 size(750,750);
 //String[] fontList = PFont.list();
 //printArray(fontList);
 background = loadImage("StartScreen.png");
 background.resize(1000,750);
}

void draw(){
  background(255);
  mX = mouseX;
  mY = mouseY;
  // print("" + mX + ", " + mY);
  image(background,0,0);
}
