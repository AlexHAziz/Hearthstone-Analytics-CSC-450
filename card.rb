require 'hero.rb'
class card
  cost = 0
  name = ''
  type = #class of card
  keywords = []
  
  def initialize( card_cost, card_name, card_type, card_keywords) 
    cost     = card_cost
    name     = card_name
    type     = card_type
    keywords = card_keywords
  end
end