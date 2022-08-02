class CreateEnemySkills < ActiveRecord::Migration[6.1]
  def change
    create_table :enemy_skills do |t|
      t.references :enemy, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
