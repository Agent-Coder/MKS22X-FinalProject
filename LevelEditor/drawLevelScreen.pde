

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

void drawCharSelect() { //setups char select
  textSize(50);
  text("CHARACTER SELECT",133,345);
  noFill();
  rect(120,297,530,65,20);
  textSize(20);
  text("Manaphy",104,488);
  text("Glaceon",343,488);
  text("Empoleon",573,488);
}

void animateCharSelect() { //draw, animates
   if (playerChar.equals("")) {
        image(ManaphyIDown1,120,414);
        image(GlaceonIDown1,355,414);
        image(EmpoleonIDown1,590,414);
      } else {     
      if (playerChar.equals("Manaphy")) {
        if (frameCount % 50 < 25) {
          image(ManaphyIDown1,120,414);
          image(GlaceonIDown1,355,414);
          image(EmpoleonIDown1,590,414);
        }
        else {
          image(ManaphyIDown2,120,414);
          image(GlaceonIDown1,355,414);
          image(EmpoleonIDown1,590,414);
        }
      }
     if (playerChar.equals("Glaceon")) {
       if (frameCount % 50 < 25) {
          image(ManaphyIDown1,120,414);
          image(GlaceonIDown1,355,414);
          image(EmpoleonIDown1,590,414);
        }
        else {
          image(ManaphyIDown1,120,414);
          image(GlaceonIDown2,355,414);
          image(EmpoleonIDown1,590,414);
      }
     }
     if (playerChar.equals("Empoleon")) {
       if (frameCount % 50 < 25) {
          image(ManaphyIDown1,120,414);
          image(GlaceonIDown1,355,414);
          image(EmpoleonIDown1,590,414);
        }
        else {
          image(ManaphyIDown1,120,414);
          image(GlaceonIDown1,355,414);
          image(EmpoleonIDown2,590,414);
      }
     }
   }
}

void drawReady() {
  textSize(25);
  showPokemon();
  textSize(25);
  text("Level Selected: " + selectedLevel,123,665); 
  if (!selectedLevel.equals("") && !playerChar.equals("")) {
    textSize(35);
    text("GO!",620,710);
  }
}

void setupText() { //goes in SETUP
  font = loadFont("YuppyTC-Regular-48.vlw");
  textFont(font);
}
