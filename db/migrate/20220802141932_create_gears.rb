class CreateGears < ActiveRecord::Migration[6.1]
  def change
    create_table :gears do |t|
      t.references :perso, null: false, foreign_key: true
      t.integer :head
      t.integer :body
      t.integer :hands
      t.integer :legs
      t.integer :feet
      t.integer :primary_weapon
      t.integer :secondary_weapon

      t.timestamps
    end
  end
end
