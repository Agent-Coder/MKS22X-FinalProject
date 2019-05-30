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
  //Berries[] D;
  Block[][] map = new Block[15][15];
  ArrayList<Block> attacked;
  ArrayList<Block> temporary;
  ArrayList<Berries> berryCount;
  boolean canMove=true;
  int oran;
  int lum;
  int nanab;
  int sitrus;
  int razz;
  public Levels() {
    B=new Player(350, 350, board);
    C=new Enemies(B);
  };
  abstract void output();
  abstract void createBerries();
  abstract void collectBerries(int berryEnd);
  abstract void displayBerries(int berryEnd);
}
class Level1 extends Levels {
  Block temp;
  Tile[][] boardtile=new Tile[15][15];
  IceBlock[][] start = new IceBlock[15][15];
  public Level1() {
    super();
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
    berryCount=new ArrayList<Berries>();
    createBerries();
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
    if (oran!=0) {

      collectBerries(oran);
      displayBerries(oran);
    } else {    
      
      collectBerries(lum);
      displayBerries(lum);
    }
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
       } else */      if (board[temp.getyB()/50][temp.getxB()/50]==null) {
        board[temp.getyB()/50][temp.getxB()/50]=new IceBlock(temp.getxB(), temp.getyB());
        make=true;
      } else if (board[temp.getyB()/50][temp.getxB()/50].getType()!="borderblock") {
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
  } else if (location.equals("levelSelect")) {
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
