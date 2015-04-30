class Move < ActiveRecord::Base
  has_many :pokemon_moves, through: :move
  has_many :pokemons, through: :pokemon_moves, inverse_of: :moves

  def self.make_new(poke_struct)
    move = self.new()
    move.accuracy = poke_struct.accuracy
    move.power = poke_struct.power
    move.pp = poke_struct.pp
    move.description = poke_struct.description
    move.name = poke_struct.name
    move.category = poke_struct.category
    move.national_id = poke_struct.national_id
    move.save
  end
end
