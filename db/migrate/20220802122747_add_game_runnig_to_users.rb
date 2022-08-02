class AddGameRunnigToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :game_running, :boolean, null: false, default: false
  end
end
