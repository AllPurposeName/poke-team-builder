class CreatePokemonTeamsJoinTable < ActiveRecord::Migration
  def change
    create_table :pokemon_teams do |t|
      t.integer :team_id
      t.integer :pokemon_id
    end

    add_index :pokemon_teams, :team_id
    add_index :pokemon_teams, :pokemon_id
  end
end
