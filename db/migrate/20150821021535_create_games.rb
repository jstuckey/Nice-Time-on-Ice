class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :game_number
      t.date    :date
      t.boolean :playoffs

      t.belongs_to :season, index: true
      t.integer :away_team_id #belongs_to
      t.integer :home_team_id #belongs_to

      t.timestamps null: false
    end
  end
end
