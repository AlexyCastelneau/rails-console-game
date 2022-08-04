class CreatePersos < ActiveRecord::Migration[6.1]
  def change
    create_table :persos do |t|
      t.references :user, null: false, foreign_key: true
      t.float :time_played
      t.string :pseudo
      # need to add races and classes
      t.integer :lvl, default: 0
      t.integer :exp, default: 0
      t.integer :exp_needed, default: 100
      t.integer :deaths, default: 0

      t.timestamps
    end
  end
end
