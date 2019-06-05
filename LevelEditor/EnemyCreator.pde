Random rngSpe = new Random();

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
  boolean isTeleport;
  PImage pic;
  Player target;
  int[] moves=new int[8];
  String pkmn;
  float speedE =1;
  float[] TentacruelSpeeds = {1, 1 };
  public Enemies(Player a, Block[][] iceBlock, Tile[][] floorBoard, int coordX, int coordY, String species) {
    pkmn = species;
    if (pkmn.equals("Tentacruel")) {
      int speC = int(rngSpe.nextInt(2));
      speedE = TentacruelSpeeds[speC];
    }
    x=coordX;
    y=coordY;
    isTeleport=false;    
    moving=true;
    target=a;
    dx=0;
    dy=1;
    tx=a.getPX();
    ty=a.getPY();
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
    if (floorTile[round(y/50)][round(x/50)].getType().equals("teleporttile")&&!isTeleport&&moving) {
      if (round(y/50)!=round(x/50)) {
        float temp=round(x/50);
        x=round(y/50)*50;
        y=temp*50;
        isTeleport=true;
      } else {
        if (round(y/50)==3) {
          x=550;
          y=550;
        } else {
          x=150;
          y=150;
        }
        isTeleport=true;
      }
    } else if (!floorTile[round(y/50)][round(x/50)].getType().equals("teleporttile")) {
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
  void moveE() {
    int a=round((y)/50);
    int b=round((x)/50);
    int smallest=grid[a][b];
    int index=-1;
    for (int i=0; i<4; i++) {
      //board();
      if (a+speedE*moves[2*i]>0&&a+speedE*moves[2*i]<grid.length-1&&b+speedE*moves[2*i+1]>0&&b+speedE*moves[2*i+1]<grid.length-1) {
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
    if (board[a+(int)(speedE*dy)][b+(int)(speedE*dx)]!=null&&!board[a+(int)(speedE*dy)][b+(int)(speedE*dx)].getType().equals("borderblock")) {
      moving=false;
      currentFrame=frameCount;
      board[a+(int)(speedE*dy)][b+(int)(speedE*dx)]=null;
    }
  }
  void moveAnimation() {
    if (frameCount-currentFrame==50) {
      moving=true;
    }
    if (moving&&x+dx*speedE>0&&y+dy*speedE>0&&x+dx*speedE<700&&y+dy*speedE<700) {
      x+=dx*speedE;
      y+=dy*speedE;
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
        if (pkmn.equals("Meowth")) pic=MeowthMRight1;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMRight1;
        if (pkmn.equals("Spoink")) pic = SpoinkMRight1;
        if (pkmn.equals("Gengar")) pic = GengarMRight1;
        if (pkmn.equals("Mismagius")) pic = MismagiusMRight1;
      } else if (frameCount%30<20) {
        if (pkmn.equals("Meowth")) pic=MeowthMRight2;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMRight2;
        if (pkmn.equals("Spoink")) pic = SpoinkMRight2;
        if (pkmn.equals("Gengar")) pic = GengarMRight2;
        if (pkmn.equals("Mismagius")) pic = MismagiusMRight2;
      } else {
        if (pkmn.equals("Meowth")) pic=MeowthMRight3;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMRight3;
        if (pkmn.equals("Spoink")) pic = SpoinkMRight3;
        if (pkmn.equals("Gengar")) pic = GengarMRight3;
        if (pkmn.equals("Mismagius")) pic = MismagiusMRight3;
      }
      display(pic);
    } else if (dx<0) {
      if (frameCount%30<10) {
        if (pkmn.equals("Meowth")) pic=MeowthMLeft1;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMLeft1;
        if (pkmn.equals("Spoink")) pic = SpoinkMLeft1;
        if (pkmn.equals("Gengar")) pic = GengarMLeft1;
        if (pkmn.equals("Mismagius")) pic = MismagiusMLeft1;
      } else if (frameCount%30<20) {
        if (pkmn.equals("Meowth")) pic=MeowthMLeft2;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMLeft2;
        if (pkmn.equals("Spoink")) pic = SpoinkMLeft2;
        if (pkmn.equals("Gengar")) pic = GengarMLeft2;
        if (pkmn.equals("Mismagius")) pic = MismagiusMLeft2;
      } else {
        if (pkmn.equals("Meowth")) pic=MeowthMLeft3;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMLeft3;
        if (pkmn.equals("Spoink")) pic = SpoinkMLeft3;
        if (pkmn.equals("Gengar")) pic = GengarMLeft3;
        if (pkmn.equals("Mismagius")) pic = MismagiusMLeft3;
      }
      display(pic);
    } else if (dy>0) {
      if (frameCount%30<10) {
        if (pkmn.equals("Meowth")) pic=MeowthMDown1;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMDown1;
        if (pkmn.equals("Spoink")) pic = SpoinkMDown1;
        if (pkmn.equals("Gengar")) pic = GengarMDown1;
        if (pkmn.equals("Mismagius")) pic = MismagiusMDown1;
      } else if (frameCount%30<20) {
        if (pkmn.equals("Meowth")) pic=MeowthMDown2;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMDown2;
        if (pkmn.equals("Spoink")) pic = SpoinkMDown2;
        if (pkmn.equals("Gengar")) pic = GengarMDown2;
        if (pkmn.equals("Mismagius")) pic = MismagiusMDown2;
      } else {
        if (pkmn.equals("Meowth")) pic=MeowthMDown3;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMDown3;
        if (pkmn.equals("Spoink")) pic = SpoinkMDown3;
        if (pkmn.equals("Gengar")) pic = GengarMDown3;
        if (pkmn.equals("Mismagius")) pic = MismagiusMDown3;
      }
      display(pic);
    } else if (dy<0) {
      if (frameCount%30<10) {
        if (pkmn.equals("Meowth")) pic=MeowthMUp1;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMUp1;
        if (pkmn.equals("Spoink")) pic = SpoinkMUp1;
        if (pkmn.equals("Gengar")) pic = GengarMUp1;
        if (pkmn.equals("Mismagius")) pic = MismagiusMUp1;
      } else if (frameCount%30<20) {
        if (pkmn.equals("Meowth")) pic=MeowthMUp2;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMUp2;
        if (pkmn.equals("Spoink")) pic = SpoinkMUp2;
        if (pkmn.equals("Gengar")) pic = GengarMUp2;
        if (pkmn.equals("Mismagius")) pic = MismagiusMUp2;
      } else {
        if (pkmn.equals("Meowth")) pic=MeowthMUp3;
        if (pkmn.equals("Tentacruel")) pic = TentacruelMUp3;
        if (pkmn.equals("Spoink")) pic = SpoinkMUp3;
        if (pkmn.equals("Gengar")) pic = GengarMUp3;
        if (pkmn.equals("Mismagius")) pic = MismagiusMUp3;
      }
      display(pic);
    } else {
      if (pkmn.equals("Mewoth")) display(MeowthMDown3);
      if (pkmn.equals("Tentacruel")) pic = TentacruelMDown3;
      if (pkmn.equals("Spoink")) pic = SpoinkMDown3;
      if (pkmn.equals("Mismagius")) pic = MismagiusMDown3;
      else pic = GengarMDown3;
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
  float getDy() {
    return dy;
  }
  float getDx() {
    return dx;
  }
}
class Ditto extends Enemies {
  public Ditto(Player a, Block[][] iceBlock, Tile[][] floorBoard, int newx, int newy) {
    super( a, iceBlock, floorBoard, newx, newy, "ditto");
  }
  void setMoving(boolean canMove) {
    moving=canMove;
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
        //println("down");
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
        //println("up");

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
        //println(moving);
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
        //println("yeet");
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
  void determineMove() {
    if (keyCodesDown.contains(LEFT)) {
      dx=-1;
      dy=0;
    } else if (keyCodesDown.contains(RIGHT)) {
      dx=1;
      dy=0;
    } else if (keyCodesDown.contains(DOWN)) {
      dy=1;
      dx=0;
    } else {
      dy=-1;
      dx=0;
    }
  }
  void display(PImage picture, float x, float y) {
    image(picture, x, y);
  }
}
class Mismagius extends Enemies {
  public Mismagius(Player a, Block[][] iceBlock, Tile[][] floorBoard, int newx, int newy) {
    super(a, iceBlock, floorBoard, newx, newy, "Mismagius");
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
    if (a+(int)dy<=0||b+(int)dx<=0||a+(int)dy>=board.length-1||b+(int)dx>=board.length-1) {
      moving=false;
      currentFrame=frameCount;
      //board[a+(int)dy][b+(int)dx]=null;
    }
  }
  void moveAnimation() {
    if (frameCount-currentFrame==50) {
      moving=true;
    }
    if (moving&&x+dx>0&&y+dy>0&&x+dx<700&&y+dy<700) {
      x+=dx*speedE;
      y+=dy*speedE;
    }
    if (dx>0) {
      if (frameCount%30<10) {
        pic = MismagiusMRight1;
      } else if (frameCount%30<20) {
        pic = MismagiusMRight2;
      } else {
        pic = MismagiusMRight3;
      }
      display(pic);
    } else if (dx<0) {
      if (frameCount%30<10) {
        pic = MismagiusMLeft1;
      } else if (frameCount%30<20) {
        pic = MismagiusMLeft2;
      } else {
        pic = MismagiusMLeft3;
      }
      display(pic);
    } else if (dy>0) {
      if (frameCount%30<10) {
        if (pkmn.equals("Mismagius")) pic = MismagiusMDown1;
      } else if (frameCount%30<20) {
        pic = MismagiusMDown2;
      } else {
        pic = MismagiusMDown3;
      }
      display(pic);
    } else if (dy<0) {
      if (frameCount%30<10) {
        pic = MismagiusMUp1;
      } else if (frameCount%30<20) {
        pic = MismagiusMUp2;
      } else {
        pic = MismagiusMUp3;
      }
      display(pic);
    } else {
      pic = MismagiusMDown3;
    }
  }
}
