class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.integer :national_id
      t.string :name
      t.string :ineffective
      t.string :no_effect
      t.string :super_effective
      t.string :weakness

      t.timestamps null: false
    end
  end
end
