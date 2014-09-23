class mage < hero 
  def hero_ability(target)
    target.health = target.health - 1
  end 
end