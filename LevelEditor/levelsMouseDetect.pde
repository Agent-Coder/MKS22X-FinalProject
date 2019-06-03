void detectStartGame() {
  if (mousePressed == true && mX >= 335 && mX <=425 &&
      mY >= 395 && mY <=431) {
        location = "levelSelect";
      }
}

void detectLevelSelect() {
   if (mousePressed == true && mX >= 50 && mX <=150 &&
     mY >=160 && mY < 260) {
       selectedLevel = "1";
   }
   
   if (mousePressed == true && mX >= 180 && mX <=280 &&
     mY >=160 && mY < 260) {
       selectedLevel = "2";
   }
     
   if (mousePressed == true && mX >= 320 && mX <=420 &&
     mY >=160 && mY < 260) {
       selectedLevel = "3";
   }
   
   if (mousePressed == true && mX >= 454 && mX <=554 &&
     mY >=160 && mY < 260) {
       selectedLevel = "4";
   }
   
   if (mousePressed == true && mX >= 590 && mX <=690 &&
     mY >=160 && mY < 260) {
       selectedLevel = "5";
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
    
}




//CONTINUE
