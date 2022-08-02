class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :perso, null: false, foreign_key: true
      t.time :session_start, null: false, default: Time.now

      t.timestamps
    end
  end
end
