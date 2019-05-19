class Enemies {
  int[][] grid=new int[5][5];
  int x;
  int y;
  int speed=20;
  int box;
  int tx;
  int ty;
  int[] moves=new int[8];
  public Enemies() {
    x=110;
    y=110;
    speed=5;
    box=0;
    tx=190;
    ty=190;
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
    for (int i=0; i<5; i++) {
      for (int j=0; j<5; j++) {
        grid[i][j]=0;
      }
    }
  }
  void update(int targetx, int targety) {
    //System.out.println("--->"+((targety-110)/20));
     clear();
    fillGrid((targety-110)/20, (targetx-110)/20, 1);
    board();
    moveE();
  }
  void fillGrid(int xer, int yer, int num) {
    if (xer<5&&xer>=0&&yer>=0&&yer<5&&grid[xer][yer]!=1&&(grid[xer][yer]==0||grid[xer][yer]>num)) {
      grid[xer][yer]=num;
      fillGrid(xer+1, yer, num+1);
      fillGrid(xer, yer+1, num+1);
      fillGrid(xer-1, yer, num+1);
      fillGrid(xer, yer-1, num+1);
    }
  }
  void board() {
    for (int i=0; i<5; i++) {
      for (int j=0; j<5; j++) {
        System.out.print(grid[i][j]+" ");
      }
      System.out.println();
    }
    System.out.println();
    //System.out.println(x+" "+y);
  }
  int getX() {
    return tx;
  }
  int getY() {
    return ty;
  }
  void display() {
    fill(255, 255, 255);
    ellipseMode(CENTER);
    ellipse(x, y, 20, 20);
    fill(0, 0, 0);
    ellipseMode(CENTER);
    ellipse(tx, ty, 20, 20);
  }
  void move() {
    if (keyPressed&&keyCode == RIGHT&&tx+speed<=190) {
      tx+=speed;
    } else if (keyPressed&&keyCode == UP&&ty-speed>0) {
      ty-=speed;
    } else if (keyPressed&&keyCode == DOWN&&ty+speed<=190) {
      ty+=speed;
    } else if (keyPressed&&keyCode == LEFT&&tx-speed>0) {
      tx-=speed;
    }
    delay(50);
  }
  int min(int a, int b) {
    if (a<b) {
      return a;
    } else {
      return b;
    }
  }
  void moveE() {
    int a=(x-110)/20;
    int b=(y-110)/20;
    int smallest=grid[a][b];
    System.out.println();
    int index=-1;
    for (int i=0; i<4; i++) {
      if (a+moves[2*i]>=0&&a+moves[2*i]<5&&b+moves[2*i+1]>=0&&b+moves[2*i+1]<5) {
        if (grid[a+moves[2*i]][b+moves[2*i+1]]<smallest) {
          System.out.println((a+moves[2*i])+" "+(b+moves[2*i+1]));
          smallest=grid[a+moves[2*i]][b+moves[2*i+1]];
          index=i;
        }
      }
    }
    if (index!=-1) {
      x+=moves[2*index]*20;
      y+=moves[2*index+1]*20;
      System.out.println(x+" "+y);
    }
  }
}

Enemies A=new Enemies();
void setup() {
  size (900, 900);
  background(255);
}
void draw() {
  background(255);
  A.move();
  A.update(A.getX(), A.getY());
  A.moveE();
  line(100, 100, 200, 100);
  line(100, 120, 200, 120);
  line(100, 140, 200, 140);
  line(100, 160, 200, 160);
  line(100, 180, 200, 180);
  line(100, 200, 200, 200);
  line(100, 100, 100, 200);
  line(120, 100, 120, 200);
  line(140, 100, 140, 200);
  line(160, 100, 160, 200);
  line(180, 100, 180, 200);
  line(200, 100, 200, 200);
  A.display();
}
