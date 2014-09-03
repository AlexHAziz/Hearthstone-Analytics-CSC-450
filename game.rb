class game
  heroes = []
  game_battlefield = [] # get battlefields from each hero
  action_queue = Queue.new
  current_turn_number = 0
  current_player = #hero who's turn it is
  
  # setup game here
  def setup
  end
  
  # play game here
  def play
    # check players life
    # if no is at zero let player who's turn it is, take their turn
  end
  
  def turn
    current_player.draw_card
    current_player.mana_available = current_player.total_mana
    while turn.over == false
    
    end 
    #end of turn effects 
  end
end
