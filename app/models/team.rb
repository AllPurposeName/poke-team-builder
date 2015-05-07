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

  def remove_all
    self.pokemon_teams.destroy_all
  end

  def full?
    count >= 6
  end

  def empty?
    count == 0
  end
end

