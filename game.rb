class game
  heroes = []
  game_battlefield = [] # get battlefields from each hero
  action_queue = Queue.new
  current_turn_number = 0
  current_player = #hero who's turn it is
  waiting_player = 
  
  # setup game here
  def setup(player1, player2)
    flip_coin(player1,player2)
    current_player.health = waiting_player.health = 30
    current_player.shuffle
    waiting_player.shuffle
    current_player.draw_card(3)
    waiting_player.draw_card(4)
  end
  
  # play game here
  def play
    # check players life
    if current_player.health <= 0 
      puts "#{waiting_player.name} wins."
      break 
    elsif waiting_player.health <= 0 
      puts "#{current_player.name} wins."
      break 
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
    current_player.battlefield.each |character|
      character.attacked_this_turn = false
    end
    playable_cards = current_player.determine_playable_cards
    possible_attackers = current_player.determine_possible_attackers
    possible_targets = current_player.determine_tragetable_characters
    end_of_turn_effects = [] # append effects to this array
    game_battlefield.each |item|
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
  
  def flip_coin
    if random.rand(1..2) == 1
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
      moves.append = {card}
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
  end
end
