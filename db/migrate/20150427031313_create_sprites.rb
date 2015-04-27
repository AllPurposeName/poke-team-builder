class CreateSprites < ActiveRecord::Migration
  def change
    create_table :sprites do |t|
      t.integer :national_id
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
