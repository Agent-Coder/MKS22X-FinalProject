PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PFont font;

void drawLevelScreen() { //goes in DRAW

  image(one, 50, 175);
  image(two, 185, 175);
  image(three, 320, 175);
  image(four, 445, 175);
  image(five, 580, 175);
  text("LEVEL SELECT", 100, 100);
  
}


void setupText() { //goes in SETUP
  font = loadFont("YuppyTC-Regular-48.vlw");
  textFont(font);
}
