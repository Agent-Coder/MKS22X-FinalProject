class Enemies {
  int[][] grid=new int[15][15];
  Block[][] board=new Block[15][15];
  Tile[][] floorTile=new Tile[15][15];
  float x;
  float y;
  float tx;
  float ty;
  float dx;
  float dy;
  int currentFrame;
  boolean moving;
  boolean onTeleport;
  boolean isTeleport;
  int moveRotation;
  PImage pic;
  Player target;
  int[] moves=new int[8];
  public Enemies(Player a, Block[][] iceBlock, Tile[][] floorBoard, int newx, int newy) {
    isTeleport=false;

    onTeleport=false;    
    moving=true;
    target=a;
    x=newx;
    y=newy;
    dx=0;
    dy=1;
    tx=a.getPX();
    ty=a.getPY();
    moveRotation=3;
    board=iceBlock;
    floorTile=floorBoard;
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
  void teleport() {
    if (floorTile[round(y/50)][round(x/50)].getType().equals("teleporttile")/*&&!isTeleport&&!onTeleport*/) {
      onTeleport=true;
      println("teleporting");
      if (round(y/50)!=round(x/50)) {
        println("teleporting");
        float temp=x;
        x=y;
        y=temp;
        display(pic);
        isTeleport=true;
      } else {
        if (round(y/50)==3) {
          x=650;
          y=650;
        } else {
          x=150;
          y=150;
        }
      }
    } else {
      onTeleport=false;
      isTeleport=false;
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
  void moveE(String avatar) {
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
      } else if (frameCount-currentFrame<40) {
        animated=IceA4;
      } else {
        animated=IceA5;
      }
      displayer(animated, (int)(x+50*dx), (int)(y+50*dy));
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
  void displayer(PImage picture, int xB, int yB) {
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
class Ditto extends Enemies {
  boolean moving;
  public Ditto(Player a, Block[][] iceBlock, Tile[][] floorBoard, int newx, int newy) {
    super( a, iceBlock, floorBoard, newx, newy);
    moving=true;
  }
  void moveE(String avatar) {
    if (avatar.equals("Glaceon")) {
      if (keyCodesDown.contains(RIGHT)&&moving) {
        if (frameCount%30<10) {
          pic=GlaceonMRight1;
        } else if (frameCount%30<20) {
          pic=GlaceonMRight2;
        } else {
          pic=GlaceonMRight3;
        }
        if (x+target.getSpeed()<650&&board[round(y/50)][round((x+target.getSpeed())/50)]==null) {
          x+=target.getSpeed();
          display(pic, x+target.getSpeed(), y);
        } else {
          display(pic, x, y);
        }
      } else if (keyCodesDown.contains(LEFT)&&moving) {
        pic=GlaceonMLeft1;
        if (frameCount%30<10) {
          pic=GlaceonMLeft1;
        } else if (frameCount%30<20) {
          pic=GlaceonMLeft2;
        } else {
          pic=GlaceonMLeft3;
        }
        if (x+target.getSpeed()>=50&&board[round(y/50)][round((x-target.getSpeed())/50)]==null) {
          x+=-1* target.getSpeed();
          display(pic, x-target.getSpeed(), y);
        } else {
          display(pic, x, y);
        }
      } else if (keyCodesDown.contains(DOWN)&&moving) {
        pic=GlaceonMDown1;
        if (frameCount%30<10) {
          pic=GlaceonMDown1;
        } else if (frameCount%30<20) {
          pic=GlaceonMDown2;
        } else {
          pic=GlaceonMDown3;
        }
        if (y+target.getSpeed()<650&&board[round((y+target.getSpeed())/50)][round(x/50)]==null) {
          y+=target.getSpeed();
          display(pic, x, y+target.getSpeed());
        } else {
          display(pic, x, y);
        }
      } else if (keyCodesDown.contains(UP)&&moving) {
        pic=GlaceonMUp1;
        if (frameCount%30<10) {
          pic=GlaceonMUp1;
        } else if (frameCount%30<10) {
          pic=GlaceonMUp2;
        } else {
          pic=GlaceonMUp3;
        }
        if (y-target.getSpeed()>50&&board[round((y-target.getSpeed())/50)][round(x/50)]==null) {
          y-=target.getSpeed();
          display(pic, x, y-target.getSpeed());
        } else {
          display(pic, x, y);
        }
      } else {
        if (frameCount%30<10) {
          display(Ditto1, x, y);
        } else if (frameCount%30<20) {
          display(Ditto2, x, y);
        } else {
          display(Ditto3, x, y);
        }
      }
    } else if (avatar.equals("Empoleon")) {
      if (keyCodesDown.contains(RIGHT)&&moving) {
        pic=EmpoleonMRight1;
        if (frameCount%30<10) {
          pic=EmpoleonMRight1;
        } else if (frameCount%30<20) {
          pic=EmpoleonMRight2;
        } else {
          pic=EmpoleonMRight3;
        }
        if (x+target.getSpeed()<650&&board[round(y/50)][round((x+target.getSpeed())/50)]==null) {
          x+=target.getSpeed();
          display(pic, x+target.getSpeed(), y);
        } else {
          display(pic, x, y);
        }
      } else if (keyCodesDown.contains(LEFT)&&moving) {
        pic=EmpoleonMLeft1;
        if (frameCount%30<10) {
          pic=EmpoleonMLeft1;
        } else if (frameCount%30<20) {
          pic=EmpoleonMLeft2;
        } else {
          pic=EmpoleonMLeft3;
        }
        if (x+target.getSpeed()>=50&&board[round(y/50)][round((x-target.getSpeed())/50)]==null) {
          x+=-1* target.getSpeed();
          display(pic, x-target.getSpeed(), y);
        } else {
          display(pic, x, y);
        }
      } else if (keyCodesDown.contains(DOWN)&&moving) {
        pic=EmpoleonMDown1;
        if (frameCount%30<10) {
          pic=EmpoleonMDown1;
        } else if (frameCount%30<20) {
          pic=EmpoleonMDown2;
        } else {
          pic=EmpoleonMDown3;
        }
        if (y+target.getSpeed()<650&&board[round((y+target.getSpeed())/50)][round(x/50)]==null) {
          y+=target.getSpeed();
          display(pic, x, y+target.getSpeed());
        } else {
          display(pic, x, y);
        }
      } else if (keyCodesDown.contains(UP)&&moving) {
        pic=EmpoleonMUp1;
        if (frameCount%30<10) {
          pic=EmpoleonMUp1;
        } else if (frameCount%30<10) {
          pic=EmpoleonMUp2;
        } else {
          pic=EmpoleonMUp3;
        }
        if (y-target.getSpeed()>50&&board[round((y-target.getSpeed())/50)][round(x/50)]==null) {
          y-=target.getSpeed();
          display(pic, x, y-target.getSpeed());
        } else {
          display(pic, x, y);
        }
      } else {
        if (frameCount%30<10) {
          display(Ditto1, x, y);
        } else if (frameCount%30<20) {
          display(Ditto2, x, y);
        } else {
          display(Ditto3, x, y);
        }
      }
    } else { //Manaphy
      if (keyCodesDown.contains(RIGHT)&&moving) {
        pic=ManaphyMRight1;
        if (frameCount%30<10) {
          pic=ManaphyMRight1;
        } else if (frameCount%30<20) {
          pic=ManaphyMRight2;
        } else {
          pic=ManaphyMRight3;
        }
        if (x+target.getSpeed()<650&&board[round(y/50)][round((x+target.getSpeed())/50)]==null) {
          x+=target.getSpeed();
          display(pic, x+target.getSpeed(), y);
        } else {
          display(pic, x, y);
        }
      } else if (keyCodesDown.contains(LEFT)&&moving) {
        pic=ManaphyMLeft1;
        if (frameCount%30<10) {
          pic=ManaphyMLeft1;
        } else if (frameCount%30<20) {
          pic=ManaphyMLeft2;
        } else {
          pic=ManaphyMLeft3;
        }
        if (x+target.getSpeed()>=50&&board[round(y/50)][round((x-target.getSpeed())/50)]==null) {
          x+=-1* target.getSpeed();
          display(pic, x-target.getSpeed(), y);
        } else {
          display(pic, x, y);
        }
      } else if (keyCodesDown.contains(DOWN)&&moving) {
        pic=ManaphyMDown1;
        if (frameCount%30<10) {
          pic=ManaphyMDown1;
        } else if (frameCount%30<20) {
          pic=ManaphyMDown2;
        } else {
          pic=ManaphyMDown3;
        }
        if (y+target.getSpeed()<650&&board[round((y+target.getSpeed())/50)][round(x/50)]==null) {
          y+=target.getSpeed();
          display(pic, x, y+target.getSpeed());
        } else {
          display(pic, x, y);
        }
      } else if (keyCodesDown.contains(UP)&&moving) {
        pic=ManaphyMUp1;
        if (frameCount%30<10) {
          pic=ManaphyMUp1;
        } else if (frameCount%30<10) {
          pic=ManaphyMUp2;
        } else {
          pic=ManaphyMUp3;
        }
        if (y-target.getSpeed()>50&&board[round((y-target.getSpeed())/50)][round(x/50)]==null) {
          y-=target.getSpeed();
          display(pic, x, y-target.getSpeed());
        } else {
          display(pic, x, y);
        }
      } else {
        if (frameCount%30<10) {
          display(Ditto1, x, y);
        } else if (frameCount%30<20) {
          display(Ditto2, x, y);
        } else {
          display(Ditto3, x, y);
        }
      }
    }
  }
  void display(PImage picture, float x, float y) {
    image(picture, x, y);
  }
}
