Level2 L2 = new Level2();


class Level2 extends Levels {
  Random rng = new Random();
  int rC = 0;
  int time;
  int time2;
  int sCount = 0;
  ArrayList<Integer> numbs = new ArrayList<Integer>();
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
    if (sCount == 0) {
      time2 = millis();
      sCount = sCount + 1;
      for (int i = 0; i < 15; i++) {
        for (int j = 0; j < 15; j++) {
           int randomNum = rng.nextInt(10);
           if (randomNum < 4 && i != 0 && i != board.length-1 && j != 0 && j != board.length-1)  {
             board[j][i]=new CrystalBlock(i*50, j*50);
             numbs.add(j);
             numbs.add(i);
           }
           print("spike now" + "\n");
         }
        }
     }   
    if (millis() > time2 + 2000 && rC == 0) {
      while ( numbs.size() > 0) { 
        rC = 1;
        int x = numbs.remove(0);
        int y = numbs.remove(0);
        board[x][y] = new CrystalBlock2(y*50,x*50);
      }
    }
    if (millis() > time2 + 6000) {
      for (int i = 0; i < 15; i++) {
        for (int j = 0; j < 15; j++) {
          if  (i != 0 && i != board.length-1 && j != 0 && j != board.length-1) {
            board[j][i] = null;
            print("nullnow");
            sCount = 0;
            time2 = millis();
            rC = 0;
          }
        }
      }
    }
  }
  
   void createBerries(){};
   void collectBerries(int berryEnd){};
   void displayBerries(int berryEnd){};;
}
