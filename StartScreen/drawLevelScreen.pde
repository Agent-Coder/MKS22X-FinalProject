PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PFont font;

PImage ManaphyIdle1;
PImage ManaphyIdle2;
PImage GlaceonIdle1;
PImage GlaceonIdle2;
PImage EmpoleonIdle1;
PImage EmpoleonIdle2;

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
 
  textSize(20);
  text("Manaphy",104,488);
  text("Glaceon",343,488);
  text("Empoleon",573,488);
}

void animateCharSelect() {
   if (playerChar.equals(null)) {
        image(ManaphyIdle1,120,414);
        image(GlaceonIdle2,355,414);
        image(EmpoleonIdle2,590,414);
      } else {     
      if (playerChar.equals("Manaphy")) {
        if (frameCount % 50 < 25) {
          image(ManaphyIdle1,120,414);
          image(GlaceonIdle1,355,414);
          image(EmpoleonIdle1,590,414);
        }
        else {
          image(ManaphyIdle2,120,414);
          image(GlaceonIdle1,355,414);
          image(EmpoleonIdle1,590,414);
        }
      }
     if (playerChar.equals("Glaceon")) {
       if (frameCount % 50 < 25) {
          image(ManaphyIdle1,120,414);
          image(GlaceonIdle1,355,414);
          image(EmpoleonIdle1,590,414);
        }
        else {
          image(ManaphyIdle1,120,414);
          image(GlaceonIdle2,355,414);
          image(EmpoleonIdle1,590,414);
      }
     }
     if (playerChar.equals("Empoleon")) {
       if (frameCount % 50 < 25) {
          image(ManaphyIdle1,120,414);
          image(GlaceonIdle1,355,414);
          image(EmpoleonIdle1,590,414);
        }
        else {
          image(ManaphyIdle1,120,414);
          image(GlaceonIdle1,355,414);
          image(EmpoleonIdle2,590,414);
      }
     }
   }
}

void setupText() { //goes in SETUP
  font = loadFont("YuppyTC-Regular-48.vlw");
  textFont(font);
}
