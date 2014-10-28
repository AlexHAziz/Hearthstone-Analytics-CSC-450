Division of labor
	Listed below is generally whats left to be coded in the game. I have distributed the work load between everybody as equitably as possible. This should result in equal code contribution. 

Coding process (Please follow this procedure when adding features)
	- make a new branch for the feature i.e. git checkout -b my_new_feature 
	- write code
	- run and test code
	- stage files for commit i.e. git add -a
	- commit files i.e. git commit
	- Type a detailed commit message in the format (subject, blank line, body) 
	- Create a patch
		- git log -1 > my_patch.patch
		- git diff my_branch_name..master > my_patch.patch
	- Email me your patch file 
	- When I review it I will email you back a r=me
	- Once you receive the r=me merge the changes with master
		- git checkout master
		- git merge my_branch_name
	- Push the changes i.e.	git push
 

Conner *has the least difficult coding in game itself because he has to write the tests.
	- Attack method (goes in game.rb)
		(All these are just rules governing how characters can attack)
		- Charge method
		- Taunt method
		- Divine Shield
		- Windfury method
	- Deal Damage method (goes in game.rb)
	- Edit Decks method (goes in deck_builder.rb)
	- Tests 

O’Malley
	- Battlecry method (goes in game.rb)
	- Death rattle method (goes in game.rb)
	- Pick Move method (goes in game.rb)
	- Shuffle deck method (goes in hero.rb)
	- Hard code cards*

Tom
	- Determine Hostile Targets method (goes in hero.rb)
	- Determine Friendly Targets method (goes in hero.rb)
	- Determine Playable Cards method (goes in hero.rb)
	- Turn & End Turn method (goes in game.rb)
	- Hard code cards*

*Note: I have removed all cards except the basic set from the json and all that needs to be done from here is to reformat their text so they are usable by the methods you guys will write. Taking that into consideration I have left the reformatting which will likely only effect about 50% of the cards to O’Malley and Tom as they will be writing most of the methods effected by this reformat. 