Level1 A=new Level1();
Player B=new Player(250, 250);
Enemies C=new Enemies(B);
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
    image(ice, xB, yB, 50, 49);
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
    image(ice, xB, yB, 50, 50);
  }
}
abstract class Levels {
  Block[][] board=new Block[15][15];
  public Levels() {
  };
  abstract void output();
}
class Level1 extends Levels {
  public Level1() {
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        board[i][j]=new BorderBlock(i*50, j*50);
      }
    }
  }
  void output() {
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
}
int i =0;
int j=0;
int k=0;
PImage test;
PImage test2;
PImage test3;
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
String preKey="right";
PImage[] images;

class Player {
  float x, y,xcor,ycor;
  Player(float x, float y) {
    this.x = x;
    this.y = y;
    xcor=x;
    xcor=x;
  }
  float getPX() {
    return xcor;
  }
  float getPY() {
    return ycor;
  }
  void move() {
    if (keyPressed&&keyCode == RIGHT&&x+i*20<=635) {
      if (i%3 == 0) {
        image(test, x+i*20, y+20*k, 50, 50);
      } else if (i%3 == 1) {
        image(test2, x+i*20, y+20*k, 50, 50);
      } else {
        image(test3, x+i*20, y+20*k, 50, 50);
      }
      xcor=x+i*20;
      ycor=y+20*k;
      preKey="right";
      delay(150);
      i++;
    } else if (keyPressed&&keyCode == LEFT&&x+(i-1)*20>=50) {
      i--;
      if (i%3 == 0) {
        image(leftm1, x+i*20, y+20*k, 50, 50);
      } else if (i%3 == 1) {
        image(leftm2, x+i*20, y+20*k, 50, 50);
      } else {
        image(leftm3, x+i*20, y+20*k, 50, 50);
      }
      xcor=x+i*20;
      ycor=y+20*k;
      preKey="left";
      delay(150);
    } else if (keyPressed&&keyCode == DOWN&&y+20*k<=630) {
      if (k%3 == 0) {
        image(downm1, x+i*20, y+20*k, 50, 50);
      } else if (k%3 == 1) {
        image(downm2, x+i*20, y+20*k, 50, 50);
      } else {
        image(downm3, x+i*20, y+20*k, 50, 50);
      }
      preKey="down";
      xcor=x+i*20;
      ycor=y+20*k;
      k++;
      delay(150);
    } else if (keyPressed&&keyCode == UP&&y+20*(k-1)>=40) {
      k--;
      if (k%3 == 0) {
        image(upm1, x+i*20, y+20*k, 50, 50);
      } else if (k%3 == 1) {
        image(upm2, x+i*20, y+20*k, 50, 50);
      } else {
        image(upm3, x+i*20, y+20*k, 50, 50);
      }
      xcor=x+i*20;
      ycor=y+20*k;
      preKey="up";
      delay(150);
    } else {
      if (preKey.equals("right")) {
        if (j%2 == 0) {
          image(rights1, x+i*20, y+20*k, 50, 50);
        } else {
          image(rights2, x+i*20, y+20*k, 50, 50);
        }
        delay(600);
        j++;
      } else if (preKey.equals("left")) {
        if (j%2 == 0) {
          image(lefts1, x+i*20, y+20*k, 50, 50);
        } else {
          image(lefts2, x+i*20, y+20*k, 50, 50);
        }
        delay(600);
        j++;
      } else if (preKey.equals("up")) {
        if (j%2 == 0) {
          image(ups1, x+i*20, y+20*k, 50, 50);
        } else {
          image(ups2, x+i*20, y+20*k, 50, 50);
        }
        delay(600);
        j++;
      } else {
        if (j%2 == 0) {
          image(downs1, x+i*20, y+20*k, 50, 50);
        } else {
          image(downs2, x+i*20, y+20*k, 50, 50);
        }
        delay(600);
        j++;
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
    board();
    moveE();
    System.out.println(target.getPX()+" "+target.getPY());
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
      y+=moves[2*index]*5;
      x+=moves[2*index+1]*5;
    }
  }
}
PImage ice;
void setup() {
  size(750, 750);
  //frameRate(64);
  ice=loadImage("Ice.png");
  test = loadImage("GlaceonWalkRight1.png");
  test2 = loadImage("GlaceonWalkRight2.png");
  test3 = loadImage("GlaceonWalkRight3.png");
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
}
void draw() {
  background(255);
  for (int i=0; i<=750; i+=50) {
    line(0, i, 750, i);
    line(i, 0, i, 750);
  }
  B.move();
  C.update();
  C.moveE();
  C.display();
  A.output();
}
