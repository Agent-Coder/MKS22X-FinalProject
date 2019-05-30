abstract class Berries {
  String berryType;
  int berryX;
  int berryY;
  //final int berryCount=0;
  public Berries(int x, int y) {
    berryX=x;
    berryY=y;
    berryType="Berry";
    //berryCount=0;
  }
  int getBerryX() {
    return berryX;
  }
  int getBerryY() {
    return berryY;
  }
  /*int berryLeft() {
   return berryCount;
   }*/
  String getBerryType() {
    return berryType;
  }
  abstract void display();
}
class OBerries extends Berries {
  public OBerries(int x, int y) {
    super(x, y);
    berryType="OranBerry";
  }
  void display() {
    image(OranBerry2, berryX, berryY);
  }
}
class LBerries extends Berries {
  public LBerries(int x, int y) {
    super(x, y);
    berryType="LumBerry";
  }
  void display() {
    image(LumBerry2, berryX, berryY);
  }
}
class NBerries extends Berries {
  public NBerries(int x, int y) {
    super(x, y);
    berryType="NanabBerry";
  }
  void display() {
    image(NanabBerry2, berryX, berryY);
  }
}
class SBerries extends Berries {
  public SBerries(int x, int y) {
    super(x, y);
    berryType="SitrusBerry";
  }
  void display() {
    image(SitrusBerry2, berryX, berryY);
  }
}
class RBerries extends Berries {
  public RBerries(int x, int y) {
    super(x, y);
    berryType="RazzBerry";
  }
  void display() {
    image(RazzBerry2, berryX, berryY);
  }
}
