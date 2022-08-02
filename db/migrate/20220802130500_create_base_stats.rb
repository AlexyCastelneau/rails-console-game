class CreateBaseStats < ActiveRecord::Migration[6.1]
  def change
    create_table :base_stats do |t|
      t.references :perso, null: false, foreign_key: true
      t.integer :str, default: 10
      t.integer :dex, default: 10
      t.integer :vit, default: 10
      t.integer :int, default: 10
      t.integer :wis, default: 10

      t.timestamps
    end
  end
end
