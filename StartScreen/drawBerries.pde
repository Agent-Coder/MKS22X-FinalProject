void drawBerries() {
  int disty = 0;
  int distx = 0;
  int berryswitch = 0;
  int rowC = 0;
  for (int i = 0; i < 6; i++) {
    if (rowC % 2 == 0) {
      for (int x = 0; x < 12; x++) {
        if (berryswitch % 5 == 0) {
         image(OranBerry, 22 + distx, 20 + disty);
        }
        if (berryswitch % 5 == 1) {
         image(LumBerry, 22 + distx, 20 + disty);
        }if (berryswitch % 5 == 2) {
         image(NanabBerry, 22 + distx, 20 + disty);
        }if (berryswitch % 5 == 3) {
         image(SitrusBerry, 22 + distx, 20 + disty);
        }if (berryswitch % 5 == 4) {
         image(RazzBerry, 22 + distx, 20 + disty);
        }
         berryswitch++;   
         distx = distx + 60;
      }
    } else {
        for (int x = 0; x < 11; x++) {
          if (berryswitch % 5 == 0) {
           image(OranBerry, 50 + distx, 20 + disty);
          }
          if (berryswitch % 5 == 1) {
           image(LumBerry, 50 + distx, 20 + disty);
          }if (berryswitch % 5 == 2) {
           image(NanabBerry, 50 + distx, 20 + disty);
          }if (berryswitch % 5 == 3) {
           image(SitrusBerry, 50+ distx, 20 + disty);
          }if (berryswitch % 5 == 4) {
           image(RazzBerry, 50 + distx, 20 + disty);
          }
          berryswitch++;   
          distx = distx + 60;
        }
      }
   disty = disty + 45;
   distx = 0;
   rowC++;
  }
  drawBerries2();
}

void drawBerries2() {
  image(RazzBerry,40,300,60,60);
  image(RazzBerry,660,300,60,60);
}
