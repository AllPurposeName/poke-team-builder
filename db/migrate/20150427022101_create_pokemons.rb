class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer :national_id
      t.integer :special_attack
      t.integer :special_defense
      t.integer :attack
      t.integer :defense
      t.integer :speed
      t.integer :hit_points
      t.string :name

      t.timestamps null: false
    end
  end
end
