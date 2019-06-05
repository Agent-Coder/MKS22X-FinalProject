class Player {
  Block[][] board;
  Tile[][] floorTile;
  float x, y, xcor, ycor, speed;
  PImage pic;
  boolean isTeleport;
  String prevKey;
  String character;
  String getPrevKey() {
    return prevKey;
  }
  String getCharacter() {
    return character;
  }
  Player(float x, float y, Block[][] gameboard,Tile[][] gameTile, String chararcter) {
    this.x = x;
    this.y = y;
    xcor=x;
    ycor=y;
    speed=2.5;
    prevKey="right";
    board=gameboard;
    floorTile=gameTile;
    isTeleport=false;
  }
  float getPX() {
    return xcor;
  }
  float getSpeed() {
    return speed;
  }
  float getPY() {
    return ycor;
  }
   void teleport() {
    if (floorTile[round(ycor/50)][round(xcor/50)].getType().equals("teleporttile")&&!isTeleport) {
      if (round(ycor/50)!=round(xcor/50)) {
        float temp=round(xcor/50);
        xcor=round(ycor/50)*50;

        ycor=temp*50;
        isTeleport=true;
      } else {
        if (round(ycor/50)==3) {
          xcor=550;
          ycor=550;
        } else {
          xcor=150;
          ycor=150;
        }
        isTeleport=true;
      }
    } else if (!floorTile[round(ycor/50)][round(xcor/50)].getType().equals("teleporttile")) {
      isTeleport=false;
    }
  }
  void display(PImage i, float x, float y) {
    image(i, x, y);
  }
  void move(boolean canMove) {
    if (playerChar.equals("Glaceon")) {
      if (keyCodesDown.contains(RIGHT)&&canMove) {
       PImage  r=GlaceonMRight1;
        if (frameCount%30<10) {
          r=GlaceonMRight1;
        } else if (frameCount%30<20) {
          r=GlaceonMRight2;
        } else {
          r=GlaceonMRight3;
        }
        if (xcor+speed<650&&board[round(ycor/50)][round((xcor+speed)/50)]==null) {
          xcor+=speed;
          display(r, xcor+speed, ycor);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="right";
      } else if (keyCodesDown.contains(LEFT)&&canMove) {
       PImage  r=GlaceonMLeft1;
        if (frameCount%30<10) {
          r=GlaceonMLeft1;
        } else if (frameCount%30<20) {
          r=GlaceonMLeft2;
        } else {
          r=GlaceonMLeft3;
        }
        if (xcor+speed>=50&&board[round(ycor/50)][round((xcor-speed)/50)]==null) {
          xcor+=-1* speed;
          display(r, xcor-speed, ycor);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="left";
      } else if (keyCodesDown.contains(DOWN)&&canMove) {
       PImage  r=GlaceonMDown1;
        if (frameCount%30<10) {
          r=GlaceonMDown1;
        } else if (frameCount%30<20) {
          r=GlaceonMDown2;
        } else {
          r=GlaceonMDown3;
        }
        if (ycor+speed<650&&board[round((ycor+speed)/50)][round(xcor/50)]==null) {
          ycor+=speed;
          display(r, xcor, ycor+speed);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="down";
      } else if (keyCodesDown.contains(UP)&&canMove) {
       PImage  r=GlaceonMUp1;
        if (frameCount%30<10) {
          r=GlaceonMUp1;
        } else if (frameCount%30<10) {
          r=GlaceonMUp2;
        } else {
          r=GlaceonMUp3;
        }
        if (ycor-speed>50&&board[round((ycor-speed)/50)][round(xcor/50)]==null) {
          ycor-=speed;
          display(r, xcor, ycor-speed);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="up";
      } else {
        if (prevKey.equals("right")) {
          if (frameCount%30<15) {
            display(GlaceonIRight1, xcor, ycor);
          } else {
            display(GlaceonIRight2, xcor, ycor);
          }
        } else if (prevKey.equals("left")) {
          if (frameCount%30<15) {
            display(GlaceonILeft1, xcor, ycor);
          } else {
            display(GlaceonILeft2, xcor, ycor);
          }
        } else if (prevKey.equals("up")) {
          if (frameCount%30<15) {
            display(GlaceonIUp1, xcor, ycor);
          } else {
            display(GlaceonIUp2, xcor, ycor);
          }
        } else {
          if (frameCount%30<15) {
            display(GlaceonIDown1, xcor, ycor);
          } else {
            display(GlaceonIDown2, xcor, ycor);
          }
        }
      }
    } else if (playerChar.equals("Empoleon")) {
      if (keyCodesDown.contains(RIGHT)&&canMove) {
       PImage  r=EmpoleonMRight1;
        if (frameCount%30<10) {
          r=EmpoleonMRight1;
        } else if (frameCount%30<20) {
          r=EmpoleonMRight2;
        } else {
          r=EmpoleonMRight3;
        }
        if (xcor+speed<650&&board[round(ycor/50)][round((xcor+speed)/50)]==null) {
          xcor+=speed;
          display(r, xcor+speed, ycor);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="right";
      } else if (keyCodesDown.contains(LEFT)&&canMove) {
       PImage  r=EmpoleonMLeft1;
        if (frameCount%30<10) {
          r=EmpoleonMLeft1;
        } else if (frameCount%30<20) {
          r=EmpoleonMLeft2;
        } else {
          r=EmpoleonMLeft3;
        }
        if (xcor+speed>=50&&board[round(ycor/50)][round((xcor-speed)/50)]==null) {
          xcor+=-1* speed;
          display(r, xcor-speed, ycor);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="left";
      } else if (keyCodesDown.contains(DOWN)&&canMove) {
       PImage  r=EmpoleonMDown1;
        if (frameCount%30<10) {
          r=EmpoleonMDown1;
        } else if (frameCount%30<20) {
          r=EmpoleonMDown2;
        } else {
          r=EmpoleonMDown3;
        }
        if (ycor+speed<650&&board[round((ycor+speed)/50)][round(xcor/50)]==null) {
          ycor+=speed;
          display(r, xcor, ycor+speed);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="down";
      } else if (keyCodesDown.contains(UP)&&canMove) {
       PImage  r=EmpoleonMUp1;
        if (frameCount%30<10) {
          r=EmpoleonMUp1;
        } else if (frameCount%30<10) {
          r=EmpoleonMUp2;
        } else {
          r=EmpoleonMUp3;
        }
        if (ycor-speed>50&&board[round((ycor-speed)/50)][round(xcor/50)]==null) {
          ycor-=speed;
          display(r, xcor, ycor-speed);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="up";
      } else {
        if (prevKey.equals("right")) {
          if (frameCount%30<15) {
            display(EmpoleonIRight1, xcor, ycor);
          } else {
            display(EmpoleonIRight2, xcor, ycor);
          }
        } else if (prevKey.equals("left")) {
          if (frameCount%30<15) {
            display(EmpoleonILeft1, xcor, ycor);
          } else {
            display(EmpoleonILeft2, xcor, ycor);
          }
        } else if (prevKey.equals("up")) {
          if (frameCount%30<15) {
            display(EmpoleonIUp1, xcor, ycor);
          } else {
            display(EmpoleonIUp2, xcor, ycor);
          }
        } else {
          if (frameCount%30<15) {
            display(EmpoleonIDown1, xcor, ycor);
          } else {
            display(EmpoleonIDown2, xcor, ycor);
          }
        }
      }
    } else { //Manaphy
      if (keyCodesDown.contains(RIGHT)&&canMove) {
       PImage  r=ManaphyMRight1;
        if (frameCount%30<10) {
          r=ManaphyMRight1;
        } else if (frameCount%30<20) {
          r=ManaphyMRight2;
        } else {
          r=ManaphyMRight3;
        }
        if (xcor+speed<650&&board[round(ycor/50)][round((xcor+speed)/50)]==null) {
          xcor+=speed;
          display(r, xcor+speed, ycor);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="right";
      } else if (keyCodesDown.contains(LEFT)&&canMove) {
       PImage  r=ManaphyMLeft1;
        if (frameCount%30<10) {
          r=ManaphyMLeft1;
        } else if (frameCount%30<20) {
          r=ManaphyMLeft2;
        } else {
          r=ManaphyMLeft3;
        }
        if (xcor+speed>=50&&board[round(ycor/50)][round((xcor-speed)/50)]==null) {
          xcor+=-1* speed;
          display(r, xcor-speed, ycor);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="left";
      } else if (keyCodesDown.contains(DOWN)&&canMove) {
       PImage  r=ManaphyMDown1;
        if (frameCount%30<10) {
          r=ManaphyMDown1;
        } else if (frameCount%30<20) {
          r=ManaphyMDown2;
        } else {
          r=ManaphyMDown3;
        }
        if (ycor+speed<650&&board[round((ycor+speed)/50)][round(xcor/50)]==null) {
          ycor+=speed;
          display(r, xcor, ycor+speed);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="down";
      } else if (keyCodesDown.contains(UP)&&canMove) {
       PImage  r=ManaphyMUp1;
        if (frameCount%30<10) {
          r=ManaphyMUp1;
        } else if (frameCount%30<10) {
          r=ManaphyMUp2;
        } else {
          r=ManaphyMUp3;
        }
        if (ycor-speed>50&&board[round((ycor-speed)/50)][round(xcor/50)]==null) {
          ycor-=speed;
          display(r, xcor, ycor-speed);
        } else {
          display(r, xcor, ycor);
        }
        prevKey="up";
      } else {
        if (prevKey.equals("right")) {
          if (frameCount%30<15) {
            display(ManaphyIRight1, xcor, ycor);
          } else {
            display(ManaphyIRight2, xcor, ycor);
          }
        } else if (prevKey.equals("left")) {
          if (frameCount%30<15) {
            display(ManaphyILeft1, xcor, ycor);
          } else {
            display(ManaphyILeft2, xcor, ycor);
          }
        } else if (prevKey.equals("up")) {
          if (frameCount%30<15) {
            display(ManaphyIUp1, xcor, ycor);
          } else {
            display(ManaphyIUp2, xcor, ycor);
          }
        } else {
          if (frameCount%30<15) {
            display(ManaphyIDown1, xcor, ycor);
          } else {
            display(ManaphyIDown2, xcor, ycor);
          }
        }
      }
    }
  }
}
