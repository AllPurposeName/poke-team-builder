class TeamPresenter
  attr_reader :team

  def initialize(team)
    @team = team
  end

  def total_hit_points
    @team.pokemons.each_with_object do |poke, total|
      total += poke.hit_points
    end
  end

  def total_attack
    @team.pokemons.each_with_object do |poke, total|
      total += poke.attack
    end
  end

  def total_defense
    @team.pokemons.each_with_object do |poke, total|
      total += poke.defence
    end
  end

  def total_special_attack
    @team.pokemons.each_with_object do |poke, total|
      total += poke.special_attack
    end
  end

  def total_special_defense
    @team.pokemons.each_with_object do |poke, total|
      total += poke.special_defense
    end
  end

  def total_speed
    @team.pokemons.each_with_object do |poke, total|
      total += poke.speed
    end
  end
end
