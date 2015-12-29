class Game < ActiveRecord::Base
  belongs_to :season
  belongs_to :away_team, class_name: "Team", foreign_key: "away_team_id"
  belongs_to :home_team, class_name: "Team", foreign_key: "home_team_id"

  validates :game_number, uniqueness: true, presence: true
  validates :date, presence: true
  validates :season_id, presence: true
  validates :away_team_id, presence: true
  validates :home_team_id, presence: true

  def to_s
    "#<Game: #{game_number}>"
  end
end
