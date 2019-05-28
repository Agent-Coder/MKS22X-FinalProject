class Player {
  PImage[] images={GlaceonMRight1, GlaceonMRight2, GlaceonMRight3, 
    GlaceonMLeft1, GlaceonMLeft2, GlaceonMLeft3, 
    GlaceonIRight1, GlaceonIRight2, 
    GlaceonILeft1, GlaceonILeft2, 
    GlaceonMDown1, GlaceonMDown2, GlaceonMDown3, 
    GlaceonMUp1, GlaceonMUp2, GlaceonMUp3, 
    GlaceonIUp1, GlaceonIUp2, 
    GlaceonIDown1, GlaceonIDown2};
  Block[][] board;
  float x, y, xcor, ycor, speed;
  String prevKey;
  String getPrevKey() {
    return prevKey;
  }
  Player(float x, float y, Block[][] gameboard) {
    this.x = x;
    this.y = y;
    xcor=x;
    ycor=y;
    speed=2.5;
    prevKey="right";
    board=gameboard;
  }
  float getPX() {
    return xcor;
  }
  float getPY() {
    return ycor;
  }
  void display(PImage i, float x, float y) {
    image(i, x, y);
  }
  void move() {
    if (keyCodesDown.contains(RIGHT)) {
      PImage r=GlaceonMRight1;
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
    } else if (keyCodesDown.contains(LEFT)) {
      PImage r=GlaceonMLeft1;
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
    } else if (keyCodesDown.contains(DOWN)) {
      PImage r=GlaceonMDown1;
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
    } else if (keyCodesDown.contains(UP)) {
      PImage r=GlaceonMUp1;
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
  }
}
