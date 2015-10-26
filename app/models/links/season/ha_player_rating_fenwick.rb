class Links::Season::HaPlayerRatingFenwick < Links::Base

  include Links::Helpers

  def site_name
    "Hockey Analysis"
  end

  def description
    "Player Ratings (Fenwick)"
  end

  def url
    "http://stats.hockeyanalysis.com/ratings.php?" \
    "db=#{season.year_start}#{season.year_end.to_s[2, 2]}" \
    "&sit=5v5&type=fenwick&teamid=#{ha_team_number}&" \
    "pos=skaters&minutes=50&disp=1"
  end

  def group
    3
  end

  def position
    1
  end

end
