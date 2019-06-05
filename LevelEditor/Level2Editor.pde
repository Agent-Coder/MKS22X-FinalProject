Level2 L2 = new Level2();
Enemies E2;
Enemies E3;
Enemies E4;

class Level2 extends Levels {
  public Level2() {
    super();
    B=new Player(350, 350, board, boardtile, playerChar);
    C=new Enemies(B, board, boardtile, 100, 100, "Meowth");
    E2 = new Enemies(B, board, boardtile, 600, 100, "Tentacruel");
    E3 = new Enemies(B, board, boardtile, 600, 600, "Spoink");
    E4 = new Enemies(B, board, boardtile, 100, 600, "Tentacruel");
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
    berryCount=new ArrayList<Berries>();
    createBerries();

    board[10][4]=new IceBlock(200, 500);
    board[9][4]=new IceBlock(200, 450);
    board[8][4]=new IceBlock(200, 400);
    board[7][4]=new IceBlock(200, 350);
    board[6][4]=new IceBlock(200, 300);
    board[5][4]=new IceBlock(200, 250);
    board[4][4]=new IceBlock(200, 200);

    board[10][5]=new IceBlock(250, 500);
    board[10][6]=new IceBlock(300, 500);
    board[10][7]=new IceBlock(350, 500);
    board[10][8]=new IceBlock(400, 500);
    board[10][9]=new IceBlock(450, 500);
    board[10][10]=new IceBlock(500, 500);

    board[4][10]=new IceBlock(500, 200);
    board[4][9]=new IceBlock(450, 200);
    board[4][8]=new IceBlock(400, 200);
    board[4][7]=new IceBlock(350, 200);
    board[4][6]=new IceBlock(300, 200);
    board[4][5]=new IceBlock(250, 200);

    board[5][10]=new IceBlock(500, 250);
    board[6][10]=new IceBlock(500, 300);
    board[7][10]=new IceBlock(500, 350);
    board[8][10]=new IceBlock(500, 400);
    board[9][10]=new IceBlock(500, 450);

    board[8][8]=new IceBlock(400, 400);
    board[8][7]=new IceBlock(350, 400);
    board[8][6]=new IceBlock(300, 400);
    board[7][8]=new IceBlock(400, 350);
    board[7][6]=new IceBlock(300, 350);
    board[6][6]=new IceBlock(300, 300);
    board[6][7]=new IceBlock(350, 300);
    board[6][8]=new IceBlock(400, 300);



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
        if (berryCount.get(i).getBerryType().equals("OranBerry")) {
          oran--;
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

    berryCount.add(new OBerries(50, 50));
    berryCount.add(new OBerries(100, 50));
    berryCount.add(new OBerries(150, 50));
    berryCount.add(new OBerries(50, 100));
    berryCount.add(new OBerries(50, 150));
    berryCount.add(new OBerries(100, 150));
    berryCount.add(new OBerries(150, 100));
    berryCount.add(new OBerries(150, 150));

    berryCount.add(new OBerries(650, 50));
    berryCount.add(new OBerries(600, 50));
    berryCount.add(new OBerries(550, 50));
    berryCount.add(new OBerries(550, 100));
    berryCount.add(new OBerries(650, 100));
    berryCount.add(new OBerries(550, 150));
    berryCount.add(new OBerries(600, 150));
    berryCount.add(new OBerries(650, 150));

    berryCount.add(new OBerries(50, 650));
    berryCount.add(new OBerries(50, 600));
    berryCount.add(new OBerries(50, 550));
    berryCount.add(new OBerries(100, 650));
    berryCount.add(new OBerries(100, 550));
    berryCount.add(new OBerries(150, 650));
    berryCount.add(new OBerries(150, 600));
    berryCount.add(new OBerries(150, 550));

    berryCount.add(new OBerries(650, 650));
    berryCount.add(new OBerries(650, 600));
    berryCount.add(new OBerries(650, 550));
    berryCount.add(new OBerries(600, 650));
    berryCount.add(new OBerries(600, 550));
    berryCount.add(new OBerries(550, 650));
    berryCount.add(new OBerries(550, 600));
    berryCount.add(new OBerries(550, 550));
    oran= 32;

    berryCount.add(new LBerries(400, 400));
    berryCount.add(new LBerries(400, 350));
    berryCount.add(new LBerries(400, 300));
    berryCount.add(new LBerries(350, 300));
    berryCount.add(new LBerries(300, 300));
    berryCount.add(new LBerries(300, 350));
    berryCount.add(new LBerries(300, 400));
    berryCount.add(new LBerries(350, 400));
    lum = 8;

    berryCount.add(new SBerries(300, 50));
    berryCount.add(new SBerries(350, 50));
    berryCount.add(new SBerries(400, 50));
    berryCount.add(new SBerries(300, 650));
    berryCount.add(new SBerries(350, 650));
    berryCount.add(new SBerries(400, 650));
    berryCount.add(new SBerries(50, 300));
    berryCount.add(new SBerries(50, 350));
    berryCount.add(new SBerries(50, 400));
    berryCount.add(new SBerries(650, 300));
    berryCount.add(new SBerries(650, 350));
    berryCount.add(new SBerries(650, 400));
    sitrus = 12;
  }

  void displayBerries(int berryEnd) {
    for (int i=0; i<berryEnd; i++) {
      berryCount.get(i).display();
    }
  }

  Block temp;
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
    if (oran!=0) {
      collectBerries(oran);
      displayBerries(oran);
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
        temp.animate(temp.getxB(), temp.getyB(), make, frameCount-playerFrames);
        if (frameCount-playerFrames==19) {
          if (abs((round(C.getX())-temp.getxB()))<50&&abs((round(C.getY())-temp.getyB()))<50 ||
            abs((round(E2.getX())-temp.getxB()))<50&&abs((round(E2.getY())-temp.getyB()))<50 ||
            abs((round(E3.getX())-temp.getxB()))<50&&abs((round(E3.getY())-temp.getyB()))<50 || 
            abs((round(E4.getX())-temp.getxB()))<50&&abs((round(E4.getY())-temp.getyB()))<50) {
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
    E2.update(board);
    E3.update(board);
    E4.update(board);
    if (frameCount%50==frameStart%50) {
      C.moveE();
      E2.moveE();
      E3.moveE();
      E4.moveE();
    }
    E2.moveAnimation();
    E3.moveAnimation();
    E4.moveAnimation();
    C.moveAnimation();
    B.move(canMove);
    if (round(C.getX()/50)==round(B.getPX()/50)&&round(C.getY()/50)==round(B.getPY()/50)) dead = true;
    if (round(E2.getX()/50)==round(B.getPX()/50)&&round(E2.getY()/50)==round(B.getPY()/50)) dead = true;
    if (round(E3.getX()/50)==round(B.getPX()/50)&&round(E3.getY()/50)==round(B.getPY()/50)) dead = true;
    if (round(E4.getX()/50)==round(B.getPX()/50)&&round(E4.getY()/50)==round(B.getPY()/50)) dead = true;
    if (berryCount.size() == 0) nextLevel = true;
  }
}
