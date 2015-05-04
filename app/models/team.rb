class Team < ActiveRecord::Base
  belongs_to :user, inverse_of: :team
  has_many :pokemon_teams, inverse_of: :team
  has_many :pokemons, through: :pokemon_teams, inverse_of: :teams
  validates :user_id, presence: true

  def add(pokemon_id)
    self.pokemons << Pokemon.find(pokemon_id) unless full?
  end

  def count
    self.pokemons.count
  end

  def remove(pokemon_id)
    self.pokemon_teams.destroy(PokemonTeam.find_by(pokemon_id: pokemon_id))
  end

###
  def total_hit_points
    self.pokemons.reduce(0) do |total, poke|
      total + poke.hit_points
    end
  end

  def total_attack
    self.pokemons.reduce(0) do |total, poke|
      total += poke.attack
    end
  end

  def total_defense
    self.pokemons.reduce(0) do |total, poke|
      total += poke.defense
    end
  end

  def total_special_attack
    self.pokemons.reduce(0) do |total, poke|
      total += poke.special_attack
    end
  end

  def total_special_defense
    self.pokemons.reduce(0) do |total, poke|
      total += poke.special_defense
    end
  end

  def total_speed
    self.pokemons.reduce(0) do |total, poke|
      total += poke.speed
    end
  end
###

  private

  def full?
    count >= 6
  end
end
