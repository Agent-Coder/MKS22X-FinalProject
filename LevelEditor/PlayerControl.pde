class Player {
  PImage[] images={rightm1, rightm2, rightm3, 
    leftm1, leftm2, leftm3, 
    rights1, rights2, 
    lefts1, lefts2, 
    downm1, downm2, downm3, 
    upm1, upm2, upm3, 
    ups1, ups2, 
    downs1, downs2};
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
      PImage r=rightm1;
      if (frameCount%30<10) {
        r=rightm1;
      } else if (frameCount%30<20) {
        r=rightm2;
      } else {
        r=rightm3;
      }
      if (xcor+speed<650&&board[round(ycor/50)][round((xcor+speed)/50)]==null) {
        xcor+=speed;
        display(r, xcor+speed, ycor);
      } else {
        display(r, xcor, ycor);
      }
      prevKey="right";
    } else if (keyCodesDown.contains(LEFT)) {
      PImage r=leftm1;
      if (frameCount%30<10) {
        r=leftm1;
      } else if (frameCount%30<20) {
        r=leftm2;
      } else {
        r=leftm3;
      }
      if (xcor+speed>=50&&board[round(ycor/50)][round((xcor-speed)/50)]==null) {
        xcor+=-1* speed;
        display(r, xcor-speed, ycor);
      } else {
        display(r, xcor, ycor);
      }
      prevKey="left";
    } else if (keyCodesDown.contains(DOWN)) {
      PImage r=downm1;
      if (frameCount%30<10) {
        r=downm1;
      } else if (frameCount%30<20) {
        r=downm2;
      } else {
        r=downm3;
      }
      if (ycor+speed<650&&board[round((ycor+speed)/50)][round(xcor/50)]==null) {
        ycor+=speed;
        display(r, xcor, ycor+speed);
      } else {
        display(r, xcor, ycor);
      }
      prevKey="down";
    } else if (keyCodesDown.contains(UP)) {
      PImage r=upm1;
      if (frameCount%30<10) {
        r=upm1;
      } else if (frameCount%30<10) {
        r=upm2;
      } else {
        r=upm3;
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
          display(rights1, xcor, ycor);
        } else {
          display(rights2, xcor, ycor);
        }
      } else if (prevKey.equals("left")) {
        if (frameCount%30<15) {
          display(lefts1, xcor, ycor);
        } else {
          display(lefts2, xcor, ycor);
        }
      } else if (prevKey.equals("up")) {
        if (frameCount%30<15) {
          display(ups1, xcor, ycor);
        } else {
          display(ups2, xcor, ycor);
        }
      } else {
        if (frameCount%30<15) {
          display(downs1, xcor, ycor);
        } else {
          display(downs2, xcor, ycor);
        }
      }
    }
  }
}
