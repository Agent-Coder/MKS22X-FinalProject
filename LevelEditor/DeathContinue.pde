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
