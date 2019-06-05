Block[][] boardF=new Block[15][15];
Tile[][] boardtileF=new Tile[15][15];
boolean drawn = false;

void drawDeathScreen() {
    background(40,94,198);
    textSize(80);
    fill(255,255,255);
    text("YOU DIED!", 175,340);
    noFill();
    rect(380, 360, 200, 50, 15);
    rect(165, 360, 200, 50, 15);
    textSize(20);
    text("Level Select", 213, 392);
    text("Restart Level", 425, 392);

    if (mousePressed && mX >= 376 && mX <= 583 && mY >= 360 && mY <412) {
      resetLevel();
      location = plocation;
    }
     if (mousePressed && mX >= 164 && mX <= 369 && mY >= 360 && mY <= 412) {
      location = "levelSelect";
      pause = false;
      goVis = false;
      playerChar = "";
      selectedLevel = "";
      resetLevel();
    }
}

void drawContinueScreen(String nextLv){
  background(43,187,222);
  textSize(50);
  fill(0,0,0);
  text("LEVEL COMPLETE!",160,340);
  noFill();
  rect(380, 360, 200, 50, 15);
  rect(165, 360, 200, 50, 15);
  textSize(20);
  text("Level Select", 213, 392);
  text("Continue", 435, 392);
  if (mousePressed && mX >= 376 && mX <= 583 && mY >= 360 && mY <412) {
    location = nextLv;
    plocation = nextLv;
  }
   if (mousePressed && mX >= 164 && mX <= 369 && mY >= 360 && mY <= 412) {
    location = "levelSelect";
    pause = false;
    goVis = false;
    playerChar = "";
    selectedLevel = "";
    resetLevel();
  }
}

void drawEndScreen() {
  if (drawn == false) {
    for (int i=0; i<boardF.length; i++) {
          boardF[i][0]=new fBlock(i*50, 0);
          boardF[0][i]=new fBlock(0, i*50);
          boardF[i][boardF.length-1]=new fBlock(i*50, (boardF.length-1)*50);
          boardF[boardF.length-1][i]=new fBlock((boardF.length-1)*50, i*50);
          for (int j=0; j<boardF[0].length; j++) {
            boardtileF[i][j]=new fTile(i*50, j*50);
        }
       }
    drawn = true;
  }
  
  for (int i=0; i<boardF.length; i++) {
      for (int j=0; j<boardF[0].length; j++) {
        if (boardtileF[i][j]!=null) {
          boardtileF[i][j].display();
        }
      }
    }
  for (int i=0; i<boardF.length; i++) {
      for (int j=0; j<boardF[0].length; j++) {
        if (boardF[i][j]!=null) {
          boardF[i][j].display();
        }
      }
    }
    
    textSize(80);
    fill(0,0,0);
    stroke(0,0,0);
    text("Congrats!", 200,340);
    textSize(25);
    text("You collected all the berries!",218,395);
    noFill();
    rect(265, 430, 200, 50, 15);
    textSize(20);
    text("Level Select", 313, 463);
    if (mousePressed && mX >= 267 && mX <= 467 && mY >= 435 && mY <= 485) {
      location = "levelSelect";
      pause = false;
      goVis = false;
      playerChar = "";
      selectedLevel = "";
      resetLevel();
      drawn = false;
    }
    image(NanabBerry2,50,650);
    image(NanabBerry2,50,50);
    image(NanabBerry2,650,50);
    image(NanabBerry2,650,650);
    
    image(OranBerry2,100,50);
    image(OranBerry2,50,100);
    image(OranBerry2,50,600);
    image(OranBerry2,100,650);
    image(OranBerry2,600,650);
    image(OranBerry2,650,600);
    image(OranBerry2,600,50);
    image(OranBerry2,650,100);
    
    image(LumBerry2,150,50);
    image(LumBerry2,100,100);
    image(LumBerry2,50,150); 
    image(LumBerry2,50,550);
    image(LumBerry2,100,600);
    image(LumBerry2,150,650);
    image(LumBerry2,650,550);
    image(LumBerry2,600,600);
    image(LumBerry2,550,650);
    image(LumBerry2,550,50);
    image(LumBerry2,600,100);
    image(LumBerry2,650,150);
    
    image(SitrusBerry2,200,200);
    image(SitrusBerry2,250,200);
    image(SitrusBerry2,300,200);
    image(SitrusBerry2,350,200);
    image(SitrusBerry2,400,200);
    image(SitrusBerry2,450,200);
    image(SitrusBerry2,500,200);
    image(SitrusBerry2,200,500);
    image(SitrusBerry2,250,500);
    image(SitrusBerry2,300,500);
    image(SitrusBerry2,350,500);
    image(SitrusBerry2,400,500);
    image(SitrusBerry2,450,500);
    image(SitrusBerry2,500,500);
    
    image(RazzBerry2,100,250);
    image(RazzBerry2,100,300);
    image(RazzBerry2,100,350);
    image(RazzBerry2,100,400);
    image(RazzBerry2,100,450);
    
    image(RazzBerry2,600,250);
    image(RazzBerry2,600,300);
    image(RazzBerry2,600,350);
    image(RazzBerry2,600,400);
    image(RazzBerry2,600,450);
    
    
}
