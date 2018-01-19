# Constructs links to Puckbase
class PuckbaseLinkPresenter < LinkPresenterBase
  LINK_BASE = "http://puckbase.com/stats".freeze

  # rubocop:disable MethodLength
  def names
    [
      "Scoring",
      "Possession",
      "Goalies",
      "Faceoff Percentage",
      "Post-faceoff Percentage",
      "Faceoff Handedness Splits",
      "Faceoff Team Splits",
      "Faceoff Line Combinations",
      "Team Scoring",
      "Team Faceoffs"
    ]
  end

  def links
    [
      scoring,
      possession,
      goalies,
      faceoff,
      post_faceoff,
      faceoff_handedness,
      faceoff_team_splits,
      faceoff_lines,
      team_scoring,
      team_faceoffs
    ]
  end

  def scoring
    "#{LINK_BASE}/scoring?team=#{team.abbreviation}" \
      "&season=#{game_type}&year=#{season.year_start}"
  end

  def possession
    "#{LINK_BASE}/possession?team=#{team.abbreviation}" \
      "&season=#{game_type}&year=#{season.year_start}"
  end

  def goalies
    "#{LINK_BASE}/goalies?team=#{team.abbreviation}" \
      "&season=#{game_type}&year=#{season.year_start}"
  end

  def faceoff
    "#{LINK_BASE}/faceoff-percentage?team=#{team.abbreviation}" \
      "&season=#{game_type}&year=#{season.year_start}"
  end

  def post_faceoff
    "#{LINK_BASE}/post-faceoff-possession?team=#{team.abbreviation}" \
      "&season=#{game_type}&year=#{season.year_start}"
  end

  def faceoff_handedness
    "#{LINK_BASE}/faceoff-hand?team=#{team.abbreviation}" \
      "&season=#{game_type}&year=#{season.year_start}"
  end

  def faceoff_team_splits
    "#{LINK_BASE}/team-faceoff-splits?team=#{team.abbreviation}" \
      "&season=#{game_type}&year=#{season.year_start}"
  end

  def faceoff_lines
    "#{LINK_BASE}/team-lines?team=#{team.abbreviation}" \
      "&season=#{game_type}&year=#{season.year_start}"
  end

  def team_scoring
    "#{LINK_BASE}/team-scoring&season=#{game_type}&year=#{season.year_start}"
  end

  def team_faceoffs
    "#{LINK_BASE}/team-faceoffs&season=#{game_type}&year=#{season.year_start}"
  end
  # rubocop:enable MethodLength
end
