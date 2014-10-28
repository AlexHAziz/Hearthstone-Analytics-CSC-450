require 'json'

class Game
  attr_accessor :game_battlefield # get battlefields from each hero
  attr_accessor :current_turn_number
  attr_accessor :current_player # hero who's turn it is
  attr_accessor :waiting_player

  # setup game here
  def initialize(player1, player2)
    @game_battlefield = [] # get battlefields from each hero
    @current_turn_number = 0
    @current_player = nil #hero who's turn it is
    @waiting_player = nil

    if Random.rand(1..2) == 1
      puts "#{player1.name} goes 1st"
      @current_player = player1
      @waiting_player = player2
    else
      puts "#{player2.name} goes 1st"
      @current_player = player2
      @waiting_player = player1
    end
    @waiting_player.hand.push('The Coin')
    @current_player.health = @waiting_player.health = 30
    @current_player.shuffle
    @waiting_player.shuffle
    @current_player.draw_card(3)
    @waiting_player.draw_card(4)
    @game_battlefield.push(@current_player.battlefield)
    @game_battlefield.push(@waiting_player.battlefield)
  end

  # play game here
  def play
    # check players life
    game_over = false
    while game_over == false
      if @current_player.health <= 0 && @waiting_player.health > 0
        abort("#{@waiting_player.name} wins.")
      elsif @waiting_player.health <= 0 && current_player.health > 0
        abort("#{@current_player.name} wins.")
      else
        @current_turn_number = @current_turn_number + 1
        @current_player.draw_card(1)
        if @current_player.total_mana < 10 
          @current_player.total_mana = @current_player.total_mana + 1
        end
        @current_player.mana_available = @current_player.total_mana
        @current_player.battlefield.each do |character|
          character.attacked_this_turn = false
        end
        playable_cards = @current_player.determine_playable_cards
        possible_attackers = @current_player.determine_possible_attackers
        possible_targets = @current_player.determine_tragetable_characters
        end_of_turn_effects = [] # push effects to this array
        @game_battlefield.each do |player_battlefield|
          player_battlefield.each do |item|
            if item["text"].contains('End of turn')
              item.keyowords['End of turn']
              end_of_turn_effects.push[item]
            end
          end
        end
        possible_moves = determine_moves(playable_cards)
        move = pick_move(possible_moves)
        execute_move(move)
        end_turn()
      end
    end
  end
  
  def turn()
    pick_playable_card()
    attack()
    pick_playable_card()
    end_turn()
  end
  
  def determine_moves(playable_cards)
    moves = []
    # Turns 1-3 seriously consider doing nothing 
    if @current_turn_number < 6
      moves.push(nil)
    end
    playable_cards.each do |card|
      play_order = []
      play_order/push(card)
      moves.push.(play_order)
    end
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
    @current_player.attack = 0 
  end

end
