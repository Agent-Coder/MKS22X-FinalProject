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

class TeleportationTile extends Tile{
  String type;
  int xer;
  int yer;
  public TeleportationTile(int x, int y) {
    super(x,y);
    type = "teleporttile";
  }
  void display() {
    image(floor, xer, yer, xer, yer);
  }
}
