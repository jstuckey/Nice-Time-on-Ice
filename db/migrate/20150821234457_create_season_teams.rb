class CreateSeasonTeams < ActiveRecord::Migration
  def change
    create_table :season_teams do |t|
      t.belongs_to :team, index: true
      t.belongs_to :season, index: true

      t.timestamps null: false
    end
  end
end
