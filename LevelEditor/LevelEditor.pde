import processing.sound.*;
Level1 A=new Level1();

SoundFile file;
SoundFile file2;

float mX;
float mY;

boolean dead = false;
boolean nextLevel = false;
String plocation;

String location = "startScreen";
int animateCount = 0;
String playerChar = "";
String selectedLevel = "";
PImage one;
PImage two;
PImage three;
PImage four;
PFont font;
boolean pause = false;
boolean goVis = false;

boolean inhibit = false;
abstract class Levels {
  Block[][] board=new Block[15][15];
  Player B;
  Enemies C;
  boolean attacking=false;
  //Berries[] D;
  ArrayList<Block> attacked;
  ArrayList<Block> temporary;
  ArrayList<Berries> berryCount;
  Tile[][] boardtile;
  Block temp;
  boolean canMove=true;
  int oran;
  int lum;
  int nanab;
  int sitrus;
  int razz;
  public Levels() {
    boardtile=new Tile[15][15];
    attacking=false;
    attacked=new ArrayList<Block>() ;
    temporary=new ArrayList<Block>();
    berryCount=new ArrayList<Berries>();
    board=new Block[15][15];
    temp=null;
    canMove=true;
    oran=0;
    lum=0;
    nanab=0;
    sitrus=0;
    razz=0;
  }

  void output() {
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        if (boardtile[i][j]!=null) {
          boardtile[i][j].display();
        }
      }
    }

    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        if (board[i][j]!=null) {
          board[i][j].display();
        }
      }
    }
  }

  ArrayList<Block> attack() {
    ArrayList<Block> delete=new ArrayList<Block>();
    if (keysDown.contains(' ') ) {
      int x=round(B.getPX()/50);
      int y=round(B.getPY()/50);
      int i;
      boolean blockHere=false;
      if (B.getPrevKey().equals("right")) {
        if (board[y][x+1]!=null) {
          blockHere=true;
        }
        i=x+1;
        while (i<board.length-1&&((blockHere&&board[y][i]!=null&&board[y][i].getType().equals("iceblock"))||(!blockHere&&board[y][i]==null))) { 
          if (board[y][i]==null) {
            delete.add(new IceBlock(i*50, y*50));
          } else {
            delete.add(board[y][i]);
          }
          i++;
        }
      } else if (B.getPrevKey().equals("left")) {
        if (board[y][x-1]!=null) {
          blockHere=true;
        }
        i=x-1;
        while (i>0&&((blockHere&&board[y][i]!=null&&board[y][i].getType().equals("iceblock"))||(!blockHere&&board[y][i]==null))) {
          if (board[y][i]==null) {
            delete.add(new IceBlock(i*50, y*50));
          } else {
            delete.add(board[y][i]);
          }
          i--;
        }
      } else if (B.getPrevKey().equals("up")) {
        if (board[y-1][x]!=null) {
          blockHere=true;
        }
        i=y-1;
        while (i>0&&((blockHere&&board[i][x]!=null&&board[i][x].getType().equals("iceblock"))||(!blockHere&&board[i][x]==null))) {
          if (board[i][x]==null) {
            delete.add(new IceBlock(x*50, i*50));
          } else {
            delete.add(board[i][x]);
          }
          i--;
        }
      } else {
        if (board[y+1][x]!=null) {
          blockHere=true;
        }
        i=y+1;
        while (i<board.length-1&&((blockHere&&board[i][x]!=null&&board[i][x].getType().equals("iceblock"))||(!blockHere&&board[i][x]==null))) {
          if (board[i][x]==null) {
            delete.add(new IceBlock(x*50, i*50));
          } else {
            delete.add(board[i][x]);
          }
          i++;
        }
      }
      keysDown.remove(' ');
    }
    return delete;
  } 
  abstract void createBerries();
  abstract void collectBerries(int berryEnd);
  abstract void displayBerries(int berryEnd);
}
class Level1 extends Levels {
  public Level1() {
    super();
    B=new Player(350, 350, board, boardtile, playerChar);
    C=new Enemies(B, board, boardtile, 100, 100, "Meowth");
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
    berryCount=new ArrayList<Berries>();
    createBerries();
    board[7][3]=new IceBlock(150, 350);
    board[7][4]=new IceBlock(200, 350);
    board[7][5]=new IceBlock(250, 350);
    board[7][9]=new IceBlock(450, 350);
    board[7][10]=new IceBlock(500, 350);
    board[7][11]=new IceBlock(550, 350);
    for (int i=0; i<board.length; i++) {
      board[i][0]=new BorderBlock(0, i*50);
      board[0][i]=new BorderBlock(i*50, 0);
      board[i][board.length-1]=new BorderBlock((board.length-1)*50, i*50 );
      board[board.length-1][i]=new BorderBlock(i*50, (board.length-1)*50);
      for (int j=0; j<board[0].length; j++) {
        boardtile[j][i]=new Tile(i*50, j*50);
        if (i>=3&&i<board.length-3&&((j>=8&&j<12)||(j>=3&&j<7))) {
          board[j][i]=new IceBlock(i*50, j*50);
        }
      }
    }
  }
  void collectBerries(int berryEnd) {
    for (int i=0; i<berryEnd; i++) {
      if (round(B.getPX()/50)==berryCount.get(i).getBerryX()/50&&round(B.getPY()/50)==berryCount.get(i).getBerryY()/50) {
        if (berryCount.get(i).getBerryType().equals("OranBerry")) {
          oran--;
        } else {
          lum--;
        }
        berryCount.remove(i);
        berryEnd--;
      }
    }
  }
  void createBerries() {
    berryCount.add(new OBerries(250, 100));
    berryCount.add(new OBerries(300, 100));
    berryCount.add(new OBerries(350, 100));
    berryCount.add(new OBerries(400, 100));
    berryCount.add(new OBerries(450, 100));

    berryCount.add(new OBerries(600, 250));
    berryCount.add(new OBerries(600, 300));
    berryCount.add(new OBerries(600, 350));
    berryCount.add(new OBerries(600, 400));
    berryCount.add(new OBerries(600, 450));

    berryCount.add(new OBerries(250, 600));
    berryCount.add(new OBerries(300, 600));
    berryCount.add(new OBerries(350, 600));
    berryCount.add(new OBerries(400, 600));
    berryCount.add(new OBerries(450, 600));

    berryCount.add(new OBerries(100, 250));
    berryCount.add(new OBerries(100, 300));
    berryCount.add(new OBerries(100, 350));
    berryCount.add(new OBerries(100, 400));
    berryCount.add(new OBerries(100, 450));
    oran=20;

    berryCount.add(new LBerries(50, 50));
    berryCount.add(new LBerries(100, 50));
    berryCount.add(new LBerries(50, 100));

    berryCount.add(new LBerries(650, 650));
    berryCount.add(new LBerries(650, 600));
    berryCount.add(new LBerries(600, 650));

    berryCount.add(new LBerries(650, 50));
    berryCount.add(new LBerries(650, 100));
    berryCount.add(new LBerries(600, 50));

    berryCount.add(new LBerries(50, 650));
    berryCount.add(new LBerries(50, 600));
    berryCount.add(new LBerries(100, 650));
    lum=12;
  }
  void displayBerries(int berryEnd) {
    for (int i=0; i<berryEnd; i++) {
      berryCount.get(i).display();
    }
  }

  Block temp;
  int frameStart;
  boolean startFrame=true;
  boolean make=true;
  boolean lastBlock=false;
  int frameBlocks=0;
  int playerFrames=0;

  void play() {
    output();
    if (startFrame) {
      frameStart=frameCount;
      startFrame=false;
      frameBlocks=frameStart-20;
    }
    if (oran!=0) {
      collectBerries(oran);
      displayBerries(oran);
    } else {    
      collectBerries(lum);
      displayBerries(lum);
    }
    temporary=attack();
    int i=temporary.size()-1;
    while (i>=0&&!attacking) {
      attacked.add(temporary.get(i));
      i--;
    }
    if (attacked.size()==0&&frameCount-playerFrames>=20) {
      temp=null;
      attacking=false;
    }
    if (attacked.size()>0||frameCount-playerFrames<20) {
      attacking=true;
    }
    if (frameCount-playerFrames>=20&&attacked.size()>0) {
      temp=attacked.remove(attacked.size()-1);
      if (board[temp.getyB()/50][temp.getxB()/50]==null) {
        make=true;  
        playerFrames=frameCount;
      } else if (board[temp.getyB()/50][temp.getxB()/50]!=null&&board[temp.getyB()/50][temp.getxB()/50].getType()!="borderblock") {
        board[temp.getyB()/50][temp.getxB()/50]=null;
        make=false;
        playerFrames=frameCount;
      }
    }

    if (temp!=null) {

      if (make) {
        lastBlock=true;
        temp.animate(temp.getxB(), temp.getyB(), make, frameCount-playerFrames);
        if (frameCount-playerFrames==19) {
          if (abs((round(C.getX())-temp.getxB()))<50&&abs((round(C.getY())-temp.getyB()))<50) {
            temp=null;      
            attacked.clear();
            lastBlock=false;
          } else if (board[temp.getyB()/50][temp.getxB()/50]==null) {
            board[temp.getyB()/50][temp.getxB()/50]=new IceBlock(temp.getxB(), temp.getyB());
            lastBlock=false;
          }
        }
      } else {
        temp.animate(temp.getxB(), temp.getyB(), make, frameCount-playerFrames);
      }
    }
    if (attacked.size()>0||frameCount-playerFrames<20) {
      canMove=false;
    } else {
      canMove=true;
    }
    C.update(board);
    if (frameCount%50==frameStart%50) {
      C.moveE();
    }
    C.moveAnimation();
    B.move(canMove);
    if (round(C.getX()/50)==round(B.getPX()/50)&&round(C.getY()/50)==round(B.getPY()/50)) {
      dead = true;
    }
    if (berryCount.size() == 0) nextLevel = true;
  }
}

boolean beginSing=true;
  boolean beginSing2=true;
void setup() {
  size(750, 750);
  importImages();
  setupText();
  file = new SoundFile(this, "Pokemon.mp3");
  file2 = new SoundFile(this, "Pokemon2.mp3");
  //file.loop();
}
void draw() {
  int frameDead=0;
  background(255);
  mX = mouseX;
  mY = mouseY;
  //file.loop();
  if (location.equals("startScreen")) {
    image(background, 0, 0);
    file2.stop();
    if (beginSing) {
      file.loop();
        beginSing=false;
    }
    drawBerries();
    drawBerries2();
    drawBerries3();
    //file.play();
    detectStartGame();
  } else if (location.equals("levelSelect")) {
    file2.stop();
    image(bluebackground, 0, 0);
    drawLevelScreen();
    detectPokemonSelect();
    detectLevelSelect();
    animateCharSelect();
    drawReady();
    if (goVis) {
      if (mousePressed && mX >= 617 && mX <683 && mY >= 684 && mY <=715) {//go button 
        location = selectedLevel;
        plocation = selectedLevel;
      }
    }
  } else if (location.equals("1") && pause == false && goVis == true) {
    file.stop();
    A.play();
    if (dead) {
      location="deathScreen";
      resetLevel();
    }
    if (nextLevel) {
      resetLevel();
      location = "1to2";
    }
  } else if (location.equals("1to2")) {
    nextLevel = false;
    drawContinueScreen("2");
  } else if (location.equals("2") && pause == false && goVis == true) {
    file.stop();
    L2.play();
    if (dead) {
      location = "deathScreen";
      resetLevel();
    }
    if (nextLevel) {
      resetLevel();
      location="2to3";
    }
  } else if (location.equals("2to3")) {
    nextLevel = false;
    drawContinueScreen("3");
  } else if (location.equals("3") && pause == false && goVis == true) {
    file.stop();
    L3.play();
    inhibit = true;
    if (dead) {
      location="deathScreen";
      inhibit = false;
      resetLevel();
    }
    if (nextLevel) {
      resetLevel();
      inhibit = false;
      location = "3to4";
    }
  } 
  else if (location.equals("3to4")) {
    nextLevel = false;
    drawContinueScreen("4");
  } 
  else if (location.equals("4") && pause == false && goVis == true) {
    file.stop();
    L4.play(playerChar);
    if (dead) {
      location = "deathScreen";
      resetLevel();
    }
    if (nextLevel) {
      resetLevel();
      location="end";
    }
  } 
  else if (location.equals("end")) {
      nextLevel = false;
      resetLevel();
      drawEndScreen();
  }
  else if (location.equals("deathScreen")) {
    dead = false;
    drawDeathScreen();
  }
  if (pause == true) {
    inhibit = false;
    background(151, 223, 237);
    textSize(80);
    fill(10, 10, 10);
    text("PAUSED", 215, 307);
    textSize(25);
    text("Press p to unpause", 260, 335);
    noFill();
    rect(165, 360, 200, 50, 15);
    rect(380, 360, 200, 50, 15);
    rect(265, 420, 210, 50, 15);
    textSize(20);
    text("Level Select", 213, 392);
    text("Restart Level", 425, 392);
    text("Unpause", 333, 450);
    if (mousePressed && mX >= 164 && mX <= 369 && mY >= 360 && mY <= 412) {
      location = "levelSelect";
      pause = false;
      goVis = false;
      playerChar = "";
      selectedLevel = "";
      resetLevel();
    }
    if (mousePressed && mX >= 376 && mX <= 583 && mY >= 360 && mY <412) {
      resetLevel();
      pause = false;
    }
    if (mousePressed && mX >= 262 && mX <= 478 && mY >= 420 && mY <473) {
      pause = false;
    }
  }
}

import java.util.*;
Set<Character> keysDown= new HashSet<Character>();
Set<Integer> keyCodesDown= new HashSet<Integer>();
boolean begin=true;
void keyPressed() {
  if (key==CODED) {
    keyCodesDown.add(keyCode);
  } else {
    keysDown.add(key);
  }
  if (!location.equals("levelSelect") && !location.equals("startScreen") && !location.equals("deathScreen") &&
    !location.equals("1to2") && !location.equals("2to3") && !location.equals("3to4") && !location.equals("end") &&
    key == 'p' && pause == false) {
    pause = true;
  } else if (key == 'p' && pause == true) {
    pause = false;
  }
}

void keyReleased() {
  if (key==CODED) {
    keyCodesDown.remove(keyCode);
  } else {
    keysDown.remove(key);
  }
}
