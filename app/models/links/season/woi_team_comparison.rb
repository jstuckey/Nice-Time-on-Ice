class Links::Season::WoiTeamComparison < Links::Base

  include Links::Helpers

  def site_name
    "War-on-Ice"
  end

  def description
    "Team Comparison"
  end

  def url
    "http://war-on-ice.com/teamtable.html?" \
    "playoffs=#{full_text_game_type}&" \
    "start0=#{season}&end0=#{season}"
  end

  def group
    5
  end

  def position
    3
  end

end
