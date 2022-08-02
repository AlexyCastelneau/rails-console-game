class CreatePassives < ActiveRecord::Migration[6.1]
  def change
    create_table :passives do |t|

      t.timestamps
    end
  end
end
