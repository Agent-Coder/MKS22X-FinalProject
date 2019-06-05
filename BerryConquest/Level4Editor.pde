Level4 L4 = new Level4();

class Level4 extends Levels {
  ArrayList<Ditto> E;
  boolean[][] enemyLocation;
  boolean enemyAttacking=false;
  public Level4() {
    B=new Player(350, 450, board, boardtile, playerChar);
    E=new ArrayList<Ditto>();
    for (int i=0; i<3; i++) {
      E.add(new Ditto(B, board, boardtile, 300+i*50, 200));
      E.add(new Ditto(B, board, boardtile, 200, 300+i*50));
      E.add(new Ditto(B, board, boardtile, 500, 300+i*50));
      E.add(new Ditto(B, board, boardtile, 300+i*50, 500));
    }
    enemyLocation=new boolean[15][15];
    enemyHere();
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
        board[i][1]=new obstacleBlock(50, i*50);
        board[board.length-2][i]=new obstacleBlock(i*50, (board.length-2)*50);
        board[i][board.length-2]=new obstacleBlock((board.length-2)*50, i*50);
      }
      if ((i<=4&&i>0)||(i>=10&&i<board.length-1)) {
        board[2][i]=new obstacleBlock(i*50, 100);
        board[i][2]=new obstacleBlock(100, i*50);
        board[board.length-3][i]=new obstacleBlock(i*50, (board.length-3)*50);
        board[i][board.length-3]=new obstacleBlock((board.length-3)*50, i*50);
      }
    }
    board[7][7]=new obstacleBlock(350, 350);
    board[7][8]=new obstacleBlock(400, 350);
    board[8][7]=new obstacleBlock(350, 400);
    board[6][7]=new obstacleBlock(350, 300);
    board[7][6]=new obstacleBlock(300, 350);
    board[6][6]=new obstacleBlock(300, 300);
    board[8][8]=new obstacleBlock(400, 400);
    board[8][6]=new obstacleBlock(300, 400);
    board[6][8]=new obstacleBlock(400, 300);
    board[10][10]=new obstacleBlock(500, 500);
    board[4][4]=new obstacleBlock(200, 200);
    board[4][10]=new obstacleBlock(200, 500);
    board[10][4]=new obstacleBlock(500, 200);
    boardtile[3][11]=new TeleportationTile(550, 150);
    boardtile[3][3]=new TeleportationTile(150, 150);
    boardtile[11][3]=new TeleportationTile(150, 550);
    boardtile[11][11]=new TeleportationTile(550, 550);
    boardtile[5][board.length-2]=new TeleportationTile(650, 250);
    boardtile[board.length-2][5]=new TeleportationTile(250, 650);
    boardtile[1][5]=new TeleportationTile(250, 50);
    boardtile[5][1]=new TeleportationTile(50, 250);
    boardtile[9][board.length-2]=new TeleportationTile(650, 450);
    boardtile[board.length-2][9]=new TeleportationTile(450, 650);
    boardtile[1][9]=new TeleportationTile(450, 50);
    boardtile[9][1]=new TeleportationTile(50, 450);
  }
  void collectBerries(int berryEnd) {
    for (int i=0; i<berryEnd; i++) {
      if (round(B.getPX()/50)==berryCount.get(i).getBerryX()/50&&round(B.getPY()/50)==berryCount.get(i).getBerryY()/50) {
        if (berryCount.get(i).getBerryType().equals("RazzBerry")&&!berryCount.get(i).getBad()) {
          razz--;
        } else if (berryCount.get(i).getBerryType().equals("RazzBerry")&&berryCount.get(i).getBad()) {
          dead=true;
        } else {
          sitrus--;
        }
        berryCount.remove(i);
        berryEnd--;
      }
    }
  }
  void createBerries() {

    berryCount.add(new RBerries(300, 100));
    berryCount.add(new RBerries(400, 100));
    berryCount.add(new RBerries(600, 300));
    berryCount.add(new RBerries(600, 400));
    berryCount.add(new RBerries(300, 600));
    berryCount.add(new RBerries(400, 600));
    berryCount.add(new RBerries(100, 300));
    berryCount.add(new RBerries(100, 400));
    razz=8;

    berryCount.add(new SBerries(250, 100));
    berryCount.add(new SBerries(450, 100));
    berryCount.add(new SBerries(200, 150));
    berryCount.add(new SBerries(250, 150));
    berryCount.add(new SBerries(450, 150));
    berryCount.add(new SBerries(500, 150));

    berryCount.add(new SBerries(100, 250));
    berryCount.add(new SBerries(150, 250));
    berryCount.add(new SBerries(150, 200));
    berryCount.add(new SBerries(150, 500));
    berryCount.add(new SBerries(100, 450));
    berryCount.add(new SBerries(150, 450));

    berryCount.add(new SBerries(250, 550));
    berryCount.add(new SBerries(250, 600));
    berryCount.add(new SBerries(200, 550));
    berryCount.add(new SBerries(450, 600));
    berryCount.add(new SBerries(450, 550));
    berryCount.add(new SBerries(500, 550));

    berryCount.add(new SBerries(550, 500));
    berryCount.add(new SBerries(550, 450));
    berryCount.add(new SBerries(600, 450));
    berryCount.add(new SBerries(550, 200));
    berryCount.add(new SBerries(600, 250));
    berryCount.add(new SBerries(550, 250));
    sitrus=24;
  }
  void displayBerries(int berryEnd) {
    for (int i=0; i<berryEnd; i++) {
      if (berryCount.get(i).berryType.equals("RazzBerry")) {
        berryCount.get(i).badBerry();
        if (berryCount.get(i).getBad()) {
          berryCount.get(i).displaySpecial();
        } else {
          berryCount.get(i).display();
        }
      } else {
        berryCount.get(i).display();
      }
    }
  }
  void enemyHere() {
    for (int a=0; a<15; a++) {
      for (int b=0; b<15; b++) {
        enemyLocation[a][b]=false;
      }
    }
    for (int c=0; c<E.size(); c++) {
      enemyLocation[round(E.get(c).getY()/50)][round(E.get(c).getX()/50)]=true;
    }
  }
  void nextEMove() {
    for(int i=0;i<E.size();i++){
      E.get(i).setMoving(false);
    }
    if (keyCodesDown.contains(RIGHT)) {
      for (int i=13; i>=1; i--) {
        for (int x=0; x<E.size(); x++) {
          if (round(E.get(x).getX()/50)==i&&board[floor(E.get(x).getY()/50)][floor(E.get(x).getX()/50)+1]==null&&!enemyLocation[round(E.get(x).getY()/50)][round(E.get(x).getX()/50)+1]) {
            enemyLocation[round(E.get(x).getY()/50)][round(E.get(x).getX()/50)]=false;
            enemyLocation[round(E.get(x).getY()/50)][round(E.get(x).getX()/50)+1]=true;
            E.get(x).setMoving(true);
          }
        }
      }
    } else if (keyCodesDown.contains(LEFT)) {
      for (int i=0; i<E.size(); i++) {
        E.get(i).setMoving(false);
      }
      for (int i=1; i<=13; i++) {
        for (int x=0; x<E.size(); x++) {
          if (round(E.get(x).getX()/50)==i&&board[ceil(E.get(x).getY()/50)][ceil(E.get(x).getX()/50)-1]==null&&!enemyLocation[round(E.get(x).getY()/50)][round(E.get(x).getX()/50)-1]) {
            enemyLocation[round(E.get(x).getY()/50)][round(E.get(x).getX()/50)]=false;
            enemyLocation[round(E.get(x).getY()/50)][round(E.get(x).getX()/50)-1]=true;
            E.get(x).setMoving(true);
          }
        }
      }
    } else if (keyCodesDown.contains(UP)) {
      for (int i=0; i<E.size(); i++) {
        E.get(i).setMoving(false);
      }
      for (int i=1; i<=13; i++) {
        for (int x=0; x<E.size(); x++) {
          if (round(E.get(x).getY()/50)==i&&board[ceil(E.get(x).getY()/50)-1][ceil(E.get(x).getX()/50)]==null&&!enemyLocation[round(E.get(x).getY()/50)-1][round(E.get(x).getX()/50)]) {
            enemyLocation[round(E.get(x).getY()/50)][round(E.get(x).getX()/50)]=false;
            enemyLocation[round(E.get(x).getY()/50)-1][round(E.get(x).getX()/50)]=true;
            E.get(x).setMoving(true);
          }
        }
      }
    } else if (keyCodesDown.contains(DOWN)) {
      for (int i=0; i<E.size(); i++) {
        E.get(i).setMoving(false);
      }
      for (int i=13; i>=1; i--) {
        for (int x=0; x<E.size(); x++) {
          if (round(E.get(x).getY()/50)==i&&board[floor(E.get(x).getY()/50)+1][floor(E.get(x).getX()/50)]==null&&!enemyLocation[round(E.get(x).getY()/50)+1][round(E.get(x).getX()/50)]) {
            enemyLocation[round(E.get(x).getY()/50)][round(E.get(x).getX()/50)]=false;
            enemyLocation[round(E.get(x).getY()/50)+1][round(E.get(x).getX()/50)]=true;
            E.get(x).setMoving(true);
          }
        }
      }
    }
  }
  int frameStart;
  boolean startFrame=true;
  boolean make=true;
  boolean lastBlock=false;
  boolean enemyMove=true;
  int frameBlocks=0;
  int playerFrames=0;
  void play(String playChar) {
    if (startFrame) {
      frameStart=frameCount;
      startFrame=false;
      frameBlocks=frameStart-20;
    }
    output();
    if (razz!=0) {
      collectBerries(razz);
      displayBerries(razz);
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
          for (int a=0; a<E.size(); a++) {
            if (abs((round(E.get(a).getX())-temp.getxB()))<50&&abs((round(E.get(a).getY())-temp.getyB()))<50) {
              temp=null;      
              attacked.clear();
              lastBlock=false;
              a=E.size();
            } else if (board[temp.getyB()/50][temp.getxB()/50]==null) {
              board[temp.getyB()/50][temp.getxB()/50]=new IceBlock(temp.getxB(), temp.getyB());
              lastBlock=false;
            }
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
    B.teleport();
    B.move(canMove);
    //if (frameCount%20==frameStart%20) {
    enemyHere();
    nextEMove();
    //}
    for (int iii=0; iii<E.size(); iii++) {
      E.get(iii).teleport();
      if (round(E.get(iii).getX()/50)==round(B.getPX()/50)&&round(E.get(iii).getY()/50)==round(B.getPY()/50)) dead = true;
      E.get(iii).determineMove();
    }
    for (int a=0; a<E.size(); a++) {

      E.get(a).moveE(playChar);
    }
    if (berryCount.size() == 0) nextLevel = true;
  }
}
