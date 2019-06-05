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
  String getType() {
    return type;
  }
}

class wTile extends Tile {
  public wTile(int x, int y) {
    super(x,y);
    type = "tile";
    xer = x;
    yer = y;
  }
  void display() {
    image(warning,xer,yer);
  }
}
class fTile extends Tile {
  public fTile(int x, int y) {
    super(x,y);
    type = "tile";
    xer = x;
    yer = y;
  }
  void display() {
    image(grass,xer,yer);
  }
}
class BerryTile {
  String type;
  int xer;
  int yer;
  public BerryTile(int x, int y) {
    type = "Berry";
    xer = x;
    yer = y;
  }
}

class TeleportationTile extends Tile {
  public TeleportationTile(int x, int y) {
    super(x,y);
    type = "teleporttile";
  }
  void display() {
    image(portal, xer, yer);
  }
  String getType() {
    return type;
  }
}
