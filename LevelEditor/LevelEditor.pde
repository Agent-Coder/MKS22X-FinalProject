Level1 A=new Level1();
Player B=new Player(350,350);
Enemies C=new Enemies(B);
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

PImage OranBerry; 
abstract class Block {
  int xB;
  int yB;
  String type;
  boolean destroyable;
  public Block() {
    xB=0;
    yB=0;
    type="block";
    destroyable=false;
  }
  abstract void display();
}
class BorderBlock extends Block {
  public BorderBlock(int x, int y) {
    type="borderblock";
    xB=x;
    yB=y;
    destroyable=false;
  }
  void display() {
    image(ice, xB, yB);
  }
}
class IceBlock extends Block {
  public IceBlock(int x, int y) {
    type="iceblock";
    xB=x;
    yB=y;
    destroyable=true;
  }
  void display() {
    image(ice, xB, yB, 50, 49);
  }
}
class Tile {
  String type;
  int xer;
  int yer;
  public Tile(int x, int y) {
    type="tile";
    xer=x;
    yer=y;
  }
  void display() {
    image(floor, xer, yer);
  }
}

//NEEDS EDITING & CHECKS
class BerryTile {
  String type;
  int xer;
  int yer;
  public BerryTile(int x, int y) {
    type = "Berry";
    xer = x;
    yer = y;
  }
  void display() {
    image(OranBerry, xer, yer, 50, 50);
  }
}

abstract class Levels {
  Block[][] board=new Block[15][15];
  Block[][] map = new Block[15][15];
  public Levels() {
  };
  abstract void output();
}
class Level1 extends Levels {
  Tile[][] boardtile=new Tile[15][15];
  IceBlock[][] start = new IceBlock[15][15];
  public Level1() {
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        board[i][j]=new BorderBlock(i*50, j*50);
        boardtile[i][j]=new Tile(i*50, j*50);
        start[i][j]=new IceBlock(i*50, j*50);
      }
    }
  }
  
  void output() {
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        boardtile[i][j].display();
      }
    }
    
    for (int i=0; i<board.length; i++) {
      if (board[i][0]!=null) {
        board[i][0].display();
      }
      if (board[0][i]!=null) {
        board[0][i].display();
      }
      if (board[i][board.length-1]!=null) {
        board[i][board.length-1].display();
      }
      if (board[board.length-1][i]!=null) {
        board[board.length-1][i].display();
      }
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


class Player {
  PImage[] images={rightm1, rightm2, rightm3, 
    leftm1, leftm2, leftm3, 
    rights1, rights2, 
    lefts1, lefts2, 
    downm1, downm2, downm3, 
    upm1, upm2, upm3, 
    ups1, ups2, 
    downs1, downs2};
  float x, y, xcor, ycor, speed;
  String prevKey;
  Player(float x, float y) {
    this.x = x;
    this.y = y;
    xcor=x;
    ycor=y;
    speed=2.5;
    prevKey="right";
  }
  float getPX() {
    return xcor;
  }
  float getPY() {
    return ycor;
  }
  void display(PImage i, float x, float y) {
    image(i, x, y, 50, 50);
  }
  void move() {
    if (keyCodesDown.contains(RIGHT)) {
      PImage r=rightm1;
      if (frameCount%30<10) {
        r=rightm1;
      } else if (frameCount%30<20) {
        r=rightm2;
      } else {
        r=rightm3;
      }
      if (xcor+speed<650) {
        xcor+=speed;
        display(r, xcor+speed, ycor);
      } else {
        display(r, xcor, ycor);
      }
      prevKey="right";
    } else if (keyCodesDown.contains(LEFT)) {
      PImage r=leftm1;
      if (frameCount%30<10) {
        r=leftm1;
      } else if (frameCount%30<20) {
        r=leftm2;
      } else {
        r=leftm3;
      }
      if (xcor+speed>=50) {
        xcor+=-1* speed;
        display(r, xcor-speed, ycor);
      } else {
        display(r, xcor, ycor);
      }
      prevKey="left";
    } else if (keyCodesDown.contains(DOWN)) {
      PImage r=downm1;
      if (frameCount%30<10) {
        r=downm1;
      } else if (frameCount%30<20) {
        r=downm2;
      } else {
        r=downm3;
      }
      if (ycor+speed<650) {
        ycor+=speed;
        display(r, xcor, ycor+speed);
      } else {
        display(r, xcor, ycor);
      }
      prevKey="down";
    } else if (keyCodesDown.contains(UP)) {
      PImage r=upm1;
      if (frameCount%30<10) {
        r=upm1;
      } else if (frameCount%30<10) {
        r=upm2;
      } else {
        r=upm3;
      }
      if (ycor-speed>50) {
        ycor-=speed;
        display(r, xcor, ycor-speed);
      } else {
        display(r, xcor, ycor);
      }
      prevKey="up";
    } else {
      if (prevKey.equals("right")) {
        if (frameCount%30<15) {
          display(rights1, xcor, ycor);
        } else {
          display(rights2, xcor, ycor);
        }
      } else if (prevKey.equals("left")) {
        if (frameCount%30<15) {
          display(lefts1, xcor, ycor);
        } else {
          display(lefts2, xcor, ycor);
        }
      } else if (prevKey.equals("up")) {
        if (frameCount%30<15) {
          display(ups1, xcor, ycor);
        } else {
          display(ups2, xcor, ycor);
        }
      } else {
        if (frameCount%30<15) {
          display(downs1, xcor, ycor);
        } else {
          display(downs2, xcor, ycor);
        }
      }
    }
  }
}
class Enemies {
  int[][] grid=new int[15][15];
  float x;
  float y;
  float tx;
  float ty;
  Player target;
  int[] moves=new int[8];
  public Enemies(Player a) {
    target=a;
    x=100;
    y=100;
    tx=a.getPX();
    ty=a.getPY();
    moves[0]=0;
    moves[1]=1;
    moves[2]=0;
    moves[3]=-1;
    moves[4]=-1;
    moves[5]=0;
    moves[6]=1;
    moves[7]=0;
    clear();
  }
  void clear() {
    for (int i=0; i<grid.length; i++) {
      for (int j=0; j<grid.length; j++) {
        grid[i][j]=0;
      }
    }
  }
  void update() {
    //System.out.println("--->"+((targety-110)/20));
    clear();
    tx=target.getPX();
    ty=target.getPY();
    fillGrid((int)(ty-50)/50, (int)(tx-50)/50, 1);
    for (int i=0; i<grid.length; i++) {
      grid[i][0]=-1;
      grid[0][i]=-1;
      grid[i][grid.length-1]=-1;
      grid[grid.length-1][i]=-1;
    }
    //board();
    moveE();
    //System.out.println(target.getPX()+" "+target.getPY());
  }
  void fillGrid(int xer, int yer, int num) {
    if (xer<grid.length&&xer>=0&&yer>=0&&yer<grid.length&&grid[xer][yer]!=1&&(grid[xer][yer]==0||grid[xer][yer]>num)) {
      grid[xer][yer]=num;
      fillGrid(xer+1, yer, num+1);
      fillGrid(xer, yer+1, num+1);
      fillGrid(xer-1, yer, num+1);
      fillGrid(xer, yer-1, num+1);
    }
  }
  void board() {
    for (int i=0; i<grid.length; i++) {
      for (int j=0; j<grid.length; j++) {
        System.out.print(grid[i][j]+" ");
      }
      System.out.println();
    }
    System.out.println();
    //System.out.println(x+" "+y);
  }
  void display() {
    fill(255, 255, 255);
    ellipseMode(CORNER);
    ellipse(x, y, 50, 50);
  }

  void moveE() {
    int a=(int)(y-50)/50;
    int b=(int)(x-50)/50;
    int smallest=grid[a][b];
    int index=-1;
    for (int i=0; i<4; i++) {
      if (a+moves[2*i]>=0&&a+moves[2*i]<grid.length&&b+moves[2*i+1]>=0&&b+moves[2*i+1]<grid.length) {
        if (grid[a+moves[2*i]][b+moves[2*i+1]]<smallest&&grid[a+moves[2*i]][b+moves[2*i+1]]!=-1) {
          smallest=grid[a+moves[2*i]][b+moves[2*i+1]];
          index=i;
        }
      }
    }
    if (index!=-1) {
      y+=moves[2*index];
      x+=moves[2*index+1];
    }
  }
}
class Spoink extends Enemies{
  public Spoink(Player a){
    super(a);
  }
  void display() {
    fill(255, 255, 255);
    ellipseMode(CORNER);
    ellipse(x, y, 50, 50);
  }
}

void setup() {
  size(750, 750);
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
  ice.resize(50,49);
  floor.resize(50,50);
  OranBerry = loadImage("OranBerry.png");
  //frameRate(64);
}
void draw() {
  background(255);
  println(frameRate);
  A.output();
  A.lvlStart1();
  B.move();
  C.update();
  C.moveE();
  C.display();
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
    keysDown.add(key);
  }
}
