class CreateGearedStats < ActiveRecord::Migration[6.1]
  def change
    create_table :geared_stats do |t|
      t.references :perso, null: false, foreign_key: true
      t.integer :str
      t.integer :dex
      t.integer :vit
      t.integer :int
      t.integer :wis

      t.timestamps
    end
  end
end
