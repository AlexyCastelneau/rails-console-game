class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.text :description
      t.boolean :active, null: false
      t.integer :skill

      t.timestamps
    end
  end
end
