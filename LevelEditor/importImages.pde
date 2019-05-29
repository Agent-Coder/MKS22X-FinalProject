void importImages() {
  
  //StartScreen, Level/Char Select Backgrounds
  background = loadImage("StartScreen.png");
  bluebackground = loadImage("BlueBackground.png");
  
  //StartScreen, Level/Char Select Backgrounds resizes
  background.resize(1000, 750);
  bluebackground.resize(1000, 750);
  
  //Level Select level button icons sprites
  one = loadImage("SPRITES/Levels Icons/L1.png");
  two = loadImage("SPRITES/Levels Icons/L2.png");
  three = loadImage("SPRITES/Levels Icons/L3.png");
  four = loadImage("SPRITES/Levels Icons/L4.png");
  five = loadImage("SPRITES/Levels Icons/L5.png");
  
  //Level Select level button icons sprites resizes
  one.resize(100, 100);
  two.resize(100, 100);
  three.resize(100, 100);
  four.resize(100, 100);
  five.resize(100, 100);
  
  //Berry sprites 
  OranBerry = loadImage("SPRITES/Berries/OranBerry.png");
  LumBerry = loadImage("SPRITES/Berries/LumBerry.png");
  SitrusBerry = loadImage("SPRITES/Berries/SitrusBerry.png");
  RazzBerry = loadImage("SPRITES/Berries/RazzBerry.png");
  NanabBerry = loadImage("SPRITES/Berries/NanabBerry.png");
  
  //Glaceon Sprites
  GlaceonMRight1 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkRight1.png");
  GlaceonMRight2 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkRight2.png");
  GlaceonMRight3 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkRight3.png");
  GlaceonMLeft1 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkLeft1.png"); 
  GlaceonMLeft2 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkLeft2.png");
  GlaceonMLeft3 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkLeft3.png");
  GlaceonMDown1 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkDown1.png");
  GlaceonMDown2 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkDown2.png");
  GlaceonMDown3 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkDown3.png");
  GlaceonMUp1 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkUp1.png");
  GlaceonMUp2 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkUp2.png");
  GlaceonMUp3 = loadImage("SPRITES/Glaceon Sprites/GlaceonWalkUp3.png");
  //idle
  GlaceonIRight1 = loadImage("SPRITES/Glaceon Sprites/GlaceonIdleRight1.png");
  GlaceonIRight2 = loadImage("SPRITES/Glaceon Sprites/GlaceonIdleRight2.png");
  GlaceonILeft1 = loadImage("SPRITES/Glaceon Sprites/GlaceonIdleLeft1.png");
  GlaceonILeft2 = loadImage("SPRITES/Glaceon Sprites/GlaceonIdleLeft2.png");
  GlaceonIDown1 = loadImage("SPRITES/Glaceon Sprites/GlaceonIdleDown1.png");
  GlaceonIDown2 = loadImage("SPRITES/Glaceon Sprites/GlaceonIdleDown2.png");
  GlaceonIUp1 = loadImage("SPRITES/Glaceon Sprites/GlaceonIdleUp1.png");
  GlaceonIUp2 = loadImage("SPRITES/Glaceon Sprites/GlaceonIdleUp2.png");
  
  //Glaceon Sprites resizes
  GlaceonMRight1.resize(50, 50);
  GlaceonMRight2.resize(50, 50);
  GlaceonMRight3.resize(50, 50);
  GlaceonMLeft1.resize(50, 50) ;
  GlaceonMLeft2.resize(50, 50);
  GlaceonMLeft3.resize(50, 50);
  GlaceonMDown1.resize(50, 50);
  GlaceonMDown2.resize(50, 50);
  GlaceonMDown3.resize(50, 50);
  GlaceonMUp1.resize(50, 50);
  GlaceonMUp2.resize(50, 50);
  GlaceonMUp3.resize(50, 50);
  GlaceonIRight1.resize(50, 50);
  GlaceonIRight2.resize(50, 50);
  GlaceonILeft1.resize(50, 50);
  GlaceonILeft2.resize(50, 50);
  GlaceonIDown1.resize(50, 50);
  GlaceonIDown2.resize(50, 50);
  GlaceonIUp1.resize(50, 50);
  GlaceonIUp2.resize(50, 50);
  
  //Manaphy Sprites
  ManaphyMRight1 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkRight1.png");
  ManaphyMRight2 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkRight2.png");
  ManaphyMRight3 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkRight3.png");
  ManaphyMLeft1 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkLeft1.png");
  ManaphyMLeft2 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkLeft2.png");
  ManaphyMLeft3 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkLeft3.png");
  ManaphyMDown1 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkDown1.png");
  ManaphyMDown2 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkDown2.png");
  ManaphyMDown3 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkDown3.png");
  ManaphyMUp1 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkUp1.png");
  ManaphyMUp2 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkUp2.png");
  ManaphyMUp3 = loadImage("SPRITES/Manaphy Sprites/ManaphyWalkUp3.png");
  //idle
  ManaphyIRight1 = loadImage("SPRITES/Manaphy Sprites/ManaphyIdleRight1.png");
  ManaphyIRight2 = loadImage("SPRITES/Manaphy Sprites/ManaphyIdleRight2.png");
  ManaphyILeft1 = loadImage("SPRITES/Manaphy Sprites/ManaphyIdleLeft1.png");
  ManaphyILeft2 = loadImage("SPRITES/Manaphy Sprites/ManaphyIdleLeft2.png");
  ManaphyIDown1 = loadImage("SPRITES/Manaphy Sprites/ManaphyIdleDown1.png");
  ManaphyIDown2 = loadImage("SPRITES/Manaphy Sprites/ManaphyIdleDown2.png");
  ManaphyIUp1 = loadImage("SPRITES/Manaphy Sprites/ManaphyIdleUp1.png");
  ManaphyIUp2 = loadImage("SPRITES/Manaphy Sprites/ManaphyIdleUp2.png");
  
  //Manaphy Sprites resizes
  ManaphyMRight1.resize(50,50);
  ManaphyMRight2.resize(50,50);
  ManaphyMRight3.resize(50,50);
  ManaphyMLeft1.resize(50,50);
  ManaphyMLeft2.resize(50,50);
  ManaphyMLeft3.resize(50,50);
  ManaphyMDown1.resize(50,50);
  ManaphyMDown2.resize(50,50);
  ManaphyMDown3.resize(50,50);
  ManaphyMUp1.resize(50,50);
  ManaphyMUp2.resize(50,50);
  ManaphyMUp3.resize(50,50);
  ManaphyIRight1.resize(50,50);
  ManaphyIRight2.resize(50,50);
  ManaphyILeft1.resize(50,50);
  ManaphyILeft2.resize(50,50);
  ManaphyIDown1.resize(50,50);
  ManaphyIDown2.resize(50,50);
  ManaphyIUp1.resize(50,50);
  ManaphyIUp2.resize(50,50);
  
  
  

  EmpoleonIDown1 = loadImage("EmpoleonIdleDown1.png");
  EmpoleonIDown2 = loadImage("EmpoleonIdleDown2.png");
  ManaphyIDown1.resize(50, 50);
  ManaphyIDown2.resize(50, 50);
  EmpoleonIDown1.resize(47, 55);
  EmpoleonIDown2.resize(51, 55);
 
  floor = loadImage("MoveTile1.png");
  ice=loadImage("Ice.png");
  ice.resize(50, 49);
  floor.resize(50, 50);
  
}
