class CreateEnemies < ActiveRecord::Migration[6.1]
  def change
    create_table :enemies do |t|
      t.string :type, null: false
      t.string :name, null: false
      t.string :difficulty, null: false
      t.integer :lvl, default: 0

      t.timestamps
    end
  end
end
