Level2 L2 = new Level2();

class Level2 extends Levels {
  ArrayList<Block> attacked;
  ArrayList<Block> temporary;
  boolean canMove=true;
  Block temp;
  Tile[][] boardtile=new Tile[15][15];
  IceBlock[][] start = new IceBlock[15][15];
  public Level2() {
    super();
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
    board[7][3]=new IceBlock(150, 350);
  }
  
  void output() {
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        if (boardtile[i][j]!=null) {
          boardtile[i][j].display();
        }
      }
    }
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        if (board[i][j]!=null) {
          board[i][j].display();
        }
      }
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
    //lvlStart1();
    /*if(frameCount%15==0){
     //C.board();
     }*/
    C.update(board);
    C.moveE();
    B.move(canMove);
  }

  ArrayList<Block> attack() {
    ArrayList<Block> delete=new ArrayList<Block>();
    if (keysDown.contains(' ')) {
      int x=round(B.getPX()/50);
      int y=round(B.getPY()/50);
      int i;
      boolean blockHere=false;
      if (B.getPrevKey().equals("right")) {
        if (board[y][x+1]!=null) {
          blockHere=true;
        }
        i=x+1;
        while (i<board.length-1&&((blockHere&&board[y][i]!=null)||(!blockHere&&board[y][i]==null))) { 
          if (board[y][i]==null) {
            delete.add(new IceBlock(i*50, y*50));
          } else {
            delete.add(board[y][i]);
          }
          i++;
        }
      } else if (B.getPrevKey().equals("left")) {
        if (board[y][x-1]!=null) {
          blockHere=true;
        }
        i=x-1;
        while (i>=0&&((blockHere&&board[y][i]!=null)||(!blockHere&&board[y][i]==null))) {
          if (board[y][i]==null) {
            delete.add(new IceBlock(i*50, y*50));
          } else {
            delete.add(board[y][i]);
          }
          i--;
        }
      } else if (B.getPrevKey().equals("up")) {
        if (board[y-1][x]!=null) {
          blockHere=true;
        }
        i=y-1;
        while (i>=0&&((blockHere&&board[i][x]!=null)||(!blockHere&&board[i][x]==null))) {
          if (board[i][x]==null) {
            delete.add(new IceBlock(x*50, i*50));
          } else {
            delete.add(board[i][x]);
          }
          i--;
        }
      } else {
        if (board[y+1][x]!=null) {
          blockHere=true;
        }
        i=y+1;
        while (i<board.length-1&&((blockHere&&board[i][x]!=null)||(!blockHere&&board[i][x]==null))) {
          if (board[i][x]==null) {
            delete.add(new IceBlock(x*50, i*50));
          } else {
            delete.add(board[i][x]);
          }
          i++;
        }
      }
      keysDown.remove(' ');
    }
    return delete;
  }   
  
}
