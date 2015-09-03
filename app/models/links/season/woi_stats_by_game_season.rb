class Links::Season::WoiStatsByGameSeason < Links::Base

  include Links::Helpers

  def site_name
    "War-on-Ice"
  end

  def description
    "Stats by Game/Season"
  end

  def url
    "http://war-on-ice.com/teambygame.html?" \
    "team=#{alternate_team_abbreviation}"
  end

  def group
    5
  end

  def position
    0
  end

end
