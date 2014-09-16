class minion < card
  attack = 0
  health = 0
  turns_in_play = 0
  attacked_this_turn = false
  
  def summon 
    
  end 

  def attack(target)
    if turn_played > 0 or keywords.contains('charge')
      if attacked_this_turn == false
        target.health = target.health - attack
        self.health = self.health - target.attack
        attacked_this_turn = true
      else
        raise 'minion already attacked'
      end
    else
      raise 'minion cant attack yet'
    end
  end

end 