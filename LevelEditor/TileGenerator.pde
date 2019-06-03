class Tile {
  String type;
  int xer;
  int yer;
  public Tile(int x, int y) {
    type="tile";
    xer=x;
    yer=y;
  }
  void display() {
    image(floor, xer, yer);
  }
}

class wTile extends Tile {
  public wTile(int x, int y) {
    super(x,y);
    xer = x;
    yer = y;
  }
  void display() {
    image(CrystalBlue,xer,yer);
  }
}

//NEEDS EDITING & CHECKS
class BerryTile {
  String type;
  int xer;
  int yer;
  public BerryTile(int x, int y) {
    type = "Berry";
    xer = x;
    yer = y;
  }
  void display() {
    image(OranBerry, xer, yer, 50, 50);
  }
}
