=begin
  This class mocks the abilities of a hero in the game and keeps track of all importan hero data.
=end
class Hero
  attr_accessor :name
  attr_accessor :hero_class
  attr_accessor :health
  attr_accessor :amour
  attr_accessor :attack
  attr_accessor :weapon
  attr_accessor :hand
  attr_accessor :deck
  attr_accessor :total_mana
  attr_accessor :mana_available
  attr_accessor :cards_used_or_discarded
  attr_accessor :battlefield # cards hero has in play
  attr_accessor :attacked_this_turn
  
  # The constructor of this class
  # does basic setup such as initializing variables. 
  def initialize(selected_class, decklist)
    @hero_class = selected_class
    case
    when @hero_class == 'druid'
      @name = 'Malfurion Stormrage'
    when @hero_class == 'hunter'
      @name = 'Rexxar'
    when @hero_class == 'mage'
      @name = 'Jaina Proudmoore'
    when @hero_class == 'paladin'
      @name = 'Uther Lightbringer'
    when @hero_class == 'priest'
      @name = 'Anduin Wrynn'
    when @hero_class == 'rouge'
      @name = 'Valeera Sanguinar'
    when @hero_class == 'shaman'
      @name = 'Thrall'
    when @hero_class == 'warlock'
      @name = 'Guldan'
    when @hero_class == 'warrior'
      @name = 'Garrosh Hellscream'
    end
    @deck                    = decklist
    @hand                    = []
    @health                  = 0
    @amour                   = 0
    @attack                  = 0
    @weapon                  = ''
    @total_mana              = 0
    @mana_available          = 0
    @cards_used_or_discarded = []
    @battlefield             = [] # card hero has in play
    @attacked_this_turn      = false
  end
  
  # Draws a given number of cards
  def draw_card(number_of_cards)
    for i in 1..number_of_cards
      @hand.push(@deck.pop)
    end
  end
  
  # Randomizes the deck
  def shuffle
    # randomize @deck
  end

  # Determines and executes the hero's ability.
  def hero_ability(target)
    case
    when @hero_class == 'druid'
      @attack = 1
      @armour = amour + 1
    when @hero_class == 'hunter'
      target.health = target.health - 2
    when @hero_class == 'mage'
      target.health = target.health - 2
    when @hero_class == 'paladin'
      @battlefield.push("Silver Hand Recruit")
    when @hero_class == 'priest'
      target.health = target.health + 2
    when @hero_class == 'rouge'
      @weapon = "Dagger Mastery"
    when @hero_class == 'shaman'
      totems = ['Healing Totem', 'Searinhg Totem', 'Stoneclaw Totem', 'Wrath of Air Totem']
      @battlefield.push(totems.sample)
    when @hero_class == 'warlock'
      darw_card(2)
      @health = @health - 2
    when @hero_class == 'warrior'
      @armour = @armour + 2
    end
  end 

  # Allows the hero to attack a given target
  def attack(target)
    if @attacked_this_turn == false
      target.health       = target.health - @attack
      @health             = @health - target.attack
      @attacked_this_turn = true
    else
      raise 'hero already attacked'
    end
  end
  
  # Determines and returns a list of playable cards
  def determine_playable_cards
    playable_cards = []
    hand.each do |card_in_hand|
      if card_in_hand["cost"] <= @mana_available
        playable_cards.push(card_in_hand)
      end 
    end
    if mana_available >= 2
      playable_cards.push("hero ablity")
    end
    playable_cards
  end
  
  # Determines and returns a list of playable cards
  def determine_possible_attackers(opponent)
    attackers = []
    opponent.battlefield.each do |card_in_play|
        attackers.push(card_in_play)
    end
    if opponent.weapon != ''
        attackers.push(opponent)
    end
    attackers
  end

  def determine_tragetable_characters(opponent)
      targetable_characters = []
      opponent.battlefield.each do |card_in_play|
          targetable_characters.push(card_in_play)
      end
      targetable_characters.push(opponent)
      targetable_characters 
  end
end
