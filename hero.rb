# Methods need to be filled in
class Hero
  name = ''
  hero_class = ''
  health = 0
  amour = 0
  hand = []
  @deck = [] #read in deck
  total_mana = 0
  mana_available = 0
  cards_used_or_discarded = []
  battlefield = [] # card hero has in play
  attacked_this_turn = false
  
  def initialize(selected_class, decklist)
    hero_class = selected_class
    case
    when hero_class = 'druid'
      name = 'Malfurion Stormrage'
    when hero_class = 'hunter'
      name = 'Rexxar'
    when hero_class = 'mage'
      name = 'Jaina Proudmoore'
    when hero_class = 'paladin'
      name = 'Uther Lightbringer'
    when hero_class = 'priest'
      name = 'Anduin Wrynn'
    when hero_class = 'rouge'
      name = 'Valeera Sanguinar'
    when hero_class = 'shaman'
      name = 'Thrall'
    when hero_class = 'warlock'
      name = 'Guldan'
    when hero_class = 'warrior'
      name = 'Garrosh Hellscream'
    end
    deck       = decklist
  end
  def deck
    @deck 
  end
  
  def draw_card(number_of_cards)
    for i in 1..number_of_cards
      hand.append(deck.pop)
    end
  end
  
  def shuffle
    # randomize deck
  end

  def hero_ability(target)
    case
    when hero_class = 'druid'
      attack = 1
      armour = amour + 1
    when hero_class = 'hunter'
      target.health = target.health - 2
    when hero_class = 'mage'
      target.health = target.health - 2
    when hero_class = 'paladin'
      battlefield.append("Silver Hand Recruit")
    when hero_class = 'priest'
      target.health = target.health + 2
    when hero_class = 'rouge'
      weapon = "Dagger Mastery"
    when hero_class = 'shaman'
      totems = ['Healing Totem', 'Searinhg Totem', 'Stoneclaw Totem', 'Wrath of Air Totem']
      battlefield.append(totems.sample)
    when hero_class = 'warlock'
      darw_card(2)
      health = health - 2
    when hero_class = 'warrior'
      armour = armour + 2
    end
  end 

  def attack
    if attacked_this_turn == false
      target.health = target.health - attack
      self.health   = self.health - target.attack
      attacked_this_turn = true
    else
      raise 'hero already attacked'
    end
  end
  
  def determine_playable_cards
    playable_cards = []
    hand.each do |card_in_hand|
      if card_in_hand.cost < mana_available
        playable_cards.append
      end 
    end
    playable_cards
  end
  
  # Fill in
  def determine_possible_attackers
  end

  # Fill in
  def determine_tragetable_characters
  end
end