# MKS22X-FinalProject: BERRY CONQUEST
  Welcome to our final project! We've developed a game based off *[Bad Ice Cream](https://www.crazygames.com/game/bad-ice-cream)*, but with an unique twist: we've added Pokémon to it! This project was created by [Amanda Zheng](https://github.com/Agent-Coder) and [Justin Chen](https://github.com/jcmmii) over the span of a bit over two weeks, so it while it won't contain as many features as the original game, we hope that the game is still enjoyable nonetheless. 

-------

## Project Description:
The player chooses one of the three Pokémon to play as: Manaphy, Empoleon, or Glaceon. The objective is to go through each level and attempt to get all the berries without being attacked by various enemy Pokémon. If an enemy comes in contact with the player, the player will have to restart the level. Players will have to navigate through not only enemies but obstacles scattered throughout each level. Players will also have the ability to create ice blocks as obstacles for enemies. However, those ice blocks can become obstacles for the players themselves. The player beats the game once they've completed all 5 levels. 
  
## Directions:
* Use arrow keys to move
* ***UDPATE LATER****

## Development Logs:
:cookie: = Justin <br/>
:icecream: = Amanda <br/>
:doughnut: = Amanda & Justin <br/>

### DAY 0 Thursday 5/16/19 
:doughnut:
- Project prototype approved by Mr. K
- Repo Google Form filled out
- Started looking at sprites to use from the internet 
- Started brainstorming which Pokémon to use as player & enemies

### DAY 1 Friday 5/17/19
:doughnut: 
- Day of AP Exam, nothing much done
- Continued looking at sprites & decided to use [Spriters-Resource.com](https://www.spriters-resource.com/ds_dsi/pokemonmysterydungeonexplorersoftimedarkness/) as our main source of sprites

### DAY 2 Saturday 5/18/19
:icecream: 
- Started working on basic player movement (input via arrow keys)
- Started working on enemy movement & tracking player
- Start on level 1

:cookie: 
- Started sprite-ing; grabbed sprites for Glaceon, Manaphy from Spriters-Resource via screenshotting and using Photoshop to extract the sprites
- Created separate Google Drive folder to save all the sprites 

:doughnut: 
- Decide to use Manaphy, Glaceon as two player Pokemon 
- Decide to use Mamoswine, Tentacruel as two enemy Pokemon
- Decide to have Snorlax as a big obstacle Pokemon (non movable)

### DAY 3 Sunday 5/19/19
:icecream:
- Basic enemy, player movements done (though needs a lot of fixing)
- Use Glaceon as default/testing character, sprites update every time it moves 

:cookie:
- Did sprites for Mamoswine, Tentacruel, Snorlax, ice block & uploaded to Drive
- Attempt at adding floor tiles for level 1

### DAY 4 Monday 5/20/19
:icecream:
- update level 1 to include smoother movements
- Glaceon/Player idle/walking movements are smoother

:cookie:
- Did sprites for berries (all five: Lum, Oran, Sitrus, Razz, Nanab) & uploaded to Drive

:doughnut:
- Talked with Mr. K to discuss the issue about lagginess & frame problems
- Realized images were not resized in setup and were resized each time it was drawn (taking up a lot of calculation space!) fixed this problem and frames went up a lot

### DAY 5 Tuesday 5/21/19
:doughnut: 
- Attempt at working on a data structure that can keep count of unbreakable walls, breakable ice tiles, and walkable tiles

### DAY 6 Wednesday 5/22/19
:icecream:
- Work on player creating ice blocks in all four directions

:cookie:
- Started to work on Start Screen
- Played around with [sketch.io](https://sketch.io/) to create a png file that will be used for the Start Screen
- Started to develop a method that'll allow a pattern of berry placement on the StartScreen (so it won't be all empty & blue) works for the top half
- organized code by create a new tab for StartScreen to hold helper methods 

### DAY 7 Thursday 5/23/19
:cookie: 
- Add mouse inputs on start screen to go into the level select screen
- Find online source for icons for level select, did sprite-ing with photoshop


### DAY 8 Friday 5/24/19
:cookie: 
- Add level number icons to level select
- Add level select background
- Played around with Processing built-in fonts

### DAY 9 Saturday 5/25/19
:cookie:
- Added bottom half of StartScreen berryplacement, final touches on StartScreen
- Fixed up level select icons, level select title after playing around with fonts & deciding what looks good
- Added character select title
- Added animation and Pokedex entries when character is selected via mouse input
- Organized a lot (regarding helper methods) to make code look less ugly
- Basically finished all of StartScreen, LevelSelect (minus loading in actual levels)

:doughnut:
- Decide to have character select screen on level screen as well

### DAY 10 Sunday 5/26/19
:cookie:
- Create & update README
- Did sprites for Mewoth & Spoink, uploaded to Drive

:icecream:
- Fix branches to reflect merging and such

:doughnut:
- Decided to include Meowth & Spoink as extra enemy Pokemon

### DAY 11 Monday 5/27/19
:cookie:
- Added Pause menu & is mostly functional (requires level start method to be implemented), return to level select and unpause button works though! c:

### DAY 12 Tuesday 5/28/19
:cookie:
- Did file reorganization (in levelEditor.pde, temporary level1); sprites are all in one folder and is accessible through loadImage("Sprites/(name)/(movement")
- Created images.pde, importImages.pde 
  - images.pde allows for initialization of PImage for each individual sprite 
  - importImages.pde allows for loadImage() to be called for each individual sprite, references sprites in sprites folder
- imported sprites for the three playable Pokemon
- implemented the other two playable Pokemon. Players now have access to three different Pokemon to play as!

### DAY 13 Wednesday 5/29/19
:cookie:
- Did some spriteing with Crystals, Ditto sprites
- Finished importing all the other sprites (Mamoswine, Spoink, Crystals, Ditto, Meowth, Tentacruel) into images.pde and importImages.pde
- Did some code organization
- Fixed bugs with the Pause button. Now does not work on start screen and level select screen, as intended
- Started to play around with level2

:doughnut:
- Discussed designs of levels 2-5

### DAY 14 Thursday 5/30/19
:cookie:
- Used photoshop to get and fix proper wall/border sprites to look natural and good
- Wall sprites alternate between two possible sprites based on randomness
- Played around with level2, started on spike generation 
- Made level a nonabstract class, children subclasses level1,level2, etc

