class Level3 extends Levels {
  public Level3() {
    B=new Player(350, 350, board);
    C=new Enemies(B, board,100,100);
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
    berryCount=new ArrayList<Berries>();
    createBerries();
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        boardtile[i][j]=new Tile(i*50, j*50);
      }
      board[i][board.length-1]=new BorderBlock( (board.length-1)*50, i*50);
      board[board.length-1][i]=new BorderBlock(i*50, (board.length-1)*50);
      board[i][0]=new BorderBlock(0, i*50);
      board[0][i]=new BorderBlock(i*50, 0);
      if ((i<=4&&i>0)||(i>=10&&i<board.length-1)) {
        board[1][i]=new obstacleBlock(i*50, 50);
        board[i][1]=new obstacleBlock(50 ,i*50);
        board[board.length-2][i]=new obstacleBlock(i*50, (board.length-2)*50);
        board[i][board.length-2]=new obstacleBlock((board.length-2)*50, i*50);
      }
      if ((i<=4&&i>0)||(i>=10&&i<board.length-1)) {
        board[2][i]=new obstacleBlock(i*50, 100);
        board[i][2]=new obstacleBlock(100 ,i*50);
        board[board.length-3][i]=new obstacleBlock(i*50, (board.length-3)*50);
        board[i][board.length-3]=new obstacleBlock((board.length-3)*50, i*50);
      }
    }
  }
  void collectBerries(int berryEnd) {
    for (int i=0; i<berryEnd; i++) {
      if (round(B.getPX()/50)==berryCount.get(i).getBerryX()/50&&round(B.getPY()/50)==berryCount.get(i).getBerryY()/50) {
        if (berryCount.get(i).getBerryType().equals("OranBerry")) {
          oran--;
        } else {
          lum--;
        }
        berryCount.remove(i);
        berryEnd--;
      }
    }
  }
  void createBerries() {
    berryCount.add(new OBerries(250, 100));
    berryCount.add(new OBerries(300, 100));
    berryCount.add(new OBerries(350, 100));
    berryCount.add(new OBerries(400, 100));
    berryCount.add(new OBerries(450, 100));

    berryCount.add(new OBerries(600, 250));
    berryCount.add(new OBerries(600, 300));
    berryCount.add(new OBerries(600, 350));
    berryCount.add(new OBerries(600, 400));
    berryCount.add(new OBerries(600, 450));

    berryCount.add(new OBerries(250, 600));
    berryCount.add(new OBerries(300, 600));
    berryCount.add(new OBerries(350, 600));
    berryCount.add(new OBerries(400, 600));
    berryCount.add(new OBerries(450, 600));

    berryCount.add(new OBerries(100, 250));
    berryCount.add(new OBerries(100, 300));
    berryCount.add(new OBerries(100, 350));
    berryCount.add(new OBerries(100, 400));
    berryCount.add(new OBerries(100, 450));
    oran=20;

    berryCount.add(new LBerries(50, 50));
    berryCount.add(new LBerries(100, 50));
    berryCount.add(new LBerries(50, 100));

    berryCount.add(new LBerries(650, 650));
    berryCount.add(new LBerries(650, 600));
    berryCount.add(new LBerries(600, 650));

    berryCount.add(new LBerries(650, 50));
    berryCount.add(new LBerries(650, 100));
    berryCount.add(new LBerries(600, 50));

    berryCount.add(new LBerries(50, 650));
    berryCount.add(new LBerries(50, 600));
    berryCount.add(new LBerries(100, 650));
    lum=12;
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
    if (startFrame) {
      frameStart=frameCount;
      startFrame=false;
      frameBlocks=frameStart-20;
    }
    output();
    if (oran!=0) {
      collectBerries(oran);
      displayBerries(oran);
    } else {    
      collectBerries(lum);
      displayBerries(lum);
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
        temp.animate(temp.getxB(), temp.getyB(), make, frameCount-playerFrames);
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
        temp.animate(temp.getxB(), temp.getyB(), make, frameCount-playerFrames);
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
    if (berryCount.size() == 0) nextLevel = true;
  }
}
