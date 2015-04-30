class PokemonMove < ActiveRecord::Base
  belongs_to :move, inverse_of: :pokemon_moves
  belongs_to :pokemon, inverse_of: :pokemon_moves
end
