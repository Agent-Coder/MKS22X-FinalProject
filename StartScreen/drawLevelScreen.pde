PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PFont font;

void drawLevelScreen() { //goes in DRAW //top half level select
  image(one, 50, 160);
  image(two, 185, 160);
  image(three, 320, 160);
  image(four, 455, 160);
  image(five, 590, 160);
  fill(0,46,67);
  textSize(60);
  text("LEVEL SELECT", 165,100);
  noFill();
  rect(145,43,462,75,20);
  stroke(66,122,188);
  strokeWeight(3);
  drawCharSelect();
}

void drawCharSelect() {
  textSize(50);
  text("CHARACTER SELECT",133,345);
  noFill();
  rect(120,297,530,65,20);
}


void setupText() { //goes in SETUP
  font = loadFont("YuppyTC-Regular-48.vlw");
  textFont(font);
}
