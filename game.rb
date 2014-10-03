require 'json'

# Need to add methods to load decklists 
# Need to add methods to load master list of cards from json
# Need to add the decision tree

class Game
  heroes = []
  game_battlefield = [] # get battlefields from each hero
  current_turn_number = 0
  current_player = nil #hero who's turn it is
  waiting_player = nil

  #read deck files and make heroes and their decks 
  def make_player(deck_file)
    hero = nil
    i = 0 
    deck_file.each_line do |line| 
      i = i + 1
      if i == 1
        hero = Hero.new(JSON.parse(line))
      else
        hero.deck.append(JSON.parse(line))
      end
    end
  end
  
  # setup game here
  def setup(player1, player2)
    flip_coin(player1,player2)
    current_player.health = waiting_player.health = 30
    current_player.shuffle
    waiting_player.shuffle
    current_player.draw_card(3)
    waiting_player.draw_card(4)
    game_battlefield.append(current_player)
    game_battlefield.append(waiting_player)
  end
  
  # play game here
  def play
    # check players life
    if current_player.health <= 0 
      abort("#{waiting_player.name} wins.")
    elsif waiting_player.health <= 0 
      abort("#{current_player.name} wins.")
    else
      current_player.turn
    end
  end
  
  def turn
    turn_number = turn_number + 1
    current_player.draw_card
    if current_player.total_mana < 10 
      current_player.total_mana = current_player.total_mana + 1
    end
    current_player.mana_available = current_player.total_mana
    current_player.battlefield.each do |character|
      character.attacked_this_turn = false
    end
    playable_cards = current_player.determine_playable_cards
    possible_attackers = current_player.determine_possible_attackers
    possible_targets = current_player.determine_tragetable_characters
    end_of_turn_effects = [] # append effects to this array
    game_battlefield.each do |item|
      if item.keywords.contains('End of turn')
        item.keyowords['End of turn']
        end_of_turn_effects.append[item]
      end
    end
    possible_moves = determine_moves(current_player.hero_ablity,playable_cards,possible_attackers,possible_targets,end_of_turn_effects)
    move = pick_move(possible_moves)
    execute_move(move)
    end_turn()
  end
  
  def flip_coin(player1,player2)
    if Random.rand(1..2) == 1
      current_player = player1
      waiting_player = player2
    else
      current_player = player2
      waiting_player = player1
    end
    waiting_player.hand.append.('The Coin')
  end
  
  def determine_moves(cards)
    moves = []
    # add all combinations of moves calculated from playable cards to a list of possible moves
    # right now just plays a card needs to make and play cards after attacks as well
    cards.each do |card|
      #determine moves if that card was played first
    end 
  end
  
  def pick_move (possible_moves)
    # determine which move is most advantageous based on both players life, cards in hand, cards in play
  end
  
  def execute_move (move)
    # make that move and end turn 
  end
  
  def end_turn
    # run all end of turn effects 
    current_hero.attack = 0 
    turn = turn + 1
  end

end
