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
      puts "#{waiting_player.name} winds."
      break 
    elsif waiting_player.health <= 0 
      puts "#{current_player.name} winds."
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
    while turn.over == false

    end 
    game_battlefield.each |item|
      if item.keywords.contains('End of turn')
        item.keyowords['End of turn']
      end
    end
    #end of turn effects 
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
  
end
