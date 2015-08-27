class Team < ActiveRecord::Base
  has_many :season_teams
  has_many :seasons, through: :season_teams

  validates :name, uniqueness: true
  validates :abbreviation, uniqueness: true

  def games
    Game.where("away_team_id = ? OR home_team_id = ?", self.id, self.id).order(:date)
  end
end
