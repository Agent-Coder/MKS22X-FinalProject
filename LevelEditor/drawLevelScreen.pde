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
  showPokemon(); //pokedex entries
  textSize(25);
  text("Level Selected: " + selectedLevel,123,665); 
  if (!selectedLevel.equals("") && !playerChar.equals("")) {
    textSize(35);
    text("GO!",620,710);
    goVis = true;
  }
}

void showPokemon() {
  if (playerChar.equals("")) text("Character Selected: ",123,545);
  if (playerChar.equals("Empoleon")) {
    text("Character Selected: Empoleon",123,545);
    textSize(18);
    //Pokedex entry creds @ Omega Ruby / X
    text("POKEDEX ENTRY #395: \n      Empoleon, the Emperor Pokémon. It swims as fast as a \n      jet boat. The edges of its wings are sharp and can \n      slice apart drifitng ice.",155,567);
  }
  
  if (playerChar.equals("Manaphy")) {
    text("Character Selected: Manaphy",123,545);
    textSize(18);
    //Pokdex entry creds @ Alpha Sapphire / Y
    text("POKEDEX ENTRY #490: \n      Manaphy, the Seafaring Pokémon. It starts its life \n      with a wondrous power that permits it to bond with \n      any kind of Pokémon.",155,567);
  }
  if (playerChar.equals("Glaceon")) {
    text("Character Selected: Glaceon",123,545);
    textSize(18);
    //Pokedex entry creds @ Ultra Sun/Moon
    text("POKEDEX ENTRY #471: \n      Glaceon, the Fresh Snow Pokémon. It can \n      instantaneously freeze any moisture that's around it. It can \n      drop its body temperature below –75 degrees Fahrenheit.",155,567);
  }
}

void setupText() { //goes in SETUP
  font = loadFont("YuppyTC-Regular-48.vlw");
  textFont(font);
}
