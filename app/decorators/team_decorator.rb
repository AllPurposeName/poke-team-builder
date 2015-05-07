class TeamDecorator < Draper::Decorator
  decorates :team
  delegate :pokemons

  def team_total
    pokemon_attributes = [:hit_points, :attack, :defense, :special_attack, :special_defense, :speed]
    OpenStruct.new(pokemon_attributes.each_with_object(Hash.new(0)) { |attr, hash| hash[attr] = total(attr) })
  end

  def total(attribute)
    self.pokemons.reduce(0) do |total, poke|
      total + poke.send(attribute)
    end
  end

  def average(attribute)
    self.total(attribute) / self.pokemons.count
  end
end
