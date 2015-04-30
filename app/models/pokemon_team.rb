class PokemonTeam < ActiveRecord::Base
  belongs_to :pokemon, inverse_of: :pokemon_teams
  belongs_to :team, inverse_of: :pokemon_teams
end
