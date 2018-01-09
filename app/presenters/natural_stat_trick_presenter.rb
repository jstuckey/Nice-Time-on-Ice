class NaturalStatTrickPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "Game Statistics",
      "Player Totals - On-Ice",
      "Player Totals - Individual",
      "Player Totals - Bios",
      "Player Index",
      "Line Tool",
      "Team Totals"
    ]
  end

  def links
    %W[
      http://naturalstattrick.com/game.php?season=#{season}&game=#{game_number_without_year_and_zero}
      http://naturalstattrick.com/playerteams.php?stdoi=oi&season=#{season}&stype=#{game_type}&team=#{team.abbreviation}
      http://naturalstattrick.com/playerteams.php?stdoi=std&season=#{season}&stype=#{game_type}&team=#{team.abbreviation}
      http://naturalstattrick.com/playerteams.php?stdoi=bio&season=#{season}&stype=#{game_type}&team=#{team.abbreviation}
      http://naturalstattrick.com/playerlist.php?season=#{season}
      http://naturalstattrick.com/linestats.php?season=#{season}&stype=#{game_type}&team=#{team.abbreviation}
      http://naturalstattrick.com/teamtable.php?season=#{season}&stype=#{game_type}
    ]
  end
end
