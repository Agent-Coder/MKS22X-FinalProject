Level1 A=new Level1();
float mX;
float mY;

String location = "startScreen";
int animateCount = 0;
String playerChar = "";
String selectedLevel = "";
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PFont font;

boolean pause = false;

abstract class Levels {
  Block[][] board=new Block[15][15];
  Player B;
  Enemies C;
  Block[][] map = new Block[15][15];

  public Levels() {
    B=new Player(350, 350, board);
    C=new Enemies(B);
  };
  abstract void output();
}
class Level1 extends Levels {
  Tile[][] boardtile=new Tile[15][15];
  IceBlock[][] start = new IceBlock[15][15];
  public Level1() {
    super();
    board[7][3]=new IceBlock(200, 350);
    board[7][4]=new IceBlock(150, 350);
    board[7][5]=new IceBlock(250, 350);
    board[7][9]=new IceBlock(450, 350);
    board[7][10]=new IceBlock(500, 350);
    board[7][11]=new IceBlock(550, 350);
    for (int i=0; i<board.length; i++) {
      board[i][0]=new BorderBlock(i*50, 0);
      board[0][i]=new BorderBlock(0, i*50);
      board[i][board.length-1]=new BorderBlock(i*50, (board.length-1)*50);
      board[board.length-1][i]=new BorderBlock((board.length-1)*50, i*50);
      for (int j=0; j<board[0].length; j++) {
        boardtile[i][j]=new Tile(i*50, j*50);
        if (i>=3&&i<board.length-3&&((j>=8&&j<12)||(j>=3&&j<7))) {
          board[j][i]=new IceBlock(i*50, j*50);
        }
        start[i][j]=new IceBlock(i*50, j*50);
      }
    }
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
  void play() {
    //spaceTime();
    output();
    attack();
    output();
    //lvlStart1();
    B.move();
    C.update();
    C.moveE();
    C.display();
  }

  void attack() {
    if (keysDown.contains(' ')) {
      int x=round(B.getPX()/50);
      int y=round(B.getPY()/50);
      int i;
      println(B.getPX());
      println(x);
      boolean blockHere=false;
      if (B.getPrevKey().equals("right")) {
        println("yes");
        if (board[y][x+1]!=null) {
          blockHere=true;
        }
        i=x+1;
        while (i<board.length-1&&((blockHere&&board[y][i]!=null)||(!blockHere&&board[y][i]==null))) {
          
          if (!blockHere) {
            println("what"+(i));
            board[y][i]=new IceBlock(i*50, y*50);
          } else {
            println("say"+(i));
            board[y][i]=null;
          }
          i++;
         
        }
      } else if (B.getPrevKey().equals("left")) {
        if (board[y][x-1]!=null) {
          blockHere=true;
        }
        i=x-1;
        while (i>=0&&((blockHere&&board[y][i]!=null)||(!blockHere&&board[y][i]==null))) {
          if (!blockHere) {
            board[y][i]=new IceBlock((i)*50, y*50);
          } else {
            board[y][i]=null;
          }
          i--;
        }
      } else if (B.getPrevKey().equals("up")) {
        if (board[y-1][x]!=null) {
          blockHere=true;
        }
        i=y-1;
        while (i>=0&&((blockHere&&board[i][x]!=null)||(!blockHere&&board[i][x]==null))) {
          if (!blockHere) {
            board[i][x]=new IceBlock(x*50, i*50);
          } else {
            board[i][x]=null;
          }
          i--;
        }
      } else {
        if (board[y+1][x]!=null) {
          blockHere=true;
        }
        i=y+1;
        while (i<board.length-1&&((blockHere&&board[i][x]!=null)||(!blockHere&&board[i][x]==null))) {
          if (!blockHere) {
            board[i][x]=new IceBlock(x*50, i*50);
          } else {
            board[i][x]=null;
          }
          i++;
        }
      }
      keysDown.remove(' ');
    }
  }   


  void lvlStart1() {
    for (int a = 3; a < board.length-3; a++) {
      for (int b = 4; b < 7; b++) {
        start[a][b].display();
      }
    }
    for (int a = 3; a < board.length-3; a++) {
      for (int b = 8; b < 11; b++) {
        start[a][b].display();
      }
    }
    start[3][7].display();
    start[4][7].display();
    start[5][7].display();
    start[9][7].display();
    start[10][7].display();
    start[11][7].display();
  }
}

void setup() {
  size(750, 750);
  background = loadImage("StartScreen.png");
  bluebackground = loadImage("BlueBackground.png");
  OranBerry = loadImage("OranBerry.png");
  LumBerry = loadImage("LumBerry.png");
  SitrusBerry = loadImage("SitrusBerry.png");
  RazzBerry = loadImage("RazzBerry.png");
  NanabBerry = loadImage("NanabBerry.png");
  background.resize(1000, 750);
  bluebackground.resize(1000, 750);
  one = loadImage("L1.png");
  two = loadImage("L2.png");
  three = loadImage("L3.png");
  four = loadImage("L4.png");
  five = loadImage("L5.png");
  one.resize(100, 100);
  two.resize(100, 100);
  three.resize(100, 100);
  four.resize(100, 100);
  five.resize(100, 100);
  setupText();
  ManaphyIDown1 = loadImage("ManaphyIdleDown1.png");
  ManaphyIDown2 = loadImage("ManaphyIdleDown2.png");
  EmpoleonIdle1 = loadImage("EmpoleonIdleDown1.png");
  EmpoleonIdle2 = loadImage("EmpoleonIdleDown2.png");
  ManaphyIDown1.resize(50, 50);
  ManaphyIDown2.resize(50, 50);
  EmpoleonIdle1.resize(47, 55);
  EmpoleonIdle2.resize(51, 55);
  GlaceonMRight1 = loadImage("GlaceonWalkRight1.png");
  GlaceonMRight2= loadImage("GlaceonWalkRight2.png");
  GlaceonMRight3 = loadImage("GlaceonWalkRight3.png");
  GlaceonMLeft1 = loadImage("GlaceonWalkLeft1.png"); 
  GlaceonMLeft2 = loadImage("GlaceonWalkLeft2.png");
  GlaceonMLeft3 = loadImage("GlaceonWalkLeft3.png");
  GlaceonIRight1 = loadImage("GlaceonRightIdle1.png");
  GlaceonIRight2 = loadImage("GlaceonRightIdle2.png");
  GlaceonILeft1 = loadImage("GlaceonLeftIdle1.png");
  GlaceonILeft2 = loadImage("GlaceonLeftIdle2.png");
  GlaceonMDown1 = loadImage("GlaceonWalkBack1.png");
  GlaceonMDown2 = loadImage("GlaceonWalkBack2.png");
  GlaceonMDown3 = loadImage("GlaceonWalkBack3.png");
  GlaceonMUp1 = loadImage("GlaceonWalkFront1.png");
  GlaceonMUp2 = loadImage("GlaceonWalkFront2.png");
  GlaceonMUp3 = loadImage("GlaceonWalkFront3.png");
  GlaceonIDown1 = loadImage("GlaceonFrontIdle1.png");
  GlaceonIDown2 = loadImage("GlaceonFrontIdle2.png");
  GlaceonIUp1 = loadImage("GlaceonBackIdle1.png");
  GlaceonIUp2 = loadImage("GlaceonBackIdle2.png");
  floor = loadImage("MoveTile1.png");
  ice=loadImage("Ice.png");
  ice.resize(50, 49);
  floor.resize(50, 50);
  GlaceonMRight1.resize(50, 50);
  GlaceonMRight2.resize(50, 50);
  GlaceonMRight3.resize(50, 50);
  GlaceonMLeft1.resize(50, 50) ;
  GlaceonMLeft2.resize(50, 50);
  GlaceonMLeft3.resize(50, 50);
  GlaceonIRight1.resize(50, 50);
  GlaceonIRight2.resize(50, 50);
  GlaceonILeft1.resize(50, 50);
  GlaceonILeft2.resize(50, 50);
  GlaceonMDown1.resize(50, 50);
  GlaceonMDown2.resize(50, 50);
  GlaceonMDown3.resize(50, 50);
  GlaceonMUp1.resize(50, 50);
  GlaceonMUp2.resize(50, 50);
  GlaceonMUp3.resize(50, 50);
  GlaceonIDown1.resize(50, 50);
  GlaceonIDown2.resize(50, 50);
  GlaceonIUp1.resize(50, 50);
  GlaceonIUp2.resize(50, 50);
} 
void draw() {
  background(255);
  mX = mouseX;
  mY = mouseY;
  if (location.equals("startScreen")) {
    image(background, 0, 0);
    drawBerries();
    drawBerries2();
    drawBerries3();
    detectStartGame();
  }
  else if (location.equals("levelSelect")) {
    image(bluebackground, 0, 0);
    drawLevelScreen();
    detectLevelSelect();
    detectPokemonSelect();
    animateCharSelect();
    drawReady();
  } else if (location.equals("Level1") && pause == false) {
    A.play();
  } 
    if (pause == true) {
      background(151,223,237);
      textSize(80);
      fill(10,10,10);
      text("PAUSED",215,307);
      textSize(25);
      text("Press p to unpause",260,335);
      noFill();
      rect(165,360,200,50,15);
      rect(380,360,200,50,15);
      rect(265,420,210,50,15);
      textSize(20);
      text("Level Select",213,392);
      text("Restart Level",425,392);
      text("Unpause",333,450);
      if (mousePressed && mX >= 164 && mX <= 369 && mY >= 360 && mY <= 412) {
        location = "levelSelect";
        pause = false;
        //WE NEED A RESET LEVEL BUTTON
      }
      if (mousePressed && mX >= 376 && mX <= 583 && mY >= 360 && mY <412) {
        //RESET LEVEL BUTTON
      }
      if (mousePressed && mX >= 262 && mX <= 478 && mY >= 420 && mY <473) {
        pause = false;
      }
  }
  
}

import java.util.*;
Set<Character> keysDown= new HashSet<Character>();
Set<Integer> keyCodesDown= new HashSet<Integer>();

void keyPressed() {
  if (key==CODED) {
    keyCodesDown.add(keyCode);
  } else {
    keysDown.add(key);
  }
  if (key == 'p' && pause == false) {
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

//debug purposes
void mousePressed() {
  print(mX + "" + ", " + mY + " \n");
}
