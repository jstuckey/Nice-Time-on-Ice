class CorsicaLinkPresenter < LinkPresenterBase
  include LinkHelpers

  LINK_BASE = "http://corsica.hockey/".freeze

  # rubocop:disable MethodLength
  def names
    [
      "Game Stats",
      "Team Stats",
      "Skater Stats",
      "Goalie Stats",
      "Line Combinations",
      "Defense Pairings",
      "Player Profiles",
      "WAR",
      "Roster",
      "Predictions"
    ]
  end

  def links
    [
      game_stats,
      team_stats,
      skater_stats,
      goalie_stats,
      link_combinations,
      defense_pairings,
      player_profiles,
      war,
      roseter,
      predictions
    ]
  end
  # rubocop:enable MethodLength

  def game_stats
    "#{LINK_BASE}games/?id=#{game.game_number}"
  end

  def team_stats
    "#{LINK_BASE}team-stats/?season=#{season.year_start}#{season.year_end}" \
      "&session=#{full_text_game_type}"
  end

  def skater_stats
    "#{LINK_BASE}skater-stats/?season=#{season.year_start}#{season.year_end}" \
      "&session=#{full_text_game_type}&team=#{alternate_team_abbreviation}"
  end

  def goalie_stats
    "#{LINK_BASE}goalie-stats/?season=#{season.year_start}#{season.year_end}" \
      "&session=#{full_text_game_type}&team=#{alternate_team_abbreviation}"
  end

  def link_combinations
    "#{LINK_BASE}line-stats/?season=#{season.year_start}#{season.year_end}" \
      "&session=#{full_text_game_type}&team=#{alternate_team_abbreviation}"
  end

  def defense_pairings
    "#{LINK_BASE}pairing-stats/?season=#{season.year_start}#{season.year_end}" \
      "&session=#{full_text_game_type}&team=#{alternate_team_abbreviation}"
  end

  def player_profiles
    "#{LINK_BASE}player-profiles/?player=ALEX.OVECHKIN"
  end

  def war
    "#{LINK_BASE}war/?season=#{season.year_start}#{season.year_end}" \
      "&team=#{alternate_team_abbreviation}"
  end

  def roseter
    "#{LINK_BASE}team-rosters/?team=#{alternate_team_abbreviation}"
  end

  def predictions
    "#{LINK_BASE}predictions/"
  end
end
