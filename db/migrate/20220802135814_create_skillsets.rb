class CreateSkillsets < ActiveRecord::Migration[6.1]
  def change
    create_table :skillsets do |t|
      t.references :perso, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
