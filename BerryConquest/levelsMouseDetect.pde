void detectStartGame() {
  if (mousePressed == true && mX >= 335 && mX <=425 &&
      mY >= 395 && mY <=431) {
        location = "levelSelect";
      }
}

void detectLevelSelect() {
   if (mousePressed == true && mX >= 100 && mX <=200 &&
     mY >=160 && mY < 260) {
       selectedLevel = "1";
   }
   
   if (mousePressed == true && mX >= 255 && mX <=355 &&
     mY >=160 && mY < 260) {
       selectedLevel = "2";
   }
     
   if (mousePressed == true && mX >= 410 && mX <=510 &&
     mY >=160 && mY < 260) {
       selectedLevel = "3";
   }
   
   if (mousePressed == true && mX >= 565 && mX <=665 &&
     mY >=160 && mY < 260) {
       selectedLevel = "4";
   }
}
  
void detectPokemonSelect() {
    if (mousePressed == true && mX >=120 && mX <170 &&
     mY >= 415 && mY <465) {
       playerChar = "Manaphy";
     }

   if (mousePressed == true && mX >=350 && mX <412 &&
     mY >= 415 && mY <465) {
       playerChar = "Glaceon";
     }

   if (mousePressed == true && mX >=590 && mX <648 &&
     mY >= 415 && mY <470) {
       playerChar = "Empoleon";
     }
}

void resetLevel() {
  if (plocation.equals("1")) A = new Level1();
  if (plocation.equals("2")) L2 = new Level2();
  if (plocation.equals("3")) L3 = new Level3();
  if (plocation.equals("4")) L4 = new Level4(); 
}
