void importImages() {
  //StartScreen, Level/Char Select Backgrounds
  background = loadImage("StartScreen.png");
  bluebackground = loadImage("BlueBackground.png");
  portal=loadImage("SPRITES/WarpTile.png");
  portal.resize(50,50);
  //StartScreen, Level/Char Select Backgrounds resizes
  background.resize(1000, 750);
  bluebackground.resize(1000, 750);
  
  //Level Select level button icons sprites
  one = loadImage("SPRITES/Levels Icons/L1.png");
  two = loadImage("SPRITES/Levels Icons/L2.png");
  three = loadImage("SPRITES/Levels Icons/L3.png");
  four = loadImage("SPRITES/Levels Icons/L4.png");
  
  //Level Select level button icons sprites resizes
  one.resize(100, 100);
  two.resize(100, 100);
  three.resize(100, 100);
  four.resize(100, 100);
  
  //Ice breaking animation
  IceA1=loadImage("IceA1.png");
  IceA2=loadImage("IceA2.png");
  IceA3=loadImage("IceA3.png");
  IceA4=loadImage("IceA4.png");
  IceA5=loadImage("IceA5.png");

  //Ice animation resizes
  IceA1.resize(50, 50);
  IceA2.resize(50, 50);
  IceA3.resize(50, 50);
  IceA4.resize(50, 50);
  IceA5.resize(50, 50);
  
  //Wall Sprites
  WallBottom = loadImage("SPRITES/Wall Sprites/WallBottom.png");
  WallBottomAlt = loadImage("SPRITES/Wall Sprites/WallBottomAlt.png");
  WallLeft = loadImage("SPRITES/Wall Sprites/WallLeft.png");
  WallLeftAlt = loadImage("SPRITES/Wall Sprites/WallLeftAlt.png");
  WallRight = loadImage("SPRITES/Wall Sprites/WallRight.png");
  WallRightAlt = loadImage("SPRITES/Wall Sprites/WallRightAlt.png");
  WallTop = loadImage("SPRITES/Wall Sprites/WallTop.png");
  WallTopAlt = loadImage("SPRITES/Wall Sprites/WallTopAlt.png");
  WallTopRight = loadImage("SPRITES/Wall Sprites/WallTopRight.png");
  WallTopLeft = loadImage("SPRITES/Wall Sprites/WallTopLeft.png");
  WallBottomRight = loadImage("SPRITES/Wall Sprites/WallBottomRight.png");
  WallBottomLeft = loadImage("SPRITES/Wall Sprites/WallBottomLeft.png");
  
  //Wall Sprites resizes
  WallBottom.resize(50,50);
  WallBottomAlt.resize(50,50);
  WallLeft.resize(50,50);
  WallLeftAlt.resize(50,50);
  WallRight.resize(50,50);
  WallRightAlt.resize(50,50);
  WallTop.resize(50,50);
  WallTopAlt.resize(50,50);
  WallTopRight.resize(50,50);
  WallTopLeft.resize(50,50);
  WallBottomRight.resize(50,50);
  WallBottomLeft.resize(50,50);
  
  //Final Wall Sprites
  fWallBottom = loadImage("SPRITES/Wall Sprites/FWallDown.png");
  fWallLeft = loadImage("SPRITES/Wall Sprites/FWallLeft.png");  
  fWallRight = loadImage("SPRITES/Wall Sprites/FWallRight.png");
  fWallTop = loadImage("SPRITES/Wall Sprites/FWallUp.png");
  fWallTopRight = loadImage("SPRITES/Wall Sprites/FWallUpRight.png");
  fWallTopLeft = loadImage("SPRITES/Wall Sprites/FWallUpLeft.png");
  fWallBottomRight = loadImage("SPRITES/Wall Sprites/FWallDownRight.png");
  fWallBottomLeft = loadImage("SPRITES/Wall Sprites/FWallDownLeft.png");
  grass = loadImage("SPRITES/Wall Sprites/Mid.png");
  
  //Final Wall Resizes
  fWallBottom.resize(50,50);
  fWallLeft.resize(50,50);
  fWallRight.resize(50,50);
  fWallTop.resize(50,50);
  fWallTopRight.resize(50,50);
  fWallTopLeft.resize(50,50);
  fWallBottomRight.resize(50,50);
  fWallBottomLeft.resize(50,50);
  grass.resize(50,50);
  
  //Berry sprites 
  OranBerry = loadImage("SPRITES/Berries/OranBerry.png");
  LumBerry = loadImage("SPRITES/Berries/LumBerry.png");
  SitrusBerry = loadImage("SPRITES/Berries/SitrusBerry.png");
  RazzBerry = loadImage("SPRITES/Berries/RazzBerry.png");
  NanabBerry = loadImage("SPRITES/Berries/NanabBerry.png");
  OranBerry2 = loadImage("SPRITES/Berries/OranBerry.png");
  LumBerry2 = loadImage("SPRITES/Berries/LumBerry.png");
  SitrusBerry2 = loadImage("SPRITES/Berries/SitrusBerry.png");
  RazzBerry2 = loadImage("SPRITES/Berries/RazzBerry.png");
  NanabBerry2 = loadImage("SPRITES/Berries/NanabBerry.png");
  SpikyRazzBerry=loadImage("SPRITES/Berries/SpikyRazzBerry.png");
  
  OranBerry2.resize(50,50);
  LumBerry2.resize(50,50);
  SitrusBerry2.resize(50,50);
  RazzBerry2.resize(50,50);
  NanabBerry2.resize(50,50);
  SpikyRazzBerry.resize(50,50);
  
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
  
  //Empoleon Sprites
  EmpoleonMRight1 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkRight1.png");
  EmpoleonMRight2 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkRight2.png");
  EmpoleonMRight3 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkRight3.png");
  EmpoleonMLeft1 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkLeft1.png");
  EmpoleonMLeft2 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkLeft2.png");
  EmpoleonMLeft3 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkLeft3.png");
  EmpoleonMDown1 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkDown1.png");
  EmpoleonMDown2 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkDown2.png");
  EmpoleonMDown3 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkDown3.png");
  EmpoleonMUp1 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkUp1.png");
  EmpoleonMUp2 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkUp2.png");
  EmpoleonMUp3 = loadImage("SPRITES/Empoleon Sprites/EmpoleonWalkUp3.png");
  //idle
  EmpoleonIRight1 = loadImage("SPRITES/Empoleon Sprites/EmpoleonIdleRight1.png");
  EmpoleonIRight2 = loadImage("SPRITES/Empoleon Sprites/EmpoleonIdleRight2.png");
  EmpoleonILeft1 = loadImage("SPRITES/Empoleon Sprites/EmpoleonIdleLeft1.png");
  EmpoleonILeft2 = loadImage("SPRITES/Empoleon Sprites/EmpoleonIdleLeft2.png");
  EmpoleonIDown1 = loadImage("SPRITES/Empoleon Sprites/EmpoleonIdleDown1.png");
  EmpoleonIDown2 = loadImage("SPRITES/Empoleon Sprites/EmpoleonIdleDown2.png");
  EmpoleonIUp1 = loadImage("SPRITES/Empoleon Sprites/EmpoleonIdleUp1.png");
  EmpoleonIUp2 = loadImage("SPRITES/Empoleon Sprites/EmpoleonIdleUp2.png");
  
  //Empoleon Sprites resizes
  EmpoleonMRight1.resize(50,50);
  EmpoleonMRight2.resize(50,50);
  EmpoleonMRight3.resize(50,50);
  EmpoleonMLeft1.resize(50,50);
  EmpoleonMLeft2.resize(50,50);
  EmpoleonMLeft3.resize(50,50);
  EmpoleonMDown1.resize(50,50);
  EmpoleonMDown2.resize(50,50);
  EmpoleonMDown3.resize(50,50);
  EmpoleonMUp1.resize(50,50);
  EmpoleonMUp2.resize(50,50);
  EmpoleonMUp3.resize(50,50);
  EmpoleonIRight1 .resize(50,50);
  EmpoleonIRight2.resize(50,50);
  EmpoleonILeft1.resize(50,50);
  EmpoleonILeft2.resize(50,50);
  EmpoleonIDown1.resize(47,50);
  EmpoleonIDown2.resize(50,50);
  EmpoleonIUp1.resize(47,50);
  EmpoleonIUp2.resize(50,50);
  
  //Meowth Sprites (no idle)
  MeowthMRight1=loadImage("SPRITES/Meowth Sprites/MeowthWalkRight1.png");
  MeowthMRight2=loadImage("SPRITES/Meowth Sprites/MeowthWalkRight2.png");
  MeowthMRight3=loadImage("SPRITES/Meowth Sprites/MeowthWalkRight3.png");
  MeowthMLeft1 =loadImage("SPRITES/Meowth Sprites/MeowthWalkLeft1.png");
  MeowthMLeft2 =loadImage("SPRITES/Meowth Sprites/MeowthWalkLeft2.png");
  MeowthMLeft3 =loadImage("SPRITES/Meowth Sprites/MeowthWalkLeft3.png");
  MeowthMDown1=loadImage("SPRITES/Meowth Sprites/MeowthWalkDown1.png");
  MeowthMDown2=loadImage("SPRITES/Meowth Sprites/MeowthWalkDown2.png");
  MeowthMDown3=loadImage("SPRITES/Meowth Sprites/MeowthWalkDown3.png");
  MeowthMUp1=loadImage("SPRITES/Meowth Sprites/MeowthWalkUp1.png");
  MeowthMUp2=loadImage("SPRITES/Meowth Sprites/MeowthWalkUp2.png");
  MeowthMUp3=loadImage("SPRITES/Meowth Sprites/MeowthWalkUp3.png");
  
  //Meowth Sprites resizes
  MeowthMRight1.resize(50, 50);
  MeowthMRight2.resize(50, 50);
  MeowthMRight3.resize(50, 50);
  MeowthMLeft1.resize(50, 50);
  MeowthMLeft2.resize(50, 50);
  MeowthMLeft3.resize(50, 50);
  MeowthMDown1.resize(50, 50);
  MeowthMDown2.resize(50, 50);
  MeowthMDown3.resize(50, 50);
  MeowthMUp1.resize(50, 50);
  MeowthMUp2.resize(50, 50);
  MeowthMUp3.resize(50, 50);
  
  //Tentacruel Sprites (no idle)
  TentacruelMRight1 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkRight1.png");
  TentacruelMRight2 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkRight2.png");
  TentacruelMRight3 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkRight3.png");
  TentacruelMLeft1 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkLeft1.png");
  TentacruelMLeft2 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkLeft2.png");
  TentacruelMLeft3 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkLeft3.png");
  TentacruelMDown1 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkDown1.png");
  TentacruelMDown2 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkDown2.png");
  TentacruelMDown3 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkDown3.png");
  TentacruelMUp1 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkUp1.png");
  TentacruelMUp2 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkUp2.png");
  TentacruelMUp3 = loadImage("SPRITES/Tentacruel Sprites/TentacruelWalkUp3.png");
  
  //Tentacruel Sprites resizes
  TentacruelMRight1.resize(50, 50);
  TentacruelMRight2.resize(50, 50);
  TentacruelMRight3.resize(50, 50);
  TentacruelMLeft1.resize(50, 50);
  TentacruelMLeft2.resize(50, 50);
  TentacruelMLeft3.resize(50, 50);
  TentacruelMDown1.resize(50, 50);
  TentacruelMDown2.resize(50, 50);
  TentacruelMDown3.resize(50, 50);
  TentacruelMUp1.resize(50, 50);
  TentacruelMUp2.resize(50, 50);
  TentacruelMUp3.resize(50, 50);
  
  
   //Spoink Sprites (no idle)
  SpoinkMRight1 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkRight1.png");
  SpoinkMRight2 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkRight2.png");
  SpoinkMRight3 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkRight3.png");
  SpoinkMLeft1 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkLeft1.png");
  SpoinkMLeft2 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkLeft2.png");
  SpoinkMLeft3 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkLeft3.png");
  SpoinkMDown1 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkDown1.png");
  SpoinkMDown2 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkDown2.png");
  SpoinkMDown3 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkDown3.png");
  SpoinkMUp1 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkUp1.png");
  SpoinkMUp2 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkUp2.png");
  SpoinkMUp3 = loadImage("SPRITES/Spoink Sprites/SpoinkWalkUp3.png");
  
  //Spoink Sprites resizes;
  SpoinkMRight1.resize(50, 50);
  SpoinkMRight2.resize(50, 50);
  SpoinkMRight3.resize(50, 50);
  SpoinkMLeft1.resize(50, 50);
  SpoinkMLeft2.resize(50, 50);
  SpoinkMLeft3.resize(50, 50);
  SpoinkMDown1.resize(50, 50);
  SpoinkMDown2.resize(50, 50);
  SpoinkMDown3.resize(50, 50);
  SpoinkMUp1.resize(50, 50);
  SpoinkMUp2.resize(50, 50);
  SpoinkMUp3.resize(50, 50);
  
  //Mismagius Sprites
  MismagiusMRight1 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkRight1.png");
  MismagiusMRight2 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkRight2.png");
  MismagiusMRight3 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkRight3.png");
  MismagiusMLeft1 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkLeft1.png");
  MismagiusMLeft2 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkLeft2.png");
  MismagiusMLeft3 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkLeft3.png");
  MismagiusMDown1 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkDown1.png");
  MismagiusMDown2 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkDown2.png");
  MismagiusMDown3 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkDown3.png");
  MismagiusMUp1 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkUp1.png");
  MismagiusMUp2 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkUp2.png");
  MismagiusMUp3 = loadImage("SPRITES/Mismagius Sprites/MismagiusWalkUp3.png");
  
  //Mismagius Sprites resizes
  MismagiusMRight1.resize(50,50);
  MismagiusMRight2.resize(50,50);
  MismagiusMRight3.resize(50,50);
  MismagiusMLeft1.resize(50,50);
  MismagiusMLeft2.resize(50,50);
  MismagiusMLeft3.resize(50,50);
  MismagiusMDown1.resize(50,50);
  MismagiusMDown2.resize(50,50);
  MismagiusMDown3.resize(50,50);
  MismagiusMUp1.resize(50,50);
  MismagiusMUp2.resize(50,50);
  MismagiusMUp3.resize(50,50);
  
  //Gengar Sprites 
  GengarMRight1 = loadImage("SPRITES/Gengar Sprites/GengarWalkRight1.png");
  GengarMRight2 = loadImage("SPRITES/Gengar Sprites/GengarWalkRight2.png");
  GengarMRight3 = loadImage("SPRITES/Gengar Sprites/GengarWalkRight3.png");
  GengarMLeft1 = loadImage("SPRITES/Gengar Sprites/GengarWalkLeft1.png");
  GengarMLeft2 = loadImage("SPRITES/Gengar Sprites/GengarWalkLeft2.png");
  GengarMLeft3 = loadImage("SPRITES/Gengar Sprites/GengarWalkLeft3.png");
  GengarMDown1 = loadImage("SPRITES/Gengar Sprites/GengarWalkDown1.png");
  GengarMDown2 = loadImage("SPRITES/Gengar Sprites/GengarWalkDown2.png");
  GengarMDown3 = loadImage("SPRITES/Gengar Sprites/GengarWalkDown3.png");
  GengarMUp1 = loadImage("SPRITES/Gengar Sprites/GengarWalkUp1.png");
  GengarMUp2 = loadImage("SPRITES/Gengar Sprites/GengarWalkUp2.png");
  GengarMUp3 = loadImage("SPRITES/Gengar Sprites/GengarWalkUp3.png");
  
  //Gengar Sprites resizes
  GengarMRight1.resize(50,50);
  GengarMRight2.resize(50,50);
  GengarMRight3.resize(50,50);
  GengarMLeft1.resize(50,50);
  GengarMLeft2.resize(50,50);
  GengarMLeft3.resize(50,50);
  GengarMDown1.resize(50,50);
  GengarMDown2.resize(50,50);
  GengarMDown3.resize(50,50);
  GengarMUp1.resize(50,50);
  GengarMUp2.resize(50,50);
  GengarMUp3.resize(50,50);
  
  //Mamoswine Sprites //ONLY HAS TWO IDLE AND WALKING SPRITES EACH DIRECTION
  MamoswineMRight1 = loadImage("SPRITES/Mamoswine Sprites/MamoswineWalkRight1.png");
  MamoswineMRight2 = loadImage("SPRITES/Mamoswine Sprites/MamoswineWalkRight2.png");
  MamoswineMLeft1 = loadImage("SPRITES/Mamoswine Sprites/MamoswineWalkLeft1.png");
  MamoswineMLeft2 = loadImage("SPRITES/Mamoswine Sprites/MamoswineWalkLeft2.png");
  MamoswineMDown1 = loadImage("SPRITES/Mamoswine Sprites/MamoswineWalkDown1.png");
  MamoswineMDown2 = loadImage("SPRITES/Mamoswine Sprites/MamoswineWalkDown2.png");
  MamoswineMUp1 = loadImage("SPRITES/Mamoswine Sprites/MamoswineWalkUp1.png");
  MamoswineMUp2 = loadImage("SPRITES/Mamoswine Sprites/MamoswineWalkUp2.png");
  MamoswineIRight1 = loadImage("SPRITES/Mamoswine Sprites/MamoswineIdleRight1.png");
  MamoswineIRight2 = loadImage("SPRITES/Mamoswine Sprites/MamoswineIdleRight2.png");
  MamoswineILeft1 = loadImage("SPRITES/Mamoswine Sprites/MamoswineIdleLeft1.png");
  MamoswineILeft2 = loadImage("SPRITES/Mamoswine Sprites/MamoswineIdleLeft2.png");
  MamoswineIDown1 = loadImage("SPRITES/Mamoswine Sprites/MamoswineIdleDown1.png");
  MamoswineIDown2 = loadImage("SPRITES/Mamoswine Sprites/MamoswineIdleDown2.png");
  MamoswineIIp1 = loadImage("SPRITES/Mamoswine Sprites/MamoswineIdleUp1.png");
  MamoswineIUp2 = loadImage("SPRITES/Mamoswine Sprites/MamoswineIdleUp2.png");

  //Mamoswine Sprites resizes
  MamoswineMRight1.resize(50, 50);
  MamoswineMRight2.resize(50, 50);
  MamoswineMLeft1.resize(50, 50);
  MamoswineMLeft2.resize(50, 50);
  MamoswineMDown1.resize(50, 50);
  MamoswineMDown2.resize(50, 50);
  MamoswineMUp1.resize(50, 50);
  MamoswineMUp2.resize(50, 50);
  MamoswineIRight1.resize(50, 50);
  MamoswineIRight2.resize(50, 50);
  MamoswineILeft1.resize(50, 50);
  MamoswineILeft2.resize(50, 50);
  MamoswineIDown1.resize(50, 50);
  MamoswineIDown2.resize(50, 50);
  MamoswineIIp1.resize(50, 50);
  MamoswineIUp2.resize(50, 50);
  
  //Ditto Sprites //only animation sprites to become player Pokemon
  Ditto1 = loadImage("SPRITES/Ditto Sprites/Ditto1.png");
  Ditto2 = loadImage("SPRITES/Ditto Sprites/Ditto2.png");
  Ditto3 = loadImage("SPRITES/Ditto Sprites/Ditto3.png");
  
  //Ditto Sprites Resizes
  Ditto1.resize(50,50);
  Ditto2.resize(50,50);
  Ditto3.resize(50,50);
  
  //Crystal Sprites
  CrystalRed = loadImage("SPRITES/Crystal Sprites/CrystalRed.png");
  CrystalYellow = loadImage("SPRITES/Crystal Sprites/CrystalYellow.png");
  CrystalOrange = loadImage("SPRITES/Crystal Sprites/CrystalOrange.png");
  CrystalBlue = loadImage("SPRITES/Crystal Sprites/CrystalBlue.png");
  CrystalGreen = loadImage("SPRITES/Crystal Sprites/CrystalGreen.png");
  CrystalPurple = loadImage("SPRITES/Crystal Sprites/CrystalPurple.png");
  
  //Crystal Sprites Resizes
  CrystalBlue.resize(50,50);
  CrystalRed.resize(50,50);

  
  floor = loadImage("SPRITES/SnowTile.png");
  warning = loadImage("SPRITES/Warning.png");
  warning.resize(50,50);
  ice=loadImage("Ice.png");
  ice.resize(50, 49);
  floor.resize(50, 50);
  
  EmpoleonHurt=loadImage("Sprites/hurt sprites/EmpoleonHurt.png");
  GlaceonHurt=loadImage("Sprites/hurt sprites/GlaceonHurt.png");
  ManaphyHurt=loadImage("Sprites/hurt sprites/ManaphyHurt.png");
  MeowthAttack=loadImage("Sprites/hurt sprites/MeowthAttack.png");
  TentacruelAttack=loadImage("Sprites/hurt sprites/TentacruelAttack.png");
  MismagiusAttack=loadImage("Sprites/hurt sprites/MismagiusAttack.png");
  SpoinkAttack=loadImage("Sprites/hurt sprites/SpoinkAttack.png");
  
  EmpoleonHurt.resize(50,60);
  GlaceonHurt.resize(50,50);
  ManaphyHurt.resize(50,50);
  
  TentacruelAttack.resize(50,50);
  MismagiusAttack.resize(50,60);
  SpoinkAttack.resize(50,55);
  MeowthAttack.resize(75,75);
}
