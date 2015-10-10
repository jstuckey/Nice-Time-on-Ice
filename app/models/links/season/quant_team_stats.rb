class Links::Season::QuantTeamStats < Links::Base

  include Links::Helpers

  def site_name
    "Quant Hockey"
  end

  def description
    "Team Stats"
  end

  def url
   "http://www.quanthockey.com/nhl/teams/" \
   "#{full_team_name}-players-" \
   "#{season.year_start}-" \
   "#{season.year_end.to_s[2, 2]}-" \
   "#{game_type == 3 ? 'playoff-' : ''}" \
   "nhl-stats.html"
  end

  def group
    8
  end

  def position
    0
  end

end
