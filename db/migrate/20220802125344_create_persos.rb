class CreatePersos < ActiveRecord::Migration[6.1]
  def change
    create_table :persos do |t|
      t.references :user, null: false, foreign_key: true
      t.time :time_played, null: false, default: 0
      t.string :pseudo, null: false
      # need to add races and classes
      t.integer :lvl, default: 0
      t.integer :exp
      t.integer :exp_needed
      t.integer :deaths

      t.timestamps
    end
  end
end
