Level2 L2 = new Level2();

class Level2 extends Levels {
  public Level2() {
    super();
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
    board[7][3]=new IceBlock(150, 350);
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
      /*if ((round(temp.getxB())==round(C.getX())&&round(temp.getyB())==round(C.getY()))) {
        temp=null;
        attacked.clear();
      } else */if (board[temp.getyB()/50][temp.getxB()/50]==null) {
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
  }    
  
}
