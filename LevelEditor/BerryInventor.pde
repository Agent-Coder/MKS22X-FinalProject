abstract class Berries {
  String berryType;
  int berryX;
  int berryY;
  boolean bad;
  //final int berryCount=0;
  public Berries(int x, int y) {
    berryX=x;
    berryY=y;
    berryType="Berry";
    //berryCount=0;
  }
  boolean getBad(){return bad;}
void displaySpecial() {
  }
  void badBerry() {
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
  //void move(){}
}
class RBerries extends Berries {
  boolean bad;
  public RBerries(int x, int y) {
    super(x, y);
    berryType="RazzBerry";
    bad=false;
  }
  void display() {
    image(RazzBerry2, berryX, berryY);
  }
  void displaySpecial() {
    image(SpikyRazzBerry, berryX, berryY);
  }
  void badBerry() {
    if (millis()%12000>=6000) {
      bad=true;
      //println("yes");
    } else {
      bad=false;
      //println("no");
    }
  }
  boolean getBad(){return bad;}
}
