class Links::Season::HaIndividualStats < Links::Base

  include Links::Helpers

  def site_name
    "Hockey Analysis"
  end

  def description
    "Individual Stats"
  end

  def url
    "http://stats.hockeyanalysis.com/ratings.php?" \
    "db=#{season.year_start}#{season.year_end.to_s[2,2]}" \
    "&sit=5v5&type=individual&teamid=#{ha_team_number}" \
    "&pos=skaters&minutes=50&disp=1"
  end

  def group
    3
  end

  def position
    2
  end

end
