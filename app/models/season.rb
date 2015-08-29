class Season < ActiveRecord::Base
  has_many :games
  has_many :season_teams
  has_many :teams, through: :season_teams

  validates :year_start, uniqueness: true
  validates :year_end, uniqueness: true

  def to_s
    "#{year_start}#{year_end}"
  end
end
