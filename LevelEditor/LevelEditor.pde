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

PImage meowthRM1;
PImage meowthRM2;
PImage meowthRM3;
PImage meowthLM1;
PImage meowthLM2;
PImage meowthLM3;
PImage meowthDM1;
PImage meowthDM2;
PImage meowthDM3;
PImage meowthUM1;
PImage meowthUM2;
PImage meowthUM3;
PImage IceA1;
PImage IceA2;
PImage IceA3;
PImage IceA4;
PImage IceA5;



boolean pause = false;


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
  Block temp;
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
    boolean make=true;
    output();
    temporary=attack();
    int i=temporary.size()-1;
    while (i>=0) {
      attacked.add(temporary.get(i));
      i--;
    }
    if (attacked.size()==0) {
      temp=null;
    }
    if (frameCount%20==0&&attacked.size()>0) {
      temp=attacked.remove(attacked.size()-1);
      /*if ((round(temp.getxB())==round(C.getX())&&round(temp.getyB())==round(C.getY()))) {
        temp=null;
        attacked.clear();
      } else */if (board[temp.getyB()/50][temp.getxB()/50]==null) {
        board[temp.getyB()/50][temp.getxB()/50]=new IceBlock(temp.getxB(), temp.getyB());
        make=true;
      } else if(board[temp.getyB()/50][temp.getxB()/50].getType()!="borderblock"){
        board[temp.getyB()/50][temp.getxB()/50]=null;
        make=false;
      }
    }
    if (temp!=null&&attacked.size()>0) {
      temp.animate(temp.getxB(), temp.getyB(), make);
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
      C.update(board);
    C.moveE();
    B.move(canMove);
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
  importImages();
  setupText();
  IceA1=loadImage("IceA1.png");
  IceA2=loadImage("IceA2.png");
  IceA3=loadImage("IceA3.png");
  IceA4=loadImage("IceA4.png");
  IceA5=loadImage("IceA5.png");
  meowthRM1=loadImage("MeowthWalkRight1.png");
  meowthRM2=loadImage("MeowthWalkRight2.png");
  meowthRM3=loadImage("MeowthWalkRight3.png");
  meowthLM1=loadImage("MeowthWalkLeft1.png");
  meowthLM2=loadImage("MeowthWalkLeft2.png");
  meowthLM3=loadImage("MeowthWalkLeft3.png");
  meowthDM1=loadImage("MeowthWalkDown1.png");
  meowthDM2=loadImage("MeowthWalkDown2.png");
  meowthDM3=loadImage("MeowthWalkDown3.png");
  meowthUM1=loadImage("MeowthWalkUp1.png");
  meowthUM2=loadImage("MeowthWalkUp2.png");
  meowthUM3=loadImage("MeowthWalkUp3.png");
  IceA1.resize(50, 50);
  IceA2.resize(50, 50);
  IceA3.resize(50, 50);
  IceA4.resize(50, 50);
  IceA5.resize(50, 50);
  meowthRM1.resize(50, 50);
  meowthRM2.resize(50, 50);
  meowthRM3.resize(50, 50);
  meowthLM1.resize(50, 50);
  meowthLM2.resize(50, 50);
  meowthLM3.resize(50, 50);
  meowthDM1.resize(50, 50);
  meowthDM2.resize(50, 50);
  meowthDM3.resize(50, 50);
  meowthUM1.resize(50, 50);
  meowthUM2.resize(50, 50);
  meowthUM3.resize(50, 50);
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
