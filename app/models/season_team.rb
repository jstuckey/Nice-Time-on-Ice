class SeasonTeam < ActiveRecord::Base
  belongs_to :season
  belongs_to :team

  validates :season_id, uniqueness: { scope: :team_id }
end
