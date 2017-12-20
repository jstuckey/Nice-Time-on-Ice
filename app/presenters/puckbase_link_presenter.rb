class PuckbaseLinkPresenter < LinkPresenterBase
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
    %W[
      http://puckbase.com/stats/scoring?team=#{team.abbreviation}&season=#{game_type}&year=#{season.year_start}
      http://puckbase.com/stats/possession?team=#{team.abbreviation}&season=#{game_type}&year=#{season.year_start}
      http://puckbase.com/stats/goalies?team=#{team.abbreviation}&season=#{game_type}&year=#{season.year_start}
      http://puckbase.com/stats/faceoff-percentage?team=#{team.abbreviation}&season=#{game_type}&year=#{season.year_start}
      http://puckbase.com/stats/post-faceoff-possession?team=#{team.abbreviation}&season=#{game_type}&year=#{season.year_start}
      http://puckbase.com/stats/faceoff-hand?team=#{team.abbreviation}&season=#{game_type}&year=#{season.year_start}
      http://puckbase.com/stats/team-faceoff-splits?team=#{team.abbreviation}&season=#{game_type}&year=#{season.year_start}
      http://puckbase.com/stats/team-lines?team=#{team.abbreviation}&season=#{game_type}&year=#{season.year_start}
      http://puckbase.com/stats/team-scoring&season=#{game_type}&year=#{season.year_start}
      http://puckbase.com/stats/team-faceoffs&season=#{game_type}&year=#{season.year_start}
    ]
  end
end
