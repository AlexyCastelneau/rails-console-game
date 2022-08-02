class CreateElixirs < ActiveRecord::Migration[6.1]
  def change
    create_table :elixirs do |t|

      t.timestamps
    end
  end
end
