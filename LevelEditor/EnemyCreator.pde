class Enemies {
  int[][] grid=new int[15][15];
  Block[][] board=new Block[15][15];
  float x;
  float y;
  float tx;
  float ty;
  float dx;
  float dy;
  int currentFrame;
  boolean moving;
  int moveRotation;
  PImage pic;
  Player target;
  int[] moves=new int[8];
  String pkmn;
  public Enemies(Player a, Block[][] iceBlock, int coordX, int coordY, String species) {
    pkmn = species;
    moving=true;
    target=a;
    x=coordX;
    y=coordY;
    dx=0;
    dy=1;
    tx=a.getPX();
    ty=a.getPY();
    moveRotation=3;
    board=iceBlock;
    moves[0]=0;
    moves[1]=1;
    moves[2]=1;
    moves[3]=0;
    moves[4]=0;
    moves[5]=-1;
    moves[6]=-1;
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

  void update(Block[][] gameBoard) {
    clear();
    for (int i=0; i<gameBoard.length; i++) {
      for (int k=0; k<gameBoard[0].length; k++) {
        if (i<0||k<0||i>board.length-1||k>board.length-1) {
          grid[i][k]=-1;
        }
      }
    }
    tx=target.getPX();
    ty=target.getPY();

    fillGrid(round(ty/50), round(tx/50), 1);
    //board();
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
  boolean trapped() {
    int a=round((y)/50);
    int b=round((x)/50);
    if (a<0||a>grid.length||b<0||b>grid.length) {
      dx=0;
      dy=0;
      return true;
    } else {
      int smallest=grid[a][b];
      if (smallest==0) {
        if (grid[a+(int)dy][b+(int)dx]==-1) {
          moveRotation=(moveRotation-1)%3;
          if (moveRotation==-1) {
            moveRotation=3;
          }
          dy=moves[2*moveRotation+1];
          dx=moves[2*moveRotation];
        }
        return true;
      }
    }
    return false;
  }
  void moveE() {
    int a=round((y)/50);
    int b=round((x)/50);
    int smallest=grid[a][b];
    int index=-1;
    for (int i=0; i<4; i++) {
      //board();
      if (a+moves[2*i]>0&&a+moves[2*i]<grid.length-1&&b+moves[2*i+1]>0&&b+moves[2*i+1]<grid.length-1) {
        if (grid[a+moves[2*i]][b+moves[2*i+1]]<=smallest&&grid[a+moves[2*i]][b+moves[2*i+1]]!=-1) {
          smallest=grid[a+moves[2*i]][b+moves[2*i+1]];      
          index=i;
        }
      }
    }
    if (index!=-1) {
      dx=moves[2*index+1];
      dy=moves[2*index];
    }
    if (board[a+(int)dy][b+(int)dx]!=null&&!board[a+(int)dy][b+(int)dx].getType().equals("borderblock")) {
      moving=false;
      currentFrame=frameCount;
      board[a+(int)dy][b+(int)dx]=null;
    }
  }
  void moveAnimation() {
    if (frameCount-currentFrame==50) {
      moving=true;
    }

    if (moving&&x+dx>0&&y+dy>0&&x+dx<700&&y+dy<700) {
      x+=dx;
      y+=dy;
    }
    PImage animated;
    if (!moving) {
      if (frameCount-currentFrame<10) {
        animated=IceA1;
      } else if (frameCount-currentFrame<20) {
        animated=IceA2;
      } else if (frameCount-currentFrame<30) {
        animated=IceA3;
      }else if (frameCount-currentFrame<40) {
        animated=IceA4;
      } else {
        animated=IceA5;
      }
     displayer(animated,(int)(x+50*dx),(int)(y+50*dy));
    }
    if (dx>0) {
      if (frameCount%30<10) {
        pic=MeowthMRight1;
      } else if (frameCount%30<20) {
        pic=MeowthMRight2;
      } else {
        pic=MeowthMRight3;
      }
      display(pic);
    } else if (dx<0) {
      if (frameCount%30<10) {
        pic=MeowthMLeft1;
      } else if (frameCount%30<20) {
        pic=MeowthMLeft2;
      } else {
        pic=MeowthMLeft3;
      }
      display(pic);
    } else if (dy>0) {
      if (frameCount%30<10) {
        pic=MeowthMDown1;
      } else if (frameCount%30<20) {
        pic=MeowthMDown2;
      } else {
        pic=MeowthMDown3;
      }
      display(pic);
    } else if (dy<0) {
      if (frameCount%30<10) {
        pic=MeowthMUp1;
      } else if (frameCount%30<20) {
        pic=MeowthMUp2;
      } else {
        pic=MeowthMUp3;
      }
      display(pic);
    } else {
      display(MeowthMDown3);
    }
  }
  void displayer(PImage picture,int xB,int yB){
    image(picture, xB, yB);
  }
  void display(PImage i) {
    image(i, x, y);
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
}
