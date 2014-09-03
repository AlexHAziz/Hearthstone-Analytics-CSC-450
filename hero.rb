class Hero
  name = ''
  hero_class = ''
  health = 0
  hand = []
  deck = [] #read in deck
  total_mana = 0
  mana_available = 0
  cards_used_or_discarded = []
  battlefield = [] # card hero has in play
  
  def draw_card
    hand.append(deck.pop)
  end
  
  def shuffle
    # randomize deck
  end
  
  def hero_ability
  end 
end
