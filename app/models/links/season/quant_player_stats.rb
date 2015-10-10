class Links::Season::QuantPlayerStats < Links::Base

  include Links::Helpers

  def site_name
    "Quant Hockey"
  end

  def description
    "Player Stats"
  end

  def url
    "http://www.quanthockey.com/nhl/seasons/" \
    "#{season.year_start}-#{season.year_end.to_s[2, 2]}-" \
    "nhl-players-" \
    "#{game_type == 3 ? 'playoff-' : ''}" \
    "stats.html"
  end

  def group
    8
  end

  def position
    1
  end

end
