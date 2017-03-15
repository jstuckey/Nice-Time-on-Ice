class Links::Game::HvTeamDash < Links::Base

  include Links::Helpers

  def site_name
    "Hockey Viz"
  end

  def description
    "Team Overview"
  end

  def url
   "http://hockeyviz.com/team/" \
     "#{team.abbreviation}/" \
     "#{season.year_start.to_s[2, 2]}" \
     "#{season.year_end.to_s[2, 2]}"
  end

  def group
    10
  end

  def position
    0
  end

end
