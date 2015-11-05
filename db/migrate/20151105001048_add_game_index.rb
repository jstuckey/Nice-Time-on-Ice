class AddGameIndex < ActiveRecord::Migration
  def change
    add_index :games, :game_number
    add_index :games, :away_team_id
    add_index :games, :home_team_id
  end
end
