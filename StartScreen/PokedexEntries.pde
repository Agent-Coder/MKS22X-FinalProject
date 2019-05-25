void showPokemon() {
  if (playerChar.equals("")) text("Character Selected: ",128,555);
  if (playerChar.equals("Empoleon")) {
    text("Character Selected: Empoleon",123,545);
    textSize(18);
    //Pokedex entry creds @ Omega Ruby / X
    text("POKEDEX ENTRY #395: \n      Empoleon, the Emperor Pokémon. It swims as fast as a \n      jet boat. The edges of its wings are sharp and can \n      slice apart drifitng ice.",155,567);
  }
  
  if (playerChar.equals("Manaphy")) {
    text("Character Selected: Manaphy",123,545);
    textSize(18);
    //Pokdex entry creds @ Alpha Sapphire / Y
    text("POKEDEX ENTRY #490: \n      Manaphy, the Seafaring Pokémon. It starts its life \n      with a wondrous power that permits it to bond with \n      any kind of Pokémon.",155,567);
  }
  if (playerChar.equals("Glaceon")) {
    text("Character Selected: Glaceon",128,545);
    textSize(18);
    //Pokedex entry creds @ Ultra Sun/Moon
    text("POKEDEX ENTRY #471: \n      Glaceon, the Fresh Snow Pokémon. It can \n      instantaneously freeze any moisture that's around it. It can \n      drop its body temperature below –75 degrees Fahrenheit.",155,567);
  }
}
