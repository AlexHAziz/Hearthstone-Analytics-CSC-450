#require 'hero.rb'
class Card
  name = ''
  cost = 0
  type = ''
  race = '' # beast, murlock etc. 
  hero_class = '' # mage, hunter, etc.
  attack = 0
  health = 0
  durablity = 0
  keywords = {} #hash of effect names that point to their effect
end