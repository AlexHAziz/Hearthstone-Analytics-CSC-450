class shaman < hero 
  def hero_ability(target)
    totems = ['Healing Totem', 'Searinhg Totem', 'Stoneclaw Totem', 'Wrath of Air Totem']
    battlefield.append(totems.sample)
  end 
end