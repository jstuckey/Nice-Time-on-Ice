class Links::Season::WoiPlayerComparison < Links::Base

  include Links::Helpers

  def site_name
    "War-on-Ice"
  end

  def description
    "Player Comparison"
  end

  def url
    "http://war-on-ice.com/playertable.html?team=" \
    "#{alternate_team_abbreviation}&start0=#{season}&end0=#{season}"
  end

  def group
    5
  end

  def position
    1
  end

end
