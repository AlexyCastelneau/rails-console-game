class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.boolean :consumable, null: false
      t.string :properties

      t.timestamps
    end
  end
end
