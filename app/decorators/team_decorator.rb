class TeamDecorator < Draper::Decorator
  decorates :team
  delegate :pokemons

  TeamDecorator.new(current_user.team, Team)

  def team_total
    pokemon_attributes = [:hit_points, :attack, :defense, :special_attack, :special_defense, :speed]
    OpenStruct.new(pokemon_attributes.each_with_object(Hash.new(0)) { |attr, hash| hash[attr] = total(attr) })
  end

  team_total.hit_point => 42
  team_total.hit_point => 42

 Stats = Struct.new(hit_points, attack)
 Stats.populate(42, 53)

 OpenS
  def class_is
    pokemon_attributes = [:hit_points, :attack, :defense, :special_attack, :special_defense, :speed]
    OpenStruct.new(pokemon_attributes.each_with_object(Hash.new(0)) { |attr, hash| hash[attr] = class_of(attr) })
  end

  def total(attribute)
    self.pokemons.reduce(0) do |total, poke|
      total + poke.send(attribute)
    end
  end

  def average(attribute)
    self.total(attribute) / self.pokemons.count
  end

  def class_of(attr)
    if total(attr) > 70
      "big_green"
    elsif total(attr) > 40
      "small_green"
    elsif total(attr) < 25
      "big_red"
    elsif total(attr) < 40
      "small_red"
    end
  end
end
