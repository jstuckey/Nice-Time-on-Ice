class Links::Misc::WoiTeamHistory < Links::Base

  def site_name
    "War-on-Ice"
  end

  def description
    "Team History"
  end

  def url
    "http://war-on-ice.com/teambygame.html?" \
    "team=#{team.abbreviation}"
  end

  def group
    1
  end

  def position
    5
  end

end
