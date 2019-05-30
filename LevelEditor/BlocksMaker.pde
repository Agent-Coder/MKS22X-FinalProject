
abstract class Block {
  int xB;
  int yB;
  String type;
  boolean destroyable;
  public Block() {
    xB=0;
    yB=0;
    type="block";
    destroyable=false;
  }
  void animate(int x, int y, boolean mode) {
    if (mode) {
      if (frameCount%20<4) {
        image(IceA1, x, y);
      } else if (frameCount%20<8) {
        image(IceA2, x, y);
      } else if (frameCount%20<12) {
        image(IceA3, x, y);
      } else if (frameCount%20<16) {
        image(IceA4, x, y);
      } else {
        image(IceA5, x, y);
      }
    } else {
      if (frameCount%20<4) {
        image(IceA5, x, y);
      } else if (frameCount%20<8) {
        image(IceA4, x, y);
      } else if (frameCount%20<12) {
        image(IceA3, x, y);
      } else if (frameCount%20<16) {
        image(IceA2, x, y);
      } else {
        image(IceA1, x, y);
      }
    }
  }
  abstract void display();
  int getxB() {
    return xB;
  }
  int getyB() {
    return yB;
  }
  String getType() {
    return type;
  }
}
class BorderBlock extends Block {
  public BorderBlock(int x, int y) {
    type="borderblock";
    xB=x;
    yB=y;
    destroyable=false;
  }
  void display() {
    image(ice, xB, yB);
  }
}
class IceBlock extends Block {
  public IceBlock(int x, int y) {
    type="iceblock";
    xB=x;
    yB=y;
    destroyable=true;
  }
  void display() {
    image(ice, xB, yB);
  }
}
class CrystalBlock extends Block {
  public CrystalBlock(int x, int y) {
    type = "crystalblock";
    xB=x;
    xB=y;
    destroyable=false;
  }
  void display() {
    image(CrystalBlue,xB,yB);
  }
}
