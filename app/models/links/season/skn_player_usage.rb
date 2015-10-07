class Links::Season::SknPlayerUsage < Links::Base

  include Links::Helpers

  def site_name
    "Some Kind of Ninja"
  end

  def description
    "Player Usage Chart"
  end

  def url
    "http://somekindofninja.com/nhl/usage.php?f1=" \
    "#{season.year_start}_#{alternate_game_type}&" \
    "f2=5v5&f3=&f5=#{alternate_team_abbreviation}&" \
    "f4=&f7=&update-filters=Update+Results"
  end

  def group
    4
  end

  def position
    0
  end

end
