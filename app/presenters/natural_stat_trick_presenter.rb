class NaturalStatTrickPresenter < LinkPresenterBase
  include LinkHelpers

  LINK_BASE = "http://naturalstattrick.com".freeze

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
    [
      game_stats,
      player_on_ice,
      player_individual,
      player_bios,
      player_index,
      line_tool,
      team_totals
    ]
  end

  def game_stats
    "#{LINK_BASE}/game.php?season=#{season}&game=#{game_number_without_year_and_zero}"
  end

  def player_on_ice
    "#{LINK_BASE}/playerteams.php?stdoi=oi&season=#{season}&" \
      "stype=#{game_type}&team=#{team.abbreviation}"
  end

  def player_individual
    "#{LINK_BASE}/playerteams.php?stdoi=std&season=#{season}" \
      "&stype=#{game_type}&team=#{team.abbreviation}"
  end

  def player_bios
    "#{LINK_BASE}/playerteams.php?stdoi=bio&season=#{season}" \
      "&stype=#{game_type}&team=#{team.abbreviation}"
  end

  def player_index
    "#{LINK_BASE}/playerlist.php?season=#{season}"
  end

  def line_tool
    "#{LINK_BASE}/linestats.php?season=#{season}" \
      "&stype=#{game_type}&team=#{team.abbreviation}"
  end

  def team_totals
    "#{LINK_BASE}/teamtable.php?season=#{season}&stype=#{game_type}"
  end
end
