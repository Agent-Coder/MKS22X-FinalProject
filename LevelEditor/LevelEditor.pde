abstract class Block {
  int xB;
  int yB;
  String type;
  boolean destroyed;
  public Block() {
    xB=0;
    yb=0;
    type="block";
    destroyed=false;
  }
  
  abstract void display();
}
void setup() {
  size(750, 750);
}
void draw() {
  background(255);
  for (int i=0; i<=900; i+=50) {
    line(0, i, 900, i);
    line(i, 0, i, 900);
  }
}
