class priest < hero 
  def hero_ability(target)
    target.health = target.health + 2
  end 
end