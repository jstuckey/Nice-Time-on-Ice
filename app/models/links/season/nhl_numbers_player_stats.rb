class Links::Season::NhlNumbersPlayerStats < Links::Base

  def site_name
    "NHL Numbers"
  end

  def description
    "Player Stats"
  end

  def url
    "http://stats.nhlnumbers.com/player_stats/" \
    "year/#{season.year_end}"
  end

  def group
    9
  end

  def position
    2
  end

end
