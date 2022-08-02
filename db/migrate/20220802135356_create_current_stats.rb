class CreateCurrentStats < ActiveRecord::Migration[6.1]
  def change
    create_table :current_stats do |t|
      t.references :perso, null: false, foreign_key: true
      t.integer :current_hp
      t.integer :max_hp
      t.integer :current_mp
      t.integer :max_mp
      t.integer :str
      t.integer :dex
      t.integer :vit
      t.integer :int
      t.integer :wis
      t.integer :armor_value

      t.timestamps
    end
  end
end
