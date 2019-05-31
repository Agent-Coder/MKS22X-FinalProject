Level2 L2 = new Level2();

class Level2 extends Levels {
  Random rng = new Random();
  public Level2() {
    super();
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
    
   for (int i=0; i<board.length; i++) {
      board[i][0]=new BorderBlock(i*50, 0);
      board[0][i]=new BorderBlock(0, i*50);
      board[i][board.length-1]=new BorderBlock(i*50, (board.length-1)*50);
      board[board.length-1][i]=new BorderBlock((board.length-1)*50, i*50);     
   }
  }
  
  void play() {
    boolean make=true;
    output();
    temporary=attack();
    int i=temporary.size()-1;
    while (i>=0) {
      attacked.add(temporary.get(i));
      i--;
    }
    if (attacked.size()==0) {
      temp=null;
    }
    if (frameCount%20==0&&attacked.size()>0) {
      temp=attacked.remove(attacked.size()-1);
      if ((round(temp.getxB())==round(C.getX())&&round(temp.getyB())==round(C.getY()))) {
        temp=null;
        attacked.clear();
      } else if (board[temp.getyB()/50][temp.getxB()/50]==null) {
        board[temp.getyB()/50][temp.getxB()/50]=new IceBlock(temp.getxB(), temp.getyB());
        make=true;
      } else if(board[temp.getyB()/50][temp.getxB()/50].getType()!="borderblock"){
        board[temp.getyB()/50][temp.getxB()/50]=null;
        make=false;
      }
    }
    if (temp!=null&&attacked.size()>0) {
      temp.animate(temp.getxB(), temp.getyB(), make);
    }
    if (attacked.size()>0) {
      canMove=false;
    } else {
      canMove=true;
    }
    C.update(board);
    C.moveE();
    B.move(canMove);
    genSpikes();
  }    


  void genSpikes() {
    if ((second() % 10 == 0 && millis() % 900 < 10)) {
      for (int i = 0; i < 15; i++) {
        for (int j = 0; j < 15; j++) {
           int randomNum = rng.nextInt(10);
           if (randomNum < 4) board[j][i]=new CrystalBlock(i*50, j*50);
           print("spike now" + "\n");
         }
        }
      }
  }
  
   void createBerries(){};
   void collectBerries(int berryEnd){};
   void displayBerries(int berryEnd){};;
}
