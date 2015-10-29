class Links::Season::HvTeamDash < Links::Base

  include Links::Helpers

  def site_name
    "Hockey Viz"
  end

  def description
    "Team Dashboard"
  end

  def url
   "http://hockeyviz.com/teamHtml/teamDash-" \
   "#{season.year_start.to_s[2, 2]}" \
   "#{season.year_end.to_s[2, 2]}-" \
   "#{alternate_team_abbreviation}" \
   ".html"
  end

  def group
    10
  end

  def position
    0
  end

end
