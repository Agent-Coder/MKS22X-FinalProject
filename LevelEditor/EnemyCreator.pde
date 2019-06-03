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
  public Enemies(Player a, Block[][] iceBlock, int newx, int newy) {
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
  public Ditto(Player a, Block[][] iceBlock, int newx, int newy, String characterPick) {
    super( a, iceBlock, newx, newy);
  }
    void moveE(boolean canMove) {
    if (target.getCharacter().equals("Glaceon")) {
      if (keyCodesDown.contains(RIGHT)&&canMove) {
        PImage r=GlaceonMRight1;
        if (frameCount%30<10) {
          r=GlaceonMRight1;
        } else if (frameCount%30<20) {
          r=GlaceonMRight2;
        } else {
          r=GlaceonMRight3;
        }
        if (x+target.getSpeed()<650&&board[round(y/50)][round((x+target.getSpeed())/50)]==null) {
          x+=target.getSpeed();
          display(r, x+target.getSpeed(), y);
        } else {
          display(r, x, y);
        }
      } else if (keyCodesDown.contains(LEFT)&&canMove) {
        PImage r=GlaceonMLeft1;
        if (frameCount%30<10) {
          r=GlaceonMLeft1;
        } else if (frameCount%30<20) {
          r=GlaceonMLeft2;
        } else {
          r=GlaceonMLeft3;
        }
        if (x+target.getSpeed()>=50&&board[round(y/50)][round((x-target.getSpeed())/50)]==null) {
          x+=-1* target.getSpeed();
          display(r, x-target.getSpeed(), y);
        } else {
          display(r, x, y);
        }
      } else if (keyCodesDown.contains(DOWN)&&canMove) {
        PImage r=GlaceonMDown1;
        if (frameCount%30<10) {
          r=GlaceonMDown1;
        } else if (frameCount%30<20) {
          r=GlaceonMDown2;
        } else {
          r=GlaceonMDown3;
        }
        if (y+target.getSpeed()<650&&board[round((y+target.getSpeed())/50)][round(x/50)]==null) {
          y+=target.getSpeed();
          display(r, x, y+target.getSpeed());
        } else {
          display(r, x, y);
        }
      } else if (keyCodesDown.contains(UP)&&canMove) {
        PImage r=GlaceonMUp1;
        if (frameCount%30<10) {
          r=GlaceonMUp1;
        } else if (frameCount%30<10) {
          r=GlaceonMUp2;
        } else {
          r=GlaceonMUp3;
        }
        if (y-target.getSpeed()>50&&board[round((y-target.getSpeed())/50)][round(x/50)]==null) {
          y-=target.getSpeed();
          display(r, x, y-target.getSpeed());
        } else {
          display(r, x, y);
        }
      } else {
        if (target.getPrevKey().equals("right")) {
          if (frameCount%30<15) {
            display(GlaceonIRight1, x, y);
          } else {
            display(GlaceonIRight2, x, y);
          }
        } else if (target.getPrevKey().equals("left")) {
          if (frameCount%30<15) {
            display(GlaceonILeft1, x, y);
          } else {
            display(GlaceonILeft2, x, y);
          }
        } else if (target.getPrevKey().equals("up")) {
          if (frameCount%30<15) {
            display(GlaceonIUp1, x, y);
          } else {
            display(GlaceonIUp2, x, y);
          }
        } else {
          if (frameCount%30<15) {
            display(GlaceonIDown1, x, y);
          } else {
            display(GlaceonIDown2, x, y);
          }
        }
      }
    } else if (target.getCharacter().equals("Empoleon")) {
      if (keyCodesDown.contains(RIGHT)&&canMove) {
        PImage r=EmpoleonMRight1;
        if (frameCount%30<10) {
          r=EmpoleonMRight1;
        } else if (frameCount%30<20) {
          r=EmpoleonMRight2;
        } else {
          r=EmpoleonMRight3;
        }
        if (x+target.getSpeed()<650&&board[round(y/50)][round((x+target.getSpeed())/50)]==null) {
          x+=target.getSpeed();
          display(r, x+target.getSpeed(), y);
        } else {
          display(r, x, y);
        }
      } else if (keyCodesDown.contains(LEFT)&&canMove) {
        PImage r=EmpoleonMLeft1;
        if (frameCount%30<10) {
          r=EmpoleonMLeft1;
        } else if (frameCount%30<20) {
          r=EmpoleonMLeft2;
        } else {
          r=EmpoleonMLeft3;
        }
        if (x+target.getSpeed()>=50&&board[round(y/50)][round((x-target.getSpeed())/50)]==null) {
          x+=-1* target.getSpeed();
          display(r, x-target.getSpeed(), y);
        } else {
          display(r, x, y);
        }
      } else if (keyCodesDown.contains(DOWN)&&canMove) {
        PImage r=EmpoleonMDown1;
        if (frameCount%30<10) {
          r=EmpoleonMDown1;
        } else if (frameCount%30<20) {
          r=EmpoleonMDown2;
        } else {
          r=EmpoleonMDown3;
        }
        if (y+target.getSpeed()<650&&board[round((y+target.getSpeed())/50)][round(x/50)]==null) {
          y+=target.getSpeed();
          display(r, x, y+target.getSpeed());
        } else {
          display(r, x, y);
        }
      } else if (keyCodesDown.contains(UP)&&canMove) {
        PImage r=EmpoleonMUp1;
        if (frameCount%30<10) {
          r=EmpoleonMUp1;
        } else if (frameCount%30<10) {
          r=EmpoleonMUp2;
        } else {
          r=EmpoleonMUp3;
        }
        if (y-target.getSpeed()>50&&board[round((y-target.getSpeed())/50)][round(x/50)]==null) {
          y-=target.getSpeed();
          display(r, x, y-target.getSpeed());
        } else {
          display(r, x, y);
        }
      } else {
        if (prevKey.equals("right")) {
          if (frameCount%30<15) {
            display(EmpoleonIRight1, x, y);
          } else {
            display(EmpoleonIRight2, x, y);
          }
        } else if (target.getPrevKey().equals("left")) {
          if (frameCount%30<15) {
            display(EmpoleonILeft1, x, y);
          } else {
            display(EmpoleonILeft2, x, y);
          }
        } else if (target.getPrevKey().equals("up")) {
          if (frameCount%30<15) {
            display(EmpoleonIUp1, x, y);
          } else {
            display(EmpoleonIUp2, x, y);
          }
        } else {
          if (frameCount%30<15) {
            display(EmpoleonIDown1, x, y);
          } else {
            display(EmpoleonIDown2, x, y);
          }
        }
      }
    } else { //Manaphy
      if (keyCodesDown.contains(RIGHT)&&canMove) {
        PImage r=ManaphyMRight1;
        if (frameCount%30<10) {
          r=ManaphyMRight1;
        } else if (frameCount%30<20) {
          r=ManaphyMRight2;
        } else {
          r=ManaphyMRight3;
        }
        if (x+target.getSpeed()<650&&board[round(y/50)][round((x+target.getSpeed())/50)]==null) {
          x+=target.getSpeed();
          display(r, x+target.getSpeed(), y);
        } else {
          display(r, x, y);
        }
      } else if (keyCodesDown.contains(LEFT)&&canMove) {
        PImage r=ManaphyMLeft1;
        if (frameCount%30<10) {
          r=ManaphyMLeft1;
        } else if (frameCount%30<20) {
          r=ManaphyMLeft2;
        } else {
          r=ManaphyMLeft3;
        }
        if (x+target.getSpeed()>=50&&board[round(y/50)][round((x-target.getSpeed())/50)]==null) {
          x+=-1* target.getSpeed();
          display(r, x-target.getSpeed(), y);
        } else {
          display(r, x, y);
        }
      } else if (keyCodesDown.contains(DOWN)&&canMove) {
        PImage r=ManaphyMDown1;
        if (frameCount%30<10) {
          r=ManaphyMDown1;
        } else if (frameCount%30<20) {
          r=ManaphyMDown2;
        } else {
          r=ManaphyMDown3;
        }
        if (y+target.getSpeed()<650&&board[round((y+target.getSpeed())/50)][round(x/50)]==null) {
          y+=target.getSpeed();
          display(r, x, y+target.getSpeed());
        } else {
          display(r, x, y);
        }
      } else if (keyCodesDown.contains(UP)&&canMove) {
        PImage r=ManaphyMUp1;
        if (frameCount%30<10) {
          r=ManaphyMUp1;
        } else if (frameCount%30<10) {
          r=ManaphyMUp2;
        } else {
          r=ManaphyMUp3;
        }
        if (y-target.getSpeed()>50&&board[round((y-target.getSpeed())/50)][round(x/50)]==null) {
          y-=target.getSpeed();
          display(r, x, y-target.getSpeed());
        } else {
          display(r, x, y);
        }
      } else {
        if (target.getPrevKey().equals("right")) {
          if (frameCount%30<15) {
            display(ManaphyIRight1, x, y);
          } else {
            display(ManaphyIRight2, x, y);
          }
        } else if (target.getPrevKey().equals("left")) {
          if (frameCount%30<15) {
            display(ManaphyILeft1, x, y);
          } else {
            display(ManaphyILeft2, x, y);
          }
        } else if (target.getPrevKey().equals("up")) {
          if (frameCount%30<15) {
            display(ManaphyIUp1, x, y);
          } else {
            display(ManaphyIUp2, x, y);
          }
        } else {
          if (frameCount%30<15) {
            display(ManaphyIDown1, x, y);
          } else {
            display(ManaphyIDown2, x, y);
          }
        }
      }
    }
  }
}
