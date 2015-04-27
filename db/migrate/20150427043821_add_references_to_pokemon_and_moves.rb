class AddReferencesToPokemonAndMoves < ActiveRecord::Migration
  def change
    create_table :pokemon_moves do |t|
      t.references :pokemon
      t.references :move
    end
    add_reference :moves, :pokemon, index: true
    add_reference :pokemons, :move, index: true
    add_reference :sprites, :pokemon, index: true
  end
end
