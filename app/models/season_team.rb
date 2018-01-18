# Joins seasons to teams - not all teams play in a season
# For example, the Atlanta Thrashers moved to Winnipeg and
# the Vegas Golden Knights are an expansion franchise
class SeasonTeam < ActiveRecord::Base
  belongs_to :season
  belongs_to :team

  validates :season_id, uniqueness: { scope: :team_id }
end
