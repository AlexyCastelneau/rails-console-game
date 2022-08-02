class CreateEnemyGears < ActiveRecord::Migration[6.1]
  def change
    create_table :enemy_gears do |t|
      t.references :enemy, null: false, foreign_key: true
      t.integer :armor_value
      t.integer :primary_weapon
      t.integer :secondary_weapon

      t.timestamps
    end
  end
end
