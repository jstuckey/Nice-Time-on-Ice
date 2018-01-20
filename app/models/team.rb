# Holds information about an NHL team
class Team < ActiveRecord::Base
  has_many :season_teams
  has_many :seasons, through: :season_teams

  validates :name, uniqueness: true
  validates :abbreviation, uniqueness: true

  def full_name
    "#{city} #{name}"
  end
end
