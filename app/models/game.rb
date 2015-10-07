class Game < ActiveRecord::Base
  belongs_to :season
  belongs_to :away_team, class_name: "Team", foreign_key: "away_team_id"
  belongs_to :home_team, class_name: "Team", foreign_key: "home_team_id"

  validates :game_number, uniqueness: true
end
