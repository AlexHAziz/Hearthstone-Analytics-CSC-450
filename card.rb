require 'hero.rb'
class card
  cost = 0
  name = ''
  keywords = {} #hash of effect names that point to their effect
  
  def initialize( card_cost, card_name, card_keywords) 
    cost     = card_cost
    name     = card_name
    keywords = card_keywords
  end
end