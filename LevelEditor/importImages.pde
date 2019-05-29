void importImages() {
  
  //StartScreen, Level/Char Select Backgrounds
  background = loadImage("StartScreen.png");
  bluebackground = loadImage("BlueBackground.png");
  
  //StartScreen, Level/Char Select Backgrounds resizes
  background.resize(1000, 750);
  bluebackground.resize(1000, 750);
  
  //Level Select level button icons sprites
  one = loadImage("L1.png");
  two = loadImage("L2.png");
  three = loadImage("L3.png");
  four = loadImage("L4.png");
  five = loadImage("L5.png");
  
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
  
  ManaphyIDown1 = loadImage("ManaphyIdleDown1.png");
  ManaphyIDown2 = loadImage("ManaphyIdleDown2.png");
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
