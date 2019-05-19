class Enemies {
  int[][] grid=new int[5][5];
  int x;
  int y;
  int speed=20;
  int box;
  int tx;
  int ty;
  public Enemies() {
    x=110;
    y=110;
    speed=5;
    box=0;
    tx=190;
    ty=190;
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
    fillGrid((targetx-110)/20, (targety-110)/20, 1);
    board();
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
    System.out.println(tx+" "+ty);
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
      A.clear();
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
