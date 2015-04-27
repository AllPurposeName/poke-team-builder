class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :accuracy
      t.integer :power
      t.integer :pp
      t.text :description
      t.string :category
      t.string :name
      t.integer :national_id

      t.timestamps null: false
    end
  end
end
