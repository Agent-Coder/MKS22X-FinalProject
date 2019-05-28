Level1 A=new Level1();
float mX;
float mY;
PImage background;
PImage bluebackground;
PImage OranBerry;
PImage NanabBerry;
PImage RazzBerry;
PImage SitrusBerry;
PImage LumBerry;
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
PImage ManaphyIdle1;
PImage ManaphyIdle2;
PImage GlaceonIdle1;
PImage GlaceonIdle2;
PImage EmpoleonIdle1;
PImage EmpoleonIdle2;
PImage floor;
PImage ice;
PImage rightm1;
PImage rightm2;
PImage rightm3;
PImage leftm1;
PImage leftm2;
PImage leftm3;
PImage rights1;
PImage rights2;
PImage lefts1;
PImage lefts2;
PImage downm1;
PImage downm2;
PImage downm3;
PImage upm1;
PImage upm2;
PImage upm3;
PImage ups1;
PImage ups2;
PImage downs1;
PImage downs2;
abstract class Levels {
  Block[][] board=new Block[15][15];
  Player B;
  Enemies C;
  //Berries[] D;
  Block[][] map = new Block[15][15];

  public Levels() {
    B=new Player(350, 350, board);
    C=new Enemies(B);
  };
  abstract void output();
}
class Level1 extends Levels {
  ArrayList<Block> attacked;
  ArrayList<Block> temporary;
  boolean canMove=true;
  Tile[][] boardtile=new Tile[15][15];
  IceBlock[][] start = new IceBlock[15][15];
  public Level1() {
    super();
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
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
    output();
    temporary=attack();
    int i=temporary.size()-1;
    while (i>=0) {
      attacked.add(temporary.get(i));
      i--;
    }
    if (frameCount%10==0&&attacked.size()>0) {
      Block temp=attacked.remove(attacked.size()-1);
      if (board[temp.getyB()/50][temp.getxB()/50]==null) {
        board[temp.getyB()/50][temp.getxB()/50]=new IceBlock(temp.getxB(), temp.getyB());
      } else {
        board[temp.getyB()/50][temp.getxB()/50]=null;
      }
    }
    if (attacked.size()>0) {
      canMove=false;
    } else {
      canMove=true;
    }
    //lvlStart1();
    /*if(frameCount%15==0){
      //C.board();
    }*/
    B.move(canMove);
    C.update(board);
    C.moveE();
    C.display();
  }

  ArrayList<Block> attack() {
    ArrayList<Block> delete=new ArrayList<Block>();
    if (keysDown.contains(' ')) {
      int x=round(B.getPX()/50);
      int y=round(B.getPY()/50);
      int i;
      boolean blockHere=false;
      if (B.getPrevKey().equals("right")) {
        if (board[y][x+1]!=null) {
          blockHere=true;
        }
        i=x+1;
        while (i<board.length-1&&((blockHere&&board[y][i]!=null)||(!blockHere&&board[y][i]==null))) { 
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
        while (i>=0&&((blockHere&&board[y][i]!=null)||(!blockHere&&board[y][i]==null))) {
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
        while (i>=0&&((blockHere&&board[i][x]!=null)||(!blockHere&&board[i][x]==null))) {
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
        while (i<board.length-1&&((blockHere&&board[i][x]!=null)||(!blockHere&&board[i][x]==null))) {
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
  ManaphyIdle1 = loadImage("ManaphyIdleDown1.png");
  ManaphyIdle2 = loadImage("ManaphyIdleDown2.png");
  EmpoleonIdle1 = loadImage("EmpoleonIdleDown1.png");
  EmpoleonIdle2 = loadImage("EmpoleonIdleDown2.png");
  GlaceonIdle1 = loadImage("GlaceonIdleDown1.png");
  GlaceonIdle2 = loadImage("GlaceonIdleDown2.png");
  ManaphyIdle1.resize(50, 50);
  ManaphyIdle2.resize(50, 50);
  EmpoleonIdle1.resize(47, 55);
  EmpoleonIdle2.resize(51, 55);
  GlaceonIdle1.resize(50, 50);
  GlaceonIdle2.resize(50, 50);
  rightm1 = loadImage("GlaceonWalkRight1.png");
  rightm2= loadImage("GlaceonWalkRight2.png");
  rightm3 = loadImage("GlaceonWalkRight3.png");
  leftm1 = loadImage("GlaceonWalkLeft1.png"); 
  leftm2 = loadImage("GlaceonWalkLeft2.png");
  leftm3 = loadImage("GlaceonWalkLeft3.png");
  rights1 = loadImage("GlaceonRightIdle1.png");
  rights2 = loadImage("GlaceonRightIdle2.png");
  lefts1 = loadImage("GlaceonLeftIdle1.png");
  lefts2 = loadImage("GlaceonLeftIdle2.png");
  downm1 = loadImage("GlaceonWalkBack1.png");
  downm2 = loadImage("GlaceonWalkBack2.png");
  downm3 = loadImage("GlaceonWalkBack3.png");
  upm1 = loadImage("GlaceonWalkFront1.png");
  upm2 = loadImage("GlaceonWalkFront2.png");
  upm3 = loadImage("GlaceonWalkFront3.png");
  downs1 = loadImage("GlaceonFrontIdle1.png");
  downs2 = loadImage("GlaceonFrontIdle2.png");
  ups1 = loadImage("GlaceonBackIdle1.png");
  ups2 = loadImage("GlaceonBackIdle2.png");
  floor = loadImage("MoveTile1.png");
  ice=loadImage("Ice.png");
  ice.resize(50, 49);
  floor.resize(50, 50);
  rightm1.resize(50, 50);
  rightm2.resize(50, 50);
  rightm3.resize(50, 50);
  leftm1.resize(50, 50) ;
  leftm2.resize(50, 50);
  leftm3.resize(50, 50);
  rights1.resize(50, 50);
  rights2.resize(50, 50);
  lefts1.resize(50, 50);
  lefts2.resize(50, 50);
  downm1.resize(50, 50);
  downm2.resize(50, 50);
  downm3.resize(50, 50);
  upm1.resize(50, 50);
  upm2.resize(50, 50);
  upm3.resize(50, 50);
  downs1.resize(50, 50);
  downs2.resize(50, 50);
  ups1.resize(50, 50);
  ups2.resize(50, 50);
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
  } else if (location.equals("levelSelect")&&!starting()) {
    image(bluebackground, 0, 0);
    drawLevelScreen();
    detectLevelSelect();
    detectPokemonSelect();
    animateCharSelect();
    drawReady();
  } else if (starting()) {
    A.play();
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
}
void keyReleased() {
  if (key==CODED) {
    keyCodesDown.remove(keyCode);
  } else {
    keysDown.remove(key);
  }
}
