class druid < hero 
  def hero_ability
    attack = 1
    armour = amour + 1
    keywords.append{"End of turn" => attack = 0}
  end 
end