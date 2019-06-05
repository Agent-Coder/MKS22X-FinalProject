Level3 L3 = new Level3();

class Level3 extends Levels {
  Block temp;
  int frameStart;
  boolean startFrame=true;
  boolean make=true;
  boolean lastBlock=false;
  int frameBlocks=0;
  int playerFrames=0;

  Random rng = new Random();
  Mismagius C;
  int rC = 0;
  int time;
  int time2;
  int sCount = 0;
  ArrayList<Integer> numbs = new ArrayList<Integer>();
  public Level3() {
    super();
    B=new Player(350, 350, board, boardtile, playerChar);
    C=new Mismagius(B, board, boardtile, 350, 600);
    attacked=new ArrayList<Block>();
    temporary=new ArrayList<Block>();
    berryCount=new ArrayList<Berries>();
    createBerries();
    for (int i=0; i<board.length; i++) {
      board[i][0]=new BorderBlock(i*50, 0);
      board[0][i]=new BorderBlock(0, i*50);
      board[i][board.length-1]=new BorderBlock(i*50, (board.length-1)*50);
      board[board.length-1][i]=new BorderBlock((board.length-1)*50, i*50);
    }
  }
  void displayBerries(int berryEnd) {
    for (int i=0; i<berryEnd; i++) {
      berryCount.get(i).display();
    }
  }
  void collectBerries(int berryEnd) {
    for (int i=0; i<berryEnd; i++) {
      if (round(B.getPX()/50)==berryCount.get(i).getBerryX()/50&&round(B.getPY()/50)==berryCount.get(i).getBerryY()/50) {
        if (berryCount.get(i).getBerryType().equals("OranBerry")) {
          oran--;
        } else if (berryCount.get(i).getBerryType().equals("SitrusBerry")) {
          sitrus--;
        } else {
          nanab--;
        }
        berryCount.remove(i);
        berryEnd--;
      }
    }
  }
  void createBerries() {
    berryCount.add(new OBerries(200, 150));
    berryCount.add(new OBerries(250, 150));
    berryCount.add(new OBerries(300, 150));
    berryCount.add(new OBerries(350, 150));
    berryCount.add(new OBerries(400, 150));
    berryCount.add(new OBerries(450, 150));
    berryCount.add(new OBerries(500, 150));

    berryCount.add(new OBerries(200, 550));
    berryCount.add(new OBerries(250, 550));
    berryCount.add(new OBerries(300, 550));
    berryCount.add(new OBerries(350, 550));
    berryCount.add(new OBerries(400, 550));
    berryCount.add(new OBerries(450, 550));
    berryCount.add(new OBerries(500, 550));

    berryCount.add(new OBerries(150, 200));
    berryCount.add(new OBerries(150, 250));
    berryCount.add(new OBerries(150, 300));
    berryCount.add(new OBerries(150, 350));
    berryCount.add(new OBerries(150, 400));
    berryCount.add(new OBerries(150, 450));
    berryCount.add(new OBerries(150, 500));

    berryCount.add(new OBerries(550, 200));
    berryCount.add(new OBerries(550, 250));
    berryCount.add(new OBerries(550, 300));
    berryCount.add(new OBerries(550, 350));
    berryCount.add(new OBerries(550, 400));
    berryCount.add(new OBerries(550, 450));
    berryCount.add(new OBerries(550, 500));
    oran=28;

    berryCount.add(new SBerries(50, 50));
    berryCount.add(new SBerries(50, 650));
    berryCount.add(new SBerries(650, 50));
    berryCount.add(new SBerries(650, 650));
    sitrus=4;

    berryCount.add(new NBerries(250, 200));
    berryCount.add(new NBerries(300, 200));
    berryCount.add(new NBerries(350, 200));
    berryCount.add(new NBerries(400, 200));
    berryCount.add(new NBerries(450, 200));

    berryCount.add(new NBerries(250, 500));
    berryCount.add(new NBerries(300, 500));
    berryCount.add(new NBerries(350, 500));
    berryCount.add(new NBerries(400, 500));
    berryCount.add(new NBerries(450, 500));

    berryCount.add(new NBerries(200, 250));
    berryCount.add(new NBerries(200, 300));
    berryCount.add(new NBerries(200, 350));
    berryCount.add(new NBerries(200, 400));
    berryCount.add(new NBerries(200, 450));

    berryCount.add(new NBerries(500, 250));
    berryCount.add(new NBerries(500, 300));
    berryCount.add(new NBerries(500, 350));
    berryCount.add(new NBerries(500, 400));
    berryCount.add(new NBerries(500, 450));
    nanab=20;
  }
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
    } else if (sitrus!=0) {
      collectBerries(sitrus);
      displayBerries(sitrus);
    } else {    
      collectBerries(nanab);
      displayBerries(nanab);
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
      } else if (board[temp.getyB()/50][temp.getxB()/50]!=null&&(board[temp.getyB()/50][temp.getxB()/50].getType().equals("iceblock"))) {
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
    genSpikes();
    C.update(board);
    if (frameCount%50==frameStart%50) {
      C.moveE();
    }
    C.moveAnimation();
    B.move(canMove);
    if (round(C.getX()/50)==round(B.getPX()/50)&&round(C.getY()/50)==round(B.getPY()/50)) {
      dead = true;
    }
    if (berryCount.size() == 0) nextLevel = true;
  }

  void genSpikes() {
    if (sCount == 0) {
      time2 = millis();
      sCount = sCount + 1;
      for (int i = 0; i < 15; i++) {
        for (int j = 0; j < 15; j++) {
          boardtile[j][i] = new Tile(i*50, j*50);
          int randomNum = rng.nextInt(10);
          if (randomNum < 4 && i != 0 && i != boardtile.length-1 && j != 0 && j != boardtile.length-1) {
            numbs.add(i);
            numbs.add(j);
            boardtile[j][i]=new wTile(i*50, j*50);
          }
        }
      }
    }  
    if (millis() >= time2 + 3000 && rC == 0) {
      rC = 1;
      while ( numbs.size() > 0) { 
        int x = numbs.remove(0);
        int y = numbs.remove(0);
        boardtile[y][x] = new Tile(x*50, y*50);
        board[y][x] = new CrystalBlock2(x*50, y*50);
        checkdead(x, y); //weird convention/coord system but i think it works
      }
    }
    if (millis() >= time2 + 7000) {
      for (int i = 0; i < 15; i++) {
        for (int j = 0; j < 15; j++) {
          if  (board[j][i]!=null&&board[j][i].getType().equals("crystalblock")) {
            boardtile[j][i] = null;
            board[j][i] = null;
            sCount = 0;
            time2 = millis();
            rC = 0;
          }
        }
      }
    }
  }
  void checkdead(int x, int y) {
    if (round(B.getPX()/50) == x && round(B.getPY()/50) == y) {
      dead = true;
    }
  }
}
