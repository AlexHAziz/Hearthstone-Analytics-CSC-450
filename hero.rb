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
  attacked_this_turn = false
  
  def draw_card(number_of_cards)
    for i in 1..number_of_cards
      hand.append(deck.pop)
    end
  end
  
  def shuffle
    # randomize deck
  end
  
  def hero_ability
  end 
  
  def attack
    if attacked_this_turn == false
      target.health = target.health - attack
      self.health = self.health - target.attack
      attacked_this_turn = true
    else
      raise 'hero already attacked'
    end
  end
  
  def determine_playable_cards
    playable_cards = []
    hand.each |card_in_hand|
      if card_in_hand.cost < mana_available
        playable_cards.append
      end 
    end
    playable_cards
  end
end
