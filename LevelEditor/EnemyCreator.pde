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
  void setGrid(Block[][] map) {
    for (int i=0; i<map.length; i++) {
      for (int j=0; j<map[0].length; j++) {
        if (map[i][j]!=null) {
          grid[i][j]=-1;
        }
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
    moveE();
  }
  void fillGrid(int xer, int yer, int num) {
    if (xer<grid.length&&xer>=0&&yer>=0&&yer<grid.length&&grid[xer][yer]!=1&&(grid[xer][yer]==0||grid[xer][yer]>num&&grid[xer][yer]!=-1)) {
      grid[xer][yer]=num;
      fillGrid(xer+1, yer, num+1);
      fillGrid(xer, yer+1, num+1);
      fillGrid(xer-1, yer, num+1);
      fillGrid(xer, yer-1, num+1);
    }
  }

  void moveE() {
    int a=(int)(y-50)/50;
    int b=(int)(x-50)/50;
    int smallest=grid[a][b];
    int index=-1;
    for (int i=0; i<4; i++) {
      if (a+moves[2*i]>=0&&a+moves[2*i]<grid.length&&b+moves[2*i+1]>=0&&b+moves[2*i+1]<grid.length) {
        if (grid[a+moves[2*i]][b+moves[2*i+1]]<smallest&&grid[a+moves[2*i]][b+moves[2*i+1]]!=-1) {
          println(grid[a+moves[2*i]][b+moves[2*i+1]]);
          //println(grid[a+moves[2*i]][b+moves[2*i+1]]);
          smallest=grid[a+moves[2*i]][b+moves[2*i+1]];
          index=i;
        }
      }
    }
    if (index!=-1) {
      println(x, y);
      y+=moves[2*index]*2.5;
      x+=moves[2*index+1]*2.5;
    }
  }
  void display() {
    fill(255, 255, 255);
    ellipseMode(CORNER);
    ellipse(x, y, 50, 50);
  }
}
class Spoink extends Enemies {
  public Spoink(Player a) {
    super(a);
  }
}
