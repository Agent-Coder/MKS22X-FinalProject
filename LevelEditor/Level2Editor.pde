Level2 L2 = new Level2();

class Level2 extends Levels {
  public Level2() {
    super();
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
    berryCount=new ArrayList<Berries>();
    createBerries();
    for (int i=0; i<board.length; i++) {
        board[i][0]=new BorderBlock(i*50, 0);
        board[0][i]=new BorderBlock(0, i*50);
        board[i][board.length-1]=new BorderBlock(i*50, (board.length-1)*50);
        board[board.length-1][i]=new BorderBlock((board.length-1)*50, i*50);     
        for (int j=0; j<board[0].length; j++) {
          boardtile[i][j]=new Tile(i*50, j*50);
        }
     }
  }
  
  void collectBerries(int berryEnd) {
      for (int i=0; i<berryEnd; i++) {
      if (round(B.getPX()/50)==berryCount.get(i).getBerryX()/50&&round(B.getPY()/50)==berryCount.get(i).getBerryY()/50) {
        if (berryCount.get(i).getBerryType().equals("RazzBerry")) {
          razz--;
        } else if (berryCount.get(i).getBerryType().equals("LumBerry")) {
          lum--;
        } else {
          sitrus--;
        }
        berryCount.remove(i);
        berryEnd--;
      }
    }
  }
  
  void createBerries() {
    berryCount.add(new RBerries(50, 50));
    berryCount.add(new RBerries(100, 50));
    berryCount.add(new RBerries(150, 50));
    berryCount.add(new RBerries(50, 100));
    berryCount.add(new RBerries(50, 150));
    berryCount.add(new RBerries(100, 150));
    berryCount.add(new RBerries(150, 100));
    berryCount.add(new RBerries(150, 150));
    
    berryCount.add(new RBerries(650,50));
    berryCount.add(new RBerries(600,50));
    berryCount.add(new RBerries(550,50));
    berryCount.add(new RBerries(550,100));
    berryCount.add(new RBerries(650,100));
    berryCount.add(new RBerries(550,150));
    berryCount.add(new RBerries(600,150));
    berryCount.add(new RBerries(650,150));
    
    berryCount.add(new RBerries(50,650));
    berryCount.add(new RBerries(50,600));
    berryCount.add(new RBerries(50,550));
    berryCount.add(new RBerries(100,650));
    berryCount.add(new RBerries(100,550));
    berryCount.add(new RBerries(150,650));
    berryCount.add(new RBerries(150,600));
    berryCount.add(new RBerries(150,550));
    
    berryCount.add(new RBerries(650,650));
    berryCount.add(new RBerries(650,600));
    berryCount.add(new RBerries(650,550));
    berryCount.add(new RBerries(600,650));
    berryCount.add(new RBerries(600,550));
    berryCount.add(new RBerries(550,650));
    berryCount.add(new RBerries(550,600));
    berryCount.add(new RBerries(550,550));
    razz= 32;
  }
  
  void displayBerries(int berryEnd) {
    for (int i=0; i<berryEnd; i++) {
      berryCount.get(i).display();
    }
  }
  
  Block temp;
  IceBlock[][] start = new IceBlock[15][15];
  int frameStart;
  boolean startFrame=true;
  boolean make=true;
  boolean lastBlock=false;
  int frameBlocks=0;
  int playerFrames=0;
  
  void play() {
    output();
    if (startFrame) {
      frameStart=frameCount;
      startFrame=false;
      frameBlocks=frameStart-20;
    }
    if (razz!=0) {
      collectBerries(razz);
      displayBerries(razz);
    } else if (lum!=0) {   
      collectBerries(lum);
      displayBerries(lum); 
    } else {
      collectBerries(sitrus);
      displayBerries(sitrus);
    }
   temporary=attack();
    int i=temporary.size()-1;
    while (i>=0&&!attacking) {
      attacked.add(temporary.get(i));
      i--;
    }
    if (attacked.size()==0&&frameCount-playerFrames>=20) {
      temp=null;
      attacking=false;
    }
    if (attacked.size()>0||frameCount-playerFrames<20) {
      attacking=true;
    }
    if (frameCount-playerFrames>=20&&attacked.size()>0) {
      temp=attacked.remove(attacked.size()-1);
      if (board[temp.getyB()/50][temp.getxB()/50]==null) {
        make=true;  
        playerFrames=frameCount;
      } else if (board[temp.getyB()/50][temp.getxB()/50]!=null&&board[temp.getyB()/50][temp.getxB()/50].getType()!="borderblock") {
        board[temp.getyB()/50][temp.getxB()/50]=null;
        make=false;
        playerFrames=frameCount;
      }
    }
    if (temp!=null) {
      if (make) {
        lastBlock=true;
        temp.animate(temp.getxB(), temp.getyB(), make,frameCount-playerFrames);
        if (frameCount-playerFrames==19) {
          if (abs((round(C.getX())-temp.getxB()))<50&&abs((round(C.getY())-temp.getyB()))<50) {
            temp=null;      
            attacked.clear();
            lastBlock=false;
          } else if (board[temp.getyB()/50][temp.getxB()/50]==null) {
            board[temp.getyB()/50][temp.getxB()/50]=new IceBlock(temp.getxB(), temp.getyB());
            lastBlock=false;
          }
        }
      } else {
        temp.animate(temp.getxB(), temp.getyB(), make,frameCount-playerFrames);
        println("-----");
      }
    }
    if (attacked.size()>0||frameCount-playerFrames<20) {
      canMove=false;
    } else {
      canMove=true;
    }
    C.update(board);
    if (frameCount%50==frameStart%50) {
      C.moveE();
    }
    C.moveAnimation();
    B.move(canMove);
    if (round(C.getX()/50)==round(B.getPX()/50)&&round(C.getY()/50)==round(B.getPY()/50)) dead = true;
 //   if (berryCount.size() == 0) nextLevel = true;
  }    
}
