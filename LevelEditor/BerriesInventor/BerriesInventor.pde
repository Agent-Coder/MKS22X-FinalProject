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
  int getBerryX(){
  return berryX;}
  int getBerryY(){
  return berryY;}
  /*int berryLeft() {
    return berryCount;
  }*/
  abstract void display();
}
class OBerries extends Berries{
  public OBerries(int x, int y) {
    super(x, y);
    berryType="OranBerry";
  }
  void display() {
    image(OranBerry, x, y);
  }
}
class LBerries extends Berries{
  public LBerries(int x, int y) {
    super(x, y);
    berryType="LumBerry";
  }
  void display() {
    image(LumBerry, x, y);
  }
}
class NBerries extends Berries{
  public NBerries(int x, int y) {
    super(x, y);
    berryType="NanabBerry";
  }
  void display() {
    image(NanabBerry, x, y);
  }
}
class SBerries extends Berries{
  public SBerries(int x, int y) {
    super(x, y);
    berryType="SitrusBerry";
  }
  void display() {
    image(SitrusBerry, x, y);
  }
}
class RBerries extends Berries{
  public RBerries(int x, int y) {
    super(x, y);
    berryType="RazzBerry";
  }
  void display() {
    image(RazzBerry, x, y);
  }
}
